import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/authentication/api_response/logout_response_entity.dart';

LogoutResponseEntity $LogoutResponseEntityFromJson(Map<String, dynamic> json) {
	final LogoutResponseEntity logoutResponseEntity = LogoutResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		logoutResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		logoutResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		logoutResponseEntity.message = message;
	}
	final LogoutResponseData? data = jsonConvert.convert<LogoutResponseData>(json['data']);
	if (data != null) {
		logoutResponseEntity.data = data;
	}
	return logoutResponseEntity;
}

Map<String, dynamic> $LogoutResponseEntityToJson(LogoutResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

LogoutResponseData $LogoutResponseDataFromJson(Map<String, dynamic> json) {
	final LogoutResponseData logoutResponseData = LogoutResponseData();
	return logoutResponseData;
}

Map<String, dynamic> $LogoutResponseDataToJson(LogoutResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}