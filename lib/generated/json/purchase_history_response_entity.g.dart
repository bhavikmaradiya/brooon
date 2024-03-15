import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/subscription/api_response/purchase_history_response_entity.dart';

PurchaseHistoryResponseEntity $PurchaseHistoryResponseEntityFromJson(Map<String, dynamic> json) {
	final PurchaseHistoryResponseEntity purchaseHistoryResponseEntity = PurchaseHistoryResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		purchaseHistoryResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		purchaseHistoryResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		purchaseHistoryResponseEntity.message = message;
	}
	final PurchaseHistoryResponseData? data = jsonConvert.convert<PurchaseHistoryResponseData>(json['data']);
	if (data != null) {
		purchaseHistoryResponseEntity.data = data;
	}
	return purchaseHistoryResponseEntity;
}

Map<String, dynamic> $PurchaseHistoryResponseEntityToJson(PurchaseHistoryResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

PurchaseHistoryResponseData $PurchaseHistoryResponseDataFromJson(Map<String, dynamic> json) {
	final PurchaseHistoryResponseData purchaseHistoryResponseData = PurchaseHistoryResponseData();
	final List<PurchaseHistoryResponseDataCurrentSubscription>? currentSubscription = jsonConvert.convertListNotNull<PurchaseHistoryResponseDataCurrentSubscription>(json['current_subscription']);
	if (currentSubscription != null) {
		purchaseHistoryResponseData.currentSubscription = currentSubscription;
	}
	final List<PurchaseHistoryResponseDataPreviousSubscription>? previousSubscription = jsonConvert.convertListNotNull<PurchaseHistoryResponseDataPreviousSubscription>(json['previous_subscription']);
	if (previousSubscription != null) {
		purchaseHistoryResponseData.previousSubscription = previousSubscription;
	}
	return purchaseHistoryResponseData;
}

Map<String, dynamic> $PurchaseHistoryResponseDataToJson(PurchaseHistoryResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current_subscription'] =  entity.currentSubscription?.map((v) => v.toJson()).toList();
	data['previous_subscription'] =  entity.previousSubscription?.map((v) => v.toJson()).toList();
	return data;
}

PurchaseHistoryResponseDataCurrentSubscription $PurchaseHistoryResponseDataCurrentSubscriptionFromJson(Map<String, dynamic> json) {
	final PurchaseHistoryResponseDataCurrentSubscription purchaseHistoryResponseDataCurrentSubscription = PurchaseHistoryResponseDataCurrentSubscription();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		purchaseHistoryResponseDataCurrentSubscription.id = id;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		purchaseHistoryResponseDataCurrentSubscription.type = type;
	}
	final String? planId = jsonConvert.convert<String>(json['plan_id']);
	if (planId != null) {
		purchaseHistoryResponseDataCurrentSubscription.planId = planId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		purchaseHistoryResponseDataCurrentSubscription.title = title;
	}
	final String? duration = jsonConvert.convert<String>(json['duration']);
	if (duration != null) {
		purchaseHistoryResponseDataCurrentSubscription.duration = duration;
	}
	final String? price = jsonConvert.convert<String>(json['price']);
	if (price != null) {
		purchaseHistoryResponseDataCurrentSubscription.price = price;
	}
	final String? planType = jsonConvert.convert<String>(json['plan_type']);
	if (planType != null) {
		purchaseHistoryResponseDataCurrentSubscription.planType = planType;
	}
	final String? paymentMode = jsonConvert.convert<String>(json['payment_mode']);
	if (paymentMode != null) {
		purchaseHistoryResponseDataCurrentSubscription.paymentMode = paymentMode;
	}
	final String? purchaseId = jsonConvert.convert<String>(json['purchase_id']);
	if (purchaseId != null) {
		purchaseHistoryResponseDataCurrentSubscription.purchaseId = purchaseId;
	}
	final int? purchaseTime = jsonConvert.convert<int>(json['purchase_time']);
	if (purchaseTime != null) {
		purchaseHistoryResponseDataCurrentSubscription.purchaseTime = purchaseTime;
	}
	final int? startAt = jsonConvert.convert<int>(json['start_at']);
	if (startAt != null) {
		purchaseHistoryResponseDataCurrentSubscription.startAt = startAt;
	}
	final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
	if (expiredAt != null) {
		purchaseHistoryResponseDataCurrentSubscription.expiredAt = expiredAt;
	}
	final int? totalExpiredAt = jsonConvert.convert<int>(json['total_expired_at']);
	if (totalExpiredAt != null) {
		purchaseHistoryResponseDataCurrentSubscription.totalExpiredAt = totalExpiredAt;
	}
	return purchaseHistoryResponseDataCurrentSubscription;
}

Map<String, dynamic> $PurchaseHistoryResponseDataCurrentSubscriptionToJson(PurchaseHistoryResponseDataCurrentSubscription entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['plan_id'] = entity.planId;
	data['title'] = entity.title;
	data['duration'] = entity.duration;
	data['price'] = entity.price;
	data['plan_type'] = entity.planType;
	data['payment_mode'] = entity.paymentMode;
	data['purchase_id'] = entity.purchaseId;
	data['purchase_time'] = entity.purchaseTime;
	data['start_at'] = entity.startAt;
	data['expired_at'] = entity.expiredAt;
	data['total_expired_at'] = entity.totalExpiredAt;
	return data;
}

PurchaseHistoryResponseDataPreviousSubscription $PurchaseHistoryResponseDataPreviousSubscriptionFromJson(Map<String, dynamic> json) {
	final PurchaseHistoryResponseDataPreviousSubscription purchaseHistoryResponseDataPreviousSubscription = PurchaseHistoryResponseDataPreviousSubscription();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		purchaseHistoryResponseDataPreviousSubscription.id = id;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		purchaseHistoryResponseDataPreviousSubscription.type = type;
	}
	final String? planId = jsonConvert.convert<String>(json['plan_id']);
	if (planId != null) {
		purchaseHistoryResponseDataPreviousSubscription.planId = planId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		purchaseHistoryResponseDataPreviousSubscription.title = title;
	}
	final String? duration = jsonConvert.convert<String>(json['duration']);
	if (duration != null) {
		purchaseHistoryResponseDataPreviousSubscription.duration = duration;
	}
	final String? price = jsonConvert.convert<String>(json['price']);
	if (price != null) {
		purchaseHistoryResponseDataPreviousSubscription.price = price;
	}
	final String? planType = jsonConvert.convert<String>(json['plan_type']);
	if (planType != null) {
		purchaseHistoryResponseDataPreviousSubscription.planType = planType;
	}
	final String? paymentMode = jsonConvert.convert<String>(json['payment_mode']);
	if (paymentMode != null) {
		purchaseHistoryResponseDataPreviousSubscription.paymentMode = paymentMode;
	}
	final String? purchaseId = jsonConvert.convert<String>(json['purchase_id']);
	if (purchaseId != null) {
		purchaseHistoryResponseDataPreviousSubscription.purchaseId = purchaseId;
	}
	final int? purchaseTime = jsonConvert.convert<int>(json['purchase_time']);
	if (purchaseTime != null) {
		purchaseHistoryResponseDataPreviousSubscription.purchaseTime = purchaseTime;
	}
	final int? startAt = jsonConvert.convert<int>(json['start_at']);
	if (startAt != null) {
		purchaseHistoryResponseDataPreviousSubscription.startAt = startAt;
	}
	final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
	if (expiredAt != null) {
		purchaseHistoryResponseDataPreviousSubscription.expiredAt = expiredAt;
	}
	final int? totalExpiredAt = jsonConvert.convert<int>(json['total_expired_at']);
	if (totalExpiredAt != null) {
		purchaseHistoryResponseDataPreviousSubscription.totalExpiredAt = totalExpiredAt;
	}
	return purchaseHistoryResponseDataPreviousSubscription;
}

Map<String, dynamic> $PurchaseHistoryResponseDataPreviousSubscriptionToJson(PurchaseHistoryResponseDataPreviousSubscription entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['plan_id'] = entity.planId;
	data['title'] = entity.title;
	data['duration'] = entity.duration;
	data['price'] = entity.price;
	data['plan_type'] = entity.planType;
	data['payment_mode'] = entity.paymentMode;
	data['purchase_id'] = entity.purchaseId;
	data['purchase_time'] = entity.purchaseTime;
	data['start_at'] = entity.startAt;
	data['expired_at'] = entity.expiredAt;
	data['total_expired_at'] = entity.totalExpiredAt;
	return data;
}