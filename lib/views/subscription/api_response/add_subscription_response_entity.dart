import 'dart:convert';

import '../../../generated/json/add_subscription_response_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class AddSubscriptionResponseEntity {
  int? code;
  bool? success;
  String? message;
  AddSubscriptionResponseData? data;

  AddSubscriptionResponseEntity();

  factory AddSubscriptionResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AddSubscriptionResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AddSubscriptionResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AddSubscriptionResponseData {
  @JSONField(name: "expired_at")
  int? expiredAt;

  AddSubscriptionResponseData();

  factory AddSubscriptionResponseData.fromJson(Map<String, dynamic> json) =>
      $AddSubscriptionResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AddSubscriptionResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
