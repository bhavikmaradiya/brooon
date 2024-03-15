import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/purchase_history_response_entity.g.dart';

@JsonSerializable()
class PurchaseHistoryResponseEntity {
  int? code;
  bool? success;
  String? message;
  PurchaseHistoryResponseData? data;

  PurchaseHistoryResponseEntity();

  factory PurchaseHistoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      $PurchaseHistoryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $PurchaseHistoryResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PurchaseHistoryResponseData {
  @JSONField(name: "current_subscription")
  List<PurchaseHistoryResponseDataCurrentSubscription>? currentSubscription;
  @JSONField(name: "previous_subscription")
  List<PurchaseHistoryResponseDataPreviousSubscription>? previousSubscription;

  PurchaseHistoryResponseData();

  factory PurchaseHistoryResponseData.fromJson(Map<String, dynamic> json) =>
      $PurchaseHistoryResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $PurchaseHistoryResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PurchaseHistoryResponseDataCurrentSubscription {
  int? id;
  String? type;
  @JSONField(name: "plan_id")
  String? planId;
  String? title;
  String? duration;
  String? price;
  @JSONField(name: "plan_type")
  String? planType;
  @JSONField(name: "payment_mode")
  String? paymentMode;
  @JSONField(name: "purchase_id")
  String? purchaseId;
  @JSONField(name: "purchase_time")
  int? purchaseTime;
  @JSONField(name: "start_at")
  int? startAt;
  @JSONField(name: "expired_at")
  int? expiredAt;
  @JSONField(name: "total_expired_at")
  int? totalExpiredAt;

  PurchaseHistoryResponseDataCurrentSubscription();

  factory PurchaseHistoryResponseDataCurrentSubscription.fromJson(
          Map<String, dynamic> json) =>
      $PurchaseHistoryResponseDataCurrentSubscriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      $PurchaseHistoryResponseDataCurrentSubscriptionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PurchaseHistoryResponseDataPreviousSubscription {
  int? id;
  String? type;
  @JSONField(name: "plan_id")
  String? planId;
  String? title;
  String? duration;
  String? price;
  @JSONField(name: "plan_type")
  String? planType;
  @JSONField(name: "payment_mode")
  String? paymentMode;
  @JSONField(name: "purchase_id")
  String? purchaseId;
  @JSONField(name: "purchase_time")
  int? purchaseTime;
  @JSONField(name: "start_at")
  int? startAt;
  @JSONField(name: "expired_at")
  int? expiredAt;
  @JSONField(name: "total_expired_at")
  int? totalExpiredAt;

  PurchaseHistoryResponseDataPreviousSubscription();

  factory PurchaseHistoryResponseDataPreviousSubscription.fromJson(
          Map<String, dynamic> json) =>
      $PurchaseHistoryResponseDataPreviousSubscriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      $PurchaseHistoryResponseDataPreviousSubscriptionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
