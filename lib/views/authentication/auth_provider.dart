import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import './api_response/auth_response_entity.dart';
import './authentication.dart';
import '../../common_property_data_provider.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/app_links/db_app_links.dart';
import '../../localdb/app_privacy_logs/db_app_privacy_logs.dart';
import '../../localdb/backup_restore/db_google_drive_file_info.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property_amenity.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/settings/db_settings.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../network/dio_client.dart';
import '../../utils/app_config.dart';
import '../../utils/app_privacy_helper.dart';
import '../../utils/download_helper.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/static_functions.dart';
import '../../utils/subscription_utils.dart';
import '../../widgets/snack_bar_view.dart';

// Ref. https://firebase.google.com/docs/auth/flutter/phone-auth
class AuthProvider extends ChangeNotifier {
  final _isarService = IsarService();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController firstOtpController = TextEditingController();
  final TextEditingController secondOtpController = TextEditingController();
  final TextEditingController thirdOtpController = TextEditingController();
  final TextEditingController fourthOtpController = TextEditingController();
  final TextEditingController fifthOtpController = TextEditingController();
  final TextEditingController sixthOtpController = TextEditingController();
  bool requiredToShowRestoreOption = true;
  String mobileNo = '';
  bool _isInvalidOtp = false;
  bool _isLoginApiFailed = false;
  String? _otpVerificationId;
  int? _otpResendToken;
  String? _firebaseUId;

  bool get isInvalidOtp => _isInvalidOtp;

  bool get isLoginApiFailed => _isLoginApiFailed;

  set updateOtpValidInvalidStatus(bool value) {
    _isInvalidOtp = value;
    _isLoginApiFailed = value;
    notifyListeners();
  }

  set setMobileNo(String value) {
    mobileNo = value;
    notifyListeners();
  }

  _clearMobile() {
    mobileNo = '';
    mobileNoController.clear();
    notifyListeners();
  }

  _updateLoginProgress(BuildContext context, bool value) {
    FullScreenProgress.showFullScreenProgress(context, value);
  }

  _updateOtpProgress(BuildContext context, bool value) {
    FullScreenProgress.showFullScreenProgress(context, value);
  }

  verifyPhoneNumberUsingFirebaseAuth(
      BuildContext context, AppLocalizations localizationsContext,
      {int? resendSmsToken}) async {
    if (resendSmsToken == null) {
      _updateLoginProgress(context, true);
    }
    final phoneNo =
        '${AppConfig.mobileNumPrefix}${mobileNo.replaceAll(' ', '')}';
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      forceResendingToken: resendSmsToken,
      verificationCompleted: (PhoneAuthCredential credential) async {
        verifyOtpUsingFirebaseAuth(
          context,
          localizationsContext,
          credential: credential,
          isResendOtpFlow: resendSmsToken != null,
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        _updateLoginProgress(context, false);
        _updateOtpProgress(context, false);
        if (e.code == Strings.authInvalidPhoneNoCode) {
          _showSnackBar(context, localizationsContext.invalidPhoneNo);
        } else {
          _showSnackBar(
            context,
            e.message ?? localizationsContext.unableToLogin,
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        _otpVerificationId = verificationId;
        _otpResendToken = resendToken;
        if (resendSmsToken == null) {
          _openOtpScreen(context);
        } else {
          _updateOtpProgress(context, false);
        }
        _showSnackBar(
          context,
          localizationsContext.otpSentToMobile(
            phoneNo,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  _invalidOtp(
    BuildContext context,
    AppLocalizations localizationsContext,
    bool isSnackBarNeedToVisible,
  ) {
    _onOtpProcessFinished(
      context,
      localizationsContext,
      false,
    );
    if (isSnackBarNeedToVisible) {
      _showSnackBar(context, localizationsContext.unableToLogin);
    }
  }

  _showSnackBar(BuildContext context, String message) {
    SnackBarView.showSnackBar(context, message);
  }

  verifyOtpUsingFirebaseAuth(
    BuildContext context,
    AppLocalizations localizationsContext, {
    String? otp,
    PhoneAuthCredential? credential,
    bool isResendOtpFlow = false,
  }) async {
    if (!isResendOtpFlow) {
      _updateOtpProgress(context, true);
    }
    PhoneAuthCredential? phoneAuthCredential = credential;
    if (otp != null && _otpVerificationId != null) {
      // Create a PhoneAuthCredential with the code
      phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _otpVerificationId!,
        smsCode: otp,
      );
    }

    try {
      if (phoneAuthCredential != null) {
        // Sign the user in (or link) with the credential
        final userCredentials = await FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredential);
        debugPrint('$userCredentials');
        _firebaseUId = userCredentials.user?.uid ?? '';
        _onOtpProcessFinished(
          context,
          localizationsContext,
          true,
        );
      } else {
        _invalidOtp(context, localizationsContext, true);
      }
    } on FirebaseAuthMultiFactorException catch (e) {
      debugPrint('$e');
      _invalidOtp(context, localizationsContext, false);
    } on FirebaseAuthException catch (e) {
      debugPrint('$e');
      if (e.code == Strings.authInvalidVerificationCode) {
        _invalidOtp(context, localizationsContext, false);
      } else {
        _invalidOtp(context, localizationsContext, false);
      }
    } catch (e) {
      debugPrint('$e');
      _invalidOtp(context, localizationsContext, true);
    }
  }

  resendOtpUsingFirebaseAuth(
    BuildContext context,
    AppLocalizations localizationsContext,
  ) {
    _updateOtpProgress(context, true);
    verifyPhoneNumberUsingFirebaseAuth(
      context,
      localizationsContext,
      resendSmsToken: _otpResendToken,
    );
  }

  _openOtpScreen(BuildContext context) {
    _updateLoginProgress(context, false);
    _clearOtpFields();
    Navigator.pushNamed(
      context,
      Routes.otpVerificationRoute,
      arguments: {
        Authentication.extraPhoneNum:
            '${AppConfig.mobileNumPrefix} ${mobileNo.replaceAll(' ', '')}'
      },
    ).then(
      (value) => {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
      },
    );
  }

  _onOtpProcessFinished(
    BuildContext context,
    AppLocalizations localizationsContext,
    bool isFirebaseOtpSuccess,
  ) async {
    if (isFirebaseOtpSuccess) {
      final authResponse = await DioClient().login(
        mobileNo.replaceAll(' ', ''),
        _firebaseUId!,
      );
      if (authResponse != null) {
        final data = authResponse.data;
        if (data != null && data.id != null) {
          DbUserInfo dbUserInfo = DbUserInfo()
            ..id = data.id!
            ..brokerCode = data.brokerCode
            ..associationId = data.associationId
            ..associationCode = data.associationInfo?.associationCode
            ..associationPhoto = data.associationInfo?.associationPhoto
            ..isVerifiedUser = data.isVerified ?? false
            ..mobileNo = mobileNo
            ..firstName = data.firstName
            ..lastName = data.lastName
            ..email = data.email
            ..gender = data.gender
            ..profilePic =
                StaticFunctions.profilePictureServerFullPath(data.profilePic)
            ..latitude = data.latitude
            ..longitude = data.longitude
            ..currentArea = data.address
            ..firebaseUserId = data.firebaseUserId
            ..accessToken = data.accessToken
            ..refreshToken = data.refreshToken
            ..lastPropertyId = data.lastPropertyId
            ..lastInquiryId = data.lastInquiryId
            ..backupTakenAt = data.backupData?.backupDateTime != null
                ? DateTime.fromMillisecondsSinceEpoch(
                    data.backupData!.backupDateTime!,
                  )
                : null
            ..backupSize = 0
            ..gDriveId = data.backupData?.googleEmailId
            ..gDriveEmailAddress = data.backupData?.googleEmailAddress;

          if (data.settings?.radius != null) {
            dbUserInfo.radius = data.settings!.radius!;
          }

          if (data.settings?.nearByDistance != null) {
            dbUserInfo.nearByDistance = data.settings!.nearByDistance!;
          } else {
            dbUserInfo.nearByDistance = AppConfig.defaultNearByDistance;
          }

          if (data.settings?.searchDistance != null) {
            dbUserInfo.privateSearchDistance = data.settings!.searchDistance!;
          } else {
            dbUserInfo.privateSearchDistance =
                AppConfig.defaultPrivateSearchDistance;
          }

          if (data.settings?.brooonDistance != null) {
            dbUserInfo.brooonSearchDistance = data.settings!.brooonDistance!;
          } else {
            dbUserInfo.brooonSearchDistance =
                AppConfig.defaultBrooonSearchDistance;
          }

          if (data.subscription != null) {
            dbUserInfo.subscribedPlanId = data.subscription?.activePlanId;
            dbUserInfo.subscribedPlanType = data.subscription?.activePlanType;
            dbUserInfo.freeTrialExpired =
                data.subscription?.freeTrialExpired ?? false;
            if (data.subscription?.expiredAt != null) {
              dbUserInfo.appSubscriptionEndTime =
                  DateTime.fromMillisecondsSinceEpoch(
                data.subscription!.expiredAt!,
              );
            }
          }

          if (data.settings?.watermarkType != null) {
            if (data.settings!.watermarkType ==
                SaveDefaultData.watermarkTypeImageString) {
              dbUserInfo.watermarkType = SaveDefaultData.watermarkTypeImageId;
            } else if (data.settings!.watermarkType ==
                SaveDefaultData.watermarkTypeTextString) {
              dbUserInfo.watermarkType = SaveDefaultData.watermarkTypeTextId;
            }
          }
          if (data.settings?.watermarkText != null) {
            dbUserInfo.watermarkText = data.settings!.watermarkText!.trim();
          }
          await saveUserInfo(dbUserInfo, localizationsContext);
          // this is added below save user info as we don't need to stop actual flow
          // downloading might take more time so once it downloaded we update file path
          if (data.settings?.watermarkImage != null) {
            DownloadHelper().downloadWatermark(data.settings!.watermarkImage!);
          }
          await _saveGoogleDriveFileInfo(data.backupData?.googleDriveFiles);
          await _saveSettings(localizationsContext, data.settings);
          await _saveDefaultCaste(localizationsContext);
          await _savePropertyAmenities(localizationsContext);
          await _saveAppWebLinks(authResponse);
          await _savePrivacyLogs(
            authResponse.data?.currentServerTime ??
                DateTime.now().millisecondsSinceEpoch,
          );
          _clearMobile();
          _updateOtpProgress(context, false);
          _updateLoginProgress(context, false);

          final isPrivacyBreak = await AppPrivacyHelper.checkForPrivacy(
            context,
            RedirectionFromForPrivacyCheck.login,
            _isarService,
          );
          if (isPrivacyBreak) {
            return;
          }
          // check for subscription : user already subscribed for paid plan or not
          // Through this we will show shared by brooon list
          final isUserHasSubscription =
              await SubscriptionUtils.checkForUserHasActiveSubscriptionPlan();
          Provider.of<CommonPropertyDataProvider>(
            context,
            listen: false,
          ).updateSubscribedPlan(isUserHasSubscription);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.otpVerified,
            (route) => false,
          );
          return;
        }
      }
      _showSnackBar(context, localizationsContext.unableToLogin);
      _handleLoginFailure(
        context,
        localizationsContext,
      );
      return;
    } else {
      _onOtpFailure(context);
    }
  }

  _onOtpFailure(BuildContext context) {
    _updateOtpProgress(context, false);
    _updateLoginProgress(context, false);
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        _clearOtpFields();
        FocusScope.of(context).unfocus();
        _isInvalidOtp = true;
        notifyListeners();
      },
    );
  }

  _handleLoginFailure(
    BuildContext context,
    AppLocalizations localizationsContext,
  ) {
    _updateOtpProgress(context, false);
    _updateLoginProgress(context, false);
    _showSnackBar(
      context,
      localizationsContext.unableToLogin,
    );
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        _clearOtpFields();
        FocusScope.of(context).unfocus();
        _isLoginApiFailed = true;
        notifyListeners();
      },
    );
  }

  _clearOtpFields() {
    firstOtpController.text = '';
    secondOtpController.text = '';
    thirdOtpController.text = '';
    fourthOtpController.text = '';
    fifthOtpController.text = '';
    sixthOtpController.text = '';
  }

  Future<DbUserInfo?> getUserInfo() async {
    return await _isarService.getUserInfo();
  }

  saveUserInfo(
    DbUserInfo userInfo,
    AppLocalizations localizationsContext,
  ) async {
    // InActive other users
    final users = await _isarService.getAllUsers();
    if (users.isNotEmpty) {
      for (int i = 0; i < users.length; i++) {
        users[i].isActiveUser = false;
      }
      await _isarService.updateUsersInfo(users);
      _checkForUserInfoAlreadyAvailable(users, userInfo);
    }
    // Save and Active current user
    userInfo.isActiveUser = true;
    userInfo.isUserLoggedOut = false;
    await _isarService.saveOrUpdateUserInfo(userInfo);
    StaticFunctions.userId = userInfo.id;
  }

  _saveGoogleDriveFileInfo(
    List<AuthResponseDataBackupDataGoogleDriveFiles>? googleDriveFiles,
  ) async {
    // Deleting all old Google Drive File Ids.
    // We are calculating size of old backup based on this db.
    await _isarService.deleteAllCompletedGoogleDriveInfo();
    if (googleDriveFiles != null && googleDriveFiles.isNotEmpty) {
      int totalBackupSize = 0;
      List<DbGoogleDriveFileInfo> list = [];
      googleDriveFiles.forEach(
        (element) {
          totalBackupSize = totalBackupSize + (element.fileSize ?? 0);
          list.add(
            DbGoogleDriveFileInfo()
              ..userId = StaticFunctions.userId
              ..fileId = element.fileId
              ..fileName = element.fileName
              ..fileSizeInByte = element.fileSize
              ..status = Strings.backupRestoreTypePending,
          );
        },
      );
      await _isarService.saveAllGoogleDriveFileInfo(list);
      final userInfo = StaticFunctions.userInfo;
      if (userInfo != null) {
        userInfo.backupSize = totalBackupSize;
        await _isarService.saveOrUpdateUserInfo(userInfo);
      }
    }
  }

  _saveSettings(
    AppLocalizations localizationsContext,
    AuthResponseDataSettings? olderSettings,
  ) async {
    final userSettings = await _isarService.getSettings();
    if (userSettings.isEmpty) {
      final List<DbSetting> settingsList = [];
      settingsList.addAll(
        [
          DbSetting()
            ..settingId = SaveDefaultData.settingNotificationId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleNotification
            ..isChecked = olderSettings?.notification ?? true,
          DbSetting()
            ..settingId = SaveDefaultData.settingRadiusId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleRadius,
          DbSetting()
            ..settingId = SaveDefaultData.settingUploadWatermarkId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleUploadWatermark,
          DbSetting()
            ..settingId = SaveDefaultData.settingShareId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleShare
            ..isChecked = olderSettings?.share ?? true,
          DbSetting()
            ..settingId = SaveDefaultData.settingShareBasicDetailsId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleBasicDetails
            ..isChecked = olderSettings?.basicDetails ?? true,
          DbSetting()
            ..settingId = SaveDefaultData.settingShareOtherDetailsId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleOtherDetails
            ..isChecked = olderSettings?.otherDetails ?? true,
          /*DbSetting()
            ..settingId = SaveDefaultData.settingShareSellerDetailsId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleOwnerDetails
            ..isChecked = olderSettings?.ownerDetails ?? false,*/
          /*DbSetting()
            ..settingId = SaveDefaultData.settingSharePriceDetailsId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitlePriceDetails
            ..isChecked = olderSettings?.priceDetails ?? true,*/
          DbSetting()
            ..settingId = SaveDefaultData.settingShareImagesId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleImages
            ..isChecked = olderSettings?.photos ?? true,
          DbSetting()
            ..settingId = SaveDefaultData.settingShareWatermarkId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleWatermark
            ..isChecked = olderSettings?.watermark ?? true,
          DbSetting()
            ..settingId = SaveDefaultData.settingShareLogoId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleLogo
            ..isChecked = true,
          DbSetting()
            ..settingId = SaveDefaultData.settingAppReminderId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleAppReminder
            ..isChecked = olderSettings?.appReminder ?? true,
          DbSetting()
            ..settingId = SaveDefaultData.settingCastManagementId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleCastManagement,
          DbSetting()
            ..settingId = SaveDefaultData.settingPublicPropertyId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitlePublicProperties
            ..isChecked = olderSettings?.publicProperties ?? true,
          DbSetting()
            ..settingId = SaveDefaultData.settingAmenitiesManagementId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleAmenityManagement,
          DbSetting()
            ..settingId = SaveDefaultData.settingConfigOptionId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleConfigOptions,
          DbSetting()
            ..settingId = SaveDefaultData.settingNearByDistanceId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleNearByDistance,
          DbSetting()
            ..settingId = SaveDefaultData.settingMySearchDistanceId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleMySearchDistance,
          DbSetting()
            ..settingId = SaveDefaultData.settingBrooonSearchDistanceId
            ..userId = StaticFunctions.userId
            ..settingTitle =
                localizationsContext.settingTitleBrooonSearchDistance,
          DbSetting()
            ..settingId = SaveDefaultData.settingBlockedBrooonerId
            ..userId = StaticFunctions.userId
            ..settingTitle = localizationsContext.settingTitleBlockedBroooner,
        ],
      );
      await _isarService.saveSettings(settingsList);
    }
  }

  _saveAppWebLinks(AuthResponseEntity authResponse) async {
    await _isarService.deleteAllAppLinks();
    List<DbAppLinks> appLinks = [];
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.aboutUsLinkId
        ..webLink = authResponse.data?.help?.aboutUs ?? AppConfig.aboutUsUrl,
    );
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.faqsLinkId
        ..webLink = authResponse.data?.help?.faqs ?? AppConfig.faqUrl,
    );
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.privacyLinkId
        ..webLink = authResponse.data?.help?.privacyPolicy ??
            AppConfig.privacyPolicyUrl,
    );
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.termsLinkId
        ..webLink = authResponse.data?.help?.termsConditions ??
            AppConfig.termsAndConditionUrl,
    );
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.facebookLinkId
        ..webLink =
            authResponse.data?.followUs?.facebook ?? AppConfig.facebookUrl,
    );
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.twitterLinkId
        ..webLink =
            authResponse.data?.followUs?.twitter ?? AppConfig.twitterUrl,
    );
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.instagramLinkId
        ..webLink =
            authResponse.data?.followUs?.instagram ?? AppConfig.instagramUrl,
    );
    appLinks.add(
      DbAppLinks()
        ..id = SaveDefaultData.linkedInLinkId
        ..webLink =
            authResponse.data?.followUs?.linkedIn ?? AppConfig.linkedInUrl,
    );
    await _isarService.saveAllAppLinks(appLinks);
  }

  _savePrivacyLogs(int serverTime) async {
    final log = await _isarService.getAppPrivacyLogs();
    if (log == null) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(serverTime);
      await _isarService.savePrivacyLogInfo(
        DbAppPrivacyLogs()
          ..appLoginTime = dateTime
          ..appOpenTime = dateTime,
      );
    }
  }

  _checkForUserInfoAlreadyAvailable(
    List<DbUserInfo> users,
    DbUserInfo userInfo,
  ) async {
    // If app already installed and user doing logout and log in with user
    // which data we already have in our db and have some properties in table
    // then don't show restore option as we are storing all data locally.
    final user = users.firstWhereOrNull((element) => element.id == userInfo.id);
    if (user != null) {
      // user if is already with us! -> then check for user property is empty or not
      // if empty then show otherwise not.
      final isPropertyEmpty =
          await _isarService.isUsersPropertyEmpty(userInfo.id);
      requiredToShowRestoreOption = (isPropertyEmpty == true);
    } else {
      requiredToShowRestoreOption = true;
    }
  }

  _saveDefaultCaste(AppLocalizations localizationsContext) async {
    final list = await _isarService.getPreferredCasts();
    if (list.isEmpty) {
      final List<DbPropertyPreferredCast> casteList = [
        DbPropertyPreferredCast()
          ..userId = StaticFunctions.userId
          ..name = localizationsContext.defaultCommunitySeniorCitizen,
        DbPropertyPreferredCast()
          ..userId = StaticFunctions.userId
          ..name = localizationsContext.defaultCommunityArmyMens,
        DbPropertyPreferredCast()
          ..userId = StaticFunctions.userId
          ..name = localizationsContext.defaultCommunityGovernmentServants,
        DbPropertyPreferredCast()
          ..userId = StaticFunctions.userId
          ..name = localizationsContext.defaultCommunityDoctors,
        DbPropertyPreferredCast()
          ..userId = StaticFunctions.userId
          ..name = localizationsContext.defaultCommunitySpecialAbilities,
      ];
      await _isarService.savePreferredCasts(casteList);
    }
  }

  _savePropertyAmenities(AppLocalizations localizationsContext) async {
    final list = await _isarService.getAmenities();
    if (list.isEmpty) {
      final List<DbPropertyAmenity> amenities = [];
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemClubHouse
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemLibrary
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemGazebo
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemPlayArea
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemSwimmingPool
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemGarden
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemTheater
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemGym
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemTemple
          ..userId = StaticFunctions.userId,
      );
      amenities.add(
        DbPropertyAmenity()
          ..name = localizationsContext.amenityItemCommunityHall
          ..userId = StaticFunctions.userId,
      );
      await _isarService.savePropertyAmenities(amenities);
    }
  }
}
