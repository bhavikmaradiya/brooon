import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';

import './localdb/isar_service.dart';
import './localdb/properties/db_brooon_pagination_count_schema.dart';
import './localdb/properties/db_property.dart';
import './localdb/properties/db_property_amenity.dart';
import './localdb/properties/db_property_area_unit.dart';
import './localdb/properties/db_property_bhk_type.dart';
import './localdb/properties/db_property_building_type.dart';
import './localdb/properties/db_property_connected_road.dart';
import './localdb/properties/db_property_construction_type.dart';
import './localdb/properties/db_property_facing_type.dart';
import './localdb/properties/db_property_for.dart';
import './localdb/properties/db_property_furnished_status.dart';
import './localdb/properties/db_property_preferred_cast.dart';
import './localdb/properties/db_property_price_unit.dart';
import './localdb/properties/db_property_scheme_type.dart';
import './localdb/properties/db_property_status.dart';
import './localdb/properties/db_property_type.dart';
import './localdb/properties/db_saved_filter.dart';
import './localdb/save_default_data.dart';
import './network/dio_client.dart';
import './utils/app_config.dart';
import './utils/enums.dart';
import './utils/static_functions.dart';
import './utils/subscription_utils.dart';
import './views/buyers_sellers/model/buyer_seller_enum.dart';
import './views/buyers_sellers/model/buyer_seller_info.dart';
import './views/shared_by_brooon/api_request/shared_by_brooon_filter_request.dart';
import './views/shared_by_brooon/api_response/shared_by_brooon_inquiry_response_entity.dart';
import './views/shared_by_brooon/api_response/shared_by_brooon_property_response_entity.dart';
import './views/view_all_property/model/view_all_screen_arg.dart';
import './widgets/property_helpers/location_filter_helper.dart';

class CommonPropertyDataProvider extends ChangeNotifier {
  final _isarService = IsarService();
  bool isUserSubscribed = false;
  Size homeSharedByBrooonItemSize = Size(0, 0);
  List<DbProperty> sharedByBrooonersProperties = [];
  List<DbSavedFilter> sharedByBrooonersInquiries = [];
  ApiEnum propertyApiEnum = ApiEnum.inProgress;
  ApiEnum inquiryApiEnum = ApiEnum.inProgress;
  bool mounted = true;
  static late List<DbProperty> _brooonMatchingProperties = [];
  static late List<DbSavedFilter> _brooonMatchingInquiries = [];

  List<DbProperty> get brooonMatchingProperties => _brooonMatchingProperties;

  List<DbSavedFilter> get brooonMatchingInquiries => _brooonMatchingInquiries;

  setBrooonMatchingProperties(List<DbProperty> properties) {
    _brooonMatchingProperties.clear();
    _brooonMatchingProperties.addAll(properties);
  }

  setBrooonMatchingInquiries(List<DbSavedFilter> inquiries) {
    _brooonMatchingInquiries.clear();
    _brooonMatchingInquiries.addAll(inquiries);
  }

  Future<DbPropertyType?> getPropertyTypeById(int propertyTypeId) async {
    final data = await _isarService.getPropertyTypeById(propertyTypeId);
    return data;
  }

  Future<DbPropertyFor?> getPropertyForById(int propertyForId) async {
    final propertyFor = await _isarService.getPropertyForById(propertyForId);
    return propertyFor;
  }

  Future<DbPropertyStatus?> getPropertyStatus(int propertyStatusId) async {
    final propertyStatus =
        await _isarService.getPropertyStatusById(propertyStatusId);
    return propertyStatus;
  }

  Future<DbPropertyPriceUnit?> getPropertyPriceUnitById(
      int? propertyPriceUnitId) async {
    if (propertyPriceUnitId != null) {
      final propertyPriceUnit =
          await _isarService.getPropertyPriceUnitById(propertyPriceUnitId);
      return propertyPriceUnit;
    }
    return null;
  }

  Future<DbPropertyAreaUnit?> getPropertyAreaUnitById(
      int? propertyAreaUnitId) async {
    if (propertyAreaUnitId != null) {
      final propertyAreaUnit =
          await _isarService.getPropertyAreaUnitById(propertyAreaUnitId);
      return propertyAreaUnit;
    }
    return null;
  }

  Future<List<DbPropertyBuildingType>?> getPropertyBuildingTypeById(
    List<int> buildingTypeIds,
  ) async {
    final propertyBuildingType =
        await _isarService.getBuildingTypesById(buildingTypeIds);
    return propertyBuildingType;
  }

  Future<DbPropertyBhkType?> getPropertyBhkById(int? bhkId) async {
    if (bhkId != null) {
      final propertyBhkType = await _isarService.getBhkTypesById([bhkId]);
      if (propertyBhkType.isNotEmpty) {
        return propertyBhkType.first;
      }
    }
    return null;
  }

  Future<List<DbPropertyBhkType>> getBhkByIds(List<int> bhkId) async {
    final propertyBhkType = await _isarService.getBhkTypesById(bhkId);
    return propertyBhkType;
  }

  Future<DbPropertyFacingType?> getPropertyFacingTypeById(
      int? facingTypeId) async {
    if (facingTypeId != null) {
      final propertyFacingType =
          await _isarService.getFacingTypesById(facingTypeId);
      return propertyFacingType;
    }
    return null;
  }

  Future<List<DbPropertyFacingType>> getPropertyFacingTypesByIds(
      List<int> facingTypeId) async {
    return await _isarService.getFacingTypesByIds(facingTypeId);
  }

  Future<DbPropertyConnectedRoad?> getConnectedRoadById(
    int? connectedRoadId,
  ) async {
    if (connectedRoadId != null) {
      final connectedRoad =
          await _isarService.getConnectedRoadsById(connectedRoadId);
      return connectedRoad;
    }
    return null;
  }

  Future<DbPropertyConstructionType?> getConstructionTypeById(
      int? constructionTypeId) async {
    if (constructionTypeId != null) {
      final constructionType =
          await _isarService.getConstructionTypeById(constructionTypeId);
      return constructionType;
    }
    return null;
  }

  Future<List<DbPropertyConstructionType>> getConstructionTypeByIds(
      List<int> constructionTypeId) async {
    final constructionType =
        await _isarService.getConstructionTypeByIds(constructionTypeId);
    return constructionType;
  }

  Future<DbPropertyFurnishedStatus?> getFurnishedStatusById(
      int? furnishedStatusId) async {
    if (furnishedStatusId != null) {
      final furnishedStatus =
          await _isarService.getFurnishedStatusById(furnishedStatusId);
      return furnishedStatus;
    }
    return null;
  }

  Future<List<DbPropertyFurnishedStatus>> getFurnishedStatusByIds(
      List<int> furnishedStatusId) async {
    final furnishedStatus =
        await _isarService.getFurnishedStatusByIds(furnishedStatusId);
    return furnishedStatus;
  }

  Future<DbPropertySchemeType?> getPropertySchemeTypeById(
    int? schemeTypeId,
  ) async {
    if (schemeTypeId != null) {
      final propertySchemeType =
          await _isarService.getSchemeTypesById(schemeTypeId);
      return propertySchemeType;
    }
    return null;
  }

  Future<List<DbPropertySchemeType>> getPropertySchemeTypeByIds(
    List<int> schemeTypeId,
  ) async {
    final propertySchemeType =
        await _isarService.getSchemeTypesByIds(schemeTypeId);
    return propertySchemeType;
  }

  Future<List<DbPropertyAmenity>?> _getPropertyAmenities(
    List<int>? amenitiesIds,
  ) async {
    if (amenitiesIds != null && amenitiesIds.isNotEmpty) {
      return await _isarService.getAmenitiesBasedOnIds(amenitiesIds);
    }
    return null;
  }

  Future<List<DbPropertyPreferredCast>?> _getPropertyPreferredCaste(
    List<int>? preferredCasteIds,
  ) async {
    if (preferredCasteIds != null && preferredCasteIds.isNotEmpty) {
      return await _isarService.getPreferredCastsBasedOnIds(preferredCasteIds);
    }
    return null;
  }

  String getPropertyMarkAsStatus(
    int? soldStatusId,
    int? propertyForId,
    AppLocalizations localizationsContext,
  ) {
    return soldStatusId == SaveDefaultData.soldStatusId
        ? propertyForId == SaveDefaultData.propertyForSellId
            ? localizationsContext.unSold
            : propertyForId == SaveDefaultData.propertyForRentId
                ? localizationsContext.unRented
                : propertyForId == SaveDefaultData.propertyForLeaseId
                    ? localizationsContext.unLeased
                    : ''
        : propertyForId == SaveDefaultData.propertyForSellId
            ? localizationsContext.sold
            : propertyForId == SaveDefaultData.propertyForRentId
                ? localizationsContext.rented
                : propertyForId == SaveDefaultData.propertyForLeaseId
                    ? localizationsContext.leased
                    : '';
  }

  String getPropertyCurrentStatus(
    int? soldStatusId,
    int? propertyForId,
    AppLocalizations localizationsContext, {
    bool isInquiry = false,
  }) {
    return soldStatusId == SaveDefaultData.soldStatusId
        ? propertyForId == SaveDefaultData.propertyForSellId
            ? isInquiry
                ? localizationsContext.bought
                : localizationsContext.sold
            : propertyForId == SaveDefaultData.propertyForRentId
                ? localizationsContext.rented
                : propertyForId == SaveDefaultData.propertyForLeaseId
                    ? localizationsContext.leased
                    : ''
        : propertyForId == SaveDefaultData.propertyForSellId
            ? localizationsContext.unSold
            : propertyForId == SaveDefaultData.propertyForRentId
                ? localizationsContext.unRented
                : propertyForId == SaveDefaultData.propertyForLeaseId
                    ? localizationsContext.unLeased
                    : '';
  }

  static String propertyAreaWithPropertyType(DbProperty property) {
    String value = '';
    value = propertyFormattedArea(property);
    if (value.trim().isNotEmpty) {
      value = '${property.propertyTypeValue} | ${value}';
    } else {
      value = '${property.propertyTypeValue}';
    }
    return value;
  }

  static String propertyFormattedArea(DbProperty property) {
    if (property.propertyAreaSize != null && property.propertyAreaSize! > 0) {
      return '${StaticFunctions.removeTrailingZeros(property.propertyAreaSize.toString())}'
          ' ${property.propertyAreaUnitValue ?? ''} ';
    }
    return '';
  }

  static String inquiryAreaWithPropertyType(
    AppLocalizations localizationsContext,
    DbSavedFilter inquiry,
  ) {
    String value = inquiryFormattedArea(
      localizationsContext,
      inquiry,
    );
    if (value.trim().isNotEmpty) {
      value = '${inquiry.propertyTypeValues!.first} | ${value}';
    } else {
      value = '${inquiry.propertyTypeValues!.first}';
    }
    return value;
  }

  static String inquiryFormattedArea(
    AppLocalizations localizationsContext,
    DbSavedFilter inquiry,
  ) {
    String value = '';
    if (inquiry.minMeasure != null && inquiry.minMeasure! > 0.0) {
      if (inquiry.maxMeasure == null || inquiry.maxMeasure! <= 0.0) {
        value = '${localizationsContext.minFilterAreaUnit} ';
      }
      value +=
          '${StaticFunctions.removeTrailingZeros(inquiry.minMeasure.toString())}';
    }
    if (inquiry.maxMeasure != null && inquiry.maxMeasure! > 0.0) {
      if (value.trim().isEmpty) {
        value = '${localizationsContext.maxFilterAreaUnit} ';
      } else if (inquiry.minMeasure != null && inquiry.minMeasure! > 0.0) {
        value += ' - ';
      }
      value +=
          '${StaticFunctions.removeTrailingZeros(inquiry.maxMeasure.toString())} ${inquiry.measureUnitValue ?? ''}';
    } else if (inquiry.minMeasure != null && inquiry.minMeasure! > 0.0) {
      value += ' ${inquiry.measureUnitValue ?? ''}';
    }
    return value;
  }

  updateSubscribedPlan(bool value) {
    StaticFunctions.isSubScribedUser = value;
    isUserSubscribed = value;
    notifyListeners();
  }

  Future<List<DbProperty>> getAllNearByPropertiesWithinRadius({
    int? propertyFor,
    DbSavedFilter? filterToApply,
  }) async {
    List<DbProperty> _nearByProperties = [];
    if (StaticFunctions.userInfo != null) {
      _nearByProperties.clear();
      List<DbProperty> list = [];
      if (propertyFor != null) {
        list = await _isarService
            .getPropertiesWithLocationAvailableByPropertyFor(propertyFor);
      } else {
        list = await _isarService.getFilteredProperties(
          filterToApply: filterToApply,
          type: ViewAllFromType.nearBy,
        );
      }
      list.forEach(
        (element) {
          final distanceInMeter = Geolocator.distanceBetween(
            element.latitude!,
            element.longitude!,
            AppConfig.enableNearByRealTimeFeature
                ? (StaticFunctions.userInfo?.liveLatitude ??
                    StaticFunctions.userInfo!.latitude!)
                : StaticFunctions.userInfo!.latitude!,
            AppConfig.enableNearByRealTimeFeature
                ? (StaticFunctions.userInfo?.liveLongitude ??
                    StaticFunctions.userInfo!.longitude!)
                : StaticFunctions.userInfo!.longitude!,
          );
          debugPrint(
              'Near By: distanceInM for ${element.propertyName}: $distanceInMeter');
          if (distanceInMeter <=
              StaticFunctions.userInfo!.nearByDistance.toInt() *
                  AppConfig.distanceMToKm) {
            element.distance = distanceInMeter;
            _nearByProperties.add(element);
          }
        },
      );
      _nearByProperties.sort(
        (a, b) => a.distance!.compareTo(b.distance!),
      );
    }
    return _nearByProperties;
  }

  Future<List<DbSavedFilter>> getAllNearByInquiriesWithinRadius({
    int? propertyFor,
    DbSavedFilter? filterToApply,
  }) async {
    List<DbSavedFilter> _nearByInquiries = [];
    if (StaticFunctions.userInfo != null) {
      _nearByInquiries.clear();
      List<DbSavedFilter> list = [];
      if (propertyFor != null) {
        list =
            await _isarService.getInquiriesWithLocationAvailableByPropertyFor(
          propertyFor,
        );
      } else {
        list = await _isarService.getFilteredInquiries(
          filterToApply: filterToApply,
          type: ViewAllFromType.nearBy,
        );
      }
      list.forEach(
        (element) {
          final distanceInMeter = Geolocator.distanceBetween(
            element.latitude!,
            element.longitude!,
            AppConfig.enableNearByRealTimeFeature
                ? (StaticFunctions.userInfo?.liveLatitude ??
                    StaticFunctions.userInfo!.latitude!)
                : StaticFunctions.userInfo!.latitude!,
            AppConfig.enableNearByRealTimeFeature
                ? (StaticFunctions.userInfo?.liveLongitude ??
                    StaticFunctions.userInfo!.longitude!)
                : StaticFunctions.userInfo!.longitude!,
          );
          debugPrint(
              'Near By: distanceInM for Inquiry ${element.inquiryId}: $distanceInMeter');
          if (distanceInMeter <=
              StaticFunctions.userInfo!.nearByDistance.toInt() *
                  AppConfig.distanceMToKm) {
            element.distance = distanceInMeter;
            _nearByInquiries.add(element);
          }
        },
      );
      _nearByInquiries.sort(
        (a, b) => a.distance!.compareTo(b.distance!),
      );
    }
    return _nearByInquiries;
  }

  updateSubscriptionStatus({
    int page = AppConfig.paginationInitialPage,
    int limit = AppConfig.paginationPerPageLimit,
    bool isFromHome = false,
    required AppLocalizations? localizationsContext,
  }) async {
    final isUserHasSubscription =
        await SubscriptionUtils.checkForUserHasActiveSubscriptionPlan();
    updateSubscribedPlan(isUserHasSubscription);
    if (isUserHasSubscription && !isFromHome) {
      // we are already calling api from home screen so.
      fetchSharedByBrooonersProperties(
        page: page,
        limit: limit,
      );
      fetchSharedByBrooonersInquiries(
        page: page,
        limit: limit,
        localizationsContext: localizationsContext,
      );
    }
  }

  Future<List<DbSavedFilter>?> fetchSharedByBrooonersInquiries({
    int page = AppConfig.paginationInitialPage,
    int limit = AppConfig.paginationPerPageLimit,
    int? propertyTypeId,
    DbSavedFilter? filter,
    required AppLocalizations? localizationsContext,
  }) async {
    if (mounted && page == AppConfig.paginationInitialPage) {
      inquiryApiEnum = ApiEnum.inProgress;
      notifyListeners();
    }

    SharedByBrooonInquiryResponseEntity? response = null;

    if (localizationsContext != null &&
        (propertyTypeId != null || filter != null)) {
      response = await DioClient().filterSharedByBrooonsInquiry(
        page,
        limit,
        await SharedByBrooonFilterRequest(
          localizationsContext: localizationsContext,
          commonPropertyDataProvider: this,
        ).toMap(
          propertyTypeId,
          filter,
        ),
      );
    } else {
      response = await DioClient().getSharedByBrooonsInquiry(
        page,
        limit,
      );
    }

    final data = await _handleBrooonInquiries(
      response,
      page,
      localizationsContext,
    );

    if (mounted && page == AppConfig.paginationInitialPage) {
      if (response != null &&
          response.success == false &&
          response.isNoInternet == true) {
        inquiryApiEnum = ApiEnum.noInternet;
      } else {
        inquiryApiEnum = data != null ? ApiEnum.onSuccess : ApiEnum.onFailure;
      }
      notifyListeners();
    }
    return data;
  }

  Future<List<DbProperty>?> fetchSharedByBrooonersProperties({
    int page = AppConfig.paginationInitialPage,
    int limit = AppConfig.paginationPerPageLimit,
    int? propertyTypeId,
    DbSavedFilter? filter,
    AppLocalizations? localizationsContext,
  }) async {
    if (mounted && page == AppConfig.paginationInitialPage) {
      propertyApiEnum = ApiEnum.inProgress;
      notifyListeners();
    }

    SharedByBrooonPropertyResponseEntity? response = null;

    if (localizationsContext != null &&
        (propertyTypeId != null || filter != null)) {
      response = await DioClient().filterSharedByBrooonsProperty(
        page,
        limit,
        await SharedByBrooonFilterRequest(
          localizationsContext: localizationsContext,
          commonPropertyDataProvider: this,
        ).toMap(
          propertyTypeId,
          filter,
        ),
      );
    } else {
      response = await DioClient().getSharedByBrooonsProperty(
        page,
        limit,
      );
    }

    final data = await _handleBrooonProperties(
      response,
      page,
    );

    if (mounted && page == AppConfig.paginationInitialPage) {
      if (response != null &&
          response.success == false &&
          response.isNoInternet == true) {
        propertyApiEnum = ApiEnum.noInternet;
      } else {
        propertyApiEnum = data != null ? ApiEnum.onSuccess : ApiEnum.onFailure;
      }
      notifyListeners();
    }
    return data;
  }

  /*Future<List<int>?> _getConnectedRoads(List<String>? connectedRoads) async {
    if (connectedRoads != null && connectedRoads.isNotEmpty) {
      List<int> ids = [];
      for (int i = 0; i < connectedRoads.length; i++) {
        ids.add(await _isarService.getConnectedRoadIdByName(connectedRoads[i]));
      }
      if (ids.isNotEmpty) {
        return ids;
      }
    }
    return null;
  }*/

  Future<List<DbProperty>?> _handleBrooonProperties(
    SharedByBrooonPropertyResponseEntity? response,
    int page,
  ) async {
    await _isarService.saveBrooonPropertiesCount(
      DbBrooonPaginationCountSchema()
        ..totalItemsCount = response?.data?.totalProperty ?? 0
        ..totalPages = response?.data?.totalPages ?? 0
        ..nextPage = response?.data?.nextPage ?? 0
        ..currentPage = response?.data?.currentPage ?? 0,
    );
    if (response?.data != null) {
      // NOW DON'T NEED TO REMOVE from db as we are not going to save any public properties in db
      /*
      // remove all brooon properties from local db for pull to refresh only
      if (isFromPullToRefresh) {
        await _isarService.deleteSharedByBrooonersProperties();
      }*/
      if (page == AppConfig.paginationInitialPage) {
        sharedByBrooonersProperties.clear();
      }
      if (response?.data?.property != null &&
          response!.data!.property!.isNotEmpty) {
        List<DbProperty> _brooonProperties = [];
        for (int i = 0; i < response.data!.property!.length; i++) {
          final propertyInfo = response.data!.property![i];
          List<int> propertyForIds = [];
          if (propertyInfo.xFor != null && propertyInfo.xFor!.isNotEmpty) {
            for (int j = 0; j < propertyInfo.xFor!.length; j++) {
              propertyForIds.add(
                await _isarService.getPropertyForIdByName(
                  propertyInfo.xFor![j],
                ),
              );
            }
          }

          DbProperty property = DbProperty()
            ..propertyId = propertyInfo.propertyId
            ..isSyncedWithServer = true
            ..isEdit = false
            ..userId = StaticFunctions.userId
            ..propertyName = propertyInfo.name ?? ''
            ..propertyTypeId = await _isarService.getPropertyTypeIdByName(
              propertyInfo.type,
            )
            ..propertyTypeValue = propertyInfo.type ?? ''
            ..propertyForIds = propertyForIds
            ..propertyForValues = propertyInfo.xFor
            ..propertyStatusId = await _isarService.getPropertyStatusIdByName(
              propertyInfo.propertyStatus,
            )
            ..propertyStatusValue = propertyInfo.propertyStatus ?? ''
            ..propertySoldStatusId = propertyInfo.propertySoldStatusId ??
                SaveDefaultData.unSoldStatusId
            ..closeDealId = propertyInfo.closeDealId
            ..addedAt = DateTime.fromMillisecondsSinceEpoch(
              propertyInfo.createdAt ?? 0,
            )
            ..updatedAt = DateTime.fromMillisecondsSinceEpoch(
              propertyInfo.updatedAt ?? 0,
            )
            ..propertyFurnishedStatusId =
                propertyInfo.propertyFurnishedType != null
                    ? (await _isarService.getFurnishedStatusIdByName(
                        [propertyInfo.propertyFurnishedType!],
                      ))
                        ?.first
                    : null
            ..roomCount = propertyInfo.room
            ..bathRoomCount = propertyInfo.bathRoom
            ..floorCount = propertyInfo.floor
            ..totalFloorCount = propertyInfo.totalFloor
            ..minSellPrice = checkForValidPrice(propertyInfo.sellMinPrice)
                ? double.parse(propertyInfo.sellMinPrice!.toString())
                : null
            ..maxSellPrice = checkForValidPrice(propertyInfo.sellMaxPrice)
                ? double.parse(propertyInfo.sellMaxPrice!.toString())
                : null
            ..minSellPriceUnit = propertyInfo.sellMinPriceUnitId != null
                ? propertyInfo.sellMinPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..maxSellPriceUnit = propertyInfo.sellMaxPriceUnitId != null
                ? propertyInfo.sellMaxPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..minRentPrice = checkForValidPrice(propertyInfo.rentMinPrice)
                ? double.parse(propertyInfo.rentMinPrice!.toString())
                : null
            ..maxRentPrice = checkForValidPrice(propertyInfo.rentMaxPrice)
                ? double.parse(propertyInfo.rentMaxPrice!.toString())
                : null
            ..minRentPriceUnit = propertyInfo.rentMinPriceUnitId != null
                ? propertyInfo.rentMinPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..maxRentPriceUnit = propertyInfo.rentMaxPriceUnitId != null
                ? propertyInfo.rentMaxPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..minLeasePrice = checkForValidPrice(propertyInfo.leaseMinPrice)
                ? double.parse(propertyInfo.leaseMinPrice!.toString())
                : null
            ..maxLeasePrice = checkForValidPrice(propertyInfo.leaseMaxPrice)
                ? double.parse(propertyInfo.leaseMaxPrice!.toString())
                : null
            ..minLeasePriceUnit = propertyInfo.leaseMinPriceUnitId != null
                ? propertyInfo.leaseMinPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..maxLeasePriceUnit = propertyInfo.leaseMaxPriceUnitId != null
                ? propertyInfo.leaseMaxPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..frontSize = propertyInfo.frontSize
            ..depthSize = propertyInfo.depthSize
            ..additionalFurnishing = propertyInfo.additionalFurnishing
            ..amenitiesValues = propertyInfo.amenities
            ..preferredCommunityValues = propertyInfo.preferredCaste
            ..tags = propertyInfo.tags
            ..buildingTypeId = propertyInfo.buildingType != null
                ? (await _isarService
                        .getBuildingTypeIdByName([propertyInfo.buildingType!]))
                    ?.first
                : null
            ..facingId = propertyInfo.facing != null
                ? (await _isarService
                        .getFacingTypeIdByName([propertyInfo.facing!]))
                    ?.first
                : null
            ..schemeTypeId = propertyInfo.schemeType != null
                ? (await _isarService
                        .getSchemeTypeIdByName([propertyInfo.schemeType!]))
                    ?.first
                : null
            ..connectedRoads = propertyInfo.connectedRoad
            ..constructionTypeId = propertyInfo.constructionType != null
                ? (await _isarService.getConstructionTypeIdByName(
                        [propertyInfo.constructionType!]))
                    ?.first
                : null
            ..bhkId = propertyInfo.bhk != null
                ? (await _isarService.getBhkTypeIdByName([propertyInfo.bhk!]))
                    ?.first
                : null
            ..balcony = propertyInfo.balcony
            ..isCornerPiece = propertyInfo.cornerPiece
            ..lightConnection = propertyInfo.lightConnection
            ..isWellAvailable = propertyInfo.wellAvailable
            ..isParkingAvailable = propertyInfo.parkingAvailable
            ..isLiftAvailable = propertyInfo.liftAvailable
            ..isAllottedParking = propertyInfo.allottedParking
            ..isWashRoomAvailable = propertyInfo.washRoomAvailable
            ..exchangeAllowed = propertyInfo.exchangeAllowed ?? false
            ..negotiationAllowed = propertyInfo.negotiationAllowed ?? false
            ..comments = propertyInfo.note
            ..brokerChain = propertyInfo.brokerChain
            ..priceUnitId =
                await _isarService.getPriceUnitIdByName(propertyInfo.priceUnit)
            ..priceUnitValue = propertyInfo.priceUnit
            ..propertyAreaSize = propertyInfo.areaSize
            ..propertyAreaUnitId = await _isarService
                .getPropertyAreaUnitIdByName(propertyInfo.areaUnit)
            ..propertyAreaUnitValue = propertyInfo.areaUnit
            ..propertySellPricePerArea = (propertyInfo.sellPriceBySize !=
                        null &&
                    propertyInfo.sellPriceBySize!.toString().trim().isNotEmpty)
                ? double.parse(propertyInfo.sellPriceBySize.toString())
                : null
            ..propertyRentPricePerArea = (propertyInfo.rentPriceBySize !=
                        null &&
                    propertyInfo.rentPriceBySize!.toString().trim().isNotEmpty)
                ? double.parse(propertyInfo.rentPriceBySize.toString())
                : null
            ..propertyLeasePricePerArea = (propertyInfo.leasePriceBySize !=
                        null &&
                    propertyInfo.leasePriceBySize!.toString().trim().isNotEmpty)
                ? double.parse(propertyInfo.leasePriceBySize.toString())
                : null
            ..propertyPricePerAreaUnitId =
                await _isarService.getPriceUnitIdByName(
              propertyInfo.priceBySizeUnit,
            )
            ..propertyPricePerAreaUnitValue = propertyInfo.priceBySizeUnit
            ..publicAddressLandMark = propertyInfo.publicLocation
            ..publicArea = propertyInfo.publicLocation
            ..publicLatitude = propertyInfo.publicLatitude
            ..publicLongitude = propertyInfo.publicLongitude
            ..isPublicProperty = true
            ..sharedByBrooon = true
            ..brooonId = propertyInfo.brooonInfo?.brooonId
            ..brooonCode = propertyInfo.brooonInfo?.brooonCode
            ..brooonName =
                '${propertyInfo.brooonInfo?.firstName} ${propertyInfo.brooonInfo?.lastName}'
            ..brooonPhone = propertyInfo.brooonInfo?.mobileNumber
            ..brooonPhoto = propertyInfo.brooonInfo?.brooonPhoto
            ..associationId =
                propertyInfo.brooonInfo?.associationInfo?.associationId
            ..associationCode =
                propertyInfo.brooonInfo?.associationInfo?.associationCode
            ..associationPhoto =
                propertyInfo.brooonInfo?.associationInfo?.associationPhoto;

          // Not storing property in db so don't required **id**
          /*int? pId = null;
          if (propertyInfo.propertyId != null) {
            final brooonProperty = await _isarService.getPropertyByPropertyId(
              propertyInfo.propertyId!,
            );
            if (brooonProperty != null) {
              pId = brooonProperty.id;
              property.id = pId;
            }
          }*/
          _brooonProperties.add(property);
        }
        // if (page == AppConfig.paginationInitialPage) {
        for (int k = 0; k < _brooonProperties.length; k++) {
          /*if (sharedByBrooonersProperties.length <
                AppConfig.showMaxSharedByPropertiesInDashBoard) {
            }*/
          sharedByBrooonersProperties.add(_brooonProperties[k]);
        }
        notifyListeners();
        // }
        // Don't store public property in db
        // await _isarService.saveProperties(_brooonProperties);
        return _brooonProperties;
      }
    }
    return null;
  }

  Future<List<DbSavedFilter>?> _handleBrooonInquiries(
    SharedByBrooonInquiryResponseEntity? response,
    int page,
    AppLocalizations? localizationsContext,
  ) async {
    await _isarService.saveBrooonInquiriesCount(
      DbBrooonPaginationCountSchema()
        ..totalItemsCount = response?.data?.totalInquiries ?? 0
        ..totalPages = response?.data?.totalPages ?? 0
        ..nextPage = response?.data?.nextPage ?? 0
        ..currentPage = response?.data?.currentPage ?? 0,
    );
    if (response?.data != null) {
      // NOW DON'T NEED TO REMOVE from db as we are not going to save any public properties in db
      /*
      // remove all brooon properties from local db for pull to refresh only
      if (isFromPullToRefresh) {
        await _isarService.deleteSharedByBrooonersProperties();
      }*/
      if (page == AppConfig.paginationInitialPage) {
        sharedByBrooonersInquiries.clear();
      }
      if (response?.data?.inquiries != null &&
          response!.data!.inquiries!.isNotEmpty) {
        List<DbSavedFilter> _brooonInquiries = [];
        for (int i = 0; i < response.data!.inquiries!.length; i++) {
          final inquiryInfo = response.data!.inquiries![i];
          List<int> propertyForIds = [];
          if (inquiryInfo.xFor != null && inquiryInfo.xFor!.isNotEmpty) {
            for (int j = 0; j < inquiryInfo.xFor!.length; j++) {
              final propertyFor = inquiryInfo.xFor![j];
              propertyForIds.add(
                await _isarService.getPropertyForIdByName(
                  propertyFor == localizationsContext!.buy
                      ? localizationsContext.sell
                      : propertyFor,
                ),
              );
            }
          }

          DbSavedFilter inquiry = DbSavedFilter()
            ..inquiryId = inquiryInfo.inquiryId
            ..isSyncedWithServer = true
            ..isFromBuyer = true
            ..userId = StaticFunctions.userId
            ..filterName = inquiryInfo.name ?? ''
            ..propertyType = [
              await _isarService.getPropertyTypeIdByName(
                inquiryInfo.type,
              )
            ]
            ..propertyTypeValues = [inquiryInfo.type ?? '']
            ..propertyFor = propertyForIds
            ..propertyForValues = inquiryInfo.xFor
            ..inquiryStatusId = await _isarService.getPropertyStatusIdByName(
              inquiryInfo.inquiryStatus,
            )
            ..inquiryStatusValue = inquiryInfo.inquiryStatus ?? ''
            ..inquirySoldStatusId = inquiryInfo.inquirySoldStatusId ??
                SaveDefaultData.unSoldStatusId
            ..closeDealId = inquiryInfo.closeDealId
            ..addedAt = DateTime.fromMillisecondsSinceEpoch(
              inquiryInfo.createdAt ?? 0,
            )
            ..updatedAt = DateTime.fromMillisecondsSinceEpoch(
              inquiryInfo.updatedAt ?? 0,
            )
            ..furnishedType = await _isarService.getFurnishedStatusIdByName(
              inquiryInfo.propertyFurnishedType,
            )
            ..roomCount = inquiryInfo.room
            ..bathroomCount = inquiryInfo.bathRoom
            ..floorCount = inquiryInfo.floor
            ..totalFloorCount = inquiryInfo.totalFloor
            ..sellPriceRangeMin = checkForValidPrice(inquiryInfo.buyMinPrice)
                ? double.parse(inquiryInfo.buyMinPrice!.toString())
                : null
            ..sellPriceRangeMax = checkForValidPrice(inquiryInfo.buyMaxPrice)
                ? double.parse(inquiryInfo.buyMaxPrice!.toString())
                : null
            ..sellMinPriceUnit = inquiryInfo.buyMinPriceUnitId != null
                ? inquiryInfo.buyMinPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..sellMaxPriceUnit = inquiryInfo.buyMaxPriceUnitId != null
                ? inquiryInfo.buyMaxPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..rentPriceRangeMin = checkForValidPrice(inquiryInfo.rentMinPrice)
                ? double.parse(inquiryInfo.rentMinPrice!.toString())
                : null
            ..rentPriceRangeMax = checkForValidPrice(inquiryInfo.rentMaxPrice)
                ? double.parse(inquiryInfo.rentMaxPrice!.toString())
                : null
            ..rentMinPriceUnit = inquiryInfo.rentMinPriceUnitId != null
                ? inquiryInfo.rentMinPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..rentMaxPriceUnit = inquiryInfo.rentMaxPriceUnitId != null
                ? inquiryInfo.rentMaxPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..leasePriceRangeMin = checkForValidPrice(inquiryInfo.leaseMinPrice)
                ? double.parse(inquiryInfo.leaseMinPrice!.toString())
                : null
            ..leasePriceRangeMax = checkForValidPrice(inquiryInfo.leaseMaxPrice)
                ? double.parse(inquiryInfo.leaseMaxPrice!.toString())
                : null
            ..leaseMinPriceUnit = inquiryInfo.leaseMinPriceUnitId != null
                ? inquiryInfo.leaseMinPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..leaseMaxPriceUnit = inquiryInfo.leaseMaxPriceUnitId != null
                ? inquiryInfo.leaseMaxPriceUnitId!
                : SaveDefaultData.filterPriceUnitThousand
            ..frontSize = inquiryInfo.frontSize
            ..depthSize = inquiryInfo.depthSize
            ..additionalFurnish = inquiryInfo.additionalFurnishing
            ..selectedAmenities = inquiryInfo.amenities
            ..preferredCaste = inquiryInfo.preferredCaste
            ..buildingType = await _isarService
                .getBuildingTypeIdByName(inquiryInfo.buildingType)
            ..facingType =
                await _isarService.getFacingTypeIdByName(inquiryInfo.facing)
            ..schemeType =
                await _isarService.getSchemeTypeIdByName(inquiryInfo.schemeType)
            ..connectedRoads = inquiryInfo.connectedRoad
            ..constructionType = await _isarService
                .getConstructionTypeIdByName(inquiryInfo.constructionType)
            ..bhkIds = await _isarService.getBhkTypeIdByName(inquiryInfo.bhk)
            ..isBalconyAvailable = inquiryInfo.balcony
            ..isCornerPiece = inquiryInfo.cornerPiece
            ..isLightConnectionAvailable = inquiryInfo.lightConnection
            ..isWellAvailable = inquiryInfo.wellAvailable
            ..isParkingAvailable = inquiryInfo.parkingAvailable
            ..isLiftAvailable = inquiryInfo.liftAvailable
            ..isAllottedParkingAvailable = inquiryInfo.allottedParking
            ..isWashroomAvailable = inquiryInfo.washRoomAvailable
            ..isNegotiable = inquiryInfo.negotiationAllowed ?? false
            ..notes = inquiryInfo.note
            ..minMeasure = inquiryInfo.minAreaSize
            ..maxMeasure = inquiryInfo.maxAreaSize
            ..measureUnit = await _isarService
                .getPropertyAreaUnitIdByName(inquiryInfo.areaUnit)
            ..measureUnitValue = inquiryInfo.areaUnit
            ..sellMinPricePerSize = (inquiryInfo.buyMinPriceBySize != null &&
                    inquiryInfo.buyMinPriceBySize!.toString().trim().isNotEmpty)
                ? double.tryParse(inquiryInfo.buyMinPriceBySize.toString())
                : null
            ..sellMaxPricePerSize = (inquiryInfo.buyMaxPriceBySize != null &&
                    inquiryInfo.buyMaxPriceBySize!.toString().trim().isNotEmpty)
                ? double.tryParse(inquiryInfo.buyMaxPriceBySize.toString())
                : null
            ..rentMinPricePerSize = (inquiryInfo.rentMinPriceBySize != null &&
                    inquiryInfo.rentMinPriceBySize!
                        .toString()
                        .trim()
                        .isNotEmpty)
                ? double.tryParse(inquiryInfo.rentMinPriceBySize.toString())
                : null
            ..rentMaxPricePerSize = (inquiryInfo.rentMaxPriceBySize != null &&
                    inquiryInfo.rentMaxPriceBySize!
                        .toString()
                        .trim()
                        .isNotEmpty)
                ? double.tryParse(inquiryInfo.rentMaxPriceBySize.toString())
                : null
            ..leaseMinPricePerSize = (inquiryInfo.leaseMinPriceBySize != null &&
                    inquiryInfo.leaseMinPriceBySize!
                        .toString()
                        .trim()
                        .isNotEmpty)
                ? double.tryParse(inquiryInfo.leaseMinPriceBySize.toString())
                : null
            ..leaseMaxPricePerSize = (inquiryInfo.leaseMaxPriceBySize != null &&
                    inquiryInfo.leaseMaxPriceBySize!
                        .toString()
                        .trim()
                        .isNotEmpty)
                ? double.tryParse(inquiryInfo.leaseMaxPriceBySize.toString())
                : null
            ..area = inquiryInfo.mapLocation
            ..location = inquiryInfo.typedLocation
            ..latitude = inquiryInfo.latitude
            ..longitude = inquiryInfo.longitude
            ..isPublicInquiry = true
            ..sharedByBrooon = true
            ..brooonId = inquiryInfo.brooonInfo?.brooonId
            ..brooonCode = inquiryInfo.brooonInfo?.brooonCode
            ..brooonName =
                '${inquiryInfo.brooonInfo?.firstName} ${inquiryInfo.brooonInfo?.lastName}'
            ..brooonPhone = inquiryInfo.brooonInfo?.mobileNumber
            ..brooonPhoto = inquiryInfo.brooonInfo?.brooonPhoto
            ..associationId =
                inquiryInfo.brooonInfo?.associationInfo?.associationId
            ..associationCode =
                inquiryInfo.brooonInfo?.associationInfo?.associationCode
            ..associationPhoto =
                inquiryInfo.brooonInfo?.associationInfo?.associationPhoto;

          // Not storing inquiry in db so don't required **id**
          /*int? iId = null;
          if (inquiryInfo.inquiryId != null) {
            final brooonInquiry = await _isarService.getInquiryByInquiryId(
              inquiryInfo.inquiryId!,
            );
            if (brooonInquiry != null) {
              iId = brooonInquiry.id;
              inquiry.id = iId;
            }
          }*/
          _brooonInquiries.add(inquiry);
        }
        // if (page == AppConfig.paginationInitialPage) {
        for (int k = 0; k < _brooonInquiries.length; k++) {
          /*if (sharedByBrooonersProperties.length <
                AppConfig.showMaxSharedByPropertiesInDashBoard) {
            }*/
          sharedByBrooonersInquiries.add(_brooonInquiries[k]);
        }
        notifyListeners();
        // }
        // Don't store public property in db
        // await _isarService.saveProperties(_brooonInquiries);
        return _brooonInquiries;
      }
    }
    return null;
  }

  static bool checkForValidPrice(double? price) {
    return price != null && price != 0 && price.toString().trim().isNotEmpty;
  }

  updateSharedByBrooonItemSize(Size updatedSize) {
    homeSharedByBrooonItemSize = updatedSize;
    notifyListeners();
  }

  static bool isNotPlotOrLandMark(List<int?> selectedPropertyTypeId) {
    return (!selectedPropertyTypeId.contains(null)) &&
        selectedPropertyTypeId.any((id) =>
            id == SaveDefaultData.propertyTypeBungalowId ||
            id == SaveDefaultData.propertyTypeShowRoomId ||
            id == SaveDefaultData.propertyTypeOfficeId ||
            id == SaveDefaultData.propertyTypeFlatId);
  }

  static bool checkForFloor(List<int?> selectedPropertyTypeId) {
    return (isNotPlotOrLandMark(selectedPropertyTypeId) &&
        selectedPropertyTypeId.any((id) =>
            id == SaveDefaultData.propertyTypeOfficeId ||
            id == SaveDefaultData.propertyTypeShowRoomId ||
            id == SaveDefaultData.propertyTypeFlatId));
  }

  static bool checkForTotalFloor(List<int?> selectedPropertyTypeId) {
    return (isNotPlotOrLandMark(selectedPropertyTypeId) &&
        selectedPropertyTypeId.any((id) =>
            id == SaveDefaultData.propertyTypeOfficeId ||
            id == SaveDefaultData.propertyTypeShowRoomId ||
            id == SaveDefaultData.propertyTypeFlatId));
  }

  static bool checkForBathRoom(List<int?> selectedPropertyTypeId) {
    return (isNotPlotOrLandMark(selectedPropertyTypeId) &&
        selectedPropertyTypeId.any((id) =>
            id == SaveDefaultData.propertyTypeBungalowId ||
            id == SaveDefaultData.propertyTypeFlatId));
  }

  static bool checkForRoom(List<int?> selectedPropertyTypeId) {
    if (AppConfig.enableRoomForBungalows) {
      return selectedPropertyTypeId
          .contains(SaveDefaultData.propertyTypeBungalowId);
    }
    return false;
  }

  static bool checkForConnectedRoad(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.contains(SaveDefaultData.propertyTypePlotId);
  }

  static bool checkForScheme(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId
        .contains(SaveDefaultData.propertyTypeAgricultureLandId);
  }

  static bool checkForConstruction(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.any((id) =>
        id == SaveDefaultData.propertyTypeBungalowId ||
        id == SaveDefaultData.propertyTypeFlatId ||
        id == SaveDefaultData.propertyTypeOfficeId ||
        id == SaveDefaultData.propertyTypeShowRoomId);
  }

  static bool checkForBhk(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.any((id) =>
        id == SaveDefaultData.propertyTypeBungalowId ||
        id == SaveDefaultData.propertyTypeFlatId);
  }

  static bool checkForFrontDepthSize(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId
        .contains(SaveDefaultData.propertyTypeBungalowId);
  }

  static bool checkForBuildingType(List<int?> selectedPropertyTypeId) {
    return (selectedPropertyTypeId.any((element) =>
        element == SaveDefaultData.propertyTypePlotId ||
        element == SaveDefaultData.propertyTypeAgricultureLandId ||
        element == SaveDefaultData.propertyTypeBungalowId));
  }

  static bool checkForFacingType(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.any((id) =>
        id == SaveDefaultData.propertyTypePlotId ||
        id == SaveDefaultData.propertyTypeBungalowId);
  }

  static bool checkForCornerPiece(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.any((id) =>
        id == SaveDefaultData.propertyTypePlotId ||
        id == SaveDefaultData.propertyTypeBungalowId);
  }

  static bool checkForLightConnection(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId
        .contains(SaveDefaultData.propertyTypeAgricultureLandId);
  }

  static bool checkForParkingAvailable(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.any((id) =>
        id == SaveDefaultData.propertyTypeShowRoomId ||
        id == SaveDefaultData.propertyTypeBungalowId);
  }

  static bool checkForAllottedParkingAvailable(
      List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.any((id) =>
        id == SaveDefaultData.propertyTypeOfficeId ||
        id == SaveDefaultData.propertyTypeFlatId);
  }

  static bool checkForWashRoomAvailable(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.any((id) =>
        id == SaveDefaultData.propertyTypeOfficeId ||
        id == SaveDefaultData.propertyTypeShowRoomId);
  }

  static bool checkForLiftAvailable(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId.contains(SaveDefaultData.propertyTypeFlatId);
  }

  static bool checkForWellAvailable(List<int?> selectedPropertyTypeId) {
    return selectedPropertyTypeId
        .contains(SaveDefaultData.propertyTypeAgricultureLandId);
  }

  Future<List<String>?> getAmenities(List<int>? amenitiesIds) async {
    final list = await _getPropertyAmenities(
      amenitiesIds,
    );
    if (list != null && list.isNotEmpty) {
      List<String> amenities = [];
      for (var value in list) {
        amenities.add(value.name);
      }
      return amenities;
    }
    return null;
  }

  Future<List<String>?> getPreferredCaste(List<int>? casteIds) async {
    final list = await _getPropertyPreferredCaste(
      casteIds,
    );
    if (list != null && list.isNotEmpty) {
      List<String> caste = [];
      for (var value in list) {
        caste.add(value.name);
      }
      return caste;
    }
    return null;
  }

  static Future<List<DbSavedFilter>> getMatchingInquiriesFromProperty({
    required DbProperty propertyInfo,
  }) async {
    if (propertyInfo.propertySoldStatusId != SaveDefaultData.soldStatusId) {
      dynamic propertyRelatedInquiries =
          await IsarService().getInquiriesByProperty(
        propertyInfo,
        excludeUnmatched: true,
      );
      if (propertyRelatedInquiries is List<DbSavedFilter> &&
          propertyRelatedInquiries.isNotEmpty) {
        propertyRelatedInquiries =
            LocationFilterHelper.applyLocationFilterForInquiresIfRequired(
          typedLocation: propertyInfo.addressLandMark,
          latitude: propertyInfo.latitude,
          longitude: propertyInfo.longitude,
          filteredList: propertyRelatedInquiries,
        );
      }
      return propertyRelatedInquiries;
    } else {
      return [];
    }
  }

  static Future<List<BuyerSellerInfo>>
      getAllSellerWithPropertiesAndMatchingInquiries() async {
    final _isarService = IsarService();
    final List<BuyerSellerInfo> sellerList = [];
    final properties = AppConfig.showSellerListWithClosedProperties
        ? await _isarService.getAllSellers()
        : await _isarService.getUnsoldProperties();
    if (properties.isNotEmpty) {
      await Future.forEach(
        properties,
        (propertyInfo) async {
          if (propertyInfo.sellerName != null &&
              propertyInfo.sellerName!.trim().isNotEmpty) {
            final sellerItem = BuyerSellerInfo(
              propertyId: null,
              name: propertyInfo.sellerName?.trim(),
              phone: propertyInfo.sellerPhoneNo?.trim(),
              buyerSellerType: BuyerSellerType.sellers,
              properties: [propertyInfo],
            );

            List<DbSavedFilter> propertyRelatedInquiries = [];
            // Don't find matching inquiries for sold properties
            /*if (propertyInfo.propertySoldStatusId !=
                SaveDefaultData.soldStatusId) {*/
            propertyRelatedInquiries = await getMatchingInquiriesFromProperty(
              propertyInfo: propertyInfo,
            );
            // }
            if (!sellerList.contains(sellerItem)) {
              sellerItem.propertyCount = 1;
              sellerItem.inquiryCount = propertyRelatedInquiries.length;
              sellerItem.inquiries = propertyRelatedInquiries;
              sellerList.add(sellerItem);
            } else {
              final sellerIndexToIncreaseCount = sellerList.indexOf(sellerItem);
              final inquiriesToInclude =
                  List<DbSavedFilter>.from(propertyRelatedInquiries);
              if (sellerList[sellerIndexToIncreaseCount].inquiries != null &&
                  sellerList[sellerIndexToIncreaseCount]
                      .inquiries!
                      .isNotEmpty) {
                inquiriesToInclude.clear();
                await Future.forEach(
                  propertyRelatedInquiries,
                  (element) {
                    if (!sellerList[sellerIndexToIncreaseCount]
                        .inquiries!
                        .contains(element)) {
                      inquiriesToInclude.add(element);
                    }
                  },
                );
                sellerList[sellerIndexToIncreaseCount]
                    .inquiries!
                    .addAll(inquiriesToInclude);
                sellerList[sellerIndexToIncreaseCount].inquiryCount =
                    sellerList[sellerIndexToIncreaseCount].inquiries!.length;
              } else if (inquiriesToInclude.isNotEmpty) {
                sellerList[sellerIndexToIncreaseCount].inquiries =
                    inquiriesToInclude;
                sellerList[sellerIndexToIncreaseCount].inquiryCount =
                    inquiriesToInclude.length;
              }

              if (sellerList[sellerIndexToIncreaseCount].properties == null ||
                  !sellerList[sellerIndexToIncreaseCount]
                      .properties!
                      .contains(propertyInfo)) {
                if (sellerList[sellerIndexToIncreaseCount].properties == null) {
                  sellerList[sellerIndexToIncreaseCount].properties = [
                    propertyInfo
                  ];
                } else {
                  sellerList[sellerIndexToIncreaseCount]
                      .properties!
                      .add(propertyInfo);
                }
                sellerList[sellerIndexToIncreaseCount].propertyCount += 1;
              }
            }
          }
        },
      );
    }
    if (sellerList.isNotEmpty) {
      return sortingListForMatchingInquiries(sellerList);
    }
    return sellerList;
  }

  static Future<List<BuyerSellerInfo>> getAllSellerWithProperties() async {
    final _isarService = IsarService();
    final List<BuyerSellerInfo> sellerList = [];
    final properties = await _isarService.getAllSellers();
    if (properties.isNotEmpty) {
      await Future.forEach(
        properties,
        (propertyInfo) async {
          if (propertyInfo.sellerName != null &&
              propertyInfo.sellerName!.trim().isNotEmpty) {
            final sellerItem = BuyerSellerInfo(
              propertyId: null,
              name: propertyInfo.sellerName?.trim(),
              phone: propertyInfo.sellerPhoneNo?.trim(),
              buyerSellerType: BuyerSellerType.sellers,
              properties: [propertyInfo],
            );

            // To remove duplicate records - checking for contains condition
            if (!sellerList.contains(sellerItem)) {
              sellerList.add(sellerItem);
            } else {
              // Added properties list to get all properties of sellers
              final sellerIndexToIncreaseCount = sellerList.indexOf(sellerItem);
              if (sellerList[sellerIndexToIncreaseCount].properties == null ||
                  !sellerList[sellerIndexToIncreaseCount]
                      .properties!
                      .contains(propertyInfo)) {
                if (sellerList[sellerIndexToIncreaseCount].properties == null) {
                  sellerList[sellerIndexToIncreaseCount].properties = [
                    propertyInfo
                  ];
                } else {
                  sellerList[sellerIndexToIncreaseCount]
                      .properties!
                      .add(propertyInfo);
                }
                sellerList[sellerIndexToIncreaseCount].propertyCount += 1;
              }
            }
          }
        },
      );
    }
    return sellerList;
  }

  static Future<List<DbProperty>> getMatchingPropertiesFromInquiry({
    required DbSavedFilter inquiry,
    BuyerSellerInfo? buyerItem,
    required ViewAllFromType viewAllType,
  }) async {
    if (inquiry.inquirySoldStatusId != SaveDefaultData.soldStatusId) {
      dynamic inquiryRelatedProperties =
          await IsarService().getFilteredProperties(
        filterToApply: inquiry,
        type: viewAllType,
        buyerSellerInfo: buyerItem,
        excludeUnmatched: true,
      );

      if (inquiryRelatedProperties is List<DbProperty> &&
          inquiryRelatedProperties.isNotEmpty) {
        inquiryRelatedProperties =
            LocationFilterHelper.applyLocationFilterForPropertiesIfRequired(
          typedLocation: inquiry.location,
          latitude: inquiry.latitude,
          longitude: inquiry.longitude,
          filteredList: inquiryRelatedProperties,
        );
      }
      return inquiryRelatedProperties;
    } else {
      return [];
    }
  }

  static Future<List<BuyerSellerInfo>>
      getAllBuyersWithInquiriesAndMatchingProperties() async {
    final _isarService = IsarService();
    final List<BuyerSellerInfo> buyerList = [];
    final allSavedFilters = AppConfig.showBuyerListWithClosedInquiries
        ? await _isarService.getAllBuyers()
        : await _isarService.getUnsoldBuyers();

    if (allSavedFilters.isNotEmpty) {
      await Future.forEach(
        allSavedFilters,
        (inquiry) async {
          if (inquiry.buyerName.trim().isNotEmpty) {
            final buyerItem = BuyerSellerInfo(
              propertyId: null,
              name: inquiry.buyerName.trim(),
              phone: inquiry.mobileNo.trim(),
              inquiries: [inquiry],
              buyerSellerType: BuyerSellerType.buyers,
            );

            // Don't find matching properties for sold inquiries
            List<DbProperty> inquiryRelatedProperties = [];
            // if (inquiry.inquirySoldStatusId != SaveDefaultData.soldStatusId) {
            inquiryRelatedProperties = await getMatchingPropertiesFromInquiry(
              inquiry: inquiry,
              buyerItem: buyerItem,
              viewAllType: ViewAllFromType.buyers,
            );
            // }

            if (!buyerList.contains(buyerItem)) {
              //add buyer to list with base counts, if buyer does not exist in list.
              buyerItem.inquiryCount = 1;
              buyerItem.properties = inquiryRelatedProperties;
              buyerItem.propertyCount = inquiryRelatedProperties.length;
              buyerList.add(buyerItem);
            } else {
              //Increment counts only if buyer already exist in list.
              final buyerIndexToIncreaseCount = buyerList.indexOf(buyerItem);
              if (buyerList[buyerIndexToIncreaseCount].inquiries == null ||
                  !buyerList[buyerIndexToIncreaseCount]
                      .inquiries!
                      .contains(inquiry)) {
                if (buyerList[buyerIndexToIncreaseCount].inquiries == null) {
                  buyerList[buyerIndexToIncreaseCount].inquiries = [inquiry];
                } else {
                  buyerList[buyerIndexToIncreaseCount].inquiries!.add(inquiry);
                }
                buyerList[buyerIndexToIncreaseCount].inquiryCount += 1;
              }

              final propertiesToInclude =
                  List<DbProperty>.from(inquiryRelatedProperties);
              if (buyerList[buyerIndexToIncreaseCount].properties != null &&
                  buyerList[buyerIndexToIncreaseCount].properties!.isNotEmpty) {
                propertiesToInclude.clear();
                await Future.forEach(
                  inquiryRelatedProperties,
                  (element) {
                    if (!buyerList[buyerIndexToIncreaseCount]
                        .properties!
                        .contains(element)) {
                      propertiesToInclude.add(element);
                    }
                  },
                );
                buyerList[buyerIndexToIncreaseCount]
                    .properties!
                    .addAll(propertiesToInclude);
                buyerList[buyerIndexToIncreaseCount].propertyCount =
                    buyerList[buyerIndexToIncreaseCount].properties!.length;
              } else if (propertiesToInclude.isNotEmpty) {
                buyerList[buyerIndexToIncreaseCount].properties =
                    propertiesToInclude;
                buyerList[buyerIndexToIncreaseCount].propertyCount =
                    propertiesToInclude.length;
              }
            }
          }
        },
      );
    }
    if (buyerList.isNotEmpty) {
      return sortingListForMatchingProperties(buyerList);
    }
    return buyerList;
  }

  static Future<List<BuyerSellerInfo>> getAllBuyersWithInquiries() async {
    final _isarService = IsarService();
    final List<BuyerSellerInfo> buyerList = [];
    final allSavedFilters = await _isarService.getAllBuyers();
    if (allSavedFilters.isNotEmpty) {
      await Future.forEach(
        allSavedFilters,
        (inquiry) async {
          if (inquiry.buyerName.trim().isNotEmpty) {
            final buyerItem = BuyerSellerInfo(
              propertyId: null,
              name: inquiry.buyerName.trim(),
              phone: inquiry.mobileNo.trim(),
              inquiries: [inquiry],
              buyerSellerType: BuyerSellerType.buyers,
            );
            // To remove duplicate records - checking for contains condition
            if (!buyerList.contains(buyerItem)) {
              buyerList.add(buyerItem);
            } else {
              // Added inquiries list to get all inquiries of buyers
              final buyerIndexToIncreaseCount = buyerList.indexOf(buyerItem);
              if (buyerList[buyerIndexToIncreaseCount].inquiries == null ||
                  !buyerList[buyerIndexToIncreaseCount]
                      .inquiries!
                      .contains(inquiry)) {
                if (buyerList[buyerIndexToIncreaseCount].inquiries == null) {
                  buyerList[buyerIndexToIncreaseCount].inquiries = [inquiry];
                } else {
                  buyerList[buyerIndexToIncreaseCount].inquiries!.add(inquiry);
                }
                buyerList[buyerIndexToIncreaseCount].inquiryCount += 1;
              }
            }
          }
        },
      );
    }
    return buyerList;
  }

  static List<BuyerSellerInfo> sortingListForMatchingInquiries(
    List<BuyerSellerInfo> list,
  ) {
    // matching / un matching count -> sort by count and then alphabetic order
    final matchingInquiries =
        list.where((element) => element.inquiryCount > 0).toList();
    final unMatchingInquiries =
        list.where((element) => element.inquiryCount == 0).toList();
    matchingInquiries.sort(
      (a, b) => (a.inquiryCount).compareTo(b.inquiryCount),
    );
    unMatchingInquiries.sort(
      (a, b) => (a.inquiryCount).compareTo(b.inquiryCount),
    );
    matchingInquiries.sort(
      (a, b) => a.name!.toLowerCase().compareTo(
            b.name!.toLowerCase(),
          ),
    );
    unMatchingInquiries.sort(
      (a, b) => a.name!.toLowerCase().compareTo(
            b.name!.toLowerCase(),
          ),
    );
    return {...matchingInquiries, ...unMatchingInquiries}.toList();
  }

  static List<BuyerSellerInfo> sortingListForMatchingProperties(
    List<BuyerSellerInfo> list,
  ) {
    // matching / un matching count -> sort by count and then alphabetic order
    final matchingProperties =
        list.where((element) => element.propertyCount > 0).toList();
    final unMatchingProperties =
        list.where((element) => element.propertyCount == 0).toList();
    matchingProperties.sort(
      (a, b) => (a.propertyCount).compareTo(b.propertyCount),
    );
    unMatchingProperties.sort(
      (a, b) => (a.propertyCount).compareTo(b.propertyCount),
    );
    matchingProperties.sort(
      (a, b) => a.name!.toLowerCase().compareTo(
            b.name!.toLowerCase(),
          ),
    );
    unMatchingProperties.sort(
      (a, b) => a.name!.toLowerCase().compareTo(
            b.name!.toLowerCase(),
          ),
    );
    return {...matchingProperties, ...unMatchingProperties}.toList();
  }

  addDummyBrooonProperties(AppLocalizations localizationsContext) async {
    final dummyProperty = DbProperty()
      ..propertyId = 'PABCD000001'
      ..propertyTypeId = SaveDefaultData.propertyTypeBungalowId
      ..propertyTypeValue = localizationsContext.propertyTypeBungalow
      ..propertyForIds = [
        SaveDefaultData.propertyForSellId,
        SaveDefaultData.propertyForRentId,
        SaveDefaultData.propertyForLeaseId
      ]
      ..propertyForValues = [
        localizationsContext.sell,
        localizationsContext.rent,
        localizationsContext.lease,
      ]
      ..propertyName = ''
      ..propertyStatusId = SaveDefaultData.activeStatusId
      ..propertyStatusValue = localizationsContext.active
      ..propertySoldStatusId = SaveDefaultData.unSoldStatusId
      ..propertyAreaSize = 100
      ..propertyAreaUnitValue = localizationsContext.sqft
      ..propertyAreaUnitId = SaveDefaultData.areaUnitSqFtId
      ..minSellPrice = 10
      ..maxSellPrice = 15
      ..minSellPriceUnit = 2
      ..maxSellPriceUnit = 2
      ..minRentPrice = 10
      ..maxRentPrice = 15
      ..minRentPriceUnit = 1
      ..maxRentPriceUnit = 1
      ..minLeasePrice = 10
      ..maxLeasePrice = 15
      ..minLeasePriceUnit = 1
      ..maxLeasePriceUnit = 1
      ..brooonName = 'Brooon User'
      ..brooonPhone = '0000000000'
      ..addedAt = DateTime.now()
      ..updatedAt = DateTime.now();
    sharedByBrooonersProperties.add(dummyProperty);
    sharedByBrooonersProperties.add(dummyProperty);
  }

  addDummyBrooonInquiries(AppLocalizations localizationsContext) async {
    final dummyInquiry = DbSavedFilter()
      ..inquiryId = 'IABCD000001'
      ..propertyType = [SaveDefaultData.propertyTypeBungalowId]
      ..propertyTypeValues = [localizationsContext.propertyTypeBungalow]
      ..propertyFor = [
        SaveDefaultData.propertyForSellId,
        SaveDefaultData.propertyForRentId,
        SaveDefaultData.propertyForLeaseId
      ]
      ..propertyForValues = [
        localizationsContext.sell,
        localizationsContext.rent,
        localizationsContext.lease,
      ]
      ..inquiryStatusId = SaveDefaultData.activeStatusId
      ..inquiryStatusValue = localizationsContext.active
      ..inquirySoldStatusId = SaveDefaultData.unSoldStatusId
      ..minMeasure = 100
      ..maxMeasure = 100
      ..measureUnitValue = localizationsContext.sqft
      ..measureUnit = SaveDefaultData.areaUnitSqFtId
      ..brooonName = 'Brooon User'
      ..brooonPhone = '0000000000'
      ..addedAt = DateTime.now()
      ..updatedAt = DateTime.now();
    sharedByBrooonersInquiries.add(dummyInquiry);
    sharedByBrooonersInquiries.add(dummyInquiry);
  }

  static isPropertyEditAvailable(DbProperty? selectedProperty) {
    return selectedProperty?.sharedByBrooon == false &&
        selectedProperty?.propertySoldStatusId ==
            SaveDefaultData.unSoldStatusId;
  }

  static isInquiryEditAvailable(DbSavedFilter? selectedInquiry) {
    return selectedInquiry?.sharedByBrooon == false &&
        selectedInquiry?.inquirySoldStatusId == SaveDefaultData.unSoldStatusId;
  }

  static Future<MapEntry<int, int>> getInquiryCountOfPropertyWith(
    int propertyType,
  ) async {
    final _isarService = IsarService();
    final propertiesOfPropertyType =
        await _isarService.getPropertiesCountByType(
      propertyType,
      returnPropertyAlso: true,
    );
    int matchingInquiryCount = 0;
    if (AppConfig.shouldShowMatchingWithDashboardCount) {
      await Future.forEach(
        propertiesOfPropertyType as List<DbProperty>,
        (element) async {
          final propertyRelatedInquiries =
              await getMatchingInquiriesFromProperty(
            propertyInfo: element,
          );

          if (propertyRelatedInquiries.length > 0) {
            matchingInquiryCount += 1;
          }
        },
      );
    }
    return MapEntry(
      propertiesOfPropertyType.length,
      matchingInquiryCount,
    );
  }

  static Future<MapEntry<int, int>> getPropertyCountOfInquiryWith(
    int propertyType,
  ) async {
    final _isarService = IsarService();
    final inquiriesOfPropertyType = await _isarService.getInquiriesCountByType(
      propertyType,
      returnInquiryAlso: true,
    );
    int matchingPropertyCount = 0;
    if (AppConfig.shouldShowMatchingWithDashboardCount) {
      await Future.forEach(
        inquiriesOfPropertyType as List<DbSavedFilter>,
        (element) async {
          final inquiryRelatedProperties =
              await getMatchingPropertiesFromInquiry(
            inquiry: element,
            viewAllType: ViewAllFromType.properties,
          );
          if (inquiryRelatedProperties.length > 0) {
            matchingPropertyCount += 1;
          }
        },
      );
    }
    return MapEntry(
      inquiriesOfPropertyType.length,
      matchingPropertyCount,
    );
  }

  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }
}
