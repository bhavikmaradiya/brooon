import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/block_unblock_broker_response_entity.g.dart';

@JsonSerializable()
class BlockUnblockBrokerResponseEntity {
  int? code;
  bool? success;
  String? message;

  BlockUnblockBrokerResponseEntity();

  factory BlockUnblockBrokerResponseEntity.fromJson(Map<String, dynamic> json) =>
      $BlockUnblockBrokerResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BlockUnblockBrokerResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
