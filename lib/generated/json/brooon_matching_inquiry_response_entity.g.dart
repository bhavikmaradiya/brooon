import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/shared_by_brooon/api_response/brooon_matching_inquiry_response_entity.dart';

BrooonMatchingInquiryResponseEntity $BrooonMatchingInquiryResponseEntityFromJson(Map<String, dynamic> json) {
	final BrooonMatchingInquiryResponseEntity brooonMatchingInquiryResponseEntity = BrooonMatchingInquiryResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		brooonMatchingInquiryResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		brooonMatchingInquiryResponseEntity.success = success;
	}
	final bool? isNoInternet = jsonConvert.convert<bool>(json['isNoInternet']);
	if (isNoInternet != null) {
		brooonMatchingInquiryResponseEntity.isNoInternet = isNoInternet;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		brooonMatchingInquiryResponseEntity.message = message;
	}
	final List<BrooonMatchingInquiryResponseData>? data = jsonConvert.convertListNotNull<BrooonMatchingInquiryResponseData>(json['data']);
	if (data != null) {
		brooonMatchingInquiryResponseEntity.data = data;
	}
	return brooonMatchingInquiryResponseEntity;
}

Map<String, dynamic> $BrooonMatchingInquiryResponseEntityToJson(BrooonMatchingInquiryResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['isNoInternet'] = entity.isNoInternet;
	data['message'] = entity.message;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

BrooonMatchingInquiryResponseData $BrooonMatchingInquiryResponseDataFromJson(Map<String, dynamic> json) {
	final BrooonMatchingInquiryResponseData brooonMatchingInquiryResponseData = BrooonMatchingInquiryResponseData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		brooonMatchingInquiryResponseData.id = id;
	}
	final String? inquiryId = jsonConvert.convert<String>(json['inquiry_id']);
	if (inquiryId != null) {
		brooonMatchingInquiryResponseData.inquiryId = inquiryId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		brooonMatchingInquiryResponseData.name = name;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		brooonMatchingInquiryResponseData.type = type;
	}
	final List<String>? xFor = jsonConvert.convertListNotNull<String>(json['for']);
	if (xFor != null) {
		brooonMatchingInquiryResponseData.xFor = xFor;
	}
	final String? inquiryStatus = jsonConvert.convert<String>(json['inquiry_status']);
	if (inquiryStatus != null) {
		brooonMatchingInquiryResponseData.inquiryStatus = inquiryStatus;
	}
	final int? closeDealId = jsonConvert.convert<int>(json['close_deal_id']);
	if (closeDealId != null) {
		brooonMatchingInquiryResponseData.closeDealId = closeDealId;
	}
	final String? inquirySoldStatus = jsonConvert.convert<String>(json['inquiry_sold_status']);
	if (inquirySoldStatus != null) {
		brooonMatchingInquiryResponseData.inquirySoldStatus = inquirySoldStatus;
	}
	final int? inquirySoldStatusId = jsonConvert.convert<int>(json['inquiry_sold_status_id']);
	if (inquirySoldStatusId != null) {
		brooonMatchingInquiryResponseData.inquirySoldStatusId = inquirySoldStatusId;
	}
	final List<String>? propertyFurnishedType = jsonConvert.convertListNotNull<String>(json['property_furnished_type']);
	if (propertyFurnishedType != null) {
		brooonMatchingInquiryResponseData.propertyFurnishedType = propertyFurnishedType;
	}
	final List<String>? additionalFurnishing = jsonConvert.convertListNotNull<String>(json['additional_furnishing']);
	if (additionalFurnishing != null) {
		brooonMatchingInquiryResponseData.additionalFurnishing = additionalFurnishing;
	}
	final int? room = jsonConvert.convert<int>(json['room']);
	if (room != null) {
		brooonMatchingInquiryResponseData.room = room;
	}
	final int? bathRoom = jsonConvert.convert<int>(json['bath_room']);
	if (bathRoom != null) {
		brooonMatchingInquiryResponseData.bathRoom = bathRoom;
	}
	final int? floor = jsonConvert.convert<int>(json['floor']);
	if (floor != null) {
		brooonMatchingInquiryResponseData.floor = floor;
	}
	final int? totalFloor = jsonConvert.convert<int>(json['total_floor']);
	if (totalFloor != null) {
		brooonMatchingInquiryResponseData.totalFloor = totalFloor;
	}
	final int? brokerChain = jsonConvert.convert<int>(json['broker_chain']);
	if (brokerChain != null) {
		brooonMatchingInquiryResponseData.brokerChain = brokerChain;
	}
	final double? buyMinPrice = jsonConvert.convert<double>(json['buy_min_price']);
	if (buyMinPrice != null) {
		brooonMatchingInquiryResponseData.buyMinPrice = buyMinPrice;
	}
	final double? buyMaxPrice = jsonConvert.convert<double>(json['buy_max_price']);
	if (buyMaxPrice != null) {
		brooonMatchingInquiryResponseData.buyMaxPrice = buyMaxPrice;
	}
	final double? rentMinPrice = jsonConvert.convert<double>(json['rent_min_price']);
	if (rentMinPrice != null) {
		brooonMatchingInquiryResponseData.rentMinPrice = rentMinPrice;
	}
	final double? rentMaxPrice = jsonConvert.convert<double>(json['rent_max_price']);
	if (rentMaxPrice != null) {
		brooonMatchingInquiryResponseData.rentMaxPrice = rentMaxPrice;
	}
	final double? leaseMinPrice = jsonConvert.convert<double>(json['lease_min_price']);
	if (leaseMinPrice != null) {
		brooonMatchingInquiryResponseData.leaseMinPrice = leaseMinPrice;
	}
	final double? leaseMaxPrice = jsonConvert.convert<double>(json['lease_max_price']);
	if (leaseMaxPrice != null) {
		brooonMatchingInquiryResponseData.leaseMaxPrice = leaseMaxPrice;
	}
	final int? buyMinPriceUnitId = jsonConvert.convert<int>(json['buy_min_price_unit_id']);
	if (buyMinPriceUnitId != null) {
		brooonMatchingInquiryResponseData.buyMinPriceUnitId = buyMinPriceUnitId;
	}
	final int? buyMaxPriceUnitId = jsonConvert.convert<int>(json['buy_max_price_unit_id']);
	if (buyMaxPriceUnitId != null) {
		brooonMatchingInquiryResponseData.buyMaxPriceUnitId = buyMaxPriceUnitId;
	}
	final int? rentMinPriceUnitId = jsonConvert.convert<int>(json['rent_min_price_unit_id']);
	if (rentMinPriceUnitId != null) {
		brooonMatchingInquiryResponseData.rentMinPriceUnitId = rentMinPriceUnitId;
	}
	final int? rentMaxPriceUnitId = jsonConvert.convert<int>(json['rent_max_price_unit_id']);
	if (rentMaxPriceUnitId != null) {
		brooonMatchingInquiryResponseData.rentMaxPriceUnitId = rentMaxPriceUnitId;
	}
	final int? leaseMinPriceUnitId = jsonConvert.convert<int>(json['lease_min_price_unit_id']);
	if (leaseMinPriceUnitId != null) {
		brooonMatchingInquiryResponseData.leaseMinPriceUnitId = leaseMinPriceUnitId;
	}
	final int? leaseMaxPriceUnitId = jsonConvert.convert<int>(json['lease_max_price_unit_id']);
	if (leaseMaxPriceUnitId != null) {
		brooonMatchingInquiryResponseData.leaseMaxPriceUnitId = leaseMaxPriceUnitId;
	}
	final String? typedLocation = jsonConvert.convert<String>(json['typed_location']);
	if (typedLocation != null) {
		brooonMatchingInquiryResponseData.typedLocation = typedLocation;
	}
	final String? mapLocation = jsonConvert.convert<String>(json['map_location']);
	if (mapLocation != null) {
		brooonMatchingInquiryResponseData.mapLocation = mapLocation;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		brooonMatchingInquiryResponseData.latitude = latitude;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		brooonMatchingInquiryResponseData.longitude = longitude;
	}
	final int? price = jsonConvert.convert<int>(json['price']);
	if (price != null) {
		brooonMatchingInquiryResponseData.price = price;
	}
	final String? priceUnit = jsonConvert.convert<String>(json['price_unit']);
	if (priceUnit != null) {
		brooonMatchingInquiryResponseData.priceUnit = priceUnit;
	}
	final double? minAreaSize = jsonConvert.convert<double>(json['min_area_size']);
	if (minAreaSize != null) {
		brooonMatchingInquiryResponseData.minAreaSize = minAreaSize;
	}
	final double? maxAreaSize = jsonConvert.convert<double>(json['max_area_size']);
	if (maxAreaSize != null) {
		brooonMatchingInquiryResponseData.maxAreaSize = maxAreaSize;
	}
	final String? areaUnit = jsonConvert.convert<String>(json['area_unit']);
	if (areaUnit != null) {
		brooonMatchingInquiryResponseData.areaUnit = areaUnit;
	}
	final double? buyMinPriceBySize = jsonConvert.convert<double>(json['buy_min_price_by_size']);
	if (buyMinPriceBySize != null) {
		brooonMatchingInquiryResponseData.buyMinPriceBySize = buyMinPriceBySize;
	}
	final double? buyMaxPriceBySize = jsonConvert.convert<double>(json['buy_max_price_by_size']);
	if (buyMaxPriceBySize != null) {
		brooonMatchingInquiryResponseData.buyMaxPriceBySize = buyMaxPriceBySize;
	}
	final double? rentMinPriceBySize = jsonConvert.convert<double>(json['rent_min_price_by_size']);
	if (rentMinPriceBySize != null) {
		brooonMatchingInquiryResponseData.rentMinPriceBySize = rentMinPriceBySize;
	}
	final double? rentMaxPriceBySize = jsonConvert.convert<double>(json['rent_max_price_by_size']);
	if (rentMaxPriceBySize != null) {
		brooonMatchingInquiryResponseData.rentMaxPriceBySize = rentMaxPriceBySize;
	}
	final double? leaseMinPriceBySize = jsonConvert.convert<double>(json['lease_min_price_by_size']);
	if (leaseMinPriceBySize != null) {
		brooonMatchingInquiryResponseData.leaseMinPriceBySize = leaseMinPriceBySize;
	}
	final double? leaseMaxPriceBySize = jsonConvert.convert<double>(json['lease_max_price_by_size']);
	if (leaseMaxPriceBySize != null) {
		brooonMatchingInquiryResponseData.leaseMaxPriceBySize = leaseMaxPriceBySize;
	}
	final List<String>? buildingType = jsonConvert.convertListNotNull<String>(json['building_type']);
	if (buildingType != null) {
		brooonMatchingInquiryResponseData.buildingType = buildingType;
	}
	final List<String>? facing = jsonConvert.convertListNotNull<String>(json['facing']);
	if (facing != null) {
		brooonMatchingInquiryResponseData.facing = facing;
	}
	final List<String>? bhk = jsonConvert.convertListNotNull<String>(json['bhk']);
	if (bhk != null) {
		brooonMatchingInquiryResponseData.bhk = bhk;
	}
	final bool? balcony = jsonConvert.convert<bool>(json['balcony']);
	if (balcony != null) {
		brooonMatchingInquiryResponseData.balcony = balcony;
	}
	final bool? cornerPiece = jsonConvert.convert<bool>(json['corner_piece']);
	if (cornerPiece != null) {
		brooonMatchingInquiryResponseData.cornerPiece = cornerPiece;
	}
	final List<double>? connectedRoad = jsonConvert.convertListNotNull<double>(json['connected_road']);
	if (connectedRoad != null) {
		brooonMatchingInquiryResponseData.connectedRoad = connectedRoad;
	}
	final bool? lightConnection = jsonConvert.convert<bool>(json['light_connection']);
	if (lightConnection != null) {
		brooonMatchingInquiryResponseData.lightConnection = lightConnection;
	}
	final bool? wellAvailable = jsonConvert.convert<bool>(json['well_available']);
	if (wellAvailable != null) {
		brooonMatchingInquiryResponseData.wellAvailable = wellAvailable;
	}
	final List<String>? schemeType = jsonConvert.convertListNotNull<String>(json['scheme_type']);
	if (schemeType != null) {
		brooonMatchingInquiryResponseData.schemeType = schemeType;
	}
	final double? frontSize = jsonConvert.convert<double>(json['front_size']);
	if (frontSize != null) {
		brooonMatchingInquiryResponseData.frontSize = frontSize;
	}
	final double? depthSize = jsonConvert.convert<double>(json['depth_size']);
	if (depthSize != null) {
		brooonMatchingInquiryResponseData.depthSize = depthSize;
	}
	final List<String>? constructionType = jsonConvert.convertListNotNull<String>(json['construction_type']);
	if (constructionType != null) {
		brooonMatchingInquiryResponseData.constructionType = constructionType;
	}
	final bool? parkingAvailable = jsonConvert.convert<bool>(json['parking_available']);
	if (parkingAvailable != null) {
		brooonMatchingInquiryResponseData.parkingAvailable = parkingAvailable;
	}
	final bool? liftAvailable = jsonConvert.convert<bool>(json['lift_available']);
	if (liftAvailable != null) {
		brooonMatchingInquiryResponseData.liftAvailable = liftAvailable;
	}
	final bool? allottedParking = jsonConvert.convert<bool>(json['allotted_parking']);
	if (allottedParking != null) {
		brooonMatchingInquiryResponseData.allottedParking = allottedParking;
	}
	final bool? washRoomAvailable = jsonConvert.convert<bool>(json['wash_room_available']);
	if (washRoomAvailable != null) {
		brooonMatchingInquiryResponseData.washRoomAvailable = washRoomAvailable;
	}
	final bool? exchangeAllowed = jsonConvert.convert<bool>(json['exchange_allowed']);
	if (exchangeAllowed != null) {
		brooonMatchingInquiryResponseData.exchangeAllowed = exchangeAllowed;
	}
	final bool? negotiationAllowed = jsonConvert.convert<bool>(json['negotiation_allowed']);
	if (negotiationAllowed != null) {
		brooonMatchingInquiryResponseData.negotiationAllowed = negotiationAllowed;
	}
	final List<String>? amenities = jsonConvert.convertListNotNull<String>(json['amenities']);
	if (amenities != null) {
		brooonMatchingInquiryResponseData.amenities = amenities;
	}
	final List<String>? preferredCaste = jsonConvert.convertListNotNull<String>(json['preferred_caste']);
	if (preferredCaste != null) {
		brooonMatchingInquiryResponseData.preferredCaste = preferredCaste;
	}
	final bool? isPublic = jsonConvert.convert<bool>(json['is_public']);
	if (isPublic != null) {
		brooonMatchingInquiryResponseData.isPublic = isPublic;
	}
	final List<String>? tags = jsonConvert.convertListNotNull<String>(json['tags']);
	if (tags != null) {
		brooonMatchingInquiryResponseData.tags = tags;
	}
	final String? note = jsonConvert.convert<String>(json['note']);
	if (note != null) {
		brooonMatchingInquiryResponseData.note = note;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		brooonMatchingInquiryResponseData.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		brooonMatchingInquiryResponseData.updatedAt = updatedAt;
	}
	final BrooonMatchingInquiryResponseDataBrooonInfo? brooonInfo = jsonConvert.convert<BrooonMatchingInquiryResponseDataBrooonInfo>(json['brooon_info']);
	if (brooonInfo != null) {
		brooonMatchingInquiryResponseData.brooonInfo = brooonInfo;
	}
	return brooonMatchingInquiryResponseData;
}

Map<String, dynamic> $BrooonMatchingInquiryResponseDataToJson(BrooonMatchingInquiryResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['inquiry_id'] = entity.inquiryId;
	data['name'] = entity.name;
	data['type'] = entity.type;
	data['for'] =  entity.xFor;
	data['inquiry_status'] = entity.inquiryStatus;
	data['close_deal_id'] = entity.closeDealId;
	data['inquiry_sold_status'] = entity.inquirySoldStatus;
	data['inquiry_sold_status_id'] = entity.inquirySoldStatusId;
	data['property_furnished_type'] =  entity.propertyFurnishedType;
	data['additional_furnishing'] =  entity.additionalFurnishing;
	data['room'] = entity.room;
	data['bath_room'] = entity.bathRoom;
	data['floor'] = entity.floor;
	data['total_floor'] = entity.totalFloor;
	data['broker_chain'] = entity.brokerChain;
	data['buy_min_price'] = entity.buyMinPrice;
	data['buy_max_price'] = entity.buyMaxPrice;
	data['rent_min_price'] = entity.rentMinPrice;
	data['rent_max_price'] = entity.rentMaxPrice;
	data['lease_min_price'] = entity.leaseMinPrice;
	data['lease_max_price'] = entity.leaseMaxPrice;
	data['buy_min_price_unit_id'] = entity.buyMinPriceUnitId;
	data['buy_max_price_unit_id'] = entity.buyMaxPriceUnitId;
	data['rent_min_price_unit_id'] = entity.rentMinPriceUnitId;
	data['rent_max_price_unit_id'] = entity.rentMaxPriceUnitId;
	data['lease_min_price_unit_id'] = entity.leaseMinPriceUnitId;
	data['lease_max_price_unit_id'] = entity.leaseMaxPriceUnitId;
	data['typed_location'] = entity.typedLocation;
	data['map_location'] = entity.mapLocation;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['price'] = entity.price;
	data['price_unit'] = entity.priceUnit;
	data['min_area_size'] = entity.minAreaSize;
	data['max_area_size'] = entity.maxAreaSize;
	data['area_unit'] = entity.areaUnit;
	data['buy_min_price_by_size'] = entity.buyMinPriceBySize;
	data['buy_max_price_by_size'] = entity.buyMaxPriceBySize;
	data['rent_min_price_by_size'] = entity.rentMinPriceBySize;
	data['rent_max_price_by_size'] = entity.rentMaxPriceBySize;
	data['lease_min_price_by_size'] = entity.leaseMinPriceBySize;
	data['lease_max_price_by_size'] = entity.leaseMaxPriceBySize;
	data['building_type'] =  entity.buildingType;
	data['facing'] =  entity.facing;
	data['bhk'] =  entity.bhk;
	data['balcony'] = entity.balcony;
	data['corner_piece'] = entity.cornerPiece;
	data['connected_road'] =  entity.connectedRoad;
	data['light_connection'] = entity.lightConnection;
	data['well_available'] = entity.wellAvailable;
	data['scheme_type'] =  entity.schemeType;
	data['front_size'] = entity.frontSize;
	data['depth_size'] = entity.depthSize;
	data['construction_type'] =  entity.constructionType;
	data['parking_available'] = entity.parkingAvailable;
	data['lift_available'] = entity.liftAvailable;
	data['allotted_parking'] = entity.allottedParking;
	data['wash_room_available'] = entity.washRoomAvailable;
	data['exchange_allowed'] = entity.exchangeAllowed;
	data['negotiation_allowed'] = entity.negotiationAllowed;
	data['amenities'] =  entity.amenities;
	data['preferred_caste'] =  entity.preferredCaste;
	data['is_public'] = entity.isPublic;
	data['tags'] =  entity.tags;
	data['note'] = entity.note;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['brooon_info'] = entity.brooonInfo?.toJson();
	return data;
}

BrooonMatchingInquiryResponseDataBrooonInfo $BrooonMatchingInquiryResponseDataBrooonInfoFromJson(Map<String, dynamic> json) {
	final BrooonMatchingInquiryResponseDataBrooonInfo brooonMatchingInquiryResponseDataBrooonInfo = BrooonMatchingInquiryResponseDataBrooonInfo();
	final int? brooonId = jsonConvert.convert<int>(json['brooon_id']);
	if (brooonId != null) {
		brooonMatchingInquiryResponseDataBrooonInfo.brooonId = brooonId;
	}
	final String? brooonCode = jsonConvert.convert<String>(json['brooon_code']);
	if (brooonCode != null) {
		brooonMatchingInquiryResponseDataBrooonInfo.brooonCode = brooonCode;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		brooonMatchingInquiryResponseDataBrooonInfo.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		brooonMatchingInquiryResponseDataBrooonInfo.lastName = lastName;
	}
	final String? mobileNumber = jsonConvert.convert<String>(json['mobile_number']);
	if (mobileNumber != null) {
		brooonMatchingInquiryResponseDataBrooonInfo.mobileNumber = mobileNumber;
	}
	final String? brooonPhoto = jsonConvert.convert<String>(json['brooon_photo']);
	if (brooonPhoto != null) {
		brooonMatchingInquiryResponseDataBrooonInfo.brooonPhoto = brooonPhoto;
	}
	final BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfo? associationInfo = jsonConvert.convert<BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfo>(json['association_info']);
	if (associationInfo != null) {
		brooonMatchingInquiryResponseDataBrooonInfo.associationInfo = associationInfo;
	}
	return brooonMatchingInquiryResponseDataBrooonInfo;
}

Map<String, dynamic> $BrooonMatchingInquiryResponseDataBrooonInfoToJson(BrooonMatchingInquiryResponseDataBrooonInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['brooon_id'] = entity.brooonId;
	data['brooon_code'] = entity.brooonCode;
	data['first_name'] = entity.firstName;
	data['last_name'] = entity.lastName;
	data['mobile_number'] = entity.mobileNumber;
	data['brooon_photo'] = entity.brooonPhoto;
	data['association_info'] = entity.associationInfo?.toJson();
	return data;
}

BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfo $BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfoFromJson(Map<String, dynamic> json) {
	final BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfo brooonMatchingInquiryResponseDataBrooonInfoAssociationInfo = BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfo();
	final int? associationId = jsonConvert.convert<int>(json['association_id']);
	if (associationId != null) {
		brooonMatchingInquiryResponseDataBrooonInfoAssociationInfo.associationId = associationId;
	}
	final String? associationCode = jsonConvert.convert<String>(json['association_code']);
	if (associationCode != null) {
		brooonMatchingInquiryResponseDataBrooonInfoAssociationInfo.associationCode = associationCode;
	}
	final String? associationPhoto = jsonConvert.convert<String>(json['association_photo']);
	if (associationPhoto != null) {
		brooonMatchingInquiryResponseDataBrooonInfoAssociationInfo.associationPhoto = associationPhoto;
	}
	return brooonMatchingInquiryResponseDataBrooonInfoAssociationInfo;
}

Map<String, dynamic> $BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfoToJson(BrooonMatchingInquiryResponseDataBrooonInfoAssociationInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['association_id'] = entity.associationId;
	data['association_code'] = entity.associationCode;
	data['association_photo'] = entity.associationPhoto;
	return data;
}