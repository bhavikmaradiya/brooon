import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/check_purchase_response_entity.g.dart';

@JsonSerializable()
class CheckPurchaseResponseEntity {
  int? code;
  bool? success;
  String? message;
  CheckPurchaseResponseData? data;

  CheckPurchaseResponseEntity();

  factory CheckPurchaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      $CheckPurchaseResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CheckPurchaseResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CheckPurchaseResponseData {
  @JSONField(name: "plan_id")
  int? planId;
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

  CheckPurchaseResponseData();

  factory CheckPurchaseResponseData.fromJson(Map<String, dynamic> json) =>
      $CheckPurchaseResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $CheckPurchaseResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
