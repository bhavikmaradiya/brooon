import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/update_location_response_entity.g.dart';

@JsonSerializable()
class UpdateLocationResponseEntity {
  int? code;
  bool? success;
  String? message;
  UpdateLocationResponseData? data;

  UpdateLocationResponseEntity();

  factory UpdateLocationResponseEntity.fromJson(Map<String, dynamic> json) =>
      $UpdateLocationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $UpdateLocationResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UpdateLocationResponseData {
  UpdateLocationResponseData();

  factory UpdateLocationResponseData.fromJson(Map<String, dynamic> json) =>
      $UpdateLocationResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $UpdateLocationResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
