import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/profile/api_response/update_profile_response_entity.dart';

UpdateProfileResponseEntity $UpdateProfileResponseEntityFromJson(Map<String, dynamic> json) {
	final UpdateProfileResponseEntity updateProfileResponseEntity = UpdateProfileResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		updateProfileResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		updateProfileResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		updateProfileResponseEntity.message = message;
	}
	final UpdateProfileResponseData? data = jsonConvert.convert<UpdateProfileResponseData>(json['data']);
	if (data != null) {
		updateProfileResponseEntity.data = data;
	}
	return updateProfileResponseEntity;
}

Map<String, dynamic> $UpdateProfileResponseEntityToJson(UpdateProfileResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

UpdateProfileResponseData $UpdateProfileResponseDataFromJson(Map<String, dynamic> json) {
	final UpdateProfileResponseData updateProfileResponseData = UpdateProfileResponseData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		updateProfileResponseData.id = id;
	}
	final String? profilePic = jsonConvert.convert<String>(json['profile_pic']);
	if (profilePic != null) {
		updateProfileResponseData.profilePic = profilePic;
	}
	final String? userName = jsonConvert.convert<String>(json['user_name']);
	if (userName != null) {
		updateProfileResponseData.userName = userName;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		updateProfileResponseData.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		updateProfileResponseData.lastName = lastName;
	}
	final String? mobileNumber = jsonConvert.convert<String>(json['mobile_number']);
	if (mobileNumber != null) {
		updateProfileResponseData.mobileNumber = mobileNumber;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		updateProfileResponseData.email = email;
	}
	final bool? isVerified = jsonConvert.convert<bool>(json['is_verified']);
	if (isVerified != null) {
		updateProfileResponseData.isVerified = isVerified;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		updateProfileResponseData.gender = gender;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		updateProfileResponseData.longitude = longitude;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		updateProfileResponseData.latitude = latitude;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		updateProfileResponseData.address = address;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		updateProfileResponseData.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		updateProfileResponseData.updatedAt = updatedAt;
	}
	return updateProfileResponseData;
}

Map<String, dynamic> $UpdateProfileResponseDataToJson(UpdateProfileResponseData entity) {
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
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	return data;
}