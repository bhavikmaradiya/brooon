import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/watermark/api_response/add_watermark_response_entity.dart';

AddWatermarkResponseEntity $AddWatermarkResponseEntityFromJson(Map<String, dynamic> json) {
	final AddWatermarkResponseEntity addWatermarkResponseEntity = AddWatermarkResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		addWatermarkResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		addWatermarkResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		addWatermarkResponseEntity.message = message;
	}
	final AddWatermarkResponseData? data = jsonConvert.convert<AddWatermarkResponseData>(json['data']);
	if (data != null) {
		addWatermarkResponseEntity.data = data;
	}
	return addWatermarkResponseEntity;
}

Map<String, dynamic> $AddWatermarkResponseEntityToJson(AddWatermarkResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AddWatermarkResponseData $AddWatermarkResponseDataFromJson(Map<String, dynamic> json) {
	final AddWatermarkResponseData addWatermarkResponseData = AddWatermarkResponseData();
	return addWatermarkResponseData;
}

Map<String, dynamic> $AddWatermarkResponseDataToJson(AddWatermarkResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}