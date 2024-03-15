import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../common_property_data_provider.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/properties/db_status_sync.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/sync_helper.dart';
import '../close_deal/close_deal_model.dart';

class PropertyInquiryStatusHelper {
  // If Property is uploaded to server then this method will be in affect
  static savePropertyStatusToSync({
    required IsarService isarService,
    required DbProperty selectedProperty,
    required AppLocalizations localizationsContext,
    required StatusTypeToSync statusType,
    required bool status,
    required CommonPropertyDataProvider? commonPropertyDataProvider,
    required bool shouldUpload,
    required CloseDealModel? closedDealInfo,
  }) async {
    if (selectedProperty.isSyncedWithServer) {
      String statusString = '';
      int? closeDealId = null;
      bool? isPublic;
      bool? isDeleteProperty;
      if (statusType == StatusTypeToSync.activeInactive) {
        statusString = status
            ? localizationsContext.active
            : localizationsContext.inActive;
      } else if (statusType == StatusTypeToSync.closedDeals &&
          commonPropertyDataProvider != null) {
        closeDealId = selectedProperty.closeDealId;
        statusString = commonPropertyDataProvider.getPropertyCurrentStatus(
          selectedProperty.propertySoldStatusId,
          selectedProperty.closeDealId,
          localizationsContext,
        );
      } else if (statusType == StatusTypeToSync.privatePublic) {
        isPublic = status;
      } else if (statusType == StatusTypeToSync.delete) {
        isDeleteProperty = status; // always true
      }

      if (isDeleteProperty == true) {
        await isarService.saveStatusToSync(
          DbStatusSync()
            ..statusType = statusType.name
            ..userId = StaticFunctions.userId
            ..syncType = StatusSyncType.property.name
            ..propertyId = selectedProperty.propertyId!,
        );
      } else {
        final statusFromDb = await isarService.getPropertyStatusWith(
          statusType.name,
          selectedProperty.propertyId!,
        );
        statusFromDb?.closeDealId = closeDealId;
        statusFromDb?.status = statusString;
        statusFromDb?.isPublic = isPublic;
        final statusToSync = statusFromDb ?? DbStatusSync()
          ..syncType = StatusSyncType.property.name
          ..statusType = statusType.name
          ..userId = StaticFunctions.userId
          ..propertyId = selectedProperty.propertyId!
          ..closeDealId = closeDealId
          ..status = statusString
          ..isPublic = isPublic
          ..closedDealBuyerSellerName = closedDealInfo?.name
          ..closedDealBuyerSellerMobile = closedDealInfo?.mobile
          ..closedDealBuyerSellerNotes = closedDealInfo?.notes
          ..closedDealPropertyInquiryId =
              closedDealInfo?.linkedPropertyInquiryId;
        await isarService.saveStatusToSync(statusToSync);
      }
      if (shouldUpload) {
        await SyncHelper.syncPropertyStatusWithServer();
      }
    }
  }

  // If Inquiry is uploaded to server then this method will be in affect
  static saveInquiryStatusToSync({
    required IsarService isarService,
    required DbSavedFilter selectedInquiry,
    required AppLocalizations localizationsContext,
    required StatusTypeToSync statusType,
    required CommonPropertyDataProvider? commonPropertyDataProvider,
    required bool status,
    required bool shouldUpload,
    required CloseDealModel? closedDealInfo,
  }) async {
    if (selectedInquiry.isSyncedWithServer) {
      String statusString = '';
      int? closeDealId = null;
      bool? isPublic;
      bool? isDeleteInquiry;
      if (statusType == StatusTypeToSync.activeInactive) {
        statusString = status
            ? localizationsContext.active
            : localizationsContext.inActive;
      } else if (statusType == StatusTypeToSync.closedDeals &&
          commonPropertyDataProvider != null) {
        closeDealId = selectedInquiry.closeDealId;
        statusString = commonPropertyDataProvider.getPropertyCurrentStatus(
          selectedInquiry.inquirySoldStatusId,
          selectedInquiry.closeDealId,
          localizationsContext,
          isInquiry: true,
        );
      } else if (statusType == StatusTypeToSync.privatePublic) {
        isPublic = status;
      } else if (statusType == StatusTypeToSync.delete) {
        isDeleteInquiry = status; // always true
      }

      if (isDeleteInquiry == true) {
        await isarService.saveStatusToSync(
          DbStatusSync()
            ..syncType = StatusSyncType.inquiry.name
            ..statusType = statusType.name
            ..userId = StaticFunctions.userId
            ..inquiryId = selectedInquiry.inquiryId,
        );
      } else {
        final statusFromDb = await isarService.getInquiryStatusWith(
          statusType.name,
          selectedInquiry.inquiryId!,
        );
        statusFromDb?.closeDealId = closeDealId;
        statusFromDb?.status = statusString;
        statusFromDb?.isPublic = isPublic;
        final statusToSync = statusFromDb ?? DbStatusSync()
          ..syncType = StatusSyncType.inquiry.name
          ..statusType = statusType.name
          ..userId = StaticFunctions.userId
          ..inquiryId = selectedInquiry.inquiryId
          ..closeDealId = closeDealId
          ..status = statusString
          ..isPublic = isPublic
          ..closedDealBuyerSellerName = closedDealInfo?.name
          ..closedDealBuyerSellerMobile = closedDealInfo?.mobile
          ..closedDealBuyerSellerNotes = closedDealInfo?.notes
          ..closedDealPropertyInquiryId =
              closedDealInfo?.linkedPropertyInquiryId;
        await isarService.saveStatusToSync(statusToSync);
      }
      if (shouldUpload) {
        await SyncHelper.syncInquiryStatusWithServer();
      }
    }
  }

  static createNewClosedPropertyFromInquiry({
    required IsarService isarService,
    required DbSavedFilter inquiry,
    required CloseDealModel closedDealInfo,
  }) async {
    final currentDateTime = DateTime.now();

    List<String> propertyForValues = [];
    if (inquiry.propertyFor != null) {
      final list = await isarService.getPropertyForByIds(inquiry.propertyFor!);
      list.forEach(
        (element) {
          propertyForValues.add(element.name);
        },
      );
    }

    DbProperty data = DbProperty()
      ..id = await nextPropertyId(
        isarService: isarService,
      )
      // This is generated at: inquiry_details_provider.dart: _updateCloseInquiryStatus()
      ..propertyId = closedDealInfo.linkedPropertyInquiryId
      ..isSyncedWithServer = false
      ..userId = StaticFunctions.userId
      ..propertyName = 'My Property'
      ..propertyTypeId = inquiry.propertyType?.first ?? -1
      ..propertyTypeValue = inquiry.propertyTypeValues?.first ?? ''
      ..propertyForIds = inquiry.propertyFor
      ..propertyForValues = propertyForValues
      ..propertyStatusId = SaveDefaultData.inActiveStatusId
      ..propertyStatusValue = inquiry.inquiryStatusValue ?? ''
      ..propertySoldStatusId = SaveDefaultData.soldStatusId
      ..sellerName = closedDealInfo.name
      ..sellerPhoneNo = closedDealInfo.mobile
      ..closeDealId = closedDealInfo.dealType
      ..closedDealBuyerName = inquiry.buyerName
      ..closedDealBuyerPhoneNo = inquiry.mobileNo
      ..closedDealNotes = closedDealInfo.notes
      ..closedLinkedInquiryId = inquiry.inquiryId
      ..addedAt = currentDateTime
      ..updatedAt = currentDateTime
      ..minSellPrice = inquiry.sellPriceRangeMin ?? inquiry.sellPriceRangeMax
      ..maxSellPrice = null
      ..minRentPrice = inquiry.rentPriceRangeMin ?? inquiry.rentPriceRangeMax
      ..maxRentPrice = null
      ..minLeasePrice = inquiry.leasePriceRangeMin ?? inquiry.leasePriceRangeMax
      ..maxLeasePrice = null
      ..minSellPriceUnit = inquiry.sellMinPriceUnit
      ..maxSellPriceUnit = inquiry.sellMaxPriceUnit
      ..minRentPriceUnit = inquiry.rentMinPriceUnit
      ..maxRentPriceUnit = inquiry.rentMaxPriceUnit
      ..minLeasePriceUnit = inquiry.leaseMinPriceUnit
      ..maxLeasePriceUnit = inquiry.leaseMaxPriceUnit
      ..priceUnitId = StaticFunctions.defaultPriceUnitId
      ..priceUnitValue = StaticFunctions.defaultPriceUnit
      ..propertyAreaSize = inquiry.minMeasure ?? inquiry.maxMeasure
      ..propertyAreaUnitId = inquiry.measureUnit
      ..propertyAreaUnitValue = inquiry.measureUnitValue
      ..addressLandMark = inquiry.location
      ..area = inquiry.area
      ..latitude = inquiry.latitude
      ..longitude = inquiry.longitude;
    await isarService.saveProperty(data);
  }

  static Future<int> nextPropertyId({
    required IsarService isarService,
  }) async {
    int propertyId = await isarService.getLastPropertyId();
    // next property id will be: last + 1:
    propertyId = propertyId + 1;
    return propertyId;
  }

  static Future<String> generatePropertyId({
    required IsarService isarService,
  }) async {
    /*Ex: PKPLD000104
    P - Property Prefix char (from 'Strings.propertyIdPrefix')
    KPLD - Broker code (from user db)
    000001 - incremental id
    */
    // final propertyCount = await isarService.getTotalPropertiesCount();
    final user = await isarService.getUserInfo();
    int lastCount = 1;
    final prefix = '${Strings.propertyIdPrefix}${user!.brokerCode}';
    NumberFormat formatter = new NumberFormat(AppConfig.propertyIdLength);
    /*if (propertyCount > 0) {
      final lastPropertyId = await isarService.getLastAddedPropertyId();
      if (lastPropertyId != null) {
        lastCount = int.parse(lastPropertyId.replaceAll(prefix, '')) + 1;
      }
    } else if (user.lastPropertyId != null) {
      lastCount = int.parse(user.lastPropertyId!.replaceAll(prefix, '')) + 1;
    }*/
    String? lastPropertyId = user.lastPropertyId;
    if (lastPropertyId != null && lastPropertyId.trim().isNotEmpty) {
      lastCount = int.parse(lastPropertyId.replaceAll(prefix, '')) + 1;
    }
    final strCount = formatter.format(lastCount);
    final propertyId = '$prefix$strCount';
    await PropertyInquiryStatusHelper.updatePropertyId(propertyId);
    return propertyId;
  }

  static createNewClosedInquiryFromProperty({
    required IsarService isarService,
    required DbProperty property,
    required CloseDealModel closedDealInfo,
    required AppLocalizations localizationsContext,
  }) async {
    final currentDateTime = DateTime.now();

    List<String> inquiryForValues = [];
    if (property.propertyForIds != null) {
      final list =
          await isarService.getPropertyForByIds(property.propertyForIds!);
      list.forEach(
        (element) {
          if (element.id == SaveDefaultData.propertyForSellId) {
            inquiryForValues.add(localizationsContext.buy);
          } else {
            inquiryForValues.add(element.name);
          }
        },
      );
    }

    DbSavedFilter data = DbSavedFilter()
      ..id = await nextInquiryId(
        isarService: isarService,
      )
      // This is generated at: property_details_provider.dart: _updateCloseDealStatus()
      ..inquiryId = closedDealInfo.linkedPropertyInquiryId
      ..isSyncedWithServer = false
      ..isFromBuyer = true
      ..userId = StaticFunctions.userId
      ..propertyType = [property.propertyTypeId]
      ..propertyTypeValues = [property.propertyTypeValue]
      ..propertyFor = property.propertyForIds
      ..propertyForValues = inquiryForValues
      ..inquiryStatusId = SaveDefaultData.inActiveStatusId
      ..inquiryStatusValue = property.propertyStatusValue
      ..inquirySoldStatusId = SaveDefaultData.soldStatusId
      ..buyerName = closedDealInfo.name.trim()
      ..mobileNo = closedDealInfo.mobile
      ..closeDealId = closedDealInfo.dealType
      ..closedDealSellerName = property.sellerName
      ..closedDealSellerPhoneNo = property.sellerPhoneNo
      ..closedDealNotes = closedDealInfo.notes
      ..closedLinkedPropertyId = property.propertyId
      ..addedAt = currentDateTime
      ..updatedAt = currentDateTime
      ..sellPriceRangeMin = property.minSellPrice
      ..sellPriceRangeMax = property.maxSellPrice
      ..rentPriceRangeMin = property.minRentPrice
      ..rentPriceRangeMax = property.maxRentPrice
      ..leasePriceRangeMin = property.minLeasePrice
      ..leasePriceRangeMax = property.maxLeasePrice
      ..sellMinPriceUnit = property.minSellPriceUnit
      ..sellMaxPriceUnit = property.maxSellPriceUnit
      ..rentMinPriceUnit = property.minRentPriceUnit
      ..rentMaxPriceUnit = property.maxRentPriceUnit
      ..leaseMinPriceUnit = property.minLeasePriceUnit
      ..leaseMaxPriceUnit = property.maxLeasePriceUnit
      ..minMeasure = property.propertyAreaSize
      ..maxMeasure = null
      ..measureUnit = property.propertyAreaUnitId
      ..measureUnitValue = property.propertyAreaUnitValue
      ..location = property.addressLandMark
      ..area = property.area
      ..latitude = property.latitude
      ..longitude = property.longitude;
    await isarService.saveFilter(data);
  }

  static Future<int> nextInquiryId({
    required IsarService isarService,
  }) async {
    int inquiryId = await isarService.getLastInquiryId();
    // next inquiry id will be: last + 1:
    inquiryId = inquiryId + 1;
    return inquiryId;
  }

  static Future<String> generateInquiryId({
    required IsarService isarService,
  }) async {
    /*Ex: IKPLD000104
    I - Inquiry Prefix char (from 'Strings.inquiryIdPrefix')
    KPLD - Broker code (from user db)
    000001 - incremental id
    */
    // final inquiryCount = await isarService.getTotalInquiriesCount();
    final user = await isarService.getUserInfo();
    int lastCount = 1;
    final prefix = '${Strings.inquiryIdPrefix}${user!.brokerCode}';
    NumberFormat formatter = new NumberFormat(AppConfig.inquiryIdLength);
    /*if (inquiryCount > 0) {
      final lastInquiryId = await isarService.getLastAddedInquiryId();
      if (lastInquiryId != null && lastInquiryId.trim().isNotEmpty) {
        lastCount = int.parse(lastInquiryId.replaceAll(prefix, '')) + 1;
      }
    } else if (user.lastInquiryId != null) {
      lastCount = int.parse(user.lastInquiryId!.replaceAll(prefix, '')) + 1;
    }*/
    String? lastInquiryId = user.lastInquiryId;
    if (lastInquiryId != null && lastInquiryId.trim().isNotEmpty) {
      lastCount = int.parse(lastInquiryId.replaceAll(prefix, '')) + 1;
    }
    final strCount = formatter.format(lastCount);
    final inquiryId = '$prefix$strCount';
    await PropertyInquiryStatusHelper.updateInquiryId(inquiryId);
    return inquiryId;
  }

  static Future updatePropertyId(String? lastPropertyId) async {
    if (lastPropertyId != null) {
      final isarService = IsarService();
      final userInfo = await isarService.getUserInfo();
      if (userInfo != null) {
        userInfo.lastPropertyId = lastPropertyId;
        await isarService.saveOrUpdateUserInfo(userInfo);
      }
    }
  }

  static Future updateInquiryId(String? lastInquiryId) async {
    if (lastInquiryId != null) {
      final isarService = IsarService();
      final userInfo = await isarService.getUserInfo();
      if (userInfo != null) {
        userInfo.lastInquiryId = lastInquiryId;
        await isarService.saveOrUpdateUserInfo(userInfo);
      }
    }
  }
}
