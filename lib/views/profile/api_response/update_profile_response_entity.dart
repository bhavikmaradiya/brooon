import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/update_profile_response_entity.g.dart';

@JsonSerializable()
class UpdateProfileResponseEntity {
  int? code;
  bool? success;
  String? message;
  UpdateProfileResponseData? data;

  UpdateProfileResponseEntity();

  factory UpdateProfileResponseEntity.fromJson(Map<String, dynamic> json) =>
      $UpdateProfileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $UpdateProfileResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UpdateProfileResponseData {
  int? id;
  @JSONField(name: "profile_pic")
  String? profilePic;
  @JSONField(name: "user_name")
  String? userName;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "mobile_number")
  String? mobileNumber;
  String? email;
  @JSONField(name: "is_verified")
  bool? isVerified;
  String? gender;
  double? longitude;
  double? latitude;
  String? address;
  @JSONField(name: "created_at")
  int? createdAt;
  @JSONField(name: "updated_at")
  int? updatedAt;

  UpdateProfileResponseData();

  factory UpdateProfileResponseData.fromJson(Map<String, dynamic> json) =>
      $UpdateProfileResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $UpdateProfileResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
