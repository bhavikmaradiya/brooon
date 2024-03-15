import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common_property_data_provider.dart';
import '../../../localdb/properties/db_property.dart';
import '../../../localdb/save_default_data.dart';
import '../../../utils/app_config.dart';

class AddPropertyApiRequest {
  final AppLocalizations localizationsContext;
  final CommonPropertyDataProvider commonPropertyDataProvider;

  AddPropertyApiRequest.local({
    required this.localizationsContext,
    required this.commonPropertyDataProvider,
  });

  String? propertyId;
  String? propertyName;
  String? propertyType;
  List<String>? propertyFor;
  String? propertyStatus;
  String? propertySoldStatus;
  int? propertySoldStatusId;
  String? propertyFurnishedType;
  int? roomCount;
  int? bathRoomCount;
  int? floorCount;
  int? totalFloorCount;
  String? brokerChain;
  double? minSellPrice;
  double? maxSellPrice;
  double? minRentPrice;
  double? maxRentPrice;
  double? minLeasePrice;
  double? maxLeasePrice;
  int? minSellPriceUnitId;
  int? maxSellPriceUnitId;
  int? minRentPriceUnitId;
  int? maxRentPriceUnitId;
  int? minLeasePriceUnitId;
  int? maxLeasePriceUnitId;
  String? priceUnit;
  double? propertyAreaSize;
  String? propertyAreaUnit;
  double? propertySellPricePerArea;
  double? propertyRentPricePerArea;
  double? propertyLeasePricePerArea;
  String? propertyPricePerAreaUnit;
  String? buildingType;
  String? facing;
  bool? isCornerPiece;
  List<double>? connectedRoad;
  bool? lightConnection;
  bool? isWellAvailable;
  bool? isBalcony;
  String? schemeType;
  String? bhk;
  double? frontSize;
  double? depthSize;
  String? constructionType;
  bool? isParkingAvailable;
  bool? isLiftAvailable;
  bool? isAllottedParking;
  bool? isWashRoomAvailable;
  bool? exchangeAllowed = false;
  bool? negotiationAllowed = false;
  String? comments;
  List<String>? additionalFurnishing;
  List<String>? amenities;
  List<String>? preferredCaste;
  List<String>? tags;
  bool? isPubliclyAvailable;
  bool? isEdit;
  DateTime? addedAt;
  DateTime? updatedAt;
  String? publicLocation;
  double? publicLatitude;
  double? publicLongitude;

  String _getPropertySoldStatus(DbProperty property) {
    int? id = null;
    if (property.propertySoldStatusId == SaveDefaultData.soldStatusId) {
      id = property.closeDealId;
    } else {
      if (property.propertyForIds != null &&
          property.propertyForIds!.length > 0) {
        id = property.propertyForIds?[0];
      }
    }
    return commonPropertyDataProvider.getPropertyCurrentStatus(
      property.propertySoldStatusId,
      id,
      localizationsContext,
    );
  }

  Future<String?> _getPropertyFurnishedStatus(int? furnishedStatusId) async {
    final data = await commonPropertyDataProvider.getFurnishedStatusById(
      furnishedStatusId,
    );
    if (data != null) {
      return data.name;
    }
    return null;
  }

  Future<String?> _getBuildingType(int? buildingTypeId) async {
    final data = buildingTypeId != null
        ? await commonPropertyDataProvider.getPropertyBuildingTypeById(
            [buildingTypeId],
          )
        : null;
    if (data != null && data.isNotEmpty) {
      return data.first.name;
    }
    return null;
  }

  Future<String?> _getFacing(int? facingId) async {
    final data = await commonPropertyDataProvider.getPropertyFacingTypeById(
      facingId,
    );
    if (data != null) {
      return data.name;
    }
    return null;
  }

  /*Future<List<String>?> _getConnectedRoad(List<int>? connectedRoadIds) async {
    if (connectedRoadIds != null && connectedRoadIds.isNotEmpty) {
      List<String> list = [];
      for (int i = 0; i < connectedRoadIds.length; i++) {
        final data = await commonPropertyDataProvider.getConnectedRoadById(
          connectedRoadIds[i],
        );
        if (data != null) {
          list.add(data.name);
        }
      }
      if (list.isNotEmpty) {
        return list;
      }
    }
    return null;
  }*/

  Future<String?> _getSchemeType(int? schemeTypeId) async {
    final data = await commonPropertyDataProvider.getPropertySchemeTypeById(
      schemeTypeId,
    );
    if (data != null) {
      return data.name;
    }
    return null;
  }

  Future<String?> _getBhk(int? bhkId) async {
    final data = await commonPropertyDataProvider.getPropertyBhkById(
      bhkId,
    );
    if (data != null) {
      return data.name;
    }
    return null;
  }

  Future<String?> _getConstruction(int? constructionId) async {
    final data = await commonPropertyDataProvider.getConstructionTypeById(
      constructionId,
    );
    if (data != null) {
      return data.name;
    }
    return null;
  }

  String? _getBrokerChain(int? brokerChainCount) {
    if (brokerChainCount != null) {
      return brokerChainCount == 0
          ? localizationsContext.directChain
          : brokerChainCount.toString();
    }
    return null;
  }

  Future<AddPropertyApiRequest> _convertObject(DbProperty property) async {
    final obj = AddPropertyApiRequest.local(
      localizationsContext: localizationsContext,
      commonPropertyDataProvider: commonPropertyDataProvider,
    );
    obj.isPubliclyAvailable = property.isPublicProperty;
    obj.propertyName = property.propertyName;
    obj.propertyType = property.propertyTypeValue;
    obj.propertyFor = property.propertyForValues;
    obj.propertyStatus = property.propertyStatusValue;
    obj.propertySoldStatus = _getPropertySoldStatus(property);
    obj.propertySoldStatusId = property.propertySoldStatusId;
    obj.propertyFurnishedType = await _getPropertyFurnishedStatus(
      property.propertyFurnishedStatusId,
    );
    obj.roomCount = property.roomCount;
    obj.bathRoomCount = property.bathRoomCount;
    obj.floorCount = property.floorCount;
    obj.totalFloorCount = property.totalFloorCount;
    obj.brokerChain = _getBrokerChain(property.brokerChain);
    obj.minSellPrice = property.minSellPrice;
    obj.maxSellPrice = property.maxSellPrice;
    obj.minRentPrice = property.minRentPrice;
    obj.maxRentPrice = property.maxRentPrice;
    obj.minLeasePrice = property.minLeasePrice;
    obj.maxLeasePrice = property.maxLeasePrice;
    obj.minSellPriceUnitId = property.minSellPriceUnit;
    obj.maxSellPriceUnitId = property.maxSellPriceUnit;
    obj.minRentPriceUnitId = property.minRentPriceUnit;
    obj.maxRentPriceUnitId = property.maxRentPriceUnit;
    obj.minLeasePriceUnitId = property.minLeasePriceUnit;
    obj.maxLeasePriceUnitId = property.maxLeasePriceUnit;
    obj.priceUnit = property.priceUnitValue;
    obj.propertyAreaSize = property.propertyAreaSize;
    obj.propertyAreaUnit = property.propertyAreaUnitValue;
    obj.propertySellPricePerArea = property.propertySellPricePerArea;
    obj.propertyRentPricePerArea = property.propertyRentPricePerArea;
    obj.propertyLeasePricePerArea = property.propertyLeasePricePerArea;
    obj.propertyPricePerAreaUnit = property.propertyPricePerAreaUnitValue;
    obj.buildingType = await _getBuildingType(property.buildingTypeId);
    obj.facing = await _getFacing(property.facingId);
    obj.isCornerPiece = property.isCornerPiece;
    obj.isBalcony = property.balcony;
    obj.connectedRoad = property.connectedRoads;
    obj.lightConnection = property.lightConnection;
    obj.isWellAvailable = property.isWellAvailable;
    obj.schemeType = await _getSchemeType(property.schemeTypeId);
    obj.bhk = await _getBhk(property.bhkId);
    obj.frontSize = property.frontSize;
    obj.depthSize = property.depthSize;
    obj.constructionType = await _getConstruction(property.constructionTypeId);
    obj.isParkingAvailable = property.isParkingAvailable;
    obj.isLiftAvailable = property.isLiftAvailable;
    obj.isAllottedParking = property.isAllottedParking;
    obj.isWashRoomAvailable = property.isWashRoomAvailable;
    obj.exchangeAllowed = property.exchangeAllowed;
    obj.negotiationAllowed = property.negotiationAllowed;
    obj.comments = property.comments;
    obj.tags = property.tags;
    obj.additionalFurnishing = property.additionalFurnishing;
    obj.amenities = property.amenitiesValues;
    obj.preferredCaste = property.preferredCommunityValues;
    obj.propertyId = property.propertyId;
    obj.isEdit = property.isEdit;
    obj.publicLocation = property.publicAddressLandMark;
    obj.publicLatitude = property.publicLatitude;
    obj.publicLongitude = property.publicLongitude;
    obj.addedAt = property.addedAt;
    obj.updatedAt = property.updatedAt;
    return obj;
  }

  Future<Map<String, dynamic>> toMap(List<DbProperty> property) async {
    Map<String, dynamic> body = {};
    List<Map<String, dynamic>> propertyArray = [];
    await Future.forEach(
      property,
      (element) async {
        Map<String, dynamic> propertyObj = {};
        AddPropertyApiRequest propertyInfo = await _convertObject(element);
        if (propertyInfo.propertyName != null) {
          propertyObj['name'] = propertyInfo.propertyName;
        }
        if (propertyInfo.propertyType != null) {
          propertyObj['type'] = propertyInfo.propertyType;
        }
        if (propertyInfo.propertyFor != null) {
          propertyObj['for'] = propertyInfo.propertyFor;
        }
        if (propertyInfo.propertyStatus != null) {
          propertyObj['property_status'] = propertyInfo.propertyStatus;
        }
        if (propertyInfo.propertySoldStatus != null) {
          propertyObj['property_sold_status'] = propertyInfo.propertySoldStatus;
        }
        if (propertyInfo.propertySoldStatusId != null) {
          propertyObj['property_sold_status_id'] =
              propertyInfo.propertySoldStatusId;
        }
        if (propertyInfo.propertyFurnishedType != null) {
          propertyObj['property_furnished_type'] =
              propertyInfo.propertyFurnishedType;
        }
        if (propertyInfo.roomCount != null) {
          propertyObj['room'] = propertyInfo.roomCount;
        }
        if (propertyInfo.bathRoomCount != null) {
          propertyObj['bath_room'] = propertyInfo.bathRoomCount;
        }
        if (propertyInfo.floorCount != null) {
          propertyObj['floor'] = propertyInfo.floorCount;
        }
        if (propertyInfo.totalFloorCount != null) {
          propertyObj['total_floor'] = propertyInfo.totalFloorCount;
        }
        if (propertyInfo.brokerChain != null) {
          propertyObj['broker_chain'] = propertyInfo.brokerChain;
        }
        if (propertyInfo.minSellPrice != null) {
          propertyObj['sell_min_price'] = propertyInfo.minSellPrice;
        }
        if (propertyInfo.maxSellPrice != null) {
          propertyObj['sell_max_price'] = propertyInfo.maxSellPrice;
        }
        if (propertyInfo.minRentPrice != null) {
          propertyObj['rent_min_price'] = propertyInfo.minRentPrice;
        }
        if (propertyInfo.maxRentPrice != null) {
          propertyObj['rent_max_price'] = propertyInfo.maxRentPrice;
        }
        if (propertyInfo.minLeasePrice != null) {
          propertyObj['lease_min_price'] = propertyInfo.minLeasePrice;
        }
        if (propertyInfo.maxLeasePrice != null) {
          propertyObj['lease_max_price'] = propertyInfo.maxLeasePrice;
        }

        if (propertyInfo.minSellPriceUnitId != null) {
          propertyObj['sell_min_price_unit_id'] =
              propertyInfo.minSellPriceUnitId;
        }
        if (propertyInfo.maxSellPriceUnitId != null) {
          propertyObj['sell_max_price_unit_id'] =
              propertyInfo.maxSellPriceUnitId;
        }
        if (propertyInfo.minRentPriceUnitId != null) {
          propertyObj['rent_min_price_unit_id'] =
              propertyInfo.minRentPriceUnitId;
        }
        if (propertyInfo.maxRentPriceUnitId != null) {
          propertyObj['rent_max_price_unit_id'] =
              propertyInfo.maxRentPriceUnitId;
        }
        if (propertyInfo.minLeasePriceUnitId != null) {
          propertyObj['lease_min_price_unit_id'] =
              propertyInfo.minLeasePriceUnitId;
        }
        if (propertyInfo.maxLeasePriceUnitId != null) {
          propertyObj['lease_max_price_unit_id'] =
              propertyInfo.maxLeasePriceUnitId;
        }
        if (propertyInfo.priceUnit != null) {
          propertyObj['price_unit'] = propertyInfo.priceUnit;
        }
        if (propertyInfo.propertyAreaSize != null) {
          propertyObj['area_size'] = propertyInfo.propertyAreaSize;
        }
        if (propertyInfo.propertyAreaUnit != null) {
          propertyObj['area_unit'] = propertyInfo.propertyAreaUnit;
        }
        if (propertyInfo.propertySellPricePerArea != null) {
          propertyObj['sell_price_by_size'] =
              propertyInfo.propertySellPricePerArea;
        }
        if (propertyInfo.propertyRentPricePerArea != null) {
          propertyObj['rent_price_by_size'] =
              propertyInfo.propertyRentPricePerArea;
        }
        if (propertyInfo.propertyLeasePricePerArea != null) {
          propertyObj['lease_price_by_size'] =
              propertyInfo.propertyLeasePricePerArea;
        }
        if (propertyInfo.propertyPricePerAreaUnit != null) {
          propertyObj['price_by_size_unit'] =
              propertyInfo.propertyPricePerAreaUnit;
        }
        if (propertyInfo.buildingType != null) {
          propertyObj['building_type'] = propertyInfo.buildingType;
        }
        if (propertyInfo.facing != null) {
          propertyObj['facing'] = propertyInfo.facing;
        }
        if (propertyInfo.bhk != null) {
          propertyObj['bhk'] = propertyInfo.bhk;
        }
        if (propertyInfo.isBalcony != null) {
          propertyObj['balcony'] = propertyInfo.isBalcony;
        }
        if (propertyInfo.isCornerPiece != null) {
          propertyObj['corner_piece'] = propertyInfo.isCornerPiece;
        }
        if (propertyInfo.connectedRoad != null) {
          propertyObj['connected_road'] = propertyInfo.connectedRoad;
        }
        if (propertyInfo.lightConnection != null) {
          propertyObj['light_connection'] = propertyInfo.lightConnection;
        }
        if (propertyInfo.isWellAvailable != null) {
          propertyObj['well_available'] = propertyInfo.isWellAvailable;
        }
        if (propertyInfo.schemeType != null) {
          propertyObj['scheme_type'] = propertyInfo.schemeType;
        }
        if (propertyInfo.frontSize != null) {
          propertyObj['front_size'] = propertyInfo.frontSize;
        }
        if (propertyInfo.depthSize != null) {
          propertyObj['depth_size'] = propertyInfo.depthSize;
        }
        if (propertyInfo.constructionType != null) {
          propertyObj['construction_type'] = propertyInfo.constructionType;
        }
        if (propertyInfo.isParkingAvailable != null) {
          propertyObj['parking_available'] = propertyInfo.isParkingAvailable;
        }
        if (propertyInfo.isLiftAvailable != null) {
          propertyObj['lift_available'] = propertyInfo.isLiftAvailable;
        }
        if (propertyInfo.isAllottedParking != null) {
          propertyObj['allotted_parking'] = propertyInfo.isAllottedParking;
        }
        if (propertyInfo.isWashRoomAvailable != null) {
          propertyObj['wash_room_available'] = propertyInfo.isWashRoomAvailable;
        }
        if (propertyInfo.exchangeAllowed != null) {
          propertyObj['exchange_allowed'] = propertyInfo.exchangeAllowed;
        }
        if (propertyInfo.negotiationAllowed != null) {
          propertyObj['negotiation_allowed'] = propertyInfo.negotiationAllowed;
        }
        if (propertyInfo.comments != null) {
          propertyObj['note'] = propertyInfo.comments;
        }
        if (propertyInfo.additionalFurnishing != null &&
            propertyInfo.additionalFurnishing!.isNotEmpty) {
          propertyObj['additional_furnishing'] =
              propertyInfo.additionalFurnishing;
        }
        if (propertyInfo.amenities != null &&
            propertyInfo.amenities!.isNotEmpty) {
          propertyObj['amenities'] = propertyInfo.amenities;
        }
        if (propertyInfo.preferredCaste != null &&
            propertyInfo.preferredCaste!.isNotEmpty) {
          propertyObj['preferred_caste'] = propertyInfo.preferredCaste;
        }
        if (propertyInfo.tags != null && propertyInfo.tags!.isNotEmpty) {
          propertyObj['tags'] = propertyInfo.tags;
        }
        if (propertyInfo.propertyId != null) {
          propertyObj['property_id'] = propertyInfo.propertyId;
        }
        if (propertyInfo.isPubliclyAvailable != null) {
          propertyObj['is_public'] = propertyInfo.isPubliclyAvailable;
        }
        if (propertyInfo.isEdit != null) {
          propertyObj['is_edit'] = propertyInfo.isEdit;
        }
        if (propertyInfo.publicLocation != null &&
            propertyInfo.publicLocation!.trim().isNotEmpty) {
          propertyObj['public_location'] = propertyInfo.publicLocation;
        }
        if (propertyInfo.publicLatitude != null) {
          propertyObj['public_latitude'] = propertyInfo.publicLatitude;
        }
        if (propertyInfo.publicLongitude != null) {
          propertyObj['public_longitude'] = propertyInfo.publicLongitude;
        }
        if (propertyInfo.addedAt != null) {
          propertyObj['created_at'] =
              propertyInfo.addedAt!.millisecondsSinceEpoch;
        }
        if (propertyInfo.updatedAt != null) {
          propertyObj['updated_at'] =
              propertyInfo.updatedAt!.millisecondsSinceEpoch;
        }
        if (AppConfig.enableCloseDealUserInfoToServer) {
          if (element.closedDealBuyerName != null &&
              element.closedDealBuyerName!.trim().isNotEmpty) {
            propertyObj['buyer_name'] = element.closedDealBuyerName!.trim();
          }
          if (element.closedDealBuyerPhoneNo != null &&
              element.closedDealBuyerPhoneNo!.trim().isNotEmpty) {
            propertyObj['buyer_mobile'] =
                element.closedDealBuyerPhoneNo!.trim();
          }
          if (element.closedDealNotes != null &&
              element.closedDealNotes!.trim().isNotEmpty) {
            propertyObj['notes'] = element.closedDealNotes!.trim();
          }
        }
        if (element.closedLinkedInquiryId != null &&
            element.closedLinkedInquiryId!.trim().isNotEmpty) {
          propertyObj['linked_inquiry_id'] =
              element.closedLinkedInquiryId!.trim();
        }
        propertyArray.add(propertyObj);
      },
    );
    body['properties'] = propertyArray;
    return body;
  }
}
