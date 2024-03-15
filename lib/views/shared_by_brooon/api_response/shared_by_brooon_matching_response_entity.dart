import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/shared_by_brooon_matching_response_entity.g.dart';

@JsonSerializable()
class SharedByBrooonMatchingResponseEntity {
  int? code;
  bool? success;
  bool? isNoInternet;
  String? message;
  List<SharedByBrooonMatchingResponseData>? data;

  SharedByBrooonMatchingResponseEntity();

  factory SharedByBrooonMatchingResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonMatchingResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonMatchingResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SharedByBrooonMatchingResponseData {
  int? id;
  String? name;
  String? type;
  @JSONField(name: "for")
  List<String>? xFor;
  @JSONField(name: "property_status")
  String? propertyStatus;
  @JSONField(name: "close_deal_id")
  int? closeDealId;
  @JSONField(name: "property_sold_status")
  String? propertySoldStatus;
  @JSONField(name: "property_sold_status_id")
  int? propertySoldStatusId;
  @JSONField(name: "property_furnished_type")
  String? propertyFurnishedType;
  @JSONField(name: "additional_furnishing")
  List<String>? additionalFurnishing;
  int? room;
  @JSONField(name: "bath_room")
  int? bathRoom;
  int? floor;
  @JSONField(name: "total_floor")
  int? totalFloor;
  @JSONField(name: "broker_chain")
  int? brokerChain;
  @JSONField(name: "sell_min_price")
  double? sellMinPrice;
  @JSONField(name: "sell_max_price")
  double? sellMaxPrice;
  @JSONField(name: "rent_min_price")
  double? rentMinPrice;
  @JSONField(name: "rent_max_price")
  double? rentMaxPrice;
  @JSONField(name: "lease_min_price")
  double? leaseMinPrice;
  @JSONField(name: "lease_max_price")
  double? leaseMaxPrice;
  @JSONField(name: "sell_min_price_unit_id")
  int? sellMinPriceUnitId;
  @JSONField(name: "sell_max_price_unit_id")
  int? sellMaxPriceUnitId;
  @JSONField(name: "rent_min_price_unit_id")
  int? rentMinPriceUnitId;
  @JSONField(name: "rent_max_price_unit_id")
  int? rentMaxPriceUnitId;
  @JSONField(name: "lease_min_price_unit_id")
  int? leaseMinPriceUnitId;
  @JSONField(name: "lease_max_price_unit_id")
  int? leaseMaxPriceUnitId;
  @JSONField(name: "public_location")
  String? publicLocation;
  @JSONField(name: "public_latitude")
  double? publicLatitude;
  @JSONField(name: "public_longitude")
  double? publicLongitude;
  int? price;
  @JSONField(name: "price_unit")
  String? priceUnit;
  @JSONField(name: "area_size")
  double? areaSize;
  @JSONField(name: "area_unit")
  String? areaUnit;
  @JSONField(name: "sell_price_by_size")
  int? sellPriceBySize;
  @JSONField(name: "rent_price_by_size")
  int? rentPriceBySize;
  @JSONField(name: "lease_price_by_size")
  int? leasePriceBySize;
  @JSONField(name: "price_by_size_unit")
  String? priceBySizeUnit;
  @JSONField(name: "building_type")
  String? buildingType;
  String? facing;
  String? bhk;
  bool? balcony;
  @JSONField(name: "corner_piece")
  bool? cornerPiece;
  @JSONField(name: "connected_road")
  List<double>? connectedRoad;
  @JSONField(name: "light_connection")
  bool? lightConnection;
  @JSONField(name: "well_available")
  bool? wellAvailable;
  @JSONField(name: "scheme_type")
  String? schemeType;
  @JSONField(name: "front_size")
  double? frontSize;
  @JSONField(name: "depth_size")
  double? depthSize;
  @JSONField(name: "construction_type")
  String? constructionType;
  @JSONField(name: "parking_available")
  bool? parkingAvailable;
  @JSONField(name: "lift_available")
  bool? liftAvailable;
  @JSONField(name: "allotted_parking")
  bool? allottedParking;
  @JSONField(name: "wash_room_available")
  bool? washRoomAvailable;
  @JSONField(name: "exchange_allowed")
  bool? exchangeAllowed;
  @JSONField(name: "negotiation_allowed")
  bool? negotiationAllowed;
  List<String>? amenities;
  @JSONField(name: "preferred_caste")
  List<String>? preferredCaste;
  @JSONField(name: "is_public")
  bool? isPublic;
  List<String>? tags;
  String? note;
  @JSONField(name: "property_id")
  String? propertyId;
  @JSONField(name: "created_at")
  int? createdAt;
  @JSONField(name: "updated_at")
  int? updatedAt;
  @JSONField(name: "brooon_info")
  SharedByBrooonMatchingResponseDataBrooonInfo? brooonInfo;

  SharedByBrooonMatchingResponseData();

  factory SharedByBrooonMatchingResponseData.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonMatchingResponseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonMatchingResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SharedByBrooonMatchingResponseDataBrooonInfo {
  @JSONField(name: "brooon_id")
  int? brooonId;
  @JSONField(name: "brooon_code")
  String? brooonCode;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "mobile_number")
  String? mobileNumber;
  @JSONField(name: "brooon_photo")
  String? brooonPhoto;
  @JSONField(name: "association_info")
  SharedByBrooonMatchingResponseDataBrooonInfoAssociationInfo? associationInfo;

  SharedByBrooonMatchingResponseDataBrooonInfo();

  factory SharedByBrooonMatchingResponseDataBrooonInfo.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonMatchingResponseDataBrooonInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonMatchingResponseDataBrooonInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SharedByBrooonMatchingResponseDataBrooonInfoAssociationInfo {
  @JSONField(name: "association_id")
  int? associationId;
  @JSONField(name: "association_code")
  String? associationCode;
  @JSONField(name: "association_photo")
  String? associationPhoto;

  SharedByBrooonMatchingResponseDataBrooonInfoAssociationInfo();

  factory SharedByBrooonMatchingResponseDataBrooonInfoAssociationInfo.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonMatchingResponseDataBrooonInfoAssociationInfoFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonMatchingResponseDataBrooonInfoAssociationInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
