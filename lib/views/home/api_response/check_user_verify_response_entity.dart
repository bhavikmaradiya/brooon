import 'dart:convert';

import '../../../generated/json/check_user_verify_response_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class CheckUserVerifyResponseEntity {
  int? code;
  bool? success;
  String? message;
  CheckUserVerifyResponseData? data;

  CheckUserVerifyResponseEntity();

  factory CheckUserVerifyResponseEntity.fromJson(Map<String, dynamic> json) =>
      $CheckUserVerifyResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CheckUserVerifyResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CheckUserVerifyResponseData {
  @JSONField(name: "is_verified")
  bool? isVerified;

  CheckUserVerifyResponseData();

  factory CheckUserVerifyResponseData.fromJson(Map<String, dynamic> json) =>
      $CheckUserVerifyResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $CheckUserVerifyResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
