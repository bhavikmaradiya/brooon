import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/home/api_response/check_user_verify_response_entity.dart';

CheckUserVerifyResponseEntity $CheckUserVerifyResponseEntityFromJson(Map<String, dynamic> json) {
	final CheckUserVerifyResponseEntity checkUserVerifyResponseEntity = CheckUserVerifyResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		checkUserVerifyResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		checkUserVerifyResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		checkUserVerifyResponseEntity.message = message;
	}
	final CheckUserVerifyResponseData? data = jsonConvert.convert<CheckUserVerifyResponseData>(json['data']);
	if (data != null) {
		checkUserVerifyResponseEntity.data = data;
	}
	return checkUserVerifyResponseEntity;
}

Map<String, dynamic> $CheckUserVerifyResponseEntityToJson(CheckUserVerifyResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

CheckUserVerifyResponseData $CheckUserVerifyResponseDataFromJson(Map<String, dynamic> json) {
	final CheckUserVerifyResponseData checkUserVerifyResponseData = CheckUserVerifyResponseData();
	final bool? isVerified = jsonConvert.convert<bool>(json['is_verified']);
	if (isVerified != null) {
		checkUserVerifyResponseData.isVerified = isVerified;
	}
	return checkUserVerifyResponseData;
}

Map<String, dynamic> $CheckUserVerifyResponseDataToJson(CheckUserVerifyResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['is_verified'] = entity.isVerified;
	return data;
}