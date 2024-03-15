import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/choose_location/api_response/update_location_response_entity.dart';

UpdateLocationResponseEntity $UpdateLocationResponseEntityFromJson(Map<String, dynamic> json) {
	final UpdateLocationResponseEntity updateLocationResponseEntity = UpdateLocationResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		updateLocationResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		updateLocationResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		updateLocationResponseEntity.message = message;
	}
	final UpdateLocationResponseData? data = jsonConvert.convert<UpdateLocationResponseData>(json['data']);
	if (data != null) {
		updateLocationResponseEntity.data = data;
	}
	return updateLocationResponseEntity;
}

Map<String, dynamic> $UpdateLocationResponseEntityToJson(UpdateLocationResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

UpdateLocationResponseData $UpdateLocationResponseDataFromJson(Map<String, dynamic> json) {
	final UpdateLocationResponseData updateLocationResponseData = UpdateLocationResponseData();
	return updateLocationResponseData;
}

Map<String, dynamic> $UpdateLocationResponseDataToJson(UpdateLocationResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}