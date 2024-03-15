import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/refresh_token_response_entity.g.dart';

@JsonSerializable()
class RefreshTokenResponseEntity {
  int? code;
  bool? success;
  String? message;
  RefreshTokenResponseData? data;

  RefreshTokenResponseEntity();

  factory RefreshTokenResponseEntity.fromJson(Map<String, dynamic> json) =>
      $RefreshTokenResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $RefreshTokenResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RefreshTokenResponseData {
  @JSONField(name: "access_token")
  String? accessToken;

  RefreshTokenResponseData();

  factory RefreshTokenResponseData.fromJson(Map<String, dynamic> json) =>
      $RefreshTokenResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $RefreshTokenResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
