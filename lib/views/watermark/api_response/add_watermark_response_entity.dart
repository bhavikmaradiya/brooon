import 'dart:convert';

import '../../../generated/json/add_watermark_response_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class AddWatermarkResponseEntity {
  int? code;
  bool? success;
  String? message;
  AddWatermarkResponseData? data;

  AddWatermarkResponseEntity();

  factory AddWatermarkResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AddWatermarkResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AddWatermarkResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AddWatermarkResponseData {
  AddWatermarkResponseData();

  factory AddWatermarkResponseData.fromJson(Map<String, dynamic> json) =>
      $AddWatermarkResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AddWatermarkResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
