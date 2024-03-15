import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/subscription_plans_response_entity.g.dart';

@JsonSerializable()
class SubscriptionPlansResponseEntity {
  int? code;
  bool? success;
  String? message;
  SubscriptionPlansResponseData? data;

  SubscriptionPlansResponseEntity();

  factory SubscriptionPlansResponseEntity.fromJson(Map<String, dynamic> json) =>
      $SubscriptionPlansResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $SubscriptionPlansResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SubscriptionPlansResponseData {
  List<SubscriptionPlansResponseDataPlans>? plans;

  SubscriptionPlansResponseData();

  factory SubscriptionPlansResponseData.fromJson(Map<String, dynamic> json) =>
      $SubscriptionPlansResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $SubscriptionPlansResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SubscriptionPlansResponseDataPlans {
  int? id;
  String? type;
  @JSONField(name: "plan_id")
  String? planId;
  String? title;
  List<String>? description;
  String? duration;
  String? price;

  SubscriptionPlansResponseDataPlans();

  factory SubscriptionPlansResponseDataPlans.fromJson(
          Map<String, dynamic> json) =>
      $SubscriptionPlansResponseDataPlansFromJson(json);

  Map<String, dynamic> toJson() =>
      $SubscriptionPlansResponseDataPlansToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
