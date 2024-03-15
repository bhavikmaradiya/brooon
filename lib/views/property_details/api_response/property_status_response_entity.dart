import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/property_status_response_entity.g.dart';

@JsonSerializable()
class PropertyStatusResponseEntity {
  int? code;
  bool? success;
  String? message;
  PropertyStatusResponseData? data;

  PropertyStatusResponseEntity();

  factory PropertyStatusResponseEntity.fromJson(Map<String, dynamic> json) =>
      $PropertyStatusResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $PropertyStatusResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PropertyStatusResponseData {
  @JSONField(name: "property_status_ids")
  List<String>? propertyStatusIds;
  @JSONField(name: "closed_deal_ids")
  List<String>? closedDealIds;
  @JSONField(name: "property_visibility_ids")
  List<String>? propertyVisibilityIds;
  @JSONField(name: "property_deleted_ids")
  List<String>? propertyDeletedIds;

  PropertyStatusResponseData();

  factory PropertyStatusResponseData.fromJson(Map<String, dynamic> json) =>
      $PropertyStatusResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $PropertyStatusResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
