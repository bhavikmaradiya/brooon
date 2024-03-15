import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import './app_config.dart';
import './enums.dart';
import './static_functions.dart';
import '../common_property_data_provider.dart';
import '../localdb/isar_service.dart';
import '../localdb/save_default_data.dart';
import '../main.dart';
import '../network/dio_client.dart';
import '../views/add_property/api_request/add_property_api_request.dart';

class SyncHelper {
  static final _isarService = IsarService();

  static Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 75,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static syncSharedByBroooners(bool isOnline) {
    if (isOnline) {
      logger.i(
        "Data Syncing:: \nConnection change detected:: \nIs Internet connected: ${isOnline} \nChecking for Shared by brooon properties",
      );
      final context = navigatorKey.currentContext;
      if (context != null) {
        Provider.of<CommonPropertyDataProvider>(
              context,
              listen: false,
            ).propertyApiEnum ==
            ApiEnum.noInternet;
        Provider.of<CommonPropertyDataProvider>(
              context,
              listen: false,
            ).inquiryApiEnum ==
            ApiEnum.noInternet;
      }
    }
  }

  static Future<void> syncDataWithServer(bool isOnline) async {
    if (isOnline) {
      logger.i(
        "Data Syncing:: \nConnection change detected:: \nIs Internet connected: ${isOnline} \nChecking for remaining data to sync with server.",
      );
      final activeUser = await _isarService.getUserInfo();
      if (activeUser != null) {
        if (StaticFunctions.userId == -1) {
          StaticFunctions.userId = activeUser.id;
        }
        final context = navigatorKey.currentContext;
        if (context != null) {
          AppLocalizations localizationsContext = AppLocalizations.of(context)!;
          final _commonPropertyDataProvider =
              Provider.of<CommonPropertyDataProvider>(context, listen: false);
          await SyncHelper.syncPropertyInfoWithServer(
            localizationsContext,
            _commonPropertyDataProvider,
          );
          await SyncHelper.syncInquiryInfoWithServer(
            localizationsContext,
            _commonPropertyDataProvider,
          );
          await SyncHelper.syncPropertyStatusWithServer();
          await SyncHelper.syncInquiryStatusWithServer();
        }
      } else {
        logger.e('Data Syncing:: No active user found');
      }
    }
  }

  static Future<void> syncPropertyStatusWithServer() async {
    Map<String, dynamic> body = {};
    final activeInactive = await _isarService.getPropertyStatusBy(
      type: StatusTypeToSync.activeInactive.name,
    );
    if (activeInactive.isNotEmpty) {
      logger.i(
        'Syncing property status:: ${activeInactive.length} remained Active/Inactive property status found to sync with server',
      );
      body['property_status_ids'] = activeInactive
          .map(
            (element) => {
              'status': element.status,
              'property_id': element.propertyId,
            },
          )
          .toList();
    }

    final closedDeals = await _isarService.getPropertyStatusBy(
      type: StatusTypeToSync.closedDeals.name,
    );
    if (closedDeals.isNotEmpty) {
      logger.i(
        'Syncing property status:: ${closedDeals.length} remained Sold/Unsold property status found to sync with server',
      );

      if (AppConfig.enableCloseDealUserInfoToServer) {
        body['closed_deal_ids'] = closedDeals
            .map(
              (element) => {
                'close_deal_id': element.closeDealId,
                'status': element.status,
                'property_id': element.propertyId,
                'buyer_name': element.closedDealBuyerSellerName,
                'buyer_mobile': element.closedDealBuyerSellerMobile,
                'notes': element.closedDealBuyerSellerNotes,
                'linked_inquiry_id': element.closedDealPropertyInquiryId,
              },
            )
            .toList();
      } else {
        body['closed_deal_ids'] = closedDeals
            .map(
              (element) => {
                'close_deal_id': element.closeDealId,
                'status': element.status,
                'property_id': element.propertyId,
                'linked_inquiry_id': element.closedDealPropertyInquiryId,
              },
            )
            .toList();
      }
    }

    final privatePublicStatus = await _isarService.getPropertyStatusBy(
      type: StatusTypeToSync.privatePublic.name,
    );
    if (privatePublicStatus.isNotEmpty) {
      logger.i(
        'Syncing property status:: ${privatePublicStatus.length} remained Private/Public property status found to sync with server',
      );
      body['property_visibility_ids'] = privatePublicStatus
          .map(
            (element) => {
              'status': element.isPublic,
              'property_id': element.propertyId,
            },
          )
          .toList();
    }

    final deletePropertyStatus = await _isarService.getPropertyStatusBy(
      type: StatusTypeToSync.delete.name,
    );
    if (deletePropertyStatus.isNotEmpty) {
      logger.i(
        'Syncing property status:: ${deletePropertyStatus.length} remained deleted property status found to sync with server',
      );
      List<String> properties = [];
      deletePropertyStatus.forEach(
        (element) {
          properties.add(element.propertyId!);
        },
      );
      body['property_deleted_ids'] = properties;
    }

    if (body.isNotEmpty) {
      final response = await DioClient().updatePropertyStatus(body);
      if (response != null &&
          response.success == true &&
          response.data != null) {
        if (response.data!.propertyStatusIds != null &&
            response.data!.propertyStatusIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.activeInactive.name;
          param['propertyIds'] = response.data!.propertyStatusIds!;
          compute(_deletePropertyStatusFromDb, param);
        }
        if (response.data!.closedDealIds != null &&
            response.data!.closedDealIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.closedDeals.name;
          param['propertyIds'] = response.data!.closedDealIds!;
          compute(_deletePropertyStatusFromDb, param);
        }
        if (response.data!.propertyVisibilityIds != null &&
            response.data!.propertyVisibilityIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.privatePublic.name;
          param['propertyIds'] = response.data!.propertyVisibilityIds!;
          compute(_deletePropertyStatusFromDb, param);
        }
        if (response.data!.propertyDeletedIds != null &&
            response.data!.propertyDeletedIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.delete.name;
          param['propertyIds'] = response.data!.propertyDeletedIds!;
          compute(_deletePropertyStatusFromDb, param);
        }
      }
    }
  }

  static Future<void> syncInquiryStatusWithServer() async {
    Map<String, dynamic> body = {};
    final activeInactive = await _isarService.getInquiryStatusBy(
      type: StatusTypeToSync.activeInactive.name,
    );
    if (activeInactive.isNotEmpty) {
      logger.i(
        'Syncing inquiry status:: ${activeInactive.length} remained Active/Inactive inquiry status found to sync with server',
      );
      body['inquiry_status_ids'] = activeInactive
          .map(
            (element) => {
              'status': element.status,
              'inquiry_id': element.inquiryId,
            },
          )
          .toList();
    }

    final closedDeals = await _isarService.getInquiryStatusBy(
      type: StatusTypeToSync.closedDeals.name,
    );
    if (closedDeals.isNotEmpty) {
      logger.i(
        'Syncing inquiry status:: ${closedDeals.length} remained Sold/Unsold inquiry status found to sync with server',
      );
      if (AppConfig.enableCloseDealUserInfoToServer) {
        body['closed_deal_ids'] = closedDeals
            .map(
              (element) => {
            'close_deal_id': element.closeDealId,
            'status': element.status,
            'inquiry_id': element.inquiryId,
            'seller_name': element.closedDealBuyerSellerName,
            'seller_mobile': element.closedDealBuyerSellerMobile,
            'notes': element.closedDealBuyerSellerNotes,
            'linked_property_id': element.closedDealPropertyInquiryId,
          },
        )
            .toList();
      } else {
        body['closed_deal_ids'] = closedDeals
            .map(
              (element) => {
            'close_deal_id': element.closeDealId,
            'status': element.status,
            'inquiry_id': element.inquiryId,
            'linked_property_id': element.closedDealPropertyInquiryId,
          },
        )
            .toList();
      }
    }

    final privatePublicStatus = await _isarService.getInquiryStatusBy(
      type: StatusTypeToSync.privatePublic.name,
    );
    if (privatePublicStatus.isNotEmpty) {
      logger.i(
        'Syncing inquiry status:: ${privatePublicStatus.length} remained Private/Public inquiry status found to sync with server',
      );
      body['inquiry_visibility_ids'] = privatePublicStatus
          .map(
            (element) => {
              'status': element.isPublic,
              'inquiry_id': element.inquiryId,
            },
          )
          .toList();
    }

    final deleteInquiryStatus = await _isarService.getInquiryStatusBy(
      type: StatusTypeToSync.delete.name,
    );
    if (deleteInquiryStatus.isNotEmpty) {
      logger.i(
        'Syncing inquiry status:: ${deleteInquiryStatus.length} remained deleted inquiry status found to sync with server',
      );
      List<String> inquiriesToDelete = [];
      deleteInquiryStatus.forEach(
        (element) {
          inquiriesToDelete.add(element.inquiryId!);
        },
      );
      body['inquiry_deleted_ids'] = inquiriesToDelete;
    }

    if (body.isNotEmpty) {
      final response = await DioClient().updateInquiryStatus(body);
      if (response != null &&
          response.success == true &&
          response.data != null) {
        if (response.data!.inquiryStatusIds != null &&
            response.data!.inquiryStatusIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.activeInactive.name;
          param['inquiryIds'] = response.data!.inquiryStatusIds!;
          compute(_deleteInquiryStatusFromDb, param);
        }
        if (response.data!.closedDealIds != null &&
            response.data!.closedDealIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.closedDeals.name;
          param['inquiryIds'] = response.data!.closedDealIds!;
          compute(_deleteInquiryStatusFromDb, param);
        }
        if (response.data!.inquiryVisibilityIds != null &&
            response.data!.inquiryVisibilityIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.privatePublic.name;
          param['inquiryIds'] = response.data!.inquiryVisibilityIds!;
          compute(_deleteInquiryStatusFromDb, param);
        }
        if (response.data!.inquiryDeletedIds != null &&
            response.data!.inquiryDeletedIds!.isNotEmpty) {
          Map<String, dynamic> param = Map();
          param['statusType'] = StatusTypeToSync.delete.name;
          param['inquiryIds'] = response.data!.inquiryDeletedIds!;
          compute(_deleteInquiryStatusFromDb, param);
        }
      }
    }
  }

  static Future<void> syncPropertyInfoWithServer(
    AppLocalizations localizationsContext,
    CommonPropertyDataProvider commonPropertyDataProvider,
  ) async {
    final listOfRemainingProperties =
        await _isarService.getPropertiesToSyncWithServer();

    if (listOfRemainingProperties.isNotEmpty) {
      logger.i(
        'Syncing properties:: ${listOfRemainingProperties.length} remained properties found to sync with server',
      );
      final response = await DioClient().uploadPropertyInfo(
        await AddPropertyApiRequest.local(
          localizationsContext: localizationsContext,
          commonPropertyDataProvider: commonPropertyDataProvider,
        ).toMap(listOfRemainingProperties),
      );
      if (response != null &&
          response.success == true &&
          response.data != null &&
          response.data!.propertyIds != null &&
          response.data!.propertyIds!.isNotEmpty) {
        compute(_updatePropertySyncStatusInDb, response.data!.propertyIds!);
      }
    } else {
      logger.i('Syncing properties:: No remained properties found to sync');
    }
  }

  static Future<void> syncInquiryInfoWithServer(
    AppLocalizations localizationsContext,
    CommonPropertyDataProvider commonPropertyDataProvider,
  ) async {
    final listOfRemainingInquiries =
        await _isarService.getInquiriesToSyncWithServer();

    if (listOfRemainingInquiries.isNotEmpty) {
      logger.i(
        'Syncing inquiries:: ${listOfRemainingInquiries.length} remained inquiries found to sync with server',
      );
      Map<String, dynamic> body = {};
      List<Map<String, dynamic>> inquiryArray = [];
      await Future.forEach(
        listOfRemainingInquiries,
        (filterToApply) async {
          Map<String, dynamic> inquiryObj = {};
          if (filterToApply.inquiryId!.trim().isNotEmpty) {
            inquiryObj['inquiry_id'] = filterToApply.inquiryId;
          }
          if (filterToApply.inquiryId!.trim().isNotEmpty) {
            inquiryObj['name'] = 'My Inquires';
          }
          if (filterToApply.propertyFor != null &&
              filterToApply.propertyFor!.isNotEmpty) {
            final selectedPropertyFor = await _isarService
                .getPropertyForByIds(filterToApply.propertyFor!);
            inquiryObj['for'] = selectedPropertyFor
                .map((e) => e.id == SaveDefaultData.propertyForSellId
                    ? localizationsContext.buy
                    : e.name)
                .toList();
          }
          if (filterToApply.propertyTypeValues != null) {
            inquiryObj['type'] = filterToApply.propertyTypeValues![0];
          }
          if (filterToApply.measureUnitValue != null) {
            inquiryObj['area_unit'] = filterToApply.measureUnitValue;
          }
          if (filterToApply.minMeasure != null) {
            inquiryObj['min_area_size'] = filterToApply.minMeasure;
          }
          if (filterToApply.maxMeasure != null) {
            inquiryObj['max_area_size'] = filterToApply.maxMeasure;
          }

          if (filterToApply.sellPriceRangeMin != null) {
            inquiryObj['buy_min_price'] = filterToApply.sellPriceRangeMin;
          }
          if (filterToApply.sellPriceRangeMax != null) {
            inquiryObj['buy_max_price'] = filterToApply.sellPriceRangeMax;
          }
          if (filterToApply.rentPriceRangeMin != null) {
            inquiryObj['rent_min_price'] = filterToApply.rentPriceRangeMin;
          }
          if (filterToApply.rentPriceRangeMax != null) {
            inquiryObj['rent_max_price'] = filterToApply.rentPriceRangeMax;
          }
          if (filterToApply.leasePriceRangeMin != null) {
            inquiryObj['lease_min_price'] = filterToApply.leasePriceRangeMin;
          }
          if (filterToApply.leasePriceRangeMax != null) {
            inquiryObj['lease_max_price'] = filterToApply.leasePriceRangeMax;
          }

          if (filterToApply.sellMinPricePerSize != null) {
            inquiryObj['buy_min_price_by_size'] =
                filterToApply.sellMinPricePerSize;
          }
          if (filterToApply.sellMaxPricePerSize != null) {
            inquiryObj['buy_max_price_by_size'] =
                filterToApply.sellMaxPricePerSize;
          }
          if (filterToApply.rentMinPricePerSize != null) {
            inquiryObj['rent_min_price_by_size'] =
                filterToApply.rentMinPricePerSize;
          }
          if (filterToApply.rentMaxPricePerSize != null) {
            inquiryObj['rent_max_price_by_size'] =
                filterToApply.rentMaxPricePerSize;
          }
          if (filterToApply.leaseMinPricePerSize != null) {
            inquiryObj['lease_min_price_by_size'] =
                filterToApply.leaseMinPricePerSize;
          }
          if (filterToApply.leaseMaxPricePerSize != null) {
            inquiryObj['lease_max_price_by_size'] =
                filterToApply.leaseMaxPricePerSize;
          }

          inquiryObj['buy_min_price_unit_id'] = filterToApply.sellMinPriceUnit;
          inquiryObj['buy_max_price_unit_id'] = filterToApply.sellMaxPriceUnit;
          inquiryObj['rent_min_price_unit_id'] = filterToApply.rentMinPriceUnit;
          inquiryObj['rent_max_price_unit_id'] = filterToApply.rentMaxPriceUnit;
          inquiryObj['lease_min_price_unit_id'] =
              filterToApply.leaseMinPriceUnit;
          inquiryObj['lease_max_price_unit_id'] =
              filterToApply.leaseMaxPriceUnit;

          inquiryObj['negotiation_allowed'] = filterToApply.isNegotiable;
          inquiryObj['note'] = filterToApply.notes;

          if (filterToApply.buildingType != null &&
              filterToApply.buildingType!.isNotEmpty) {
            final selectedBuildingTypes = await _isarService
                .getBuildingTypeBasedOnIds(filterToApply.buildingType!);
            inquiryObj['building_type'] =
                selectedBuildingTypes.map((e) => e.name).toList();
          }
          if (filterToApply.constructionType != null &&
              filterToApply.constructionType!.isNotEmpty) {
            final selectedConstructionTypes = await _isarService
                .getConstructionTypeByIds(filterToApply.constructionType!);
            inquiryObj['construction_type'] =
                selectedConstructionTypes.map((e) => e.name).toList();
          }
          if (filterToApply.schemeType != null &&
              filterToApply.schemeType!.isNotEmpty) {
            final selectedSchemeTypes = await _isarService
                .getSchemeTypeByIds(filterToApply.schemeType!);
            inquiryObj['scheme_type'] =
                selectedSchemeTypes.map((e) => e.name).toList();
          }
          if (filterToApply.furnishedType != null &&
              filterToApply.furnishedType!.isNotEmpty) {
            final selectedFurnished = await _isarService
                .getFurnishedStatusByIds(filterToApply.furnishedType!);
            inquiryObj['property_furnished_type'] =
                selectedFurnished.map((e) => e.name).toList();
          }
          if (filterToApply.additionalFurnish != null &&
              filterToApply.additionalFurnish!.isNotEmpty) {
            inquiryObj['additional_furnishing'] =
                filterToApply.additionalFurnish;
          }
          if (filterToApply.bhkIds != null &&
              filterToApply.bhkIds!.isNotEmpty) {
            final selectedBhkIds =
                await _isarService.getBhkTypesByIds(filterToApply.bhkIds!);
            inquiryObj['bhk'] = selectedBhkIds.map((e) => e.name).toList();
          }
          if (filterToApply.connectedRoads != null &&
              filterToApply.connectedRoads!.isNotEmpty) {
            inquiryObj['connected_road'] = filterToApply.connectedRoads!;
          }

          inquiryObj['bath_room'] = filterToApply.bathroomCount;
          inquiryObj['room'] = filterToApply.roomCount;
          inquiryObj['floor'] = filterToApply.floorCount;
          inquiryObj['total_floor'] = filterToApply.totalFloorCount;
          inquiryObj['front_size'] = filterToApply.frontSize;
          inquiryObj['depth_size'] = filterToApply.depthSize;

          inquiryObj['wash_room_available'] = filterToApply.isWashroomAvailable;
          inquiryObj['balcony'] = filterToApply.isBalconyAvailable;
          inquiryObj['corner_piece'] = filterToApply.isCornerPiece;
          inquiryObj['light_connection'] =
              filterToApply.isLightConnectionAvailable;
          inquiryObj['well_available'] = filterToApply.isWellAvailable;
          inquiryObj['allotted_parking'] =
              filterToApply.isAllottedParkingAvailable;
          inquiryObj['parking_available'] = filterToApply.isParkingAvailable;
          inquiryObj['lift_available'] = filterToApply.isLiftAvailable;
          inquiryObj['is_public'] = filterToApply.isPublicInquiry;
          inquiryObj['inquiry_status'] = filterToApply.inquiryStatusValue;
          inquiryObj['close_deal_id'] = filterToApply.closeDealId;
          inquiryObj['inquiry_sold_status_id'] =
              filterToApply.inquirySoldStatusId;
          inquiryObj['inquiry_sold_status'] =
              commonPropertyDataProvider.getPropertyCurrentStatus(
            filterToApply.inquirySoldStatusId,
            filterToApply.inquirySoldStatusId == SaveDefaultData.soldStatusId
                ? filterToApply.closeDealId!
                : filterToApply.propertyFor![0],
            localizationsContext,
            isInquiry: true,
          );

          if (filterToApply.facingType != null &&
              filterToApply.facingType!.isNotEmpty) {
            final selectedFacingType = await _isarService
                .getFacingTypesByIds(filterToApply.facingType!);
            inquiryObj['facing'] =
                selectedFacingType.map((e) => e.name).toList();
          }
          if (filterToApply.preferredCaste != null &&
              filterToApply.preferredCaste!.isNotEmpty) {
            inquiryObj['preferred_caste'] = filterToApply.preferredCaste;
          }
          if (filterToApply.selectedAmenities != null &&
              filterToApply.selectedAmenities!.isNotEmpty) {
            inquiryObj['amenities'] = filterToApply.selectedAmenities;
          }
          if (filterToApply.area != null &&
              filterToApply.area!.trim().isNotEmpty) {
            inquiryObj['map_location'] = filterToApply.area;
          }
          if (filterToApply.location != null &&
              filterToApply.location!.trim().isNotEmpty) {
            inquiryObj['typed_location'] = filterToApply.location;
          }
          if (filterToApply.latitude != null) {
            inquiryObj['latitude'] = filterToApply.latitude;
          }
          if (filterToApply.longitude != null) {
            inquiryObj['longitude'] = filterToApply.longitude;
          }
          if (AppConfig.enableCloseDealUserInfoToServer) {
            if (filterToApply.closedDealSellerName != null &&
                filterToApply.closedDealSellerName!.trim().isNotEmpty) {
              inquiryObj['seller_name'] =
                  filterToApply.closedDealSellerName!.trim();
            }
            if (filterToApply.closedDealSellerPhoneNo != null &&
                filterToApply.closedDealSellerPhoneNo!.trim().isNotEmpty) {
              inquiryObj['seller_mobile'] =
                  filterToApply.closedDealSellerPhoneNo!.trim();
            }
            if (filterToApply.closedDealNotes != null &&
                filterToApply.closedDealNotes!.trim().isNotEmpty) {
              inquiryObj['notes'] = filterToApply.closedDealNotes!.trim();
            }
          }
          if (filterToApply.closedLinkedPropertyId != null &&
              filterToApply.closedLinkedPropertyId!.trim().isNotEmpty) {
            inquiryObj['linked_property_id'] =
                filterToApply.closedLinkedPropertyId!.trim();
          }
          inquiryObj['created_at'] =
              filterToApply.addedAt.millisecondsSinceEpoch;
          inquiryObj['updated_at'] =
              filterToApply.updatedAt.millisecondsSinceEpoch;
          inquiryArray.add(inquiryObj);
        },
      );
      body['inquiries'] = inquiryArray;
      final response = await DioClient().uploadInquiryInfo(
        body,
      );
      if (response != null &&
          response.success == true &&
          response.data != null &&
          response.data!.inquiriesId != null &&
          response.data!.inquiriesId!.isNotEmpty) {
        compute(_updateInquirySyncStatusInDb, response.data!.inquiriesId!);
      }
    } else {
      logger.i('Syncing inquiries:: No remained inquiries found to sync');
    }
  }

  static Future<void> _updatePropertySyncStatusInDb(
      List<String> propertyIds) async {
    final properties = await _isarService.getPropertyByIds(propertyIds);
    if (properties.isNotEmpty) {
      await Future.forEach(
        properties,
        (e) async {
          final index = properties
              .indexWhere((element) => element.propertyId == e.propertyId);
          properties[index].isSyncedWithServer = true;
          await _isarService.saveProperty(properties[index]);
        },
      );
    }
  }

  static Future<void> _updateInquirySyncStatusInDb(
      List<String> inquiriesIds) async {
    final inquiries = await _isarService.getInquiryByIds(inquiriesIds);
    if (inquiries.isNotEmpty) {
      await Future.forEach(
        inquiries,
        (e) async {
          final index = inquiries
              .indexWhere((element) => element.inquiryId == e.inquiryId);
          inquiries[index].isSyncedWithServer = true;
          await _isarService.saveFilter(inquiries[index]);
        },
      );
    }
  }

  static Future<void> _deletePropertyStatusFromDb(
    Map<String, dynamic> value,
  ) async {
    final activeUser = await _isarService.getUserInfo();
    if (activeUser != null) {
      //because of compute function which runs on separate thread we have to reinitialize static members.
      if (StaticFunctions.userId == -1) {
        StaticFunctions.userId = activeUser.id;
      }
      String statusType = value['statusType'];
      List<String> propertyIds = value['propertyIds'];
      await Future.forEach(
        propertyIds,
        (id) async {
          await _isarService.deletePropertyStatusBy(
            statusType,
            id,
          );
        },
      );
    }
  }

  static Future<void> _deleteInquiryStatusFromDb(
    Map<String, dynamic> value,
  ) async {
    final activeUser = await _isarService.getUserInfo();
    if (activeUser != null) {
      //because of compute function which runs on separate thread we have to reinitialize static members.
      if (StaticFunctions.userId == -1) {
        StaticFunctions.userId = activeUser.id;
      }
      String statusType = value['statusType'];
      List<String> inquiryIds = value['inquiryIds'];
      await Future.forEach(
        inquiryIds,
        (id) async {
          await _isarService.deleteInquiryStatusBy(
            statusType,
            id,
          );
        },
      );
    }
  }
}
