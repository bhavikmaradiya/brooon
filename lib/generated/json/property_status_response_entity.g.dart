import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/property_details/api_response/property_status_response_entity.dart';

PropertyStatusResponseEntity $PropertyStatusResponseEntityFromJson(Map<String, dynamic> json) {
	final PropertyStatusResponseEntity propertyStatusResponseEntity = PropertyStatusResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		propertyStatusResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		propertyStatusResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		propertyStatusResponseEntity.message = message;
	}
	final PropertyStatusResponseData? data = jsonConvert.convert<PropertyStatusResponseData>(json['data']);
	if (data != null) {
		propertyStatusResponseEntity.data = data;
	}
	return propertyStatusResponseEntity;
}

Map<String, dynamic> $PropertyStatusResponseEntityToJson(PropertyStatusResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

PropertyStatusResponseData $PropertyStatusResponseDataFromJson(Map<String, dynamic> json) {
	final PropertyStatusResponseData propertyStatusResponseData = PropertyStatusResponseData();
	final List<String>? propertyStatusIds = jsonConvert.convertListNotNull<String>(json['property_status_ids']);
	if (propertyStatusIds != null) {
		propertyStatusResponseData.propertyStatusIds = propertyStatusIds;
	}
	final List<String>? closedDealIds = jsonConvert.convertListNotNull<String>(json['closed_deal_ids']);
	if (closedDealIds != null) {
		propertyStatusResponseData.closedDealIds = closedDealIds;
	}
	final List<String>? propertyVisibilityIds = jsonConvert.convertListNotNull<String>(json['property_visibility_ids']);
	if (propertyVisibilityIds != null) {
		propertyStatusResponseData.propertyVisibilityIds = propertyVisibilityIds;
	}
	final List<String>? propertyDeletedIds = jsonConvert.convertListNotNull<String>(json['property_deleted_ids']);
	if (propertyDeletedIds != null) {
		propertyStatusResponseData.propertyDeletedIds = propertyDeletedIds;
	}
	return propertyStatusResponseData;
}

Map<String, dynamic> $PropertyStatusResponseDataToJson(PropertyStatusResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['property_status_ids'] =  entity.propertyStatusIds;
	data['closed_deal_ids'] =  entity.closedDealIds;
	data['property_visibility_ids'] =  entity.propertyVisibilityIds;
	data['property_deleted_ids'] =  entity.propertyDeletedIds;
	return data;
}