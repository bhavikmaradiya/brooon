import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/subscription/api_response/add_subscription_response_entity.dart';

AddSubscriptionResponseEntity $AddSubscriptionResponseEntityFromJson(Map<String, dynamic> json) {
	final AddSubscriptionResponseEntity addSubscriptionResponseEntity = AddSubscriptionResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		addSubscriptionResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		addSubscriptionResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		addSubscriptionResponseEntity.message = message;
	}
	final AddSubscriptionResponseData? data = jsonConvert.convert<AddSubscriptionResponseData>(json['data']);
	if (data != null) {
		addSubscriptionResponseEntity.data = data;
	}
	return addSubscriptionResponseEntity;
}

Map<String, dynamic> $AddSubscriptionResponseEntityToJson(AddSubscriptionResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AddSubscriptionResponseData $AddSubscriptionResponseDataFromJson(Map<String, dynamic> json) {
	final AddSubscriptionResponseData addSubscriptionResponseData = AddSubscriptionResponseData();
	final int? expiredAt = jsonConvert.convert<int>(json['expired_at']);
	if (expiredAt != null) {
		addSubscriptionResponseData.expiredAt = expiredAt;
	}
	return addSubscriptionResponseData;
}

Map<String, dynamic> $AddSubscriptionResponseDataToJson(AddSubscriptionResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['expired_at'] = entity.expiredAt;
	return data;
}