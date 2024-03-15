import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/blocked_broooners_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BlockedBrooonersResponseEntity {
  int? code;
  bool? success;
  String? message;
  BlockedBrooonersResponseData? data;

  BlockedBrooonersResponseEntity();

  factory BlockedBrooonersResponseEntity.fromJson(Map<String, dynamic> json) =>
      $BlockedBrooonersResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BlockedBrooonersResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BlockedBrooonersResponseData {
  @JSONField(name: "total_bloked_user")
  int? totalBlokedUser;
  @JSONField(name: "total_pages")
  int? totalPages;
  @JSONField(name: "current_page")
  int? currentPage;
  @JSONField(name: "next_page")
  int? nextPage;
  List<BlockedBrooonersResponseDataUsers>? users;

  BlockedBrooonersResponseData();

  factory BlockedBrooonersResponseData.fromJson(Map<String, dynamic> json) =>
      $BlockedBrooonersResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $BlockedBrooonersResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BlockedBrooonersResponseDataUsers {
  @JSONField(name: "created_at")
  int? createdAt;
  @JSONField(name: "updated_at")
  int? updatedAt;
  @JSONField(name: "brooon_info")
  BlockedBrooonersResponseDataUsersBrooonInfo? brooonInfo;

  BlockedBrooonersResponseDataUsers();

  factory BlockedBrooonersResponseDataUsers.fromJson(
          Map<String, dynamic> json) =>
      $BlockedBrooonersResponseDataUsersFromJson(json);

  Map<String, dynamic> toJson() =>
      $BlockedBrooonersResponseDataUsersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BlockedBrooonersResponseDataUsersBrooonInfo {
  @JSONField(name: "brooon_id")
  int? brooonId;
  @JSONField(name: "brooon_code")
  String? brooonCode;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "mobile_number")
  int? mobileNumber;
  @JSONField(name: "brooon_photo")
  dynamic brooonPhoto;

  BlockedBrooonersResponseDataUsersBrooonInfo();

  factory BlockedBrooonersResponseDataUsersBrooonInfo.fromJson(
          Map<String, dynamic> json) =>
      $BlockedBrooonersResponseDataUsersBrooonInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      $BlockedBrooonersResponseDataUsersBrooonInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
