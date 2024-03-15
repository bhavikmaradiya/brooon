import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/inquiry_status_response_entity.g.dart';

@JsonSerializable()
class InquiryStatusResponseEntity {
  int? code;
  bool? success;
  String? message;
  InquiryStatusResponseData? data;

  InquiryStatusResponseEntity();

  factory InquiryStatusResponseEntity.fromJson(Map<String, dynamic> json) =>
      $InquiryStatusResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $InquiryStatusResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InquiryStatusResponseData {
  @JSONField(name: "inquiry_status_ids")
  List<String>? inquiryStatusIds;
  @JSONField(name: "closed_deal_ids")
  List<String>? closedDealIds;
  @JSONField(name: "inquiry_visibility_ids")
  List<String>? inquiryVisibilityIds;
  @JSONField(name: "inquiry_deleted_ids")
  List<String>? inquiryDeletedIds;

  InquiryStatusResponseData();

  factory InquiryStatusResponseData.fromJson(Map<String, dynamic> json) =>
      $InquiryStatusResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $InquiryStatusResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
