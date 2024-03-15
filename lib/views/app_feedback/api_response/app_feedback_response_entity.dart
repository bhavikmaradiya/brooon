import 'dart:convert';

import '../../../generated/json/app_feedback_response_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class AppFeedbackResponseEntity {
  int? code;
  bool? success;
  String? message;

  AppFeedbackResponseEntity();

  factory AppFeedbackResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AppFeedbackResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppFeedbackResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
