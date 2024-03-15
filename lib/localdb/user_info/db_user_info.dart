import 'package:isar/isar.dart';

import '../../utils/app_config.dart';
import '../save_default_data.dart';

part 'db_user_info.g.dart';

@collection
class DbUserInfo {
  late Id id;
  String? firstName;
  String? lastName;
  late String mobileNo;
  String? email;
  String? gender;
  String? profilePic;
  double? latitude;
  double? longitude;
  String? currentArea;
  String? firebaseUserId;
  int radius = AppConfig.defaultRadius;
  int watermarkType = SaveDefaultData.watermarkTypeImageId;
  String? watermarkLogoPath;
  String? watermarkText;
  bool isActiveUser = false;
  bool isUserLoggedOut = false;
  String? accessToken;
  String? refreshToken;
  String? lastPropertyId;
  String? lastInquiryId;
  int? backupSize;
  String? gDriveId;
  String? gDriveEmailAddress;
  DateTime? backupTakenAt;
  String? brokerCode;
  String? associationId;
  String? associationCode;
  String? associationPhoto;
  int? subscribedPlanId;
  String? subscribedPlanType;
  DateTime? appSubscriptionEndTime;
  bool? freeTrialExpired;
  bool isVerifiedUser = false;
  double? liveLatitude;
  double? liveLongitude;
  double nearByDistance = AppConfig.defaultNearByDistance;
  double privateSearchDistance = AppConfig.defaultPrivateSearchDistance;
  double brooonSearchDistance = AppConfig.defaultBrooonSearchDistance;
}
