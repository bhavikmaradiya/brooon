import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/add_property/api_response/add_property_response_entity.dart';

AddPropertyResponseEntity $AddPropertyResponseEntityFromJson(Map<String, dynamic> json) {
	final AddPropertyResponseEntity addPropertyResponseEntity = AddPropertyResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		addPropertyResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		addPropertyResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		addPropertyResponseEntity.message = message;
	}
	final AddPropertyResponseData? data = jsonConvert.convert<AddPropertyResponseData>(json['data']);
	if (data != null) {
		addPropertyResponseEntity.data = data;
	}
	return addPropertyResponseEntity;
}

Map<String, dynamic> $AddPropertyResponseEntityToJson(AddPropertyResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AddPropertyResponseData $AddPropertyResponseDataFromJson(Map<String, dynamic> json) {
	final AddPropertyResponseData addPropertyResponseData = AddPropertyResponseData();
	final List<String>? propertyIds = jsonConvert.convertListNotNull<String>(json['property_ids']);
	if (propertyIds != null) {
		addPropertyResponseData.propertyIds = propertyIds;
	}
	return addPropertyResponseData;
}

Map<String, dynamic> $AddPropertyResponseDataToJson(AddPropertyResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['property_ids'] =  entity.propertyIds;
	return data;
}