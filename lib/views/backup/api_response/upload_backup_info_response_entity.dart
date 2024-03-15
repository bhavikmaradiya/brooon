import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/upload_backup_info_response_entity.g.dart';

@JsonSerializable()
class UploadBackupInfoResponseEntity {
  int? code;
  bool? success;
  String? message;
  UploadBackupInfoResponseData? data;

  UploadBackupInfoResponseEntity();

  factory UploadBackupInfoResponseEntity.fromJson(Map<String, dynamic> json) =>
      $UploadBackupInfoResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $UploadBackupInfoResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UploadBackupInfoResponseData {
  @JSONField(name: "google_backup_id")
  String? googleBackupId;

  UploadBackupInfoResponseData();

  factory UploadBackupInfoResponseData.fromJson(Map<String, dynamic> json) =>
      $UploadBackupInfoResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $UploadBackupInfoResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
