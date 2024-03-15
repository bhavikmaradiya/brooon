import 'dart:convert';

import '../../../generated/json/add_property_response_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class AddPropertyResponseEntity {
  int? code;
  bool? success;
  String? message;
  AddPropertyResponseData? data;

  AddPropertyResponseEntity();

  factory AddPropertyResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AddPropertyResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AddPropertyResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AddPropertyResponseData {
  @JSONField(name: "property_ids")
  List<String>? propertyIds;

  AddPropertyResponseData();

  factory AddPropertyResponseData.fromJson(Map<String, dynamic> json) =>
      $AddPropertyResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AddPropertyResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
