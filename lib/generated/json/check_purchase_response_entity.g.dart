import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/subscription/api_response/check_purchase_response_entity.dart';

CheckPurchaseResponseEntity $CheckPurchaseResponseEntityFromJson(Map<String, dynamic> json) {
	final CheckPurchaseResponseEntity checkPurchaseResponseEntity = CheckPurchaseResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		checkPurchaseResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		checkPurchaseResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		checkPurchaseResponseEntity.message = message;
	}
	final CheckPurchaseResponseData? data = jsonConvert.convert<CheckPurchaseResponseData>(json['data']);
	if (data != null) {
		checkPurchaseResponseEntity.data = data;
	}
	return checkPurchaseResponseEntity;
}

Map<String, dynamic> $CheckPurchaseResponseEntityToJson(CheckPurchaseResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

CheckPurchaseResponseData $CheckPurchaseResponseDataFromJson(Map<String, dynamic> json) {
	final CheckPurchaseResponseData checkPurchaseResponseData = CheckPurchaseResponseData();
	final String? planType = jsonConvert.convert<String>(json['plan_type']);
	if (planType != null) {
		checkPurchaseResponseData.planType = planType;
	}
	final int? planId = jsonConvert.convert<int>(json['plan_id']);
	if (planId != null) {
		checkPurchaseResponseData.planId = planId;
	}
	final String? paymentMode = jsonConvert.convert<String>(json['payment_mode']);
	if (paymentMode != null) {
		checkPurchaseResponseData.paymentMode = paymentMode;
	}
	final String? purchaseId = jsonConvert.convert<String>(json['purchase_id']);
	if (purchaseId != null) {
		checkPurchaseResponseData.purchaseId = purchaseId;
	}
	final int? purchaseTime = jsonConvert.convert<int>(json['purchase_time']);
	if (purchaseTime != null) {
		checkPurchaseResponseData.purchaseTime = purchaseTime;
	}
	final int? startAt = jsonConvert.convert<int>(json['start_at']);
	if (startAt != null) {
		checkPurchaseResponseData.startAt = startAt;
	}
	final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
	if (expiredAt != null) {
		checkPurchaseResponseData.expiredAt = expiredAt;
	}
	final int? totalExpiredAt = jsonConvert.convert<int>(json['total_expired_at']);
	if (totalExpiredAt != null) {
		checkPurchaseResponseData.totalExpiredAt = totalExpiredAt;
	}
	return checkPurchaseResponseData;
}

Map<String, dynamic> $CheckPurchaseResponseDataToJson(CheckPurchaseResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['plan_id'] = entity.planId;
	data['plan_type'] = entity.planType;
	data['payment_mode'] = entity.paymentMode;
	data['purchase_id'] = entity.purchaseId;
	data['purchase_time'] = entity.purchaseTime;
	data['start_at'] = entity.startAt;
	data['expired_at'] = entity.expiredAt;
	data['total_expired_at'] = entity.totalExpiredAt;
	return data;
}