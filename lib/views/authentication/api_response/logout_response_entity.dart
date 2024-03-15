import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/logout_response_entity.g.dart';

@JsonSerializable()
class LogoutResponseEntity {
  int? code;
  bool? success;
  String? message;
  LogoutResponseData? data;

  LogoutResponseEntity();

  factory LogoutResponseEntity.fromJson(Map<String, dynamic> json) =>
      $LogoutResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $LogoutResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LogoutResponseData {
  LogoutResponseData();

  factory LogoutResponseData.fromJson(Map<String, dynamic> json) =>
      $LogoutResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $LogoutResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
