import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/add_buyer/api_response/add_buyer_response_entity.dart';

AddBuyerResponseEntity $AddBuyerResponseEntityFromJson(Map<String, dynamic> json) {
	final AddBuyerResponseEntity addBuyerResponseEntity = AddBuyerResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		addBuyerResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		addBuyerResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		addBuyerResponseEntity.message = message;
	}
	final AddBuyerResponseData? data = jsonConvert.convert<AddBuyerResponseData>(json['data']);
	if (data != null) {
		addBuyerResponseEntity.data = data;
	}
	return addBuyerResponseEntity;
}

Map<String, dynamic> $AddBuyerResponseEntityToJson(AddBuyerResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AddBuyerResponseData $AddBuyerResponseDataFromJson(Map<String, dynamic> json) {
	final AddBuyerResponseData addBuyerResponseData = AddBuyerResponseData();
	final List<String>? inquiriesId = jsonConvert.convertListNotNull<String>(json['inquiries_id']);
	if (inquiriesId != null) {
		addBuyerResponseData.inquiriesId = inquiriesId;
	}
	return addBuyerResponseData;
}

Map<String, dynamic> $AddBuyerResponseDataToJson(AddBuyerResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['inquiries_id'] =  entity.inquiriesId;
	return data;
}