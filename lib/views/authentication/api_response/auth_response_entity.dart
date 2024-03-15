import 'dart:convert';

import '../../../generated/json/auth_response_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class AuthResponseEntity {
  int? code;
  bool? success;
  String? message;
  AuthResponseData? data;

  AuthResponseEntity();

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AuthResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseData {
  int? id;
  @JSONField(name: "profile_pic")
  String? profilePic;
  @JSONField(name: "user_name")
  String? userName;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "mobile_number")
  String? mobileNumber;
  String? email;
  @JSONField(name: "is_verified")
  bool? isVerified;
  String? gender;
  double? longitude;
  double? latitude;
  String? address;
  @JSONField(name: "access_token")
  String? accessToken;
  @JSONField(name: "refresh_token")
  String? refreshToken;
  @JSONField(name: "last_property_id")
  String? lastPropertyId;
  @JSONField(name: "last_inquiry_id")
  String? lastInquiryId;
  @JSONField(name: "firebase_user_id")
  String? firebaseUserId;
  @JSONField(name: "broker_code")
  String? brokerCode;
  @JSONField(name: "association_id")
  String? associationId;
  @JSONField(name: "created_at")
  int? createdAt;
  @JSONField(name: "updated_at")
  int? updatedAt;
  @JSONField(name: "association_info")
  AuthResponseDataAssociationInfo? associationInfo;
  @JSONField(name: "backup_data")
  AuthResponseDataBackupData? backupData;
  AuthResponseDataSettings? settings;
  AuthResponseDataSubscription? subscription;
  AuthResponseDataHelp? help;
  @JSONField(name: "follow_us")
  AuthResponseDataFollowUs? followUs;
  @JSONField(name: "current_server_time")
  int? currentServerTime;

  AuthResponseData();

  factory AuthResponseData.fromJson(Map<String, dynamic> json) =>
      $AuthResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataBackupData {
  @JSONField(name: "backup_date_time")
  int? backupDateTime;
  @JSONField(name: "google_email_id")
  String? googleEmailId;
  @JSONField(name: "google_email_address")
  String? googleEmailAddress;
  @JSONField(name: "google_drive_files")
  List<AuthResponseDataBackupDataGoogleDriveFiles>? googleDriveFiles;
  @JSONField(name: "created_at")
  int? createdAt;
  @JSONField(name: "updated_at")
  int? updatedAt;

  AuthResponseDataBackupData();

  factory AuthResponseDataBackupData.fromJson(Map<String, dynamic> json) =>
      $AuthResponseDataBackupDataFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataBackupDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataBackupDataGoogleDriveFiles {
  @JSONField(name: "file_id")
  String? fileId;
  @JSONField(name: "file_name")
  String? fileName;
  @JSONField(name: "file_size")
  int? fileSize;

  AuthResponseDataBackupDataGoogleDriveFiles();

  factory AuthResponseDataBackupDataGoogleDriveFiles.fromJson(
          Map<String, dynamic> json) =>
      $AuthResponseDataBackupDataGoogleDriveFilesFromJson(json);

  Map<String, dynamic> toJson() =>
      $AuthResponseDataBackupDataGoogleDriveFilesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataSettings {
  int? id;
  bool? notification;
  int? radius;
  bool? share;
  @JSONField(name: "near_by_distance")
  double? nearByDistance;
  @JSONField(name: "search_distance")
  double? searchDistance;
  @JSONField(name: "brooon_distance")
  double? brooonDistance;
  @JSONField(name: "basic_details")
  bool? basicDetails;
  @JSONField(name: "owner_details")
  bool? ownerDetails;
  @JSONField(name: "other_details")
  bool? otherDetails;
  @JSONField(name: "price_details")
  bool? priceDetails;
  bool? photos;
  bool? watermark;
  @JSONField(name: "app_reminder")
  bool? appReminder;
  @JSONField(name: "public_properties")
  bool? publicProperties;
  @JSONField(name: "watermark_image")
  String? watermarkImage;
  @JSONField(name: "watermark_text")
  String? watermarkText;
  @JSONField(name: "watermark_type")
  String? watermarkType;
  @JSONField(name: "created_at")
  int? createdAt;
  @JSONField(name: "updated_at")
  int? updatedAt;

  AuthResponseDataSettings();

  factory AuthResponseDataSettings.fromJson(Map<String, dynamic> json) =>
      $AuthResponseDataSettingsFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataSettingsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataSubscription {
  @JSONField(name: "active_plan_id")
  int? activePlanId;
  @JSONField(name: "active_plan_type")
  String? activePlanType;
  @JSONField(name: "expired_at")
  int? expiredAt;
  @JSONField(name: "free_trial_expired")
  bool? freeTrialExpired;

  AuthResponseDataSubscription();

  factory AuthResponseDataSubscription.fromJson(Map<String, dynamic> json) =>
      $AuthResponseDataSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataSubscriptionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataHelp {
  @JSONField(name: "about_us")
  String? aboutUs;
  String? faqs;
  @JSONField(name: "privacy_policy")
  String? privacyPolicy;
  @JSONField(name: "terms_conditions")
  String? termsConditions;

  AuthResponseDataHelp();

  factory AuthResponseDataHelp.fromJson(Map<String, dynamic> json) =>
      $AuthResponseDataHelpFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataHelpToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataFollowUs {
  String? facebook;
  String? twitter;
  String? instagram;
  String? linkedIn;

  AuthResponseDataFollowUs();

  factory AuthResponseDataFollowUs.fromJson(Map<String, dynamic> json) =>
      $AuthResponseDataFollowUsFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataFollowUsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataAssociationInfo {
  @JSONField(name: "association_id")
  int? associationId;
  @JSONField(name: "association_code")
  String? associationCode;
  @JSONField(name: "association_photo")
  String? associationPhoto;

  AuthResponseDataAssociationInfo();

  factory AuthResponseDataAssociationInfo.fromJson(
      Map<String, dynamic> json) =>
      $AuthResponseDataAssociationInfoFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $AuthResponseDataAssociationInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}