import 'dart:convert';

import '../../../generated/json/add_settings_response_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class AddSettingsResponseEntity {
  int? code;
  bool? success;
  String? message;
  AddSettingsResponseData? data;

  AddSettingsResponseEntity();

  factory AddSettingsResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AddSettingsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AddSettingsResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AddSettingsResponseData {
  AddSettingsResponseData();

  factory AddSettingsResponseData.fromJson(Map<String, dynamic> json) =>
      $AddSettingsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AddSettingsResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
