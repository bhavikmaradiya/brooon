import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/shared_by_brooon_inquiry_response_entity.g.dart';

@JsonSerializable()
class SharedByBrooonInquiryResponseEntity {
  int? code;
  bool? success;
  bool? isNoInternet;
  String? message;
  SharedByBrooonInquiryResponseData? data;

  SharedByBrooonInquiryResponseEntity();

  factory SharedByBrooonInquiryResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonInquiryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonInquiryResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SharedByBrooonInquiryResponseData {
  @JSONField(name: "total_inquiries")
  int? totalInquiries;
  @JSONField(name: "total_pages")
  int? totalPages;
  @JSONField(name: "current_page")
  int? currentPage;
  @JSONField(name: "next_page")
  int? nextPage;
  List<SharedByBrooonInquiryResponseDataInquiries>? inquiries;

  SharedByBrooonInquiryResponseData();

  factory SharedByBrooonInquiryResponseData.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonInquiryResponseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonInquiryResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SharedByBrooonInquiryResponseDataInquiries {
  int? id;
  @JSONField(name: "inquiry_id")
  String? inquiryId;
  String? name;
  String? type;
  @JSONField(name: "for")
  List<String>? xFor;
  @JSONField(name: "inquiry_status")
  String? inquiryStatus;
  @JSONField(name: "close_deal_id")
  int? closeDealId;
  @JSONField(name: "inquiry_sold_status")
  String? inquirySoldStatus;
  @JSONField(name: "inquiry_sold_status_id")
  int? inquirySoldStatusId;
  @JSONField(name: "property_furnished_type")
  List<String>? propertyFurnishedType;
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
  @JSONField(name: "buy_min_price")
  double? buyMinPrice;
  @JSONField(name: "buy_max_price")
  double? buyMaxPrice;
  @JSONField(name: "rent_min_price")
  double? rentMinPrice;
  @JSONField(name: "rent_max_price")
  double? rentMaxPrice;
  @JSONField(name: "lease_min_price")
  double? leaseMinPrice;
  @JSONField(name: "lease_max_price")
  double? leaseMaxPrice;
  @JSONField(name: "buy_min_price_unit_id")
  int? buyMinPriceUnitId;
  @JSONField(name: "buy_max_price_unit_id")
  int? buyMaxPriceUnitId;
  @JSONField(name: "rent_min_price_unit_id")
  int? rentMinPriceUnitId;
  @JSONField(name: "rent_max_price_unit_id")
  int? rentMaxPriceUnitId;
  @JSONField(name: "lease_min_price_unit_id")
  int? leaseMinPriceUnitId;
  @JSONField(name: "lease_max_price_unit_id")
  int? leaseMaxPriceUnitId;
  @JSONField(name: "map_location")
  String? mapLocation;
  @JSONField(name: "typed_location")
  String? typedLocation;
  @JSONField(name: "latitude")
  double? latitude;
  @JSONField(name: "longitude")
  double? longitude;
  int? price;
  @JSONField(name: "price_unit")
  String? priceUnit;
  @JSONField(name: "min_area_size")
  double? minAreaSize;
  @JSONField(name: "max_area_size")
  double? maxAreaSize;
  @JSONField(name: "area_unit")
  String? areaUnit;
  @JSONField(name: "buy_min_price_by_size")
  double? buyMinPriceBySize;
  @JSONField(name: "buy_max_price_by_size")
  double? buyMaxPriceBySize;
  @JSONField(name: "rent_min_price_by_size")
  double? rentMinPriceBySize;
  @JSONField(name: "rent_max_price_by_size")
  double? rentMaxPriceBySize;
  @JSONField(name: "lease_min_price_by_size")
  double? leaseMinPriceBySize;
  @JSONField(name: "lease_max_price_by_size")
  double? leaseMaxPriceBySize;
  @JSONField(name: "building_type")
  List<String>? buildingType;
  List<String>? facing;
  List<String>? bhk;
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
  List<String>? schemeType;
  @JSONField(name: "front_size")
  double? frontSize;
  @JSONField(name: "depth_size")
  double? depthSize;
  @JSONField(name: "construction_type")
  List<String>? constructionType;
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
  @JSONField(name: "created_at")
  int? createdAt;
  @JSONField(name: "updated_at")
  int? updatedAt;
  @JSONField(name: "brooon_info")
  SharedByBrooonInquiryResponseDataInquiriesBrooonInfo? brooonInfo;

  SharedByBrooonInquiryResponseDataInquiries();

  factory SharedByBrooonInquiryResponseDataInquiries.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonInquiryResponseDataInquiriesFromJson(json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonInquiryResponseDataInquiriesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SharedByBrooonInquiryResponseDataInquiriesBrooonInfo {
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
  SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo?
      associationInfo;

  SharedByBrooonInquiryResponseDataInquiriesBrooonInfo();

  factory SharedByBrooonInquiryResponseDataInquiriesBrooonInfo.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonInquiryResponseDataInquiriesBrooonInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonInquiryResponseDataInquiriesBrooonInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo {
  @JSONField(name: "association_id")
  int? associationId;
  @JSONField(name: "association_code")
  String? associationCode;
  @JSONField(name: "association_photo")
  String? associationPhoto;

  SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo();

  factory SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo.fromJson(
          Map<String, dynamic> json) =>
      $SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfoFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfoToJson(
          this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
