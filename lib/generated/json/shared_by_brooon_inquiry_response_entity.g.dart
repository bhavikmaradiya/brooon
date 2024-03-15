import 'package:brooon/generated/json/base/json_convert_content.dart';
import 'package:brooon/views/shared_by_brooon/api_response/shared_by_brooon_inquiry_response_entity.dart';

SharedByBrooonInquiryResponseEntity $SharedByBrooonInquiryResponseEntityFromJson(Map<String, dynamic> json) {
	final SharedByBrooonInquiryResponseEntity sharedByBrooonInquiryResponseEntity = SharedByBrooonInquiryResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		sharedByBrooonInquiryResponseEntity.code = code;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		sharedByBrooonInquiryResponseEntity.success = success;
	}
	final bool? isNoInternet = jsonConvert.convert<bool>(json['isNoInternet']);
	if (isNoInternet != null) {
		sharedByBrooonInquiryResponseEntity.isNoInternet = isNoInternet;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		sharedByBrooonInquiryResponseEntity.message = message;
	}
	final SharedByBrooonInquiryResponseData? data = jsonConvert.convert<SharedByBrooonInquiryResponseData>(json['data']);
	if (data != null) {
		sharedByBrooonInquiryResponseEntity.data = data;
	}
	return sharedByBrooonInquiryResponseEntity;
}

Map<String, dynamic> $SharedByBrooonInquiryResponseEntityToJson(SharedByBrooonInquiryResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['success'] = entity.success;
	data['isNoInternet'] = entity.isNoInternet;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

SharedByBrooonInquiryResponseData $SharedByBrooonInquiryResponseDataFromJson(Map<String, dynamic> json) {
	final SharedByBrooonInquiryResponseData sharedByBrooonInquiryResponseData = SharedByBrooonInquiryResponseData();
	final int? totalInquiries = jsonConvert.convert<int>(json['total_inquiries']);
	if (totalInquiries != null) {
		sharedByBrooonInquiryResponseData.totalInquiries = totalInquiries;
	}
	final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
	if (totalPages != null) {
		sharedByBrooonInquiryResponseData.totalPages = totalPages;
	}
	final int? currentPage = jsonConvert.convert<int>(json['current_page']);
	if (currentPage != null) {
		sharedByBrooonInquiryResponseData.currentPage = currentPage;
	}
	final int? nextPage = jsonConvert.convert<int>(json['next_page']);
	if (nextPage != null) {
		sharedByBrooonInquiryResponseData.nextPage = nextPage;
	}
	final List<SharedByBrooonInquiryResponseDataInquiries>? inquiries = jsonConvert.convertListNotNull<SharedByBrooonInquiryResponseDataInquiries>(json['inquiries']);
	if (inquiries != null) {
		sharedByBrooonInquiryResponseData.inquiries = inquiries;
	}
	return sharedByBrooonInquiryResponseData;
}

Map<String, dynamic> $SharedByBrooonInquiryResponseDataToJson(SharedByBrooonInquiryResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total_inquiries'] = entity.totalInquiries;
	data['total_pages'] = entity.totalPages;
	data['current_page'] = entity.currentPage;
	data['next_page'] = entity.nextPage;
	data['inquiries'] =  entity.inquiries?.map((v) => v.toJson()).toList();
	return data;
}

SharedByBrooonInquiryResponseDataInquiries $SharedByBrooonInquiryResponseDataInquiriesFromJson(Map<String, dynamic> json) {
	final SharedByBrooonInquiryResponseDataInquiries sharedByBrooonInquiryResponseDataInquiries = SharedByBrooonInquiryResponseDataInquiries();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		sharedByBrooonInquiryResponseDataInquiries.id = id;
	}
	final String? inquiryId = jsonConvert.convert<String>(json['inquiry_id']);
	if (inquiryId != null) {
		sharedByBrooonInquiryResponseDataInquiries.inquiryId = inquiryId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		sharedByBrooonInquiryResponseDataInquiries.name = name;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		sharedByBrooonInquiryResponseDataInquiries.type = type;
	}
	final List<String>? xFor = jsonConvert.convertListNotNull<String>(json['for']);
	if (xFor != null) {
		sharedByBrooonInquiryResponseDataInquiries.xFor = xFor;
	}
	final String? inquiryStatus = jsonConvert.convert<String>(json['inquiry_status']);
	if (inquiryStatus != null) {
		sharedByBrooonInquiryResponseDataInquiries.inquiryStatus = inquiryStatus;
	}
	final int? closeDealId = jsonConvert.convert<int>(json['close_deal_id']);
	if (closeDealId != null) {
		sharedByBrooonInquiryResponseDataInquiries.closeDealId = closeDealId;
	}
	final String? inquirySoldStatus = jsonConvert.convert<String>(json['inquiry_sold_status']);
	if (inquirySoldStatus != null) {
		sharedByBrooonInquiryResponseDataInquiries.inquirySoldStatus = inquirySoldStatus;
	}
	final int? inquirySoldStatusId = jsonConvert.convert<int>(json['inquiry_sold_status_id']);
	if (inquirySoldStatusId != null) {
		sharedByBrooonInquiryResponseDataInquiries.inquirySoldStatusId = inquirySoldStatusId;
	}
	final List<String>? propertyFurnishedType = jsonConvert.convertListNotNull<String>(json['property_furnished_type']);
	if (propertyFurnishedType != null) {
		sharedByBrooonInquiryResponseDataInquiries.propertyFurnishedType = propertyFurnishedType;
	}
	final List<String>? additionalFurnishing = jsonConvert.convertListNotNull<String>(json['additional_furnishing']);
	if (additionalFurnishing != null) {
		sharedByBrooonInquiryResponseDataInquiries.additionalFurnishing = additionalFurnishing;
	}
	final int? room = jsonConvert.convert<int>(json['room']);
	if (room != null) {
		sharedByBrooonInquiryResponseDataInquiries.room = room;
	}
	final int? bathRoom = jsonConvert.convert<int>(json['bath_room']);
	if (bathRoom != null) {
		sharedByBrooonInquiryResponseDataInquiries.bathRoom = bathRoom;
	}
	final int? floor = jsonConvert.convert<int>(json['floor']);
	if (floor != null) {
		sharedByBrooonInquiryResponseDataInquiries.floor = floor;
	}
	final int? totalFloor = jsonConvert.convert<int>(json['total_floor']);
	if (totalFloor != null) {
		sharedByBrooonInquiryResponseDataInquiries.totalFloor = totalFloor;
	}
	final int? brokerChain = jsonConvert.convert<int>(json['broker_chain']);
	if (brokerChain != null) {
		sharedByBrooonInquiryResponseDataInquiries.brokerChain = brokerChain;
	}
	final double? buyMinPrice = jsonConvert.convert<double>(json['buy_min_price']);
	if (buyMinPrice != null) {
		sharedByBrooonInquiryResponseDataInquiries.buyMinPrice = buyMinPrice;
	}
	final double? buyMaxPrice = jsonConvert.convert<double>(json['buy_max_price']);
	if (buyMaxPrice != null) {
		sharedByBrooonInquiryResponseDataInquiries.buyMaxPrice = buyMaxPrice;
	}
	final double? rentMinPrice = jsonConvert.convert<double>(json['rent_min_price']);
	if (rentMinPrice != null) {
		sharedByBrooonInquiryResponseDataInquiries.rentMinPrice = rentMinPrice;
	}
	final double? rentMaxPrice = jsonConvert.convert<double>(json['rent_max_price']);
	if (rentMaxPrice != null) {
		sharedByBrooonInquiryResponseDataInquiries.rentMaxPrice = rentMaxPrice;
	}
	final double? leaseMinPrice = jsonConvert.convert<double>(json['lease_min_price']);
	if (leaseMinPrice != null) {
		sharedByBrooonInquiryResponseDataInquiries.leaseMinPrice = leaseMinPrice;
	}
	final double? leaseMaxPrice = jsonConvert.convert<double>(json['lease_max_price']);
	if (leaseMaxPrice != null) {
		sharedByBrooonInquiryResponseDataInquiries.leaseMaxPrice = leaseMaxPrice;
	}
	final int? buyMinPriceUnitId = jsonConvert.convert<int>(json['buy_min_price_unit_id']);
	if (buyMinPriceUnitId != null) {
		sharedByBrooonInquiryResponseDataInquiries.buyMinPriceUnitId = buyMinPriceUnitId;
	}
	final int? buyMaxPriceUnitId = jsonConvert.convert<int>(json['buy_max_price_unit_id']);
	if (buyMaxPriceUnitId != null) {
		sharedByBrooonInquiryResponseDataInquiries.buyMaxPriceUnitId = buyMaxPriceUnitId;
	}
	final int? rentMinPriceUnitId = jsonConvert.convert<int>(json['rent_min_price_unit_id']);
	if (rentMinPriceUnitId != null) {
		sharedByBrooonInquiryResponseDataInquiries.rentMinPriceUnitId = rentMinPriceUnitId;
	}
	final int? rentMaxPriceUnitId = jsonConvert.convert<int>(json['rent_max_price_unit_id']);
	if (rentMaxPriceUnitId != null) {
		sharedByBrooonInquiryResponseDataInquiries.rentMaxPriceUnitId = rentMaxPriceUnitId;
	}
	final int? leaseMinPriceUnitId = jsonConvert.convert<int>(json['lease_min_price_unit_id']);
	if (leaseMinPriceUnitId != null) {
		sharedByBrooonInquiryResponseDataInquiries.leaseMinPriceUnitId = leaseMinPriceUnitId;
	}
	final int? leaseMaxPriceUnitId = jsonConvert.convert<int>(json['lease_max_price_unit_id']);
	if (leaseMaxPriceUnitId != null) {
		sharedByBrooonInquiryResponseDataInquiries.leaseMaxPriceUnitId = leaseMaxPriceUnitId;
	}
	final String? mapLocation = jsonConvert.convert<String>(json['map_location']);
	if (mapLocation != null) {
		sharedByBrooonInquiryResponseDataInquiries.mapLocation = mapLocation;
	}
	final String? typedLocation = jsonConvert.convert<String>(json['typed_location']);
	if (typedLocation != null) {
		sharedByBrooonInquiryResponseDataInquiries.typedLocation = typedLocation;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		sharedByBrooonInquiryResponseDataInquiries.latitude = latitude;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		sharedByBrooonInquiryResponseDataInquiries.longitude = longitude;
	}
	final int? price = jsonConvert.convert<int>(json['price']);
	if (price != null) {
		sharedByBrooonInquiryResponseDataInquiries.price = price;
	}
	final String? priceUnit = jsonConvert.convert<String>(json['price_unit']);
	if (priceUnit != null) {
		sharedByBrooonInquiryResponseDataInquiries.priceUnit = priceUnit;
	}
	final double? minAreaSize = jsonConvert.convert<double>(json['min_area_size']);
	if (minAreaSize != null) {
		sharedByBrooonInquiryResponseDataInquiries.minAreaSize = minAreaSize;
	}
	final double? maxAreaSize = jsonConvert.convert<double>(json['max_area_size']);
	if (maxAreaSize != null) {
		sharedByBrooonInquiryResponseDataInquiries.maxAreaSize = maxAreaSize;
	}
	final String? areaUnit = jsonConvert.convert<String>(json['area_unit']);
	if (areaUnit != null) {
		sharedByBrooonInquiryResponseDataInquiries.areaUnit = areaUnit;
	}
	final double? buyMinPriceBySize = jsonConvert.convert<double>(json['buy_min_price_by_size']);
	if (buyMinPriceBySize != null) {
		sharedByBrooonInquiryResponseDataInquiries.buyMinPriceBySize = buyMinPriceBySize;
	}
	final double? buyMaxPriceBySize = jsonConvert.convert<double>(json['buy_max_price_by_size']);
	if (buyMaxPriceBySize != null) {
		sharedByBrooonInquiryResponseDataInquiries.buyMaxPriceBySize = buyMaxPriceBySize;
	}
	final double? rentMinPriceBySize = jsonConvert.convert<double>(json['rent_min_price_by_size']);
	if (rentMinPriceBySize != null) {
		sharedByBrooonInquiryResponseDataInquiries.rentMinPriceBySize = rentMinPriceBySize;
	}
	final double? rentMaxPriceBySize = jsonConvert.convert<double>(json['rent_max_price_by_size']);
	if (rentMaxPriceBySize != null) {
		sharedByBrooonInquiryResponseDataInquiries.rentMaxPriceBySize = rentMaxPriceBySize;
	}
	final double? leaseMinPriceBySize = jsonConvert.convert<double>(json['lease_min_price_by_size']);
	if (leaseMinPriceBySize != null) {
		sharedByBrooonInquiryResponseDataInquiries.leaseMinPriceBySize = leaseMinPriceBySize;
	}
	final double? leaseMaxPriceBySize = jsonConvert.convert<double>(json['lease_max_price_by_size']);
	if (leaseMaxPriceBySize != null) {
		sharedByBrooonInquiryResponseDataInquiries.leaseMaxPriceBySize = leaseMaxPriceBySize;
	}
	final List<String>? buildingType = jsonConvert.convertListNotNull<String>(json['building_type']);
	if (buildingType != null) {
		sharedByBrooonInquiryResponseDataInquiries.buildingType = buildingType;
	}
	final List<String>? facing = jsonConvert.convertListNotNull<String>(json['facing']);
	if (facing != null) {
		sharedByBrooonInquiryResponseDataInquiries.facing = facing;
	}
	final List<String>? bhk = jsonConvert.convertListNotNull<String>(json['bhk']);
	if (bhk != null) {
		sharedByBrooonInquiryResponseDataInquiries.bhk = bhk;
	}
	final bool? balcony = jsonConvert.convert<bool>(json['balcony']);
	if (balcony != null) {
		sharedByBrooonInquiryResponseDataInquiries.balcony = balcony;
	}
	final bool? cornerPiece = jsonConvert.convert<bool>(json['corner_piece']);
	if (cornerPiece != null) {
		sharedByBrooonInquiryResponseDataInquiries.cornerPiece = cornerPiece;
	}
	final List<double>? connectedRoad = jsonConvert.convertListNotNull<double>(json['connected_road']);
	if (connectedRoad != null) {
		sharedByBrooonInquiryResponseDataInquiries.connectedRoad = connectedRoad;
	}
	final bool? lightConnection = jsonConvert.convert<bool>(json['light_connection']);
	if (lightConnection != null) {
		sharedByBrooonInquiryResponseDataInquiries.lightConnection = lightConnection;
	}
	final bool? wellAvailable = jsonConvert.convert<bool>(json['well_available']);
	if (wellAvailable != null) {
		sharedByBrooonInquiryResponseDataInquiries.wellAvailable = wellAvailable;
	}
	final List<String>? schemeType = jsonConvert.convertListNotNull<String>(json['scheme_type']);
	if (schemeType != null) {
		sharedByBrooonInquiryResponseDataInquiries.schemeType = schemeType;
	}
	final double? frontSize = jsonConvert.convert<double>(json['front_size']);
	if (frontSize != null) {
		sharedByBrooonInquiryResponseDataInquiries.frontSize = frontSize;
	}
	final double? depthSize = jsonConvert.convert<double>(json['depth_size']);
	if (depthSize != null) {
		sharedByBrooonInquiryResponseDataInquiries.depthSize = depthSize;
	}
	final List<String>? constructionType = jsonConvert.convertListNotNull<String>(json['construction_type']);
	if (constructionType != null) {
		sharedByBrooonInquiryResponseDataInquiries.constructionType = constructionType;
	}
	final bool? parkingAvailable = jsonConvert.convert<bool>(json['parking_available']);
	if (parkingAvailable != null) {
		sharedByBrooonInquiryResponseDataInquiries.parkingAvailable = parkingAvailable;
	}
	final bool? liftAvailable = jsonConvert.convert<bool>(json['lift_available']);
	if (liftAvailable != null) {
		sharedByBrooonInquiryResponseDataInquiries.liftAvailable = liftAvailable;
	}
	final bool? allottedParking = jsonConvert.convert<bool>(json['allotted_parking']);
	if (allottedParking != null) {
		sharedByBrooonInquiryResponseDataInquiries.allottedParking = allottedParking;
	}
	final bool? washRoomAvailable = jsonConvert.convert<bool>(json['wash_room_available']);
	if (washRoomAvailable != null) {
		sharedByBrooonInquiryResponseDataInquiries.washRoomAvailable = washRoomAvailable;
	}
	final bool? exchangeAllowed = jsonConvert.convert<bool>(json['exchange_allowed']);
	if (exchangeAllowed != null) {
		sharedByBrooonInquiryResponseDataInquiries.exchangeAllowed = exchangeAllowed;
	}
	final bool? negotiationAllowed = jsonConvert.convert<bool>(json['negotiation_allowed']);
	if (negotiationAllowed != null) {
		sharedByBrooonInquiryResponseDataInquiries.negotiationAllowed = negotiationAllowed;
	}
	final List<String>? amenities = jsonConvert.convertListNotNull<String>(json['amenities']);
	if (amenities != null) {
		sharedByBrooonInquiryResponseDataInquiries.amenities = amenities;
	}
	final List<String>? preferredCaste = jsonConvert.convertListNotNull<String>(json['preferred_caste']);
	if (preferredCaste != null) {
		sharedByBrooonInquiryResponseDataInquiries.preferredCaste = preferredCaste;
	}
	final bool? isPublic = jsonConvert.convert<bool>(json['is_public']);
	if (isPublic != null) {
		sharedByBrooonInquiryResponseDataInquiries.isPublic = isPublic;
	}
	final List<String>? tags = jsonConvert.convertListNotNull<String>(json['tags']);
	if (tags != null) {
		sharedByBrooonInquiryResponseDataInquiries.tags = tags;
	}
	final String? note = jsonConvert.convert<String>(json['note']);
	if (note != null) {
		sharedByBrooonInquiryResponseDataInquiries.note = note;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		sharedByBrooonInquiryResponseDataInquiries.createdAt = createdAt;
	}
	final int? updatedAt = jsonConvert.convert<int>(json['updated_at']);
	if (updatedAt != null) {
		sharedByBrooonInquiryResponseDataInquiries.updatedAt = updatedAt;
	}
	final SharedByBrooonInquiryResponseDataInquiriesBrooonInfo? brooonInfo = jsonConvert.convert<SharedByBrooonInquiryResponseDataInquiriesBrooonInfo>(json['brooon_info']);
	if (brooonInfo != null) {
		sharedByBrooonInquiryResponseDataInquiries.brooonInfo = brooonInfo;
	}
	return sharedByBrooonInquiryResponseDataInquiries;
}

Map<String, dynamic> $SharedByBrooonInquiryResponseDataInquiriesToJson(SharedByBrooonInquiryResponseDataInquiries entity) {
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
	data['map_location'] = entity.mapLocation;
	data['typed_location'] = entity.typedLocation;
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

SharedByBrooonInquiryResponseDataInquiriesBrooonInfo $SharedByBrooonInquiryResponseDataInquiriesBrooonInfoFromJson(Map<String, dynamic> json) {
	final SharedByBrooonInquiryResponseDataInquiriesBrooonInfo sharedByBrooonInquiryResponseDataInquiriesBrooonInfo = SharedByBrooonInquiryResponseDataInquiriesBrooonInfo();
	final int? brooonId = jsonConvert.convert<int>(json['brooon_id']);
	if (brooonId != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonInfo.brooonId = brooonId;
	}
	final String? brooonCode = jsonConvert.convert<String>(json['brooon_code']);
	if (brooonCode != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonInfo.brooonCode = brooonCode;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonInfo.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonInfo.lastName = lastName;
	}
	final String? mobileNumber = jsonConvert.convert<String>(json['mobile_number']);
	if (mobileNumber != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonInfo.mobileNumber = mobileNumber;
	}
	final String? brooonPhoto = jsonConvert.convert<String>(json['brooon_photo']);
	if (brooonPhoto != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonInfo.brooonPhoto = brooonPhoto;
	}
	final SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo? associationInfo = jsonConvert.convert<SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo>(json['association_info']);
	if (associationInfo != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonInfo.associationInfo = associationInfo;
	}
	return sharedByBrooonInquiryResponseDataInquiriesBrooonInfo;
}

Map<String, dynamic> $SharedByBrooonInquiryResponseDataInquiriesBrooonInfoToJson(SharedByBrooonInquiryResponseDataInquiriesBrooonInfo entity) {
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

SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo $SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfoFromJson(Map<String, dynamic> json) {
	final SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo sharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo = SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo();
	final int? associationId = jsonConvert.convert<int>(json['association_id']);
	if (associationId != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo.associationId = associationId;
	}
	final String? associationCode = jsonConvert.convert<String>(json['association_code']);
	if (associationCode != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo.associationCode = associationCode;
	}
	final String? associationPhoto = jsonConvert.convert<String>(json['association_photo']);
	if (associationPhoto != null) {
		sharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo.associationPhoto = associationPhoto;
	}
	return sharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo;
}

Map<String, dynamic> $SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfoToJson(SharedByBrooonInquiryResponseDataInquiriesBrooonAssociationInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['association_id'] = entity.associationId;
	data['association_code'] = entity.associationCode;
	data['association_photo'] = entity.associationPhoto;
	return data;
}