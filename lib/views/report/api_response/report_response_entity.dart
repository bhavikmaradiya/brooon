import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/report_response_entity.g.dart';

@JsonSerializable()
class ReportResponseEntity {
  int? code;
  bool? success;
  String? message;

  ReportResponseEntity();

  factory ReportResponseEntity.fromJson(Map<String, dynamic> json) =>
      $ReportResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $ReportResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
