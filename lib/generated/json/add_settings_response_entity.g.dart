import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/settings/api_response/add_settings_response_entity.dart';

AddSettingsResponseEntity $AddSettingsResponseEntityFromJson(Map<String, dynamic> json) {
	final AddSettingsResponseEntity addSettingsResponseEntity = AddSettingsResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		addSettingsResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		addSettingsResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		addSettingsResponseEntity.message = message;
	}
	final AddSettingsResponseData? data = jsonConvert.convert<AddSettingsResponseData>(json['data']);
	if (data != null) {
		addSettingsResponseEntity.data = data;
	}
	return addSettingsResponseEntity;
}

Map<String, dynamic> $AddSettingsResponseEntityToJson(AddSettingsResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AddSettingsResponseData $AddSettingsResponseDataFromJson(Map<String, dynamic> json) {
	final AddSettingsResponseData addSettingsResponseData = AddSettingsResponseData();
	return addSettingsResponseData;
}

Map<String, dynamic> $AddSettingsResponseDataToJson(AddSettingsResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}