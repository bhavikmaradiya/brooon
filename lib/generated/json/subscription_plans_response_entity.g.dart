import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/subscription/api_response/subscription_plans_response_entity.dart';

SubscriptionPlansResponseEntity $SubscriptionPlansResponseEntityFromJson(Map<String, dynamic> json) {
	final SubscriptionPlansResponseEntity subscriptionPlansResponseEntity = SubscriptionPlansResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		subscriptionPlansResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		subscriptionPlansResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		subscriptionPlansResponseEntity.message = message;
	}
	final SubscriptionPlansResponseData? data = jsonConvert.convert<SubscriptionPlansResponseData>(json['data']);
	if (data != null) {
		subscriptionPlansResponseEntity.data = data;
	}
	return subscriptionPlansResponseEntity;
}

Map<String, dynamic> $SubscriptionPlansResponseEntityToJson(SubscriptionPlansResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

SubscriptionPlansResponseData $SubscriptionPlansResponseDataFromJson(Map<String, dynamic> json) {
	final SubscriptionPlansResponseData subscriptionPlansResponseData = SubscriptionPlansResponseData();
	final List<SubscriptionPlansResponseDataPlans>? plans = jsonConvert.convertListNotNull<SubscriptionPlansResponseDataPlans>(json['plans']);
	if (plans != null) {
		subscriptionPlansResponseData.plans = plans;
	}
	return subscriptionPlansResponseData;
}

Map<String, dynamic> $SubscriptionPlansResponseDataToJson(SubscriptionPlansResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['plans'] =  entity.plans?.map((v) => v.toJson()).toList();
	return data;
}

SubscriptionPlansResponseDataPlans $SubscriptionPlansResponseDataPlansFromJson(Map<String, dynamic> json) {
	final SubscriptionPlansResponseDataPlans subscriptionPlansResponseDataPlans = SubscriptionPlansResponseDataPlans();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		subscriptionPlansResponseDataPlans.id = id;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		subscriptionPlansResponseDataPlans.type = type;
	}
	final String? planId = jsonConvert.convert<String>(json['plan_id']);
	if (planId != null) {
		subscriptionPlansResponseDataPlans.planId = planId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		subscriptionPlansResponseDataPlans.title = title;
	}
	final List<String>? description = jsonConvert.convertListNotNull<String>(json['description']);
	if (description != null) {
		subscriptionPlansResponseDataPlans.description = description;
	}
	final String? duration = jsonConvert.convert<String>(json['duration']);
	if (duration != null) {
		subscriptionPlansResponseDataPlans.duration = duration;
	}
	final String? price = jsonConvert.convert<String>(json['price']);
	if (price != null) {
		subscriptionPlansResponseDataPlans.price = price;
	}
	return subscriptionPlansResponseDataPlans;
}

Map<String, dynamic> $SubscriptionPlansResponseDataPlansToJson(SubscriptionPlansResponseDataPlans entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['plan_id'] = entity.planId;
	data['title'] = entity.title;
	data['description'] =  entity.description;
	data['duration'] = entity.duration;
	data['price'] = entity.price;
	return data;
}