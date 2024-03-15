import 'package:brooon/generated/json/base/json_field.dart';
import 'package:brooon/generated/json/add_buyer_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AddBuyerResponseEntity {

	int? code;
	bool? success;
	String? message;
	AddBuyerResponseData? data;
  
  AddBuyerResponseEntity();

  factory AddBuyerResponseEntity.fromJson(Map<String, dynamic> json) => $AddBuyerResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AddBuyerResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AddBuyerResponseData {

	@JSONField(name: "inquiries_id")
	List<String>? inquiriesId;
  
  AddBuyerResponseData();

  factory AddBuyerResponseData.fromJson(Map<String, dynamic> json) => $AddBuyerResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AddBuyerResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}