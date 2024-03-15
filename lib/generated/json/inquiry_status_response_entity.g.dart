import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/inquiry_details/api_response/inquiry_status_response_entity.dart';

InquiryStatusResponseEntity $InquiryStatusResponseEntityFromJson(Map<String, dynamic> json) {
	final InquiryStatusResponseEntity inquiryStatusResponseEntity = InquiryStatusResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		inquiryStatusResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		inquiryStatusResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		inquiryStatusResponseEntity.message = message;
	}
	final InquiryStatusResponseData? data = jsonConvert.convert<InquiryStatusResponseData>(json['data']);
	if (data != null) {
		inquiryStatusResponseEntity.data = data;
	}
	return inquiryStatusResponseEntity;
}

Map<String, dynamic> $InquiryStatusResponseEntityToJson(InquiryStatusResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

InquiryStatusResponseData $InquiryStatusResponseDataFromJson(Map<String, dynamic> json) {
	final InquiryStatusResponseData inquiryStatusResponseData = InquiryStatusResponseData();
	final List<String>? inquiryStatusIds = jsonConvert.convertListNotNull<String>(json['inquiry_status_ids']);
	if (inquiryStatusIds != null) {
		inquiryStatusResponseData.inquiryStatusIds = inquiryStatusIds;
	}
	final List<String>? closedDealIds = jsonConvert.convertListNotNull<String>(json['closed_deal_ids']);
	if (closedDealIds != null) {
		inquiryStatusResponseData.closedDealIds = closedDealIds;
	}
	final List<String>? inquiryVisibilityIds = jsonConvert.convertListNotNull<String>(json['inquiry_visibility_ids']);
	if (inquiryVisibilityIds != null) {
		inquiryStatusResponseData.inquiryVisibilityIds = inquiryVisibilityIds;
	}
	final List<String>? inquiryDeletedIds = jsonConvert.convertListNotNull<String>(json['inquiry_deleted_ids']);
	if (inquiryDeletedIds != null) {
		inquiryStatusResponseData.inquiryDeletedIds = inquiryDeletedIds;
	}
	return inquiryStatusResponseData;
}

Map<String, dynamic> $InquiryStatusResponseDataToJson(InquiryStatusResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['inquiry_status_ids'] =  entity.inquiryStatusIds;
	data['closed_deal_ids'] =  entity.closedDealIds;
	data['inquiry_visibility_ids'] =  entity.inquiryVisibilityIds;
	data['inquiry_deleted_ids'] =  entity.inquiryDeletedIds;
	return data;
}