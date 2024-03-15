import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/shared_by_brooon/api_response/shared_by_brooon_property_response_entity.dart';

SharedByBrooonPropertyResponseEntity $SharedByBrooonPropertyResponseEntityFromJson(Map<String, dynamic> json) {
	final SharedByBrooonPropertyResponseEntity sharedByBrooonPropertyResponseEntity = SharedByBrooonPropertyResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		sharedByBrooonPropertyResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		sharedByBrooonPropertyResponseEntity.success = success;
	}
	final bool? isNoInternet = jsonConvert.convert<bool>(json['isNoInternet']);
	if (isNoInternet != null) {
		sharedByBrooonPropertyResponseEntity.isNoInternet = isNoInternet;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		sharedByBrooonPropertyResponseEntity.message = message;
	}
	final SharedByBrooonPropertyResponseData? data = jsonConvert.convert<SharedByBrooonPropertyResponseData>(json['data']);
	if (data != null) {
		sharedByBrooonPropertyResponseEntity.data = data;
	}
	return sharedByBrooonPropertyResponseEntity;
}

Map<String, dynamic> $SharedByBrooonPropertyResponseEntityToJson(SharedByBrooonPropertyResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['isNoInternet'] = entity.isNoInternet;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

SharedByBrooonPropertyResponseData $SharedByBrooonPropertyResponseDataFromJson(Map<String, dynamic> json) {
	final SharedByBrooonPropertyResponseData sharedByBrooonPropertyResponseData = SharedByBrooonPropertyResponseData();
	final int? totalProperty = jsonConvert.convert<int>(json['total_property']);
	if (totalProperty != null) {
		sharedByBrooonPropertyResponseData.totalProperty = totalProperty;
	}
	final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
	if (totalPages != null) {
		sharedByBrooonPropertyResponseData.totalPages = totalPages;
	}
	final int? currentPage = jsonConvert.convert<int>(json['current_page']);
	if (currentPage != null) {
		sharedByBrooonPropertyResponseData.currentPage = currentPage;
	}
	final int? nextPage = jsonConvert.convert<int>(json['next_page']);
	if (nextPage != null) {
		sharedByBrooonPropertyResponseData.nextPage = nextPage;
	}
	final List<SharedByBrooonPropertyResponseDataProperty>? property = jsonConvert.convertListNotNull<SharedByBrooonPropertyResponseDataProperty>(json['property']);
	if (property != null) {
		sharedByBrooonPropertyResponseData.property = property;
	}
	return sharedByBrooonPropertyResponseData;
}

Map<String, dynamic> $SharedByBrooonPropertyResponseDataToJson(SharedByBrooonPropertyResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total_property'] = entity.totalProperty;
	data['total_pages'] = entity.totalPages;
	data['current_page'] = entity.currentPage;
	data['next_page'] = entity.nextPage;
	data['property'] =  entity.property?.map((v) => v.toJson()).toList();
	return data;
}

SharedByBrooonPropertyResponseDataProperty $SharedByBrooonPropertyResponseDataPropertyFromJson(Map<String, dynamic> json) {
	final SharedByBrooonPropertyResponseDataProperty sharedByBrooonPropertyResponseDataProperty = SharedByBrooonPropertyResponseDataProperty();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		sharedByBrooonPropertyResponseDataProperty.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		sharedByBrooonPropertyResponseDataProperty.name = name;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		sharedByBrooonPropertyResponseDataProperty.type = type;
	}
	final List<String>? xFor = jsonConvert.convertListNotNull<String>(json['for']);
	if (xFor != null) {
		sharedByBrooonPropertyResponseDataProperty.xFor = xFor;
	}
	final String? propertyStatus = jsonConvert.convert<String>(json['property_status']);
	if (propertyStatus != null) {
		sharedByBrooonPropertyResponseDataProperty.propertyStatus = propertyStatus;
	}
	final String? propertySoldStatus = jsonConvert.convert<String>(json['property_sold_status']);
	if (propertySoldStatus != null) {
		sharedByBrooonPropertyResponseDataProperty.propertySoldStatus = propertySoldStatus;
	}
	final int? propertySoldStatusId = jsonConvert.convert<int>(json['property_sold_status_id']);
	if (propertySoldStatusId != null) {
		sharedByBrooonPropertyResponseDataProperty.propertySoldStatusId = propertySoldStatusId;
	}
	final int? closeDealId = jsonConvert.convert<int>(json['close_deal_id']);
	if (closeDealId != null) {
		sharedByBrooonPropertyResponseDataProperty.closeDealId = closeDealId;
	}
	final String? propertyFurnishedType = jsonConvert.convert<String>(json['property_furnished_type']);
	if (propertyFurnishedType != null) {
		sharedByBrooonPropertyResponseDataProperty.propertyFurnishedType = propertyFurnishedType;
	}
	final List<String>? additionalFurnishing = jsonConvert.convertListNotNull<String>(json['additional_furnishing']);
	if (additionalFurnishing != null) {
		sharedByBrooonPropertyResponseDataProperty.additionalFurnishing = additionalFurnishing;
	}
	final int? room = jsonConvert.convert<int>(json['room']);
	if (room != null) {
		sharedByBrooonPropertyResponseDataProperty.room = room;
	}
	final int? bathRoom = jsonConvert.convert<int>(json['bath_room']);
	if (bathRoom != null) {
		sharedByBrooonPropertyResponseDataProperty.bathRoom = bathRoom;
	}
	final int? floor = jsonConvert.convert<int>(json['floor']);
	if (floor != null) {
		sharedByBrooonPropertyResponseDataProperty.floor = floor;
	}
	final int? totalFloor = jsonConvert.convert<int>(json['total_floor']);
	if (totalFloor != null) {
		sharedByBrooonPropertyResponseDataProperty.totalFloor = totalFloor;
	}
	final int? brokerChain = jsonConvert.convert<int>(json['broker_chain']);
	if (brokerChain != null) {
		sharedByBrooonPropertyResponseDataProperty.brokerChain = brokerChain;
	}
	final double? sellMinPrice = jsonConvert.convert<double>(json['sell_min_price']);
	if (sellMinPrice != null) {
		sharedByBrooonPropertyResponseDataProperty.sellMinPrice = sellMinPrice;
	}
	final double? sellMaxPrice = jsonConvert.convert<double>(json['sell_max_price']);
	if (sellMaxPrice != null) {
		sharedByBrooonPropertyResponseDataProperty.sellMaxPrice = sellMaxPrice;
	}
	final int? sellMinPriceUnitId = jsonConvert.convert<int>(json['sell_min_price_unit_id']);
	if (sellMinPriceUnitId != null) {
		sharedByBrooonPropertyResponseDataProperty.sellMinPriceUnitId = sellMinPriceUnitId;
	}
	final int? sellMaxPriceUnitId = jsonConvert.convert<int>(json['sell_max_price_unit_id']);
	if (sellMaxPriceUnitId != null) {
		sharedByBrooonPropertyResponseDataProperty.sellMaxPriceUnitId = sellMaxPriceUnitId;
	}
	final double? rentMinPrice = jsonConvert.convert<double>(json['rent_min_price']);
	if (rentMinPrice != null) {
		sharedByBrooonPropertyResponseDataProperty.rentMinPrice = rentMinPrice;
	}
	final double? rentMaxPrice = jsonConvert.convert<double>(json['rent_max_price']);
	if (rentMaxPrice != null) {
		sharedByBrooonPropertyResponseDataProperty.rentMaxPrice = rentMaxPrice;
	}
	final double? leaseMinPrice = jsonConvert.convert<double>(json['lease_min_price']);
	if (leaseMinPrice != null) {
		sharedByBrooonPropertyResponseDataProperty.leaseMinPrice = leaseMinPrice;
	}
	final double? leaseMaxPrice = jsonConvert.convert<double>(json['lease_max_price']);
	if (leaseMaxPrice != null) {
		sharedByBrooonPropertyResponseDataProperty.leaseMaxPrice = leaseMaxPrice;
	}
	final int? rentMinPriceUnitId = jsonConvert.convert<int>(json['rent_min_price_unit_id']);
	if (rentMinPriceUnitId != null) {
		sharedByBrooonPropertyResponseDataProperty.rentMinPriceUnitId = rentMinPriceUnitId;
	}
	final int? rentMaxPriceUnitId = jsonConvert.convert<int>(json['rent_max_price_unit_id']);
	if (rentMaxPriceUnitId != null) {
		sharedByBrooonPropertyResponseDataProperty.rentMaxPriceUnitId = rentMaxPriceUnitId;
	}
	final int? leaseMinPriceUnitId = jsonConvert.convert<int>(json['lease_min_price_unit_id']);
	if (leaseMinPriceUnitId != null) {
		sharedByBrooonPropertyResponseDataProperty.leaseMinPriceUnitId = leaseMinPriceUnitId;
	}
	final int? leaseMaxPriceUnitId = jsonConvert.convert<int>(json['lease_max_price_unit_id']);
	if (leaseMaxPriceUnitId != null) {
		sharedByBrooonPropertyResponseDataProperty.leaseMaxPriceUnitId = leaseMaxPriceUnitId;
	}
	final int? price = jsonConvert.convert<int>(json['price']);
	if (price != null) {
		sharedByBrooonPropertyResponseDataProperty.price = price;
	}
	final String? priceUnit = jsonConvert.convert<String>(json['price_unit']);
	if (priceUnit != null) {
		sharedByBrooonPropertyResponseDataProperty.priceUnit = priceUnit;
	}
	final double? areaSize = jsonConvert.convert<double>(json['area_size']);
	if (areaSize != null) {
		sharedByBrooonPropertyResponseDataProperty.areaSize = areaSize;
	}
	final String? areaUnit = jsonConvert.convert<String>(json['area_unit']);
	if (areaUnit != null) {
		sharedByBrooonPropertyResponseDataProperty.areaUnit = areaUnit;
	}
	final int? sellPriceBySize = jsonConvert.convert<int>(json['sell_price_by_size']);
	if (sellPriceBySize != null) {
		sharedByBrooonPropertyResponseDataProperty.sellPriceBySize = sellPriceBySize;
	}
	final int? rentPriceBySize = jsonConvert.convert<int>(json['rent_price_by_size']);
	if (rentPriceBySize != null) {
		sharedByBrooonPropertyResponseDataProperty.rentPriceBySize = rentPriceBySize;
	}
	final int? leasePriceBySize = jsonConvert.convert<int>(json['lease_price_by_size']);
	if (leasePriceBySize != null) {
		sharedByBrooonPropertyResponseDataProperty.leasePriceBySize = leasePriceBySize;
	}
	final String? priceBySizeUnit = jsonConvert.convert<String>(json['price_by_size_unit']);
	if (priceBySizeUnit != null) {
		sharedByBrooonPropertyResponseDataProperty.priceBySizeUnit = priceBySizeUnit;
	}
	final String? buildingType = jsonConvert.convert<String>(json['building_type']);
	if (buildingType != null) {
		sharedByBrooonPropertyResponseDataProperty.buildingType = buildingType;
	}
	final String? facing = jsonConvert.convert<String>(json['facing']);
	if (facing != null) {
		sharedByBrooonPropertyResponseDataProperty.facing = facing;
	}
	final String? bhk = jsonConvert.convert<String>(json['bhk']);
	if (bhk != null) {
		sharedByBrooonPropertyResponseDataProperty.bhk = bhk;
	}
	final bool? balcony = jsonConvert.convert<bool>(json['balcony']);
	if (balcony != null) {
		sharedByBrooonPropertyResponseDataProperty.balcony = balcony;
	}
	final bool? cornerPiece = jsonConvert.convert<bool>(json['corner_piece']);
	if (cornerPiece != null) {
		sharedByBrooonPropertyResponseDataProperty.cornerPiece = cornerPiece;
	}
	final List<double>? connectedRoad = jsonConvert.convertListNotNull<double>(json['connected_road']);
	if (connectedRoad != null) {
		sharedByBrooonPropertyResponseDataProperty.connectedRoad = connectedRoad;
	}
	final bool? lightConnection = jsonConvert.convert<bool>(json['light_connection']);
	if (lightConnection != null) {
		sharedByBrooonPropertyResponseDataProperty.lightConnection = lightConnection;
	}
	final bool? wellAvailable = jsonConvert.convert<bool>(json['well_available']);
	if (wellAvailable != null) {
		sharedByBrooonPropertyResponseDataProperty.wellAvailable = wellAvailable;
	}
	final String? schemeType = jsonConvert.convert<String>(json['scheme_type']);
	if (schemeType != null) {
		sharedByBrooonPropertyResponseDataProperty.schemeType = schemeType;
	}
	final double? frontSize = jsonConvert.convert<double>(json['front_size']);
	if (frontSize != null) {
		sharedByBrooonPropertyResponseDataProperty.frontSize = frontSize;
	}
	final double? depthSize = jsonConvert.convert<double>(json['depth_size']);
	if (depthSize != null) {
		sharedByBrooonPropertyResponseDataProperty.depthSize = depthSize;
	}
	final String? constructionType = jsonConvert.convert<String>(json['construction_type']);
	if (constructionType != null) {
		sharedByBrooonPropertyResponseDataProperty.constructionType = constructionType;
	}
	final bool? parkingAvailable = jsonConvert.convert<bool>(json['parking_available']);
	if (parkingAvailable != null) {
		sharedByBrooonPropertyResponseDataProperty.parkingAvailable = parkingAvailable;
	}
	final bool? liftAvailable = jsonConvert.convert<bool>(json['lift_available']);
	if (liftAvailable != null) {
		sharedByBrooonPropertyResponseDataProperty.liftAvailable = liftAvailable;
	}
	final bool? allottedParking = jsonConvert.convert<bool>(json['allotted_parking']);
	if (allottedParking != null) {
		sharedByBrooonPropertyResponseDataProperty.allottedParking = allottedParking;
	}
	final bool? washRoomAvailable = jsonConvert.convert<bool>(json['wash_room_available']);
	if (washRoomAvailable != null) {
		sharedByBrooonPropertyResponseDataProperty.washRoomAvailable = washRoomAvailable;
	}
	final bool? exchangeAllowed = jsonConvert.convert<bool>(json['exchange_allowed']);
	if (exchangeAllowed != null) {
		sharedByBrooonPropertyResponseDataProperty.exchangeAllowed = exchangeAllowed;
	}
	final bool? negotiationAllowed = jsonConvert.convert<bool>(json['negotiation_allowed']);
	if (negotiationAllowed != null) {
		sharedByBrooonPropertyResponseDataProperty.negotiationAllowed = negotiationAllowed;
	}
	final List<String>? amenities = jsonConvert.convertListNotNull<String>(json['amenities']);
	if (amenities != null) {
		sharedByBrooonPropertyResponseDataProperty.amenities = amenities;
	}
	final List<String>? preferredCaste = jsonConvert.convertListNotNull<String>(json['preferred_caste']);
	if (preferredCaste != null) {
		sharedByBrooonPropertyResponseDataProperty.preferredCaste = preferredCaste;
	}
	final bool? isPublic = jsonConvert.convert<bool>(json['is_public']);
	if (isPublic != null) {
		sharedByBrooonPropertyResponseDataProperty.isPublic = isPublic;
	}
	final List<String>? tags = jsonConvert.convertListNotNull<String>(json['tags']);
	if (tags != null) {
		sharedByBrooonPropertyResponseDataProperty.tags = tags;
	}
	final String? note = jsonConvert.convert<String>(json['note']);
	if (note != null) {
		sharedByBrooonPropertyResponseDataProperty.note = note;
	}
	final String? propertyId = jsonConvert.convert<String>(json['property_id']);
	if (propertyId != null) {
		sharedByBrooonPropertyResponseDataProperty.propertyId = propertyId;
	}
	final String? publicLocation = jsonConvert.convert<String>(json['public_location']);
	if (publicLocation != null) {
		sharedByBrooonPropertyResponseDataProperty.publicLocation = publicLocation;
	}
	final double? publicLatitude = jsonConvert.convert<double>(json['public_latitude']);
	if (publicLatitude != null) {
		sharedByBrooonPropertyResponseDataProperty.publicLatitude = publicLatitude;
	}
	final double? publicLongitude = jsonConvert.convert<double>(json['public_longitude']);
	if (publicLongitude != null) {
		sharedByBrooonPropertyResponseDataProperty.publicLongitude = publicLongitude;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		sharedByBrooonPropertyResponseDataProperty.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		sharedByBrooonPropertyResponseDataProperty.updatedAt = updatedAt;
	}
	final SharedByBrooonPropertyResponseDataPropertyBrooonInfo? brooonInfo = jsonConvert.convert<SharedByBrooonPropertyResponseDataPropertyBrooonInfo>(json['brooon_info']);
	if (brooonInfo != null) {
		sharedByBrooonPropertyResponseDataProperty.brooonInfo = brooonInfo;
	}
	return sharedByBrooonPropertyResponseDataProperty;
}

Map<String, dynamic> $SharedByBrooonPropertyResponseDataPropertyToJson(SharedByBrooonPropertyResponseDataProperty entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['type'] = entity.type;
	data['for'] =  entity.xFor;
	data['property_status'] = entity.propertyStatus;
	data['property_sold_status'] = entity.propertySoldStatus;
	data['property_sold_status_id'] = entity.propertySoldStatusId;
	data['close_deal_id'] = entity.closeDealId;
	data['property_furnished_type'] = entity.propertyFurnishedType;
	data['additional_furnishing'] =  entity.additionalFurnishing;
	data['room'] = entity.room;
	data['bath_room'] = entity.bathRoom;
	data['floor'] = entity.floor;
	data['total_floor'] = entity.totalFloor;
	data['broker_chain'] = entity.brokerChain;
	data['sell_min_price'] = entity.sellMinPrice;
	data['sell_max_price'] = entity.sellMaxPrice;
	data['sell_min_price_unit_id'] = entity.sellMinPriceUnitId;
	data['sell_max_price_unit_id'] = entity.sellMaxPriceUnitId;
	data['rent_min_price'] = entity.rentMinPrice;
	data['rent_max_price'] = entity.rentMaxPrice;
	data['lease_min_price'] = entity.leaseMinPrice;
	data['lease_max_price'] = entity.leaseMaxPrice;
	data['rent_min_price_unit_id'] = entity.rentMinPriceUnitId;
	data['rent_max_price_unit_id'] = entity.rentMaxPriceUnitId;
	data['lease_min_price_unit_id'] = entity.leaseMinPriceUnitId;
	data['lease_max_price_unit_id'] = entity.leaseMaxPriceUnitId;
	data['price'] = entity.price;
	data['price_unit'] = entity.priceUnit;
	data['area_size'] = entity.areaSize;
	data['area_unit'] = entity.areaUnit;
	data['sell_price_by_size'] = entity.sellPriceBySize;
	data['rent_price_by_size'] = entity.rentPriceBySize;
	data['lease_price_by_size'] = entity.leasePriceBySize;
	data['price_by_size_unit'] = entity.priceBySizeUnit;
	data['building_type'] = entity.buildingType;
	data['facing'] = entity.facing;
	data['bhk'] = entity.bhk;
	data['balcony'] = entity.balcony;
	data['corner_piece'] = entity.cornerPiece;
	data['connected_road'] =  entity.connectedRoad;
	data['light_connection'] = entity.lightConnection;
	data['well_available'] = entity.wellAvailable;
	data['scheme_type'] = entity.schemeType;
	data['front_size'] = entity.frontSize;
	data['depth_size'] = entity.depthSize;
	data['construction_type'] = entity.constructionType;
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
	data['property_id'] = entity.propertyId;
	data['public_location'] = entity.publicLocation;
	data['public_latitude'] = entity.publicLatitude;
	data['public_longitude'] = entity.publicLongitude;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['brooon_info'] = entity.brooonInfo?.toJson();
	return data;
}

SharedByBrooonPropertyResponseDataPropertyBrooonInfo $SharedByBrooonPropertyResponseDataPropertyBrooonInfoFromJson(Map<String, dynamic> json) {
	final SharedByBrooonPropertyResponseDataPropertyBrooonInfo sharedByBrooonPropertyResponseDataPropertyBrooonInfo = SharedByBrooonPropertyResponseDataPropertyBrooonInfo();
	final int? brooonId = jsonConvert.convert<int>(json['brooon_id']);
	if (brooonId != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonInfo.brooonId = brooonId;
	}
	final String? brooonCode = jsonConvert.convert<String>(json['brooon_code']);
	if (brooonCode != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonInfo.brooonCode = brooonCode;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonInfo.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonInfo.lastName = lastName;
	}
	final String? mobileNumber = jsonConvert.convert<String>(json['mobile_number']);
	if (mobileNumber != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonInfo.mobileNumber = mobileNumber;
	}
	final String? brooonPhoto = jsonConvert.convert<String>(json['brooon_photo']);
	if (brooonPhoto != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonInfo.brooonPhoto = brooonPhoto;
	}
	final SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo? associationInfo = jsonConvert.convert<SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo>(json['association_info']);
	if (associationInfo != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonInfo.associationInfo = associationInfo;
	}
	return sharedByBrooonPropertyResponseDataPropertyBrooonInfo;
}

Map<String, dynamic> $SharedByBrooonPropertyResponseDataPropertyBrooonInfoToJson(SharedByBrooonPropertyResponseDataPropertyBrooonInfo entity) {
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

SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo $SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfoFromJson(Map<String, dynamic> json) {
	final SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo sharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo = SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo();
	final int? associationId = jsonConvert.convert<int>(json['association_id']);
	if (associationId != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo.associationId = associationId;
	}
	final String? associationCode = jsonConvert.convert<String>(json['association_code']);
	if (associationCode != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo.associationCode = associationCode;
	}
	final String? associationPhoto = jsonConvert.convert<String>(json['association_photo']);
	if (associationPhoto != null) {
		sharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo.associationPhoto = associationPhoto;
	}
	return sharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo;
}

Map<String, dynamic> $SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfoToJson(SharedByBrooonPropertyResponseDataPropertyBrooonAssociationInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['association_id'] = entity.associationId;
	data['association_code'] = entity.associationCode;
	data['association_photo'] = entity.associationPhoto;
	return data;
}