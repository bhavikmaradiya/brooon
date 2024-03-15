import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/authentication/api_response/auth_response_entity.dart';

AuthResponseEntity $AuthResponseEntityFromJson(Map<String, dynamic> json) {
	final AuthResponseEntity authResponseEntity = AuthResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		authResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		authResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		authResponseEntity.message = message;
	}
	final AuthResponseData? data = jsonConvert.convert<AuthResponseData>(json['data']);
	if (data != null) {
		authResponseEntity.data = data;
	}
	return authResponseEntity;
}

Map<String, dynamic> $AuthResponseEntityToJson(AuthResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AuthResponseData $AuthResponseDataFromJson(Map<String, dynamic> json) {
	final AuthResponseData authResponseData = AuthResponseData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		authResponseData.id = id;
	}
	final String? profilePic = jsonConvert.convert<String>(json['profile_pic']);
	if (profilePic != null) {
		authResponseData.profilePic = profilePic;
	}
	final String? userName = jsonConvert.convert<String>(json['user_name']);
	if (userName != null) {
		authResponseData.userName = userName;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		authResponseData.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		authResponseData.lastName = lastName;
	}
	final String? mobileNumber = jsonConvert.convert<String>(json['mobile_number']);
	if (mobileNumber != null) {
		authResponseData.mobileNumber = mobileNumber;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		authResponseData.email = email;
	}
	final bool? isVerified = jsonConvert.convert<bool>(json['is_verified']);
	if (isVerified != null) {
		authResponseData.isVerified = isVerified;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		authResponseData.gender = gender;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		authResponseData.longitude = longitude;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		authResponseData.latitude = latitude;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		authResponseData.address = address;
	}
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		authResponseData.accessToken = accessToken;
	}
	final String? refreshToken = jsonConvert.convert<String>(json['refresh_token']);
	if (refreshToken != null) {
		authResponseData.refreshToken = refreshToken;
	}
	final String? lastPropertyId = jsonConvert.convert<String>(json['last_property_id']);
	if (lastPropertyId != null) {
		authResponseData.lastPropertyId = lastPropertyId;
	}
	final String? lastInquiryId = jsonConvert.convert<String>(json['last_inquiry_id']);
	if (lastInquiryId != null) {
		authResponseData.lastInquiryId = lastInquiryId;
	}
	final String? firebaseUserId = jsonConvert.convert<String>(json['firebase_user_id']);
	if (firebaseUserId != null) {
		authResponseData.firebaseUserId = firebaseUserId;
	}
	final String? brokerCode = jsonConvert.convert<String>(json['broker_code']);
	if (brokerCode != null) {
		authResponseData.brokerCode = brokerCode;
	}
	final String? associationId = jsonConvert.convert<String>(json['association_id']);
	if (associationId != null) {
		authResponseData.associationId = associationId;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		authResponseData.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		authResponseData.updatedAt = updatedAt;
	}
	final AuthResponseDataAssociationInfo? associationInfo = jsonConvert.convert<AuthResponseDataAssociationInfo>(json['association_info']);
	if (associationInfo != null) {
		authResponseData.associationInfo = associationInfo;
	}
	final AuthResponseDataBackupData? backupData = jsonConvert.convert<AuthResponseDataBackupData>(json['backup_data']);
	if (backupData != null) {
		authResponseData.backupData = backupData;
	}
	final AuthResponseDataSettings? settings = jsonConvert.convert<AuthResponseDataSettings>(json['settings']);
	if (settings != null) {
		authResponseData.settings = settings;
	}
	final AuthResponseDataSubscription? subscription = jsonConvert.convert<AuthResponseDataSubscription>(json['subscription']);
	if (subscription != null) {
		authResponseData.subscription = subscription;
	}
	final AuthResponseDataHelp? help = jsonConvert.convert<AuthResponseDataHelp>(json['help']);
	if (help != null) {
		authResponseData.help = help;
	}
	final AuthResponseDataFollowUs? followUs = jsonConvert.convert<AuthResponseDataFollowUs>(json['follow_us']);
	if (followUs != null) {
		authResponseData.followUs = followUs;
	}
	final int? currentServerTime = jsonConvert.convert<int>(json['current_server_time']);
	if (currentServerTime != null) {
		authResponseData.currentServerTime = currentServerTime;
	}
	return authResponseData;
}

Map<String, dynamic> $AuthResponseDataToJson(AuthResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['profile_pic'] = entity.profilePic;
	data['user_name'] = entity.userName;
	data['first_name'] = entity.firstName;
	data['last_name'] = entity.lastName;
	data['mobile_number'] = entity.mobileNumber;
	data['email'] = entity.email;
	data['is_verified'] = entity.isVerified;
	data['gender'] = entity.gender;
	data['longitude'] = entity.longitude;
	data['latitude'] = entity.latitude;
	data['address'] = entity.address;
	data['access_token'] = entity.accessToken;
	data['refresh_token'] = entity.refreshToken;
	data['last_property_id'] = entity.lastPropertyId;
	data['last_inquiry_id'] = entity.lastInquiryId;
	data['firebase_user_id'] = entity.firebaseUserId;
	data['broker_code'] = entity.brokerCode;
	data['association_id'] = entity.associationId;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['association_info'] = entity.associationInfo?.toJson();
	data['backup_data'] = entity.backupData?.toJson();
	data['settings'] = entity.settings?.toJson();
	data['subscription'] = entity.subscription?.toJson();
	data['help'] = entity.help?.toJson();
	data['follow_us'] = entity.followUs?.toJson();
	data['current_server_time'] = entity.currentServerTime;
	return data;
}

AuthResponseDataBackupData $AuthResponseDataBackupDataFromJson(Map<String, dynamic> json) {
	final AuthResponseDataBackupData authResponseDataBackupData = AuthResponseDataBackupData();
	final int? backupDateTime = jsonConvert.convert<int>(json['backup_date_time']);
	if (backupDateTime != null) {
		authResponseDataBackupData.backupDateTime = backupDateTime;
	}
	final String? googleEmailId = jsonConvert.convert<String>(json['google_email_id']);
	if (googleEmailId != null) {
		authResponseDataBackupData.googleEmailId = googleEmailId;
	}
	final String? googleEmailAddress = jsonConvert.convert<String>(json['google_email_address']);
	if (googleEmailAddress != null) {
		authResponseDataBackupData.googleEmailAddress = googleEmailAddress;
	}
	final List<AuthResponseDataBackupDataGoogleDriveFiles>? googleDriveFiles = jsonConvert.convertListNotNull<AuthResponseDataBackupDataGoogleDriveFiles>(json['google_drive_files']);
	if (googleDriveFiles != null) {
		authResponseDataBackupData.googleDriveFiles = googleDriveFiles;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		authResponseDataBackupData.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		authResponseDataBackupData.updatedAt = updatedAt;
	}
	return authResponseDataBackupData;
}

Map<String, dynamic> $AuthResponseDataBackupDataToJson(AuthResponseDataBackupData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['backup_date_time'] = entity.backupDateTime;
	data['google_email_id'] = entity.googleEmailId;
	data['google_email_address'] = entity.googleEmailAddress;
	data['google_drive_files'] =  entity.googleDriveFiles?.map((v) => v.toJson()).toList();
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	return data;
}

AuthResponseDataBackupDataGoogleDriveFiles $AuthResponseDataBackupDataGoogleDriveFilesFromJson(Map<String, dynamic> json) {
	final AuthResponseDataBackupDataGoogleDriveFiles authResponseDataBackupDataGoogleDriveFiles = AuthResponseDataBackupDataGoogleDriveFiles();
	final String? fileId = jsonConvert.convert<String>(json['file_id']);
	if (fileId != null) {
		authResponseDataBackupDataGoogleDriveFiles.fileId = fileId;
	}
	final String? fileName = jsonConvert.convert<String>(json['file_name']);
	if (fileName != null) {
		authResponseDataBackupDataGoogleDriveFiles.fileName = fileName;
	}
	final int? fileSize = jsonConvert.convert<int>(json['file_size']);
	if (fileSize != null) {
		authResponseDataBackupDataGoogleDriveFiles.fileSize = fileSize;
	}
	return authResponseDataBackupDataGoogleDriveFiles;
}

Map<String, dynamic> $AuthResponseDataBackupDataGoogleDriveFilesToJson(AuthResponseDataBackupDataGoogleDriveFiles entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['file_id'] = entity.fileId;
	data['file_name'] = entity.fileName;
	data['file_size'] = entity.fileSize;
	return data;
}

AuthResponseDataSettings $AuthResponseDataSettingsFromJson(Map<String, dynamic> json) {
	final AuthResponseDataSettings authResponseDataSettings = AuthResponseDataSettings();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		authResponseDataSettings.id = id;
	}
	final bool? notification = jsonConvert.convert<bool>(json['notification']);
	if (notification != null) {
		authResponseDataSettings.notification = notification;
	}
	final int? radius = jsonConvert.convert<int>(json['radius']);
	if (radius != null) {
		authResponseDataSettings.radius = radius;
	}
	final bool? share = jsonConvert.convert<bool>(json['share']);
	if (share != null) {
		authResponseDataSettings.share = share;
	}
	final double? nearByDistance = jsonConvert.convert<double>(json['near_by_distance']);
	if (nearByDistance != null) {
		authResponseDataSettings.nearByDistance = nearByDistance;
	}
	final double? searchDistance = jsonConvert.convert<double>(json['search_distance']);
	if (searchDistance != null) {
		authResponseDataSettings.searchDistance = searchDistance;
	}
	final double? brooonDistance = jsonConvert.convert<double>(json['brooon_distance']);
	if (brooonDistance != null) {
		authResponseDataSettings.brooonDistance = brooonDistance;
	}
	final bool? basicDetails = jsonConvert.convert<bool>(json['basic_details']);
	if (basicDetails != null) {
		authResponseDataSettings.basicDetails = basicDetails;
	}
	final bool? ownerDetails = jsonConvert.convert<bool>(json['owner_details']);
	if (ownerDetails != null) {
		authResponseDataSettings.ownerDetails = ownerDetails;
	}
	final bool? otherDetails = jsonConvert.convert<bool>(json['other_details']);
	if (otherDetails != null) {
		authResponseDataSettings.otherDetails = otherDetails;
	}
	final bool? priceDetails = jsonConvert.convert<bool>(json['price_details']);
	if (priceDetails != null) {
		authResponseDataSettings.priceDetails = priceDetails;
	}
	final bool? photos = jsonConvert.convert<bool>(json['photos']);
	if (photos != null) {
		authResponseDataSettings.photos = photos;
	}
	final bool? watermark = jsonConvert.convert<bool>(json['watermark']);
	if (watermark != null) {
		authResponseDataSettings.watermark = watermark;
	}
	final bool? appReminder = jsonConvert.convert<bool>(json['app_reminder']);
	if (appReminder != null) {
		authResponseDataSettings.appReminder = appReminder;
	}
	final bool? publicProperties = jsonConvert.convert<bool>(json['public_properties']);
	if (publicProperties != null) {
		authResponseDataSettings.publicProperties = publicProperties;
	}
	final String? watermarkImage = jsonConvert.convert<String>(json['watermark_image']);
	if (watermarkImage != null) {
		authResponseDataSettings.watermarkImage = watermarkImage;
	}
	final String? watermarkText = jsonConvert.convert<String>(json['watermark_text']);
	if (watermarkText != null) {
		authResponseDataSettings.watermarkText = watermarkText;
	}
	final String? watermarkType = jsonConvert.convert<String>(json['watermark_type']);
	if (watermarkType != null) {
		authResponseDataSettings.watermarkType = watermarkType;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		authResponseDataSettings.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		authResponseDataSettings.updatedAt = updatedAt;
	}
	return authResponseDataSettings;
}

Map<String, dynamic> $AuthResponseDataSettingsToJson(AuthResponseDataSettings entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['notification'] = entity.notification;
	data['radius'] = entity.radius;
	data['share'] = entity.share;
	data['near_by_distance'] = entity.nearByDistance;
	data['search_distance'] = entity.searchDistance;
	data['brooon_distance'] = entity.brooonDistance;
	data['basic_details'] = entity.basicDetails;
	data['owner_details'] = entity.ownerDetails;
	data['other_details'] = entity.otherDetails;
	data['price_details'] = entity.priceDetails;
	data['photos'] = entity.photos;
	data['watermark'] = entity.watermark;
	data['app_reminder'] = entity.appReminder;
	data['public_properties'] = entity.publicProperties;
	data['watermark_image'] = entity.watermarkImage;
	data['watermark_text'] = entity.watermarkText;
	data['watermark_type'] = entity.watermarkType;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	return data;
}

AuthResponseDataSubscription $AuthResponseDataSubscriptionFromJson(Map<String, dynamic> json) {
	final AuthResponseDataSubscription authResponseDataSubscription = AuthResponseDataSubscription();
	final int? activePlanId = jsonConvert.convert<int>(json['active_plan_id']);
	if (activePlanId != null) {
		authResponseDataSubscription.activePlanId = activePlanId;
	}
	final String? activePlanType = jsonConvert.convert<String>(json['active_plan_type']);
	if (activePlanType != null) {
		authResponseDataSubscription.activePlanType = activePlanType;
	}
	final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
	if (expiredAt != null) {
		authResponseDataSubscription.expiredAt = expiredAt;
	}
	final bool? freeTrialExpired = jsonConvert.convert<bool>(json['free_trial_expired']);
	if (freeTrialExpired != null) {
		authResponseDataSubscription.freeTrialExpired = freeTrialExpired;
	}
	return authResponseDataSubscription;
}

Map<String, dynamic> $AuthResponseDataSubscriptionToJson(AuthResponseDataSubscription entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['active_plan_id'] = entity.activePlanId;
	data['active_plan_type'] = entity.activePlanType;
	data['expired_at'] = entity.expiredAt;
	data['free_trial_expired'] = entity.freeTrialExpired;
	return data;
}

AuthResponseDataHelp $AuthResponseDataHelpFromJson(Map<String, dynamic> json) {
	final AuthResponseDataHelp authResponseDataHelp = AuthResponseDataHelp();
	final String? aboutUs = jsonConvert.convert<String>(json['about_us']);
	if (aboutUs != null) {
		authResponseDataHelp.aboutUs = aboutUs;
	}
	final String? faqs = jsonConvert.convert<String>(json['faqs']);
	if (faqs != null) {
		authResponseDataHelp.faqs = faqs;
	}
	final String? privacyPolicy = jsonConvert.convert<String>(json['privacy_policy']);
	if (privacyPolicy != null) {
		authResponseDataHelp.privacyPolicy = privacyPolicy;
	}
	final String? termsConditions = jsonConvert.convert<String>(json['terms_conditions']);
	if (termsConditions != null) {
		authResponseDataHelp.termsConditions = termsConditions;
	}
	return authResponseDataHelp;
}

Map<String, dynamic> $AuthResponseDataHelpToJson(AuthResponseDataHelp entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['about_us'] = entity.aboutUs;
	data['faqs'] = entity.faqs;
	data['privacy_policy'] = entity.privacyPolicy;
	data['terms_conditions'] = entity.termsConditions;
	return data;
}

AuthResponseDataFollowUs $AuthResponseDataFollowUsFromJson(Map<String, dynamic> json) {
	final AuthResponseDataFollowUs authResponseDataFollowUs = AuthResponseDataFollowUs();
	final String? facebook = jsonConvert.convert<String>(json['facebook']);
	if (facebook != null) {
		authResponseDataFollowUs.facebook = facebook;
	}
	final String? twitter = jsonConvert.convert<String>(json['twitter']);
	if (twitter != null) {
		authResponseDataFollowUs.twitter = twitter;
	}
	final String? instagram = jsonConvert.convert<String>(json['instagram']);
	if (instagram != null) {
		authResponseDataFollowUs.instagram = instagram;
	}
	final String? linkedIn = jsonConvert.convert<String>(json['linkedIn']);
	if (linkedIn != null) {
		authResponseDataFollowUs.linkedIn = linkedIn;
	}
	return authResponseDataFollowUs;
}

Map<String, dynamic> $AuthResponseDataFollowUsToJson(AuthResponseDataFollowUs entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['facebook'] = entity.facebook;
	data['twitter'] = entity.twitter;
	data['instagram'] = entity.instagram;
	data['linkedIn'] = entity.linkedIn;
	return data;
}

AuthResponseDataAssociationInfo $AuthResponseDataAssociationInfoFromJson(Map<String, dynamic> json) {
	final AuthResponseDataAssociationInfo authResponseDataAssociationInfo = AuthResponseDataAssociationInfo();
	final int? associationId = jsonConvert.convert<int>(json['association_id']);
	if (associationId != null) {
		authResponseDataAssociationInfo.associationId = associationId;
	}
	final String? associationCode = jsonConvert.convert<String>(json['association_code']);
	if (associationCode != null) {
		authResponseDataAssociationInfo.associationCode = associationCode;
	}
	final String? associationPhoto = jsonConvert.convert<String>(json['association_photo']);
	if (associationPhoto != null) {
		authResponseDataAssociationInfo.associationPhoto = associationPhoto;
	}
	return authResponseDataAssociationInfo;
}

Map<String, dynamic> $AuthResponseDataAssociationInfoToJson(AuthResponseDataAssociationInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['association_id'] = entity.associationId;
	data['association_code'] = entity.associationCode;
	data['association_photo'] = entity.associationPhoto;
	return data;
}