import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import './model/gender_item_model.dart';
import './profile_from_enum.dart';
import '../../const/routes.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../network/dio_client.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_location_from_enum.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/compress_image_helper.dart';
import '../../utils/file_utils.dart';
import '../../utils/static_functions.dart';
import '../../utils/subscription_utils.dart';
import '../../widgets/snack_bar_view.dart';

class ProfileProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  final _isarService = IsarService();
  late DbUserInfo userProfile = DbUserInfo();
  TextEditingController brokerIdFieldController = TextEditingController();
  TextEditingController associationIdFieldController = TextEditingController();
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController phoneNumFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController genderFieldController = TextEditingController();
  List<GenderItem> genderOptions = [];
  bool isValid = false;
  String? _profilePath;
  bool _isProfilePicRemoved = false;
  bool isAssociationIdEnabled = true;
  ProfileFrom profileFrom = ProfileFrom.login;

  Future<void> init(
    AppLocalizations localizationsContext,
    ProfileFrom profileFrom,
  ) async {
    this.profileFrom = profileFrom;
    userProfile = (await _isarService.getUserInfo())!;
    this.localizationsContext = localizationsContext;
    genderOptions = [
      GenderItem(
        id: 1,
        value: localizationsContext.genderMale,
      ),
      GenderItem(
        id: 2,
        value: localizationsContext.genderFemale,
      ),
      GenderItem(
        id: 3,
        value: localizationsContext.genderOther,
      ),
    ];
    _loadProfileData();
    validateData();
    notifyListeners();
  }

  validateData() {
    isValid = firstNameFieldController.text.trim().isNotEmpty &&
        lastNameFieldController.text.trim().isNotEmpty;
    notifyListeners();
  }

  void selectGender(int id) {
    var genderToSelect =
        genderOptions.firstWhereOrNull((element) => element.id == id);
    genderOptions.forEach((element) {
      element.isSelected = false;
    });
    if (genderToSelect != null) {
      genderToSelect.isSelected = true;
      genderFieldController.text =
          genderToSelect.id == -1 ? "" : genderToSelect.value;
    }
    notifyListeners();
  }

  Future<String> getLocalImagePathWithRemovingOlderImage() async {
    final destinationPath = await FileUtils.userProfilePicLocalPath();
    final isFileExist = await File(destinationPath).exists();
    if (isFileExist) {
      await File(destinationPath).delete();
    }
    return destinationPath;
  }

  Future<bool> chooseFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      userProfile.profilePic = photo.path;
      _profilePath = photo.path;
      _isProfilePicRemoved = false;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> chooseFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      userProfile.profilePic = photo.path;
      _profilePath = photo.path;
      _isProfilePicRemoved = false;
      notifyListeners();
      return true;
    }
    return false;
  }

  void removeProfilePicture() {
    userProfile.profilePic = '';
    _profilePath = null;
    _isProfilePicRemoved = true;
    notifyListeners();
  }

  _loadProfileData() {
    if (userProfile.brokerCode != null &&
        userProfile.brokerCode!.trim().isNotEmpty) {
      brokerIdFieldController.text = userProfile.brokerCode!;
    }
    if (userProfile.firstName != null &&
        userProfile.firstName!.trim().isNotEmpty) {
      firstNameFieldController.text = userProfile.firstName!;
    }
    if (userProfile.lastName != null &&
        userProfile.lastName!.trim().isNotEmpty) {
      lastNameFieldController.text = userProfile.lastName!;
    }
    if (userProfile.email != null && userProfile.email!.trim().isNotEmpty) {
      emailFieldController.text = userProfile.email!;
    }
    if (userProfile.mobileNo.trim().isNotEmpty) {
      phoneNumFieldController.text = userProfile.mobileNo;
    }
    if (userProfile.gender != null && userProfile.gender!.trim().isNotEmpty) {
      final genderToSelect = genderOptions.firstWhereOrNull((element) =>
          element.value.toLowerCase() == userProfile.gender!.toLowerCase());
      if (genderToSelect != null) {
        selectGender(genderToSelect.id);
      }
    }
    if (userProfile.associationId != null &&
        userProfile.associationId!.trim().isNotEmpty) {
      associationIdFieldController.text =
          userProfile.associationId!.toString().trim();
      isAssociationIdEnabled = false;
    }
  }

  Future<void> saveData(BuildContext context) async {
    if (firstNameFieldController.text.trim().isNotEmpty &&
        lastNameFieldController.text.trim().isNotEmpty) {
      await _storeIntoDb();
      // removed await from below function as not to stop user till data upload
      // We are storing data in local db directly so offline flow will work even if API fail
      _uploadProfileInfoToServer();
      _openNextScreen(context);
    } else {
      _profileSavedFailed(context);
    }
  }

  _profileSavedFailed(BuildContext context) {
    SnackBarView.showSnackBar(context, localizationsContext.profileSavedFail);
  }

  _storeIntoDb() async {
    if (firstNameFieldController.text != userProfile.firstName) {
      userProfile.firstName = firstNameFieldController.text;
    }
    if (lastNameFieldController.text != userProfile.lastName) {
      userProfile.lastName = lastNameFieldController.text;
    }
    if (genderFieldController.text != userProfile.gender) {
      userProfile.gender = genderFieldController.text;
    }
    if (emailFieldController.text != userProfile.email) {
      userProfile.email = emailFieldController.text;
    }
    if (associationIdFieldController.text != userProfile.associationId) {
      userProfile.associationId =
          associationIdFieldController.text.toString().trim();
    }
    if (_isProfilePicRemoved) {
      userProfile.profilePic = null;
      // To remove photo from our app local storage
      getLocalImagePathWithRemovingOlderImage();
    } else {
      if (_profilePath != null && _profilePath!.trim().isNotEmpty) {
        final destinationPath = await getLocalImagePathWithRemovingOlderImage();
        await CompressImageHelper.compressHelper(
            _profilePath!, destinationPath);
        _profilePath = destinationPath;
        userProfile.profilePic = destinationPath;
      }
    }
    FileUtils.clearCacheImages();
    await _isarService.saveOrUpdateUserInfo(userProfile);
  }

  _uploadProfileInfoToServer() async {
    final data = await DioClient().updateProfileInfo(
      firstName: firstNameFieldController.text,
      lastName: lastNameFieldController.text,
      email: emailFieldController.text,
      gender: genderFieldController.text,
      associationId: associationIdFieldController.text,
      isProfileDeleted: _isProfilePicRemoved,
      picPath: _profilePath,
    );
    if (data?.data != null) {
      if (_profilePath != null && _profilePath!.trim().isNotEmpty) {
        userProfile.profilePic = StaticFunctions.profilePictureServerFullPath(
          data?.data?.profilePic,
        );
        await _isarService.saveOrUpdateUserInfo(userProfile);
      }
    }
  }

  _openNextScreen(BuildContext context) async {
    SnackBarView.showSnackBar(
      context,
      localizationsContext.profileSavedMessage,
    );
    if (profileFrom != ProfileFrom.drawer) {
      if (AppConfig.enabledSubscriptionFeature &&
          SubscriptionUtils.checkUserSubscriptionExpired()) {
        Navigator.pushReplacementNamed(
          context,
          Routes.subscription,
          arguments: ChoosePlanFrom.splash,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          Routes.chooseLocation,
          arguments: ChooseLocationFrom.splash,
        );
      }
    }
  }
}
