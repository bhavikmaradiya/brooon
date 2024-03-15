import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/network/refresh_token/refresh_token_response_entity.dart';

RefreshTokenResponseEntity $RefreshTokenResponseEntityFromJson(Map<String, dynamic> json) {
	final RefreshTokenResponseEntity refreshTokenResponseEntity = RefreshTokenResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		refreshTokenResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		refreshTokenResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		refreshTokenResponseEntity.message = message;
	}
	final RefreshTokenResponseData? data = jsonConvert.convert<RefreshTokenResponseData>(json['data']);
	if (data != null) {
		refreshTokenResponseEntity.data = data;
	}
	return refreshTokenResponseEntity;
}

Map<String, dynamic> $RefreshTokenResponseEntityToJson(RefreshTokenResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

RefreshTokenResponseData $RefreshTokenResponseDataFromJson(Map<String, dynamic> json) {
	final RefreshTokenResponseData refreshTokenResponseData = RefreshTokenResponseData();
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		refreshTokenResponseData.accessToken = accessToken;
	}
	return refreshTokenResponseData;
}

Map<String, dynamic> $RefreshTokenResponseDataToJson(RefreshTokenResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['access_token'] = entity.accessToken;
	return data;
}