import 'dart:collection';
import 'dart:io';

import 'package:isar/isar.dart';

import './app_links/db_app_links.dart';
import './app_privacy_logs/db_app_privacy_logs.dart';
import './app_settings/db_app_settings.dart';
import './backup_restore/db_backup_local_info.dart';
import './backup_restore/db_google_drive_file_info.dart';
import './helpers/db_locations_tags.dart';
import './notification/db_notifications.dart';
import './properties/db_additional_furnish.dart';
import './properties/db_area_unit_values.dart';
import './properties/db_blocked_broooner.dart';
import './properties/db_brooon_pagination_count_schema.dart';
import './properties/db_property.dart';
import './properties/db_property_amenity.dart';
import './properties/db_property_area_unit.dart';
import './properties/db_property_bhk_type.dart';
import './properties/db_property_building_type.dart';
import './properties/db_property_connected_road.dart';
import './properties/db_property_construction_type.dart';
import './properties/db_property_facing_type.dart';
import './properties/db_property_for.dart';
import './properties/db_property_furnished_status.dart';
import './properties/db_property_photos_meta.dart';
import './properties/db_property_preferred_cast.dart';
import './properties/db_property_price_unit.dart';
import './properties/db_property_scheme_type.dart';
import './properties/db_property_sold_status.dart';
import './properties/db_property_status.dart';
import './properties/db_property_type.dart';
import './properties/db_property_visitors.dart';
import './properties/db_saved_filter.dart';
import './properties/db_status_sync.dart';
import './reminder/db_reminder.dart';
import './save_default_data.dart';
import './settings/db_settings.dart';
import './subscription/db_plan_history.dart';
import './subscription/db_purchased_status.dart';
import './subscription/db_subscription_plan.dart';
import './user_info/db_user_info.dart';
import '../const/string_const.dart';
import '../utils/app_config.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';
import '../views/buyers_sellers/model/buyer_seller_info.dart';
import '../views/view_all_property/model/view_all_screen_arg.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveOrUpdateUserInfo(DbUserInfo userInfo) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbUserInfos.put(userInfo);
        StaticFunctions.userInfo = userInfo;
      },
    );
  }

  Future<void> updateUsersInfo(List<DbUserInfo> users) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbUserInfos.putAll(users);
      },
    );
  }

  Future<DbUserInfo?> getUserInfo() async {
    final isar = await db;
    return await isar.dbUserInfos
        .filter()
        .isActiveUserEqualTo(true)
        .findFirst();
  }

  Future<List<DbUserInfo>> getAllUsers() async {
    final isar = await db;
    return await isar.dbUserInfos.where().findAll();
  }

  Future<Stream<void>> watchOnUserInfo() async {
    final isar = await db;
    return await isar.dbUserInfos.watchLazy();
  }

  Future<int> saveProperty(DbProperty property) async {
    int id = -1;
    final isar = await db;
    id = await isar.writeTxn(
      () async {
        final id = await isar.dbPropertys.put(property);
        return id;
      },
    );
    return id;
  }

  Future<void> saveProperties(List<DbProperty> properties) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertys.putAll(properties);
      },
    );
  }

  Future<bool> deleteProperty(int id) async {
    bool isDeleted = false;
    final isar = await db;
    isDeleted = await isar.writeTxn(
      () async {
        return await isar.dbPropertys.delete(id);
      },
    );
    return isDeleted;
  }

  Future<bool> deleteInquiry(int id) async {
    bool isDeleted = false;
    final isar = await db;
    isDeleted = await isar.writeTxn(
      () async {
        return await isar.dbSavedFilters.delete(id);
      },
    );
    return isDeleted;
  }

  /*deleteSharedByBrooonersProperties() async {
    final isar = await db;
    final list =
        await isar.dbPropertys.filter().sharedByBrooonEqualTo(true).findAll();
    if (list.isNotEmpty) {
      final List<int> ids = [];
      list.forEach(
        (element) {
          ids.add(element.id);
        },
      );
      await isar.writeTxn(
        () async {
          return await isar.dbPropertys.deleteAll(ids);
        },
      );
    }
  }*/

  Future<Stream<void>> watchOnPropertySave() async {
    final isar = await db;
    return await isar.dbPropertys.watchLazy();
  }

  Future<Stream<void>> watchOnPropertyUpdate(int propertyId) async {
    final isar = await db;
    return await isar.dbPropertys.watchObjectLazy(propertyId);
  }

  Future<List<DbProperty>> getSharedByBrooonProperties(int maxLimit) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(true)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .sortByUpdatedAtDesc()
        .limit(maxLimit)
        .findAll();
  }

  Future<List<DbProperty>> getAllPropertiesWithLocationAvailable() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .and()
        .latitudeIsNotNull()
        .and()
        .longitudeIsNotNull()
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getPropertiesWithLocationAvailableByPropertyFor(
    int propertyFor,
  ) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .and()
        .latitudeIsNotNull()
        .and()
        .longitudeIsNotNull()
        .and()
        .propertyForIdsElementEqualTo(propertyFor)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbSavedFilter>> getInquiriesWithLocationAvailableByPropertyFor(
    int propertyFor,
  ) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .inquiryStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .and()
        .latitudeIsNotNull()
        .and()
        .longitudeIsNotNull()
        .and()
        .propertyForElementEqualTo(propertyFor)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getRecentlyAddedProperties(
    int maxLimit, {
    DateTime? lastDate,
  }) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .and()
        .optional(
          lastDate != null,
          (q) => q.addedAtLessThan(lastDate!),
        )
        .sortByAddedAtDesc()
        .limit(maxLimit)
        .findAll();
  }

  Future<List<DbSavedFilter>> getRecentlyAddedInquiries(
    int maxLimit, {
    DateTime? lastDate,
  }) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .inquiryStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .and()
        .optional(
          lastDate != null,
          (q) => q.addedAtLessThan(lastDate!),
        )
        .sortByAddedAtDesc()
        .limit(maxLimit)
        .findAll();
  }

  Future<int> getTotalPropertiesCount() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .count();
  }

  Future<int> getTotalInquiriesCount() async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFromBuyerEqualTo(true)
        .count();
  }

  Future<int> getMyPropertiesCount() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .count();
  }

  Future<int> getMyInquiriesCount() async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .inquiryStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .count();
  }

  Future<dynamic> getPropertiesCountByType(
    int typeId, {
    bool returnPropertyAlso = false,
  }) async {
    final isar = await db;
    final query = await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertyTypeIdEqualTo(typeId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId);
    return await (!returnPropertyAlso ? query.count() : query.findAll());
  }

  Future<dynamic> getInquiriesCountByType(
    int typeId, {
    bool returnInquiryAlso = false,
  }) async {
    final isar = await db;
    final query = await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .propertyTypeElementEqualTo(typeId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .inquiryStatusIdEqualTo(SaveDefaultData.activeStatusId);
    return await (!returnInquiryAlso ? query.count() : query.findAll());
  }

  Future<int> getSharedByBrooonPropertiesCount() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(true)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .count();
  }

  Future<void> savePropertyTypes(List<DbPropertyType> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyTypes.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyType>> getPropertyTypes() async {
    final isar = await db;
    return await isar.dbPropertyTypes.where().findAll();
  }

  Future<DbPropertyType?> getPropertyTypeById(int id) async {
    final isar = await db;
    return await isar.dbPropertyTypes.filter().idEqualTo(id).findFirst();
  }

  Future<int> getPropertyTypeIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyTypes
          .filter()
          .nameEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<void> savePropertyFor(List<DbPropertyFor> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyFors.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyFor>> getPropertyFor() async {
    final isar = await db;
    return await isar.dbPropertyFors.where().findAll();
  }

  Future<DbPropertyFor?> getPropertyForById(int id) async {
    final isar = await db;
    return await isar.dbPropertyFors.filter().idEqualTo(id).findFirst();
  }

  Future<List<DbPropertyFor>> getPropertyForByIds(List<int> ids) async {
    final isar = await db;
    return await isar.dbPropertyFors
        .filter()
        .anyOf(
          ids,
          (q, id) => q.idEqualTo(id),
        )
        .findAll();
  }

  Future<int> getPropertyForIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyFors
          .filter()
          .nameEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<void> saveFurnishedStatus(List<DbPropertyFurnishedStatus> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyFurnishedStatus.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyFurnishedStatus>> getFurnishedStatus() async {
    final isar = await db;
    return await isar.dbPropertyFurnishedStatus.where().findAll();
  }

  Future<DbPropertyFurnishedStatus?> getFurnishedStatusById(int id) async {
    final isar = await db;
    return await isar.dbPropertyFurnishedStatus
        .filter()
        .idEqualTo(id)
        .findFirst();
  }

  Future<List<DbPropertyFurnishedStatus>> getFurnishedStatusByIds(
      List<int> ids) async {
    final isar = await db;
    return await isar.dbPropertyFurnishedStatus
        .filter()
        .anyOf(
          ids,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<int>?> getFurnishedStatusIdByName(List<String>? name) async {
    if (name != null && name.isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyFurnishedStatus
          .filter()
          .optional(
            name.isNotEmpty,
            (q) => q.anyOf(
              name,
              (q, element) => q.nameEqualTo(
                element,
                caseSensitive: false,
              ),
            ),
          )
          .findAll();
      if (info.isNotEmpty) {
        return info.map((e) => e.id).toList();
      }
    }
    return null;
  }

  Future<void> savePropertyStatus(List<DbPropertyStatus> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyStatus.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyStatus>> getPropertyStatus() async {
    final isar = await db;
    return await isar.dbPropertyStatus.where().findAll();
  }

  Future<DbPropertyStatus?> getPropertyStatusById(int id) async {
    final isar = await db;
    return await isar.dbPropertyStatus.filter().idEqualTo(id).findFirst();
  }

  Future<int> getPropertyStatusIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyStatus
          .filter()
          .nameEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<void> savePropertyPriceUnit(List<DbPropertyPriceUnit> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyPriceUnits.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyPriceUnit>> getPropertyPriceUnit() async {
    final isar = await db;
    return await isar.dbPropertyPriceUnits.where().findAll();
  }

  Future<DbPropertyPriceUnit?> getPropertyPriceUnitById(int id) async {
    final isar = await db;
    return await isar.dbPropertyPriceUnits.filter().idEqualTo(id).findFirst();
  }

  Future<int> getPriceUnitIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyPriceUnits
          .filter()
          .unitEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<DbPropertyPriceUnit?> getDefaultPriceUnit() async {
    final isar = await db;
    return await isar.dbPropertyPriceUnits
        .filter()
        .isDefaultUnitEqualTo(true)
        .findFirst();
  }

  Future<List<DbPropertySoldStatus>> getPropertySoldStatus() async {
    final isar = await db;
    return await isar.dbPropertySoldStatus.where().findAll();
  }

  Future<void> savePropertySoldStatus(List<DbPropertySoldStatus> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertySoldStatus.putAll(list);
        },
      );
    }
  }

  Future<int> getPropertySoldStatusIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertySoldStatus
          .filter()
          .nameEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<List<DbPropertyAreaUnit>> getPropertyAreaUnits() async {
    final isar = await db;
    return await isar.dbPropertyAreaUnits.where().findAll();
  }

  Future<DbPropertyAreaUnit?> getPropertyAreaUnitById(int id) async {
    final isar = await db;
    return await isar.dbPropertyAreaUnits.filter().idEqualTo(id).findFirst();
  }

  Future<int> getPropertyAreaUnitIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyAreaUnits
          .filter()
          .unitEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<void> savePropertyAreaUnit(List<DbPropertyAreaUnit> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyAreaUnits.putAll(list);
        },
      );
    }
  }

  Future<void> saveUnitValues(List<DbAreaUnitValue> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbAreaUnitValues.putAll(list);
        },
      );
    }
  }

  Future<void> saveBlockedBroooner(List<DbBlockedBroooner> brooner) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbBlockedBroooners.putAll(brooner);
      },
    );
  }

  Future<DbBlockedBroooner?> getBlockedBroooner(
      int brooonId, String brooonCode) async {
    final isar = await db;
    return await isar.dbBlockedBroooners
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .brooonIdEqualTo(brooonId)
        .and()
        .brooonCodeEqualTo(brooonCode)
        .findFirst();
  }

  Future<void> deleteBlockedBroooner({
    int? brooonId,
    String? brooonCode,
  }) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbBlockedBroooners
            .filter()
            .userIdEqualTo(StaticFunctions.userId)
            .and()
            .optional(
              brooonId != null,
              (q) => q.brooonIdEqualTo(brooonId!),
            )
            .and()
            .optional(
              brooonCode != null && brooonCode.trim().isNotEmpty,
              (q) => q.brooonCodeEqualTo(brooonCode!),
            )
            .deleteAll();
      },
    );
  }

  Future<Stream<void>> watchOnBlockedBrooonerChanges() async {
    final isar = await db;
    return await isar.dbBlockedBroooners.watchLazy();
  }

  Future<double> getUnitValueOf(int from, int to) async {
    final isar = await db;
    final DbAreaUnitValue? unit = await isar.dbAreaUnitValues
        .filter()
        .fromIdEqualTo(from)
        .toIdEqualTo(to)
        .findFirst();
    if (unit != null) {
      return unit.value;
    } else {
      final inverseUnit = await getUnitValueOf(to, from);
      return (1 / inverseUnit);
    }
  }

  Future<List<DbAreaUnitValue>> getUnitValues() async {
    final isar = await db;
    return await isar.dbAreaUnitValues.where().findAll();
  }

  Future<bool> isUsersPropertyEmpty(int userId) async {
    final isar = await db;
    return await isar.dbPropertys.filter().userIdEqualTo(userId).isEmpty();
  }

  Future<List<DbProperty>> getAllActiveProperties() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<DbProperty?> getPropertyByPropertyId(String propertyId) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .propertyIdEqualTo(propertyId)
        .sortByUpdatedAtDesc()
        .findFirst();
  }

  Future<DbProperty?> getPropertyById(int propertyId) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .idEqualTo(propertyId)
        .sortByUpdatedAtDesc()
        .findFirst();
  }

  Future<List<DbProperty>> getPropertyByIds(List<String> propertyIds) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .anyOf(
          propertyIds,
          (q, element) => q.propertyIdEqualTo(element),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<DbSavedFilter?> getInquiryByInquiryId(String inquiryId) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .inquiryIdEqualTo(inquiryId)
        .sortByUpdatedAtDesc()
        .findFirst();
  }

  Future<List<DbSavedFilter>> getInquiryByIds(List<String> inquiriesIds) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .isFromBuyerEqualTo(true)
        .and()
        .anyOf(
          inquiriesIds,
          (q, element) => q.inquiryIdEqualTo(element),
        )
        .findAll();
  }

  Future<String?> getLastAddedPropertyId() async {
    final isar = await db;
    final lastProperty = await isar.dbPropertys
        .filter()
        .sharedByBrooonEqualTo(false)
        .sortByAddedAtDesc()
        .findFirst();
    if (lastProperty != null) {
      return lastProperty.propertyId;
    }
    return null;
  }

  Future<String?> getLastAddedInquiryId() async {
    final isar = await db;
    final lastInquiry = await isar.dbSavedFilters
        .filter()
        .isFromBuyerEqualTo(true)
        .sortByAddedAtDesc()
        .findFirst();
    if (lastInquiry != null) {
      return lastInquiry.inquiryId;
    }
    return null;
  }

  Future<int> getLastPropertyId() async {
    final isar = await db;
    final lastProperty =
        await isar.dbPropertys.where().sortByAddedAtDesc().findFirst();
    if (lastProperty != null) {
      return lastProperty.id;
    }
    return 0;
  }

  Future<int> getLastInquiryId() async {
    final isar = await db;
    final lastInquiry =
        await isar.dbSavedFilters.where().sortByAddedAtDesc().findFirst();
    if (lastInquiry != null) {
      return lastInquiry.id;
    }
    return 0;
  }

  Future<List<DbProperty>> getPropertiesToSyncWithServer() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .isSyncedWithServerEqualTo(false)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbSavedFilter>> getInquiriesToSyncWithServer() async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .isSyncedWithServerEqualTo(false)
        .findAll();
  }

  Future<List<DbProperty>> getAllPropertiesByPropertyType(
    int propertyTypeId,
  ) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertyTypeIdEqualTo(propertyTypeId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getPropertiesByPropertyFor(int propertyFor) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertyForIdsElementEqualTo(propertyFor)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getAllSharedByBrooonsProperties() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(true)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getSharedByBrooonsPropertiesByPropertyFor(
      int propertyFor) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(true)
        .and()
        .propertyForIdsElementEqualTo(propertyFor)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<dynamic> getFilteredProperties({
    DbSavedFilter? filterToApply,
    required ViewAllFromType type,
    int? propertyTypeId,
    BuyerSellerInfo? buyerSellerInfo,
    bool showCountOnly = false,
    bool excludeUnmatched = false,
  }) async {
    final isar = await db;
    final bool isMultiTypePrice = filterToApply?.isFromBuyer ?? false;
    final minPriceValue = filterToApply?.sellPriceRangeMin;
    final maxPriceValue = filterToApply?.sellPriceRangeMax;

    final sellMinPriceValue = filterToApply?.sellPriceRangeMin;
    final sellMaxPriceValue = filterToApply?.sellPriceRangeMax;
    final rentMinPriceValue = filterToApply?.rentPriceRangeMin;
    final rentMaxPriceValue = filterToApply?.rentPriceRangeMax;
    final leaseMinPriceValue = filterToApply?.leasePriceRangeMin;
    final leaseMaxPriceValue = filterToApply?.leasePriceRangeMax;

    final query = isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .optional(
          excludeUnmatched &&
              filterToApply != null &&
              filterToApply.isFromBuyer &&
              filterToApply.unmatchProperties.isNotEmpty,
          (q) => q.allOf(
            filterToApply!.unmatchProperties,
            (q, element) => q.not().propertyIdEqualTo(element),
          ),
        )
        .and()
        .optional(
          //IF FROM SELLER
          type == ViewAllFromType.sellers && buyerSellerInfo != null,
          (q) => q.group(
            (q) => q
                .optional(
                    !AppConfig.showSellerListWithClosedProperties,
                    (q) => q.propertySoldStatusIdEqualTo(
                        SaveDefaultData.unSoldStatusId))
                .and()
                .optional(
                  buyerSellerInfo!.name != null &&
                      buyerSellerInfo.name!.trim().isNotEmpty,
                  (q) => q.sellerNameEqualTo(
                    buyerSellerInfo.name,
                  ),
                )
                .and()
                .optional(
                  buyerSellerInfo.phone != null &&
                      buyerSellerInfo.phone!.trim().isNotEmpty,
                  (q) => q.sellerPhoneNoEqualTo(
                    buyerSellerInfo.phone,
                  ),
                ),
          ),
        )
        .and()
        .optional(
          // IF FILTER & NOT A SOLD PROPERTY -> THEN SHOW UNSOLD & ACTIVE PROPERTIES
          type != ViewAllFromType.closedDeals && filterToApply != null,
          (q) => q.group(
            (q) => q
                .optional(
                  type == ViewAllFromType.sellers ||
                      type == ViewAllFromType.buyers ||
                      !filterToApply!.includeClosedProperty,
                  (q) => q.propertySoldStatusIdEqualTo(
                    SaveDefaultData.unSoldStatusId,
                  ),
                )
                .and()
                .optional(
                  //TODO: need to apply conditions for filterToApply.includeInactiveProperty with forceInActivePropertyNeedToShow flag.
                  // if Force InActive property need to show then don't include status id query
                  // currently used for customer properties only
                  type == ViewAllFromType.buyers ||
                      !filterToApply!.includeInactiveProperty,
                  (q) =>
                      q.propertyStatusIdEqualTo(SaveDefaultData.activeStatusId),
                ),
          ),
        )
        .and()
        .optional(
          // IF NEAR BY PROPERTIES -> SHOW UNSOLD & ACTIVE PROPERTIES
          type == ViewAllFromType.nearBy,
          (q) => q.group(
            (q) => q
                .optional(
                  filterToApply == null || !filterToApply.includeClosedProperty,
                  (q) => q.propertySoldStatusIdEqualTo(
                    SaveDefaultData.unSoldStatusId,
                  ),
                )
                .and()
                .optional(
                  filterToApply == null ||
                      !filterToApply.includeInactiveProperty,
                  (q) => q.propertyStatusIdEqualTo(
                    SaveDefaultData.activeStatusId,
                  ),
                )
                .and()
                .latitudeIsNotNull()
                .and()
                .longitudeIsNotNull(),
          ),
        )
        .and()
        .optional(
          // SHOW ONLY SOLD PROPERTIES -> NORMAL AND FILTER BOTH
          type == ViewAllFromType.closedDeals,
          (q) => q.propertySoldStatusIdEqualTo(SaveDefaultData.soldStatusId),
        )
        .optional(
          // SHOW ONLY InActive PROPERTIES -> NORMAL AND FILTER BOTH
          type == ViewAllFromType.inActives,
          (q) => q.group(
            (q) => q
                .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
                .and()
                .propertyStatusIdEqualTo(
                  SaveDefaultData.inActiveStatusId,
                ),
          ),
        )
        .and()
        .optional(
          // SHOW PROPERTIES (UNSOLD, ACTIVE) -> IF NOT FILTER
          type == ViewAllFromType.properties,
          (q) => q.group(
            (q) => q
                .optional(
                  propertyTypeId != null,
                  (q) => q.propertyTypeIdEqualTo(propertyTypeId!),
                )
                .and()
                .optional(
                  filterToApply == null || !filterToApply.includeClosedProperty,
                  (q) => q.propertySoldStatusIdEqualTo(
                    SaveDefaultData.unSoldStatusId,
                  ),
                )
                .and()
                .optional(
                  filterToApply == null ||
                      !filterToApply.includeInactiveProperty,
                  (q) => q.propertyStatusIdEqualTo(
                    SaveDefaultData.activeStatusId,
                  ),
                ),
          ),
        )
        .and()
        .optional(
          filterToApply != null,
          (q) => q.group(
            (q) => q
                .group(
                  (q) => q
                      .optional(
                        filterToApply!.propertyFor != null &&
                            filterToApply.propertyFor!.isNotEmpty,
                        (q) => q.anyOf(
                          filterToApply.propertyFor!,
                          (q, element) =>
                              q.propertyForIdsElementEqualTo(element),
                        ),
                      )
                      .and()
                      .optional(
                        filterToApply.propertyType != null &&
                            filterToApply.propertyType!.isNotEmpty,
                        (q) => q.anyOf(
                          filterToApply.propertyType!,
                          (q, element) => q.propertyTypeIdEqualTo(element),
                        ),
                      )
                      .and()
                      .optional(
                        isMultiTypePrice,
                        (q) => q.group(
                          (q) => q
                              .optional(
                                //If Sell is Selected from Filter
                                filterToApply.propertyFor != null &&
                                    filterToApply.propertyFor!.contains(
                                        SaveDefaultData.propertyForSellId) &&
                                    (sellMinPriceValue != null ||
                                        sellMaxPriceValue != null),
                                (q) => q.group(
                                  (q) => q //If Sell is selected in property
                                      .propertyForIdsElementEqualTo(
                                        SaveDefaultData.propertyForSellId,
                                      )
                                      .and()
                                      .group(
                                        //If any of min or max are given, otherwise ignore pricing query if no sell price is added in property.
                                        (q) => q
                                            .minSellPriceIsNotNull()
                                            .or()
                                            .maxSellPriceIsNotNull(),
                                      )
                                      .and()
                                      .group(
                                        (q) => q
                                            .group(
                                              (q) =>
                                                  q //min and max both are given in property
                                                      .group(
                                                        (q) => q
                                                            .minSellPriceIsNotNull()
                                                            .and()
                                                            .maxSellPriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ value
                                                        sellMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minSellPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minSellPriceGreaterThan(
                                                                      sellMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minSellPriceEqualTo(
                                                                      sellMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        sellMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .optional(
                                                                // maxPrice ≤ value
                                                                sellMinPriceValue !=
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .maxSellPriceIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .maxSellPriceLessThan(
                                                                              sellMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .maxSellPriceEqualTo(
                                                                              sellMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              )
                                                              .or()
                                                              .optional(
                                                                // minPrice ≤ maxValue
                                                                sellMinPriceValue ==
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .minSellPriceIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .minSellPriceLessThan(
                                                                              sellMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .minSellPriceEqualTo(
                                                                              sellMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only min is given in property
                                                      .group(
                                                        (q) => q
                                                            .maxSellPriceIsNull()
                                                            .and()
                                                            .minSellPriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ minValue
                                                        sellMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minSellPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minSellPriceGreaterThan(
                                                                      sellMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minSellPriceEqualTo(
                                                                      sellMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        sellMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minSellPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minSellPriceLessThan(
                                                                      sellMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minSellPriceEqualTo(
                                                                      sellMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only max is given in property
                                                      .group(
                                                        (q) => q
                                                            .minSellPriceIsNull()
                                                            .and()
                                                            .maxSellPriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≥ minValue
                                                        sellMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .maxSellPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .maxSellPriceGreaterThan(
                                                                      sellMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .maxSellPriceEqualTo(
                                                                      sellMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≤ maxValue
                                                        sellMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .maxSellPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .maxSellPriceLessThan(
                                                                      sellMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .maxSellPriceEqualTo(
                                                                      sellMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            ),
                                      ),
                                ),
                              )
                              .or()
                              .optional(
                                //If Rent is Selected from Filter
                                filterToApply.propertyFor != null &&
                                    filterToApply.propertyFor!.contains(
                                        SaveDefaultData.propertyForRentId) &&
                                    (rentMinPriceValue != null ||
                                        rentMaxPriceValue != null),
                                (q) => q.group(
                                  (q) => q
                                      //If Rent is selected in property
                                      .propertyForIdsElementEqualTo(
                                        SaveDefaultData.propertyForRentId,
                                      )
                                      .and()
                                      .group(
                                        //If any of min or max are given, otherwise ignore pricing query if no rent price is added in property.
                                        (q) => q
                                            .minRentPriceIsNotNull()
                                            .or()
                                            .maxRentPriceIsNotNull(),
                                      )
                                      .and()
                                      .group(
                                        (q) => q
                                            .group(
                                              (q) =>
                                                  q //min and max both are given in property
                                                      .group(
                                                        (q) => q
                                                            .minRentPriceIsNotNull()
                                                            .and()
                                                            .maxRentPriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ value
                                                        rentMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minRentPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minRentPriceGreaterThan(
                                                                      rentMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minRentPriceEqualTo(
                                                                      rentMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        rentMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .optional(
                                                                // maxPrice ≤ value
                                                                rentMinPriceValue !=
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .maxRentPriceIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .maxRentPriceLessThan(
                                                                              rentMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .maxRentPriceEqualTo(
                                                                              rentMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              )
                                                              .or()
                                                              .optional(
                                                                // minPrice ≤ maxValue
                                                                rentMinPriceValue ==
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .minRentPriceIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .minRentPriceLessThan(
                                                                              rentMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .minRentPriceEqualTo(
                                                                              rentMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only min is given in property
                                                      .group(
                                                        (q) => q
                                                            .maxRentPriceIsNull()
                                                            .and()
                                                            .minRentPriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ minValue
                                                        rentMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minRentPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minRentPriceGreaterThan(
                                                                      rentMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minRentPriceEqualTo(
                                                                      rentMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        rentMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minRentPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minRentPriceLessThan(
                                                                      rentMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minRentPriceEqualTo(
                                                                      rentMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only max is given in property
                                                      .group(
                                                        (q) => q
                                                            .minRentPriceIsNull()
                                                            .and()
                                                            .maxRentPriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≥ minValue
                                                        rentMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .maxRentPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .maxRentPriceGreaterThan(
                                                                      rentMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .maxRentPriceEqualTo(
                                                                      rentMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≤ maxValue
                                                        rentMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .maxRentPriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .maxRentPriceLessThan(
                                                                      rentMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .maxRentPriceEqualTo(
                                                                      rentMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            ),
                                      ),
                                ),
                              )
                              .or()
                              .optional(
                                //If Lease is Selected from Filter
                                filterToApply.propertyFor != null &&
                                    filterToApply.propertyFor!.contains(
                                        SaveDefaultData.propertyForLeaseId) &&
                                    (leaseMinPriceValue != null ||
                                        leaseMaxPriceValue != null),
                                (q) => q.group(
                                  (q) => q
                                      //If Lease is selected in property
                                      .propertyForIdsElementEqualTo(
                                        SaveDefaultData.propertyForLeaseId,
                                      )
                                      .and()
                                      .group(
                                        //If any of min or max are given, otherwise ignore pricing query if no lease price is added in property.
                                        (q) => q
                                            .minLeasePriceIsNotNull()
                                            .or()
                                            .maxLeasePriceIsNotNull(),
                                      )
                                      .and()
                                      .group(
                                        (q) => q
                                            .group(
                                              (q) =>
                                                  q //min and max both are given in property
                                                      .group(
                                                        (q) => q
                                                            .minLeasePriceIsNotNull()
                                                            .and()
                                                            .maxLeasePriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ value
                                                        leaseMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minLeasePriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minLeasePriceGreaterThan(
                                                                      leaseMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minLeasePriceEqualTo(
                                                                      leaseMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        leaseMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .optional(
                                                                // maxPrice ≤ value
                                                                leaseMinPriceValue !=
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .maxLeasePriceIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .maxLeasePriceLessThan(
                                                                              leaseMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .maxLeasePriceEqualTo(
                                                                              leaseMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              )
                                                              .or()
                                                              .optional(
                                                                // minPrice ≤ maxValue
                                                                leaseMinPriceValue ==
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .minLeasePriceIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .minLeasePriceLessThan(
                                                                              leaseMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .minLeasePriceEqualTo(
                                                                              leaseMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only min is given in property
                                                      .group(
                                                        (q) => q
                                                            .maxLeasePriceIsNull()
                                                            .and()
                                                            .minLeasePriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ minValue
                                                        leaseMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minLeasePriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minLeasePriceGreaterThan(
                                                                      leaseMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minLeasePriceEqualTo(
                                                                      leaseMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        leaseMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .minLeasePriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .minLeasePriceLessThan(
                                                                      leaseMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .minLeasePriceEqualTo(
                                                                      leaseMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only max is given in property
                                                      .group(
                                                        (q) => q
                                                            .minLeasePriceIsNull()
                                                            .and()
                                                            .maxLeasePriceIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≥ minValue
                                                        leaseMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .maxLeasePriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .maxLeasePriceGreaterThan(
                                                                      leaseMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .maxLeasePriceEqualTo(
                                                                      leaseMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≤ maxValue
                                                        leaseMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .maxLeasePriceIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .maxLeasePriceLessThan(
                                                                      leaseMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .maxLeasePriceEqualTo(
                                                                      leaseMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            ),
                                      ),
                                ),
                              ),
                        ),
                      )
                      .and()
                      .optional(
                        !isMultiTypePrice &&
                            (minPriceValue != null || maxPriceValue != null),
                        (q) => q.group(
                          (q) => q
                              .group(
                                //If any of min or max are given, otherwise ignore pricing query if no price is added in property.
                                (q) => q
                                    .group(
                                      (q) => q
                                          .minSellPriceIsNotNull()
                                          .or()
                                          .maxSellPriceIsNotNull(),
                                    )
                                    .or()
                                    .group(
                                      (q) => q
                                          .minRentPriceIsNotNull()
                                          .or()
                                          .maxRentPriceIsNotNull(),
                                    )
                                    .or()
                                    .group(
                                      (q) => q
                                          .minLeasePriceIsNotNull()
                                          .or()
                                          .maxLeasePriceIsNotNull(),
                                    ),
                              )
                              .and()
                              .group(
                                (q) => q
                                    .group(
                                      (q) =>
                                          q //min and max both are given in property
                                              .group(
                                                (q) => q
                                                    .group(
                                                      (q) => q
                                                          .minSellPriceIsNotNull()
                                                          .and()
                                                          .maxSellPriceIsNotNull(),
                                                    )
                                                    .or()
                                                    .group(
                                                      (q) => q
                                                          .minRentPriceIsNotNull()
                                                          .and()
                                                          .maxRentPriceIsNotNull(),
                                                    )
                                                    .or()
                                                    .group(
                                                      (q) => q
                                                          .minLeasePriceIsNotNull()
                                                          .and()
                                                          .maxLeasePriceIsNotNull(),
                                                    ),
                                              )
                                              .and()
                                              .optional(
                                                // minPrice ≥ value
                                                minPriceValue != null,
                                                (q) => q.group(
                                                  (q) => q
                                                      .group(
                                                        (q) => q //if min sell price is not null
                                                            .minSellPriceIsNotNull()
                                                            .and()
                                                            .group(
                                                              (q) => q
                                                                  .minSellPriceGreaterThan(
                                                                    minPriceValue,
                                                                  )
                                                                  .or()
                                                                  .minSellPriceEqualTo(
                                                                    minPriceValue,
                                                                  ),
                                                            ),
                                                      )
                                                      .or()
                                                      .group(
                                                        (q) => q //if min rent price is not null
                                                            .minRentPriceIsNotNull()
                                                            .and()
                                                            .group(
                                                              (q) => q
                                                                  .minRentPriceGreaterThan(
                                                                    minPriceValue,
                                                                  )
                                                                  .or()
                                                                  .minRentPriceEqualTo(
                                                                    minPriceValue,
                                                                  ),
                                                            ),
                                                      )
                                                      .or()
                                                      .group(
                                                        (q) => q //if min lease price is not null
                                                            .minLeasePriceIsNotNull()
                                                            .and()
                                                            .group(
                                                              (q) => q
                                                                  .minLeasePriceGreaterThan(
                                                                    minPriceValue,
                                                                  )
                                                                  .or()
                                                                  .minLeasePriceEqualTo(
                                                                    minPriceValue,
                                                                  ),
                                                            ),
                                                      ),
                                                ),
                                              )
                                              .and()
                                              .optional(
                                                maxPriceValue != null,
                                                (q) => q.group(
                                                  (q) => q
                                                      .optional(
                                                        // maxPrice ≤ value
                                                        minPriceValue != null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .group(
                                                                (q) => q //if max sell price is not null
                                                                    .maxSellPriceIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .maxSellPriceLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .maxSellPriceEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if max rent price is not null
                                                                    .maxRentPriceIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .maxRentPriceLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .maxRentPriceEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if max lease price is not null
                                                                    .maxLeasePriceIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .maxLeasePriceLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .maxLeasePriceEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .or()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        minPriceValue == null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .group(
                                                                (q) => q //if min sell price is not null
                                                                    .minSellPriceIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .minSellPriceLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .minSellPriceEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if min rent price is not null
                                                                    .minRentPriceIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .minRentPriceLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .minRentPriceEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if min lease price is not null
                                                                    .minLeasePriceIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .minLeasePriceLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .minLeasePriceEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                                ),
                                              ),
                                    )
                                    .or()
                                    .group(
                                      (q) => q //only min is given in property
                                          .group(
                                            (q) => q
                                                .group(
                                                  (q) => q
                                                      .maxSellPriceIsNull()
                                                      .and()
                                                      .minSellPriceIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .maxRentPriceIsNull()
                                                      .and()
                                                      .minRentPriceIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .maxLeasePriceIsNull()
                                                      .and()
                                                      .minLeasePriceIsNotNull(),
                                                ),
                                          )
                                          .and()
                                          .optional(
                                            // minPrice ≥ minValue
                                            minPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if min sell price is not null
                                                        .minSellPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .minSellPriceGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .minSellPriceEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min rent price is not null
                                                        .minRentPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .minRentPriceGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .minRentPriceEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min lease price is not null
                                                        .minLeasePriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .minLeasePriceGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .minLeasePriceEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          )
                                          .and()
                                          .optional(
                                            // minPrice ≤ maxValue
                                            maxPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if min sell price is not null
                                                        .minSellPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .minSellPriceLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .minSellPriceEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min rent price is not null
                                                        .minRentPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .minRentPriceLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .minRentPriceEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min lease price is not null
                                                        .minLeasePriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .minLeasePriceLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .minLeasePriceEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          ),
                                    )
                                    .or()
                                    .group(
                                      (q) => q //only max is given in property
                                          .group(
                                            (q) => q
                                                .group(
                                                  (q) => q
                                                      .minSellPriceIsNull()
                                                      .and()
                                                      .maxSellPriceIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .minRentPriceIsNull()
                                                      .and()
                                                      .maxRentPriceIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .minLeasePriceIsNull()
                                                      .and()
                                                      .maxLeasePriceIsNotNull(),
                                                ),
                                          )
                                          .and()
                                          .optional(
                                            // maxPrice ≥ minValue
                                            minPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if max sell price is not null
                                                        .maxSellPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .maxSellPriceGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .maxSellPriceEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max rent price is not null
                                                        .maxRentPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .maxRentPriceGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .maxRentPriceEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max lease price is not null
                                                        .maxLeasePriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .maxLeasePriceGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .maxLeasePriceEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          )
                                          .and()
                                          .optional(
                                            // maxPrice ≤ maxValue
                                            maxPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if max sell price is not null
                                                        .maxSellPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .maxSellPriceLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .maxSellPriceEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max rent price is not null
                                                        .maxRentPriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .maxRentPriceLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .maxRentPriceEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max lease price is not null
                                                        .maxLeasePriceIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .maxLeasePriceLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .maxLeasePriceEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          ),
                                    ),
                              ),
                        ),
                      ),
                )
                .and()
                .optional(
                  filterToApply!.measureUnit != null &&
                      (filterToApply.minMeasure != null ||
                          filterToApply.maxMeasure != null),
                  (q) => q.group(
                    (q) => q
                        .propertyAreaUnitIdIsNotNull()
                        .and()
                        .propertyAreaUnitIdEqualTo(filterToApply.measureUnit)
                        .and()
                        .propertyAreaSizeIsNotNull()
                        .and()
                        .optional(
                          filterToApply.minMeasure != null,
                          (q) => q.group(
                            (q) => q
                                .propertyAreaSizeGreaterThan(
                                  filterToApply.minMeasure,
                                )
                                .or()
                                .propertyAreaSizeEqualTo(
                                  filterToApply.minMeasure,
                                ),
                          ),
                        )
                        .and()
                        .optional(
                          filterToApply.maxMeasure != null,
                          (q) => q.group(
                            (q) => q
                                .propertyAreaSizeLessThan(
                                  filterToApply.maxMeasure,
                                )
                                .or()
                                .propertyAreaSizeEqualTo(
                                  filterToApply.maxMeasure,
                                ),
                          ),
                        ),
                  ),
                )
                .and()
                .optional(
                  filterToApply.constructionType != null &&
                      filterToApply.constructionType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.constructionType!,
                    (q, element) => q.constructionTypeIdEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.schemeType != null &&
                      filterToApply.schemeType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.schemeType!,
                    (q, element) => q.schemeTypeIdEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.furnishedType != null &&
                      filterToApply.furnishedType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.furnishedType!,
                    (q, element) => q.propertyFurnishedStatusIdEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.bathroomCount != null &&
                      filterToApply.bathroomCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .bathRoomCountEqualTo(filterToApply.bathroomCount!)
                        .or()
                        .bathRoomCountGreaterThan(filterToApply.bathroomCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.roomCount != null &&
                      filterToApply.roomCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .roomCountEqualTo(filterToApply.roomCount!)
                        .or()
                        .roomCountGreaterThan(filterToApply.roomCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.floorCount != null &&
                      filterToApply.floorCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .floorCountEqualTo(filterToApply.floorCount!)
                        .or()
                        .floorCountGreaterThan(filterToApply.floorCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.totalFloorCount != null &&
                      filterToApply.totalFloorCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .totalFloorCountEqualTo(filterToApply.totalFloorCount!)
                        .or()
                        .totalFloorCountGreaterThan(
                            filterToApply.totalFloorCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.frontSize != null,
                  (q) => q.group(
                    (q) => q
                        .frontSizeEqualTo(filterToApply.frontSize!)
                        .or()
                        .frontSizeGreaterThan(filterToApply.frontSize!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.depthSize != null,
                  (q) => q.group(
                    (q) => q
                        .depthSizeEqualTo(filterToApply.depthSize!)
                        .or()
                        .depthSizeGreaterThan(filterToApply.depthSize!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.buildingType != null &&
                      filterToApply.buildingType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.buildingType!,
                    (q, element) => q.buildingTypeIdEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.bhkIds != null &&
                      filterToApply.bhkIds!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.bhkIds!,
                    (q, element) => q.bhkIdEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.facingType != null &&
                      filterToApply.facingType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.facingType!,
                    (q, element) => q.facingIdEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.connectedRoads != null &&
                      filterToApply.connectedRoads!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.connectedRoads!,
                    (q, element) => q.group(
                      (q) => q
                          .connectedRoadsElementEqualTo(element)
                          .or()
                          .connectedRoadsElementGreaterThan(element),
                    ),
                  ),
                )
                .and()
                .optional(
                  filterToApply.isWashroomAvailable != null,
                  (q) => q.isWashRoomAvailableEqualTo(
                    filterToApply.isWashroomAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isBalconyAvailable != null,
                  (q) => q.balconyEqualTo(
                    filterToApply.isBalconyAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isCornerPiece != null,
                  (q) => q.isCornerPieceEqualTo(
                    filterToApply.isCornerPiece!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isLightConnectionAvailable != null,
                  (q) => q.lightConnectionEqualTo(
                    filterToApply.isLightConnectionAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isWellAvailable != null,
                  (q) => q.isWellAvailableEqualTo(
                    filterToApply.isWellAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isAllottedParkingAvailable != null,
                  (q) => q.isAllottedParkingEqualTo(
                    filterToApply.isAllottedParkingAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isParkingAvailable != null,
                  (q) => q.isParkingAvailableEqualTo(
                    filterToApply.isParkingAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isLiftAvailable != null,
                  (q) => q.isLiftAvailableEqualTo(
                    filterToApply.isLiftAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.selectedAmenities != null &&
                      filterToApply.selectedAmenities!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.selectedAmenities!,
                    (q, element) => q.amenitiesValuesElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.additionalFurnish != null &&
                      filterToApply.additionalFurnish!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.additionalFurnish!,
                    (q, element) =>
                        q.additionalFurnishingElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.preferredCaste != null &&
                      filterToApply.preferredCaste!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.preferredCaste!,
                    (q, element) =>
                        q.preferredCommunityValuesElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  AppConfig.shouldApplyStringQueryForLocal &&
                      filterToApply.stringQuery != null &&
                      filterToApply.stringQuery!.trim().isNotEmpty,
                  (q) => q.group(
                    (q) => q
                        .propertyNameContains(
                          filterToApply.stringQuery!,
                          caseSensitive: false,
                        )
                        .or()
                        .propertyForValuesElementContains(
                          filterToApply.stringQuery!,
                          caseSensitive: false,
                        )
                        .or()
                        .propertyTypeValueContains(
                          filterToApply.stringQuery!,
                          caseSensitive: false,
                        )
                        .or()
                        .group(
                          (q) => q
                              .areaIsNotNull()
                              .and()
                              .areaIsNotEmpty()
                              .and()
                              .areaContains(
                                filterToApply.stringQuery!,
                                caseSensitive: false,
                              ),
                        )
                        .or()
                        .group(
                          (q) => q
                              .sellerNameIsNotNull()
                              .and()
                              .sellerNameIsNotEmpty()
                              .and()
                              .sellerNameContains(
                                filterToApply.stringQuery!,
                                caseSensitive: false,
                              ),
                        )
                        .or()
                        .group(
                          (q) => q
                              .brooonNameIsNotNull()
                              .and()
                              .brooonNameIsNotEmpty()
                              .and()
                              .brooonNameContains(
                                filterToApply.stringQuery!,
                                caseSensitive: false,
                              ),
                        )
                        .or()
                        .group(
                          (q) => q
                              .tagsIsNotNull()
                              .and()
                              .tagsIsNotEmpty()
                              .and()
                              .tagsElementContains(
                                filterToApply.stringQuery!,
                                caseSensitive: false,
                              ),
                        ),
                  ),
                ),
          ),
        )
        .sortByUpdatedAtDesc();
    return await (!showCountOnly ? query.findAll() : query.count());
  }

  Future<dynamic> getFilteredInquiries({
    DbSavedFilter? filterToApply,
    required ViewAllFromType type,
    int? propertyTypeId,
    BuyerSellerInfo? buyerSellerInfo,
    bool showCountOnly = false,
  }) async {
    final isar = await db;
    final bool isMultiTypePrice = filterToApply?.isFromBuyer ?? false;
    final minPriceValue = filterToApply?.sellPriceRangeMin;
    final maxPriceValue = filterToApply?.sellPriceRangeMax;

    final sellMinPriceValue = filterToApply?.sellPriceRangeMin;
    final sellMaxPriceValue = filterToApply?.sellPriceRangeMax;
    final rentMinPriceValue = filterToApply?.rentPriceRangeMin;
    final rentMaxPriceValue = filterToApply?.rentPriceRangeMax;
    final leaseMinPriceValue = filterToApply?.leasePriceRangeMin;
    final leaseMaxPriceValue = filterToApply?.leasePriceRangeMax;

    final query = isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .optional(
          //IF FROM SELLER
          type == ViewAllFromType.sellers && buyerSellerInfo != null,
          (q) => q.group(
            (q) => q
                .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
                .and()
                .optional(
                  buyerSellerInfo!.name != null &&
                      buyerSellerInfo.name!.trim().isNotEmpty,
                  (q) => q.buyerNameEqualTo(buyerSellerInfo.name!),
                )
                .and()
                .optional(
                  buyerSellerInfo.phone != null &&
                      buyerSellerInfo.phone!.trim().isNotEmpty,
                  (q) => q.mobileNoEqualTo(buyerSellerInfo.phone!),
                ),
          ),
        )
        .and()
        .optional(
          // IF FILTER & NOT A SOLD Inquiry -> THEN SHOW UNSOLD & ACTIVE INQUIRIES
          type != ViewAllFromType.closedDeals && filterToApply != null,
          (q) => q.group(
            (q) => q
                .optional(
                  type == ViewAllFromType.sellers ||
                      type == ViewAllFromType.buyers ||
                      !filterToApply!.includeClosedProperty,
                  (q) => q.inquirySoldStatusIdEqualTo(
                    SaveDefaultData.unSoldStatusId,
                  ),
                )
                .and()
                .optional(
                  //TODO: need to apply conditions for filterToApply.includeInactiveProperty with forceInActivePropertyNeedToShow flag.
                  // if Force InActive Inquiry need to show then don't include status id query
                  // currently used for customer Inquiries only
                  type == ViewAllFromType.buyers ||
                      !filterToApply!.includeInactiveProperty,
                  (q) =>
                      q.inquiryStatusIdEqualTo(SaveDefaultData.activeStatusId),
                ),
          ),
        )
        .and()
        .optional(
          // IF NEAR BY INQUIRIES -> SHOW UNSOLD & ACTIVE INQUIRIES
          type == ViewAllFromType.nearBy,
          (q) => q.group(
            (q) => q
                .optional(
                  filterToApply == null || !filterToApply.includeClosedProperty,
                  (q) => q.inquirySoldStatusIdEqualTo(
                    SaveDefaultData.unSoldStatusId,
                  ),
                )
                .and()
                .optional(
                  filterToApply == null ||
                      !filterToApply.includeInactiveProperty,
                  (q) => q.inquiryStatusIdEqualTo(
                    SaveDefaultData.activeStatusId,
                  ),
                )
                .and()
                .latitudeIsNotNull()
                .and()
                .longitudeIsNotNull(),
          ),
        )
        .and()
        .optional(
          // SHOW ONLY SOLD INQUIRIES -> NORMAL AND FILTER BOTH
          type == ViewAllFromType.closedDeals,
          (q) => q.inquirySoldStatusIdEqualTo(SaveDefaultData.soldStatusId),
        )
        .optional(
          // SHOW ONLY InActive INQUIRIES -> NORMAL AND FILTER BOTH
          type == ViewAllFromType.inActives,
          (q) => q.group(
            (q) => q
                .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
                .and()
                .inquiryStatusIdEqualTo(
                  SaveDefaultData.inActiveStatusId,
                ),
          ),
        )
        .and()
        .optional(
          // SHOW INQUIRIES (UNSOLD, ACTIVE) -> IF NOT FILTER
          type == ViewAllFromType.properties,
          (q) => q.group(
            (q) => q
                .optional(
                  propertyTypeId != null,
                  (q) => q.propertyTypeElementEqualTo(propertyTypeId!),
                )
                .and()
                .optional(
                  filterToApply == null || !filterToApply.includeClosedProperty,
                  (q) => q.inquirySoldStatusIdEqualTo(
                    SaveDefaultData.unSoldStatusId,
                  ),
                )
                .and()
                .optional(
                  filterToApply == null ||
                      !filterToApply.includeInactiveProperty,
                  (q) => q.inquiryStatusIdEqualTo(
                    SaveDefaultData.activeStatusId,
                  ),
                ),
          ),
        )
        .and()
        .optional(
          filterToApply != null,
          (q) => q.group(
            (q) => q
                .group(
                  (q) => q
                      .optional(
                        filterToApply!.propertyFor != null &&
                            filterToApply.propertyFor!.isNotEmpty,
                        (q) => q.anyOf(
                          filterToApply.propertyFor!,
                          (q, element) => q.propertyForElementEqualTo(element),
                        ),
                      )
                      .and()
                      .optional(
                        filterToApply.propertyType != null &&
                            filterToApply.propertyType!.isNotEmpty,
                        (q) => q.anyOf(
                          filterToApply.propertyType!,
                          (q, element) => q.propertyTypeElementEqualTo(element),
                        ),
                      )
                      .and()
                      .optional(
                        isMultiTypePrice,
                        (q) => q.group(
                          (q) => q
                              .optional(
                                //If Sell is Selected from Filter
                                filterToApply.propertyFor != null &&
                                    filterToApply.propertyFor!.contains(
                                        SaveDefaultData.propertyForSellId) &&
                                    (sellMinPriceValue != null ||
                                        sellMaxPriceValue != null),
                                (q) => q.group(
                                  (q) => q //If Sell is selected in inquiry
                                      .propertyForElementEqualTo(
                                        SaveDefaultData.propertyForSellId,
                                      )
                                      .and()
                                      .group(
                                        //If any of min or max are given, otherwise ignore pricing query if no sell price is added in inquiry.
                                        (q) => q
                                            .sellPriceRangeMinIsNotNull()
                                            .or()
                                            .sellPriceRangeMaxIsNotNull(),
                                      )
                                      .and()
                                      .group(
                                        (q) => q
                                            .group(
                                              (q) =>
                                                  q //min and max both are given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .sellPriceRangeMinIsNotNull()
                                                            .and()
                                                            .sellPriceRangeMaxIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ value
                                                        sellMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .sellPriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .sellPriceRangeMinGreaterThan(
                                                                      sellMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .sellPriceRangeMinEqualTo(
                                                                      sellMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        sellMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .optional(
                                                                // maxPrice ≤ value
                                                                sellMinPriceValue !=
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .sellPriceRangeMaxIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .sellPriceRangeMaxLessThan(
                                                                              sellMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .sellPriceRangeMaxEqualTo(
                                                                              sellMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              )
                                                              .or()
                                                              .optional(
                                                                // minPrice ≤ maxValue
                                                                sellMinPriceValue ==
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .sellPriceRangeMinIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .sellPriceRangeMinLessThan(
                                                                              sellMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .sellPriceRangeMinEqualTo(
                                                                              sellMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only min is given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .sellPriceRangeMaxIsNull()
                                                            .and()
                                                            .sellPriceRangeMinIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ minValue
                                                        sellMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .sellPriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .sellPriceRangeMinGreaterThan(
                                                                      sellMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .sellPriceRangeMinEqualTo(
                                                                      sellMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        sellMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .sellPriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .sellPriceRangeMinLessThan(
                                                                      sellMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .sellPriceRangeMinEqualTo(
                                                                      sellMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only max is given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .sellPriceRangeMinIsNull()
                                                            .and()
                                                            .sellPriceRangeMaxIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≥ minValue
                                                        sellMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .sellPriceRangeMaxIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .sellPriceRangeMaxGreaterThan(
                                                                      sellMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .sellPriceRangeMaxEqualTo(
                                                                      sellMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≤ maxValue
                                                        sellMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .sellPriceRangeMaxIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .sellPriceRangeMaxLessThan(
                                                                      sellMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .sellPriceRangeMaxEqualTo(
                                                                      sellMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            ),
                                      ),
                                ),
                              )
                              .or()
                              .optional(
                                //If Rent is Selected from Filter
                                filterToApply.propertyFor != null &&
                                    filterToApply.propertyFor!.contains(
                                        SaveDefaultData.propertyForRentId) &&
                                    (rentMinPriceValue != null ||
                                        rentMaxPriceValue != null),
                                (q) => q.group(
                                  (q) => q
                                      //If Rent is selected in property
                                      .propertyForElementEqualTo(
                                        SaveDefaultData.propertyForRentId,
                                      )
                                      .and()
                                      .group(
                                        //If any of min or max are given, otherwise ignore pricing query if no rent price is added in property.
                                        (q) => q
                                            .rentPriceRangeMinIsNotNull()
                                            .or()
                                            .rentPriceRangeMaxIsNotNull(),
                                      )
                                      .and()
                                      .group(
                                        (q) => q
                                            .group(
                                              (q) =>
                                                  q //min and max both are given in property
                                                      .group(
                                                        (q) => q
                                                            .rentPriceRangeMinIsNotNull()
                                                            .and()
                                                            .rentPriceRangeMaxIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ value
                                                        rentMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .rentPriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .rentPriceRangeMinGreaterThan(
                                                                      rentMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .rentPriceRangeMinEqualTo(
                                                                      rentMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        rentMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .optional(
                                                                // maxPrice ≤ value
                                                                rentMinPriceValue !=
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .rentPriceRangeMaxIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .rentPriceRangeMaxLessThan(
                                                                              rentMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .rentPriceRangeMaxEqualTo(
                                                                              rentMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              )
                                                              .or()
                                                              .optional(
                                                                // minPrice ≤ maxValue
                                                                rentMinPriceValue ==
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .rentPriceRangeMinIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .rentPriceRangeMinLessThan(
                                                                              rentMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .rentPriceRangeMinEqualTo(
                                                                              rentMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only min is given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .rentPriceRangeMaxIsNull()
                                                            .and()
                                                            .rentPriceRangeMinIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ minValue
                                                        rentMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .rentPriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .rentPriceRangeMinGreaterThan(
                                                                      rentMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .rentPriceRangeMinEqualTo(
                                                                      rentMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        rentMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .rentPriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .rentPriceRangeMinLessThan(
                                                                      rentMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .rentPriceRangeMinEqualTo(
                                                                      rentMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only max is given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .rentPriceRangeMinIsNull()
                                                            .and()
                                                            .rentPriceRangeMaxIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≥ minValue
                                                        rentMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .rentPriceRangeMaxIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .rentPriceRangeMaxGreaterThan(
                                                                      rentMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .rentPriceRangeMaxEqualTo(
                                                                      rentMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≤ maxValue
                                                        rentMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .rentPriceRangeMaxIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .rentPriceRangeMaxLessThan(
                                                                      rentMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .rentPriceRangeMaxEqualTo(
                                                                      rentMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            ),
                                      ),
                                ),
                              )
                              .or()
                              .optional(
                                //If Lease is Selected from Filter
                                filterToApply.propertyFor != null &&
                                    filterToApply.propertyFor!.contains(
                                        SaveDefaultData.propertyForLeaseId) &&
                                    (leaseMinPriceValue != null ||
                                        leaseMaxPriceValue != null),
                                (q) => q.group(
                                  (q) => q
                                      //If Lease is selected in property
                                      .propertyForElementEqualTo(
                                        SaveDefaultData.propertyForLeaseId,
                                      )
                                      .and()
                                      .group(
                                        //If any of min or max are given, otherwise ignore pricing query if no lease price is added in inquiry.
                                        (q) => q
                                            .leasePriceRangeMinIsNotNull()
                                            .or()
                                            .leasePriceRangeMaxIsNotNull(),
                                      )
                                      .and()
                                      .group(
                                        (q) => q
                                            .group(
                                              (q) =>
                                                  q //min and max both are given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .leasePriceRangeMinIsNotNull()
                                                            .and()
                                                            .leasePriceRangeMaxIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ value
                                                        leaseMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .leasePriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .leasePriceRangeMinGreaterThan(
                                                                      leaseMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .leasePriceRangeMinEqualTo(
                                                                      leaseMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        leaseMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .optional(
                                                                // maxPrice ≤ value
                                                                leaseMinPriceValue !=
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .leasePriceRangeMaxIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .leasePriceRangeMaxLessThan(
                                                                              leaseMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .leasePriceRangeMaxEqualTo(
                                                                              leaseMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              )
                                                              .or()
                                                              .optional(
                                                                // minPrice ≤ maxValue
                                                                leaseMinPriceValue ==
                                                                    null,
                                                                (q) => q.group(
                                                                  (q) => q
                                                                      .leasePriceRangeMinIsNotNull()
                                                                      .and()
                                                                      .group(
                                                                        (q) => q
                                                                            .leasePriceRangeMinLessThan(
                                                                              leaseMaxPriceValue,
                                                                            )
                                                                            .or()
                                                                            .leasePriceRangeMinEqualTo(
                                                                              leaseMaxPriceValue,
                                                                            ),
                                                                      ),
                                                                ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only min is given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .leasePriceRangeMaxIsNull()
                                                            .and()
                                                            .leasePriceRangeMinIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≥ minValue
                                                        leaseMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .leasePriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .leasePriceRangeMinGreaterThan(
                                                                      leaseMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .leasePriceRangeMinEqualTo(
                                                                      leaseMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        leaseMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .leasePriceRangeMinIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .leasePriceRangeMinLessThan(
                                                                      leaseMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .leasePriceRangeMinEqualTo(
                                                                      leaseMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            )
                                            .or()
                                            .group(
                                              (q) =>
                                                  q //only max is given in inquiry
                                                      .group(
                                                        (q) => q
                                                            .leasePriceRangeMinIsNull()
                                                            .and()
                                                            .leasePriceRangeMaxIsNotNull(),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≥ minValue
                                                        leaseMinPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .leasePriceRangeMaxIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .leasePriceRangeMaxGreaterThan(
                                                                      leaseMinPriceValue,
                                                                    )
                                                                    .or()
                                                                    .leasePriceRangeMaxEqualTo(
                                                                      leaseMinPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .and()
                                                      .optional(
                                                        // maxPrice ≤ maxValue
                                                        leaseMaxPriceValue !=
                                                            null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .leasePriceRangeMaxIsNotNull()
                                                              .and()
                                                              .group(
                                                                (q) => q
                                                                    .leasePriceRangeMaxLessThan(
                                                                      leaseMaxPriceValue,
                                                                    )
                                                                    .or()
                                                                    .leasePriceRangeMaxEqualTo(
                                                                      leaseMaxPriceValue,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                            ),
                                      ),
                                ),
                              ),
                        ),
                      )
                      .and()
                      .optional(
                        !isMultiTypePrice &&
                            (minPriceValue != null || maxPriceValue != null),
                        (q) => q.group(
                          (q) => q
                              .group(
                                //If any of min or max are given, otherwise ignore pricing query if no price is added in inquiry.
                                (q) => q
                                    .group(
                                      (q) => q
                                          .sellPriceRangeMinIsNotNull()
                                          .or()
                                          .sellPriceRangeMaxIsNotNull(),
                                    )
                                    .or()
                                    .group(
                                      (q) => q
                                          .rentPriceRangeMinIsNotNull()
                                          .or()
                                          .rentPriceRangeMaxIsNotNull(),
                                    )
                                    .or()
                                    .group(
                                      (q) => q
                                          .leasePriceRangeMinIsNotNull()
                                          .or()
                                          .leasePriceRangeMaxIsNotNull(),
                                    ),
                              )
                              .and()
                              .group(
                                (q) => q
                                    .group(
                                      (q) =>
                                          q //min and max both are given in inquiry
                                              .group(
                                                (q) => q
                                                    .group(
                                                      (q) => q
                                                          .sellPriceRangeMinIsNotNull()
                                                          .and()
                                                          .sellPriceRangeMaxIsNotNull(),
                                                    )
                                                    .or()
                                                    .group(
                                                      (q) => q
                                                          .rentPriceRangeMinIsNotNull()
                                                          .and()
                                                          .rentPriceRangeMaxIsNotNull(),
                                                    )
                                                    .or()
                                                    .group(
                                                      (q) => q
                                                          .leasePriceRangeMinIsNotNull()
                                                          .and()
                                                          .leasePriceRangeMaxIsNotNull(),
                                                    ),
                                              )
                                              .and()
                                              .optional(
                                                // minPrice ≥ value
                                                minPriceValue != null,
                                                (q) => q.group(
                                                  (q) => q
                                                      .group(
                                                        (q) => q //if min sell price is not null
                                                            .sellPriceRangeMinIsNotNull()
                                                            .and()
                                                            .group(
                                                              (q) => q
                                                                  .sellPriceRangeMinGreaterThan(
                                                                    minPriceValue,
                                                                  )
                                                                  .or()
                                                                  .sellPriceRangeMinEqualTo(
                                                                    minPriceValue,
                                                                  ),
                                                            ),
                                                      )
                                                      .or()
                                                      .group(
                                                        (q) => q //if min rent price is not null
                                                            .rentPriceRangeMinIsNotNull()
                                                            .and()
                                                            .group(
                                                              (q) => q
                                                                  .rentPriceRangeMinGreaterThan(
                                                                    minPriceValue,
                                                                  )
                                                                  .or()
                                                                  .rentPriceRangeMinEqualTo(
                                                                    minPriceValue,
                                                                  ),
                                                            ),
                                                      )
                                                      .or()
                                                      .group(
                                                        (q) => q //if min lease price is not null
                                                            .leasePriceRangeMinIsNotNull()
                                                            .and()
                                                            .group(
                                                              (q) => q
                                                                  .leasePriceRangeMinGreaterThan(
                                                                    minPriceValue,
                                                                  )
                                                                  .or()
                                                                  .leasePriceRangeMinEqualTo(
                                                                    minPriceValue,
                                                                  ),
                                                            ),
                                                      ),
                                                ),
                                              )
                                              .and()
                                              .optional(
                                                maxPriceValue != null,
                                                (q) => q.group(
                                                  (q) => q
                                                      .optional(
                                                        // maxPrice ≤ value
                                                        minPriceValue != null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .group(
                                                                (q) => q //if max sell price is not null
                                                                    .sellPriceRangeMaxIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .sellPriceRangeMaxLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .sellPriceRangeMaxEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if max rent price is not null
                                                                    .rentPriceRangeMaxIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .rentPriceRangeMaxLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .rentPriceRangeMaxEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if max lease price is not null
                                                                    .leasePriceRangeMaxIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .leasePriceRangeMaxLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .leasePriceRangeMaxEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              ),
                                                        ),
                                                      )
                                                      .or()
                                                      .optional(
                                                        // minPrice ≤ maxValue
                                                        minPriceValue == null,
                                                        (q) => q.group(
                                                          (q) => q
                                                              .group(
                                                                (q) => q //if min sell price is not null
                                                                    .sellPriceRangeMinIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .sellPriceRangeMinLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .sellPriceRangeMinEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if min rent price is not null
                                                                    .rentPriceRangeMinIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .rentPriceRangeMinLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .rentPriceRangeMinEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              )
                                                              .or()
                                                              .group(
                                                                (q) => q //if min lease price is not null
                                                                    .leasePriceRangeMinIsNotNull()
                                                                    .and()
                                                                    .group(
                                                                      (q) => q
                                                                          .leasePriceRangeMinLessThan(
                                                                            maxPriceValue,
                                                                          )
                                                                          .or()
                                                                          .leasePriceRangeMinEqualTo(
                                                                            maxPriceValue,
                                                                          ),
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                                ),
                                              ),
                                    )
                                    .or()
                                    .group(
                                      (q) => q //only min is given in inquiry
                                          .group(
                                            (q) => q
                                                .group(
                                                  (q) => q
                                                      .sellPriceRangeMaxIsNull()
                                                      .and()
                                                      .sellPriceRangeMinIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .rentPriceRangeMaxIsNull()
                                                      .and()
                                                      .rentPriceRangeMinIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .leasePriceRangeMaxIsNull()
                                                      .and()
                                                      .leasePriceRangeMinIsNotNull(),
                                                ),
                                          )
                                          .and()
                                          .optional(
                                            // minPrice ≥ minValue
                                            minPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if min sell price is not null
                                                        .sellPriceRangeMinIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .sellPriceRangeMinGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .sellPriceRangeMinEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min rent price is not null
                                                        .rentPriceRangeMinIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .rentPriceRangeMinGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .rentPriceRangeMinEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min lease price is not null
                                                        .leasePriceRangeMinIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .leasePriceRangeMinGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .leasePriceRangeMinEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          )
                                          .and()
                                          .optional(
                                            // minPrice ≤ maxValue
                                            maxPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if min sell price is not null
                                                        .sellPriceRangeMinIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .sellPriceRangeMinLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .sellPriceRangeMinEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min rent price is not null
                                                        .rentPriceRangeMinIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .rentPriceRangeMinLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .rentPriceRangeMinEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if min lease price is not null
                                                        .leasePriceRangeMinIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .leasePriceRangeMinLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .leasePriceRangeMinEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          ),
                                    )
                                    .or()
                                    .group(
                                      (q) => q //only max is given in inquiry
                                          .group(
                                            (q) => q
                                                .group(
                                                  (q) => q
                                                      .sellPriceRangeMinIsNull()
                                                      .and()
                                                      .sellPriceRangeMaxIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .rentPriceRangeMinIsNull()
                                                      .and()
                                                      .rentPriceRangeMaxIsNotNull(),
                                                )
                                                .or()
                                                .group(
                                                  (q) => q
                                                      .leasePriceRangeMinIsNull()
                                                      .and()
                                                      .leasePriceRangeMaxIsNotNull(),
                                                ),
                                          )
                                          .and()
                                          .optional(
                                            // maxPrice ≥ minValue
                                            minPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if max sell price is not null
                                                        .sellPriceRangeMaxIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .sellPriceRangeMaxGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .sellPriceRangeMaxEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max rent price is not null
                                                        .rentPriceRangeMaxIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .rentPriceRangeMaxGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .rentPriceRangeMaxEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max lease price is not null
                                                        .leasePriceRangeMaxIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .leasePriceRangeMaxGreaterThan(
                                                                minPriceValue,
                                                              )
                                                              .or()
                                                              .leasePriceRangeMaxEqualTo(
                                                                minPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          )
                                          .and()
                                          .optional(
                                            // maxPrice ≤ maxValue
                                            maxPriceValue != null,
                                            (q) => q.group(
                                              (q) => q
                                                  .group(
                                                    (q) => q //if max sell price is not null
                                                        .sellPriceRangeMaxIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .sellPriceRangeMaxLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .sellPriceRangeMaxEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max rent price is not null
                                                        .rentPriceRangeMaxIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .rentPriceRangeMaxLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .rentPriceRangeMaxEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  )
                                                  .or()
                                                  .group(
                                                    (q) => q //if max lease price is not null
                                                        .leasePriceRangeMaxIsNotNull()
                                                        .and()
                                                        .group(
                                                          (q) => q
                                                              .leasePriceRangeMaxLessThan(
                                                                maxPriceValue,
                                                              )
                                                              .or()
                                                              .leasePriceRangeMaxEqualTo(
                                                                maxPriceValue,
                                                              ),
                                                        ),
                                                  ),
                                            ),
                                          ),
                                    ),
                              ),
                        ),
                      ),
                )
                .and()
                .optional(
                  filterToApply!.measureUnit != null &&
                      (filterToApply.minMeasure != null ||
                          filterToApply.maxMeasure != null),
                  (q) => q.group(
                    (q) => q
                        .measureUnitIsNotNull()
                        .and()
                        .measureUnitEqualTo(filterToApply.measureUnit)
                        .and()
                        .optional(
                          filterToApply.minMeasure != null &&
                              filterToApply.maxMeasure == null,
                          (q) => q
                              .group(
                                (q) => q.minMeasureIsNotNull().and().group(
                                      (q) => q
                                          .minMeasureGreaterThan(
                                            filterToApply.minMeasure,
                                          )
                                          .or()
                                          .minMeasureEqualTo(
                                            filterToApply.minMeasure,
                                          ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q.maxMeasureIsNotNull().and().group(
                                      (q) => q
                                          .maxMeasureGreaterThan(
                                            filterToApply.minMeasure,
                                          )
                                          .or()
                                          .maxMeasureEqualTo(
                                            filterToApply.minMeasure,
                                          ),
                                    ),
                              ),
                        )
                        .and()
                        .optional(
                          filterToApply.maxMeasure != null &&
                              filterToApply.minMeasure == null,
                          (q) => q
                              .group(
                                (q) => q.minMeasureIsNotNull().and().group(
                                      (q) => q
                                          .minMeasureLessThan(
                                            filterToApply.maxMeasure,
                                          )
                                          .or()
                                          .minMeasureEqualTo(
                                            filterToApply.maxMeasure,
                                          ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q.maxMeasureIsNotNull().and().group(
                                      (q) => q
                                          .maxMeasureLessThan(
                                            filterToApply.maxMeasure,
                                          )
                                          .or()
                                          .maxMeasureEqualTo(
                                            filterToApply.maxMeasure,
                                          ),
                                    ),
                              ),
                        )
                        .and()
                        .optional(
                          filterToApply.minMeasure != null &&
                              filterToApply.maxMeasure != null,
                          (q) => q
                              .group(
                                (q) => q.minMeasureIsNotNull().and().group(
                                      (q) => q
                                          .group(
                                            (q) => q
                                                .minMeasureGreaterThan(
                                                  filterToApply.minMeasure,
                                                )
                                                .or()
                                                .minMeasureEqualTo(
                                                  filterToApply.minMeasure,
                                                ),
                                          )
                                          .and()
                                          .group(
                                            (q) => q
                                                .minMeasureLessThan(
                                                  filterToApply.maxMeasure,
                                                )
                                                .or()
                                                .minMeasureEqualTo(
                                                  filterToApply.maxMeasure,
                                                ),
                                          ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q
                                    .maxMeasureIsNotNull()
                                    .and()
                                    .minMeasureIsNotNull()
                                    .and()
                                    .group(
                                      (q) => q
                                          .group(
                                            (q) => q
                                                .maxMeasureGreaterThan(
                                                  filterToApply.minMeasure,
                                                )
                                                .or()
                                                .maxMeasureEqualTo(
                                                  filterToApply.minMeasure,
                                                ),
                                          )
                                          .and()
                                          .group(
                                            (q) => q
                                                .maxMeasureLessThan(
                                                  filterToApply.maxMeasure,
                                                )
                                                .or()
                                                .maxMeasureEqualTo(
                                                  filterToApply.maxMeasure,
                                                ),
                                          ),
                                    ),
                              ),
                        ),
                  ),
                )
                .and()
                .optional(
                  filterToApply.constructionType != null &&
                      filterToApply.constructionType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.constructionType!,
                    (q, element) => q.constructionTypeElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.schemeType != null &&
                      filterToApply.schemeType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.schemeType!,
                    (q, element) => q.schemeTypeElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.furnishedType != null &&
                      filterToApply.furnishedType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.furnishedType!,
                    (q, element) => q.furnishedTypeElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.bathroomCount != null &&
                      filterToApply.bathroomCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .bathroomCountEqualTo(filterToApply.bathroomCount!)
                        .or()
                        .bathroomCountGreaterThan(filterToApply.bathroomCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.roomCount != null &&
                      filterToApply.roomCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .roomCountEqualTo(filterToApply.roomCount!)
                        .or()
                        .roomCountGreaterThan(filterToApply.roomCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.floorCount != null &&
                      filterToApply.floorCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .floorCountEqualTo(filterToApply.floorCount!)
                        .or()
                        .floorCountGreaterThan(filterToApply.floorCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.totalFloorCount != null &&
                      filterToApply.totalFloorCount! > 0,
                  (q) => q.group(
                    (q) => q
                        .totalFloorCountEqualTo(filterToApply.totalFloorCount!)
                        .or()
                        .totalFloorCountGreaterThan(
                            filterToApply.totalFloorCount!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.frontSize != null,
                  (q) => q.group(
                    (q) => q
                        .frontSizeEqualTo(filterToApply.frontSize!)
                        .or()
                        .frontSizeGreaterThan(filterToApply.frontSize!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.depthSize != null,
                  (q) => q.group(
                    (q) => q
                        .depthSizeEqualTo(filterToApply.depthSize!)
                        .or()
                        .depthSizeGreaterThan(filterToApply.depthSize!),
                  ),
                )
                .and()
                .optional(
                  filterToApply.buildingType != null &&
                      filterToApply.buildingType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.buildingType!,
                    (q, element) => q.buildingTypeElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.bhkIds != null &&
                      filterToApply.bhkIds!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.bhkIds!,
                    (q, element) => q.bhkIdsElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.facingType != null &&
                      filterToApply.facingType!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.facingType!,
                    (q, element) => q.facingTypeElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.connectedRoads != null &&
                      filterToApply.connectedRoads!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.connectedRoads!,
                    (q, element) => q.group(
                      (q) => q
                          .connectedRoadsElementEqualTo(element)
                          .or()
                          .connectedRoadsElementGreaterThan(element),
                    ),
                  ),
                )
                .and()
                .optional(
                  filterToApply.isWashroomAvailable != null,
                  (q) => q.isWashroomAvailableEqualTo(
                    filterToApply.isWashroomAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isBalconyAvailable != null,
                  (q) => q.isBalconyAvailableEqualTo(
                    filterToApply.isBalconyAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isCornerPiece != null,
                  (q) => q.isCornerPieceEqualTo(
                    filterToApply.isCornerPiece!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isLightConnectionAvailable != null,
                  (q) => q.isLightConnectionAvailableEqualTo(
                    filterToApply.isLightConnectionAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isWellAvailable != null,
                  (q) => q.isWellAvailableEqualTo(
                    filterToApply.isWellAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isAllottedParkingAvailable != null,
                  (q) => q.isAllottedParkingAvailableEqualTo(
                    filterToApply.isAllottedParkingAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isParkingAvailable != null,
                  (q) => q.isParkingAvailableEqualTo(
                    filterToApply.isParkingAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.isLiftAvailable != null,
                  (q) => q.isLiftAvailableEqualTo(
                    filterToApply.isLiftAvailable!,
                  ),
                )
                .and()
                .optional(
                  filterToApply.selectedAmenities != null &&
                      filterToApply.selectedAmenities!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.selectedAmenities!,
                    (q, element) => q.selectedAmenitiesElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.additionalFurnish != null &&
                      filterToApply.additionalFurnish!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.additionalFurnish!,
                    (q, element) => q.additionalFurnishElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  filterToApply.preferredCaste != null &&
                      filterToApply.preferredCaste!.isNotEmpty,
                  (q) => q.anyOf(
                    filterToApply.preferredCaste!,
                    (q, element) => q.preferredCasteElementEqualTo(element),
                  ),
                )
                .and()
                .optional(
                  AppConfig.shouldApplyStringQueryForLocal &&
                      filterToApply.stringQuery != null &&
                      filterToApply.stringQuery!.trim().isNotEmpty,
                  (q) => q.group(
                    (q) => q
                        .propertyForValuesElementContains(
                          filterToApply.stringQuery!,
                          caseSensitive: false,
                        )
                        .or()
                        .propertyTypeValuesElementEqualTo(
                          filterToApply.stringQuery!,
                          caseSensitive: false,
                        )
                        .or()
                        .group(
                          (q) => q
                              .areaIsNotNull()
                              .and()
                              .areaIsNotEmpty()
                              .and()
                              .areaContains(
                                filterToApply.stringQuery!,
                                caseSensitive: false,
                              ),
                        )
                        .or()
                        .group(
                          (q) =>
                              q.buyerNameIsNotEmpty().and().buyerNameContains(
                                    filterToApply.stringQuery!,
                                    caseSensitive: false,
                                  ),
                        ),
                  ),
                ),
          ),
        )
        .sortByUpdatedAtDesc();
    return await (!showCountOnly ? query.findAll() : query.count());
  }

  Future<List<DbProperty>> getUnmatchedProperties({
    String? unmatchedInquiryId,
  }) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .unmatchInquiriesIsNotEmpty()
        .and()
        .optional(
          unmatchedInquiryId != null && unmatchedInquiryId.trim().isNotEmpty,
          (q) => q.unmatchInquiriesElementEqualTo(unmatchedInquiryId!),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getFavoriteProperties() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFavoriteEqualTo(true)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbSavedFilter>> getFavoriteInquiries() async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFavoriteEqualTo(true)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbSavedFilter>> getUnmatchedInquiries({
    String? unmatchedPropertyId,
  }) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .unmatchPropertiesIsNotEmpty()
        .and()
        .optional(
          unmatchedPropertyId != null && unmatchedPropertyId.trim().isNotEmpty,
          (q) => q.unmatchPropertiesElementEqualTo(unmatchedPropertyId!),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<dynamic> getInquiriesByProperty(
    DbProperty property, {
    bool showCountOnly = false,
    bool excludeUnmatched = false,
  }) async {
    final isar = await db;
    final query = await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .optional(
          excludeUnmatched && property.unmatchInquiries.isNotEmpty,
          (q) => q.allOf(
            property.unmatchInquiries,
            (q, element) => q.not().inquiryIdEqualTo(element),
          ),
        )
        .and()
        .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .inquiryStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .and()
        .optional(
          property.propertyForIds != null &&
              property.propertyForIds!.isNotEmpty,
          (q) => q.anyOf(
            property.propertyForIds!,
            (q, element) => q.propertyForElementEqualTo(element),
          ),
        )
        .and()
        .propertyTypeElementEqualTo(property.propertyTypeId)
        .and()
        .optional(
          property.propertyAreaUnitId != null &&
              property.propertyAreaSize != null,
          (q) => q.group(
            (q) => q.measureUnitIsNull().or().group(
                  (q) => q
                      .measureUnitEqualTo(property.propertyAreaUnitId)
                      .and()
                      .group(
                        (q) => q
                            .group(
                              (q) =>
                                  q.minMeasureIsNull().and().maxMeasureIsNull(),
                            )
                            .or()
                            .group(
                              (q) => q
                                  .group(
                                    (q) => q
                                        .minMeasureIsNotNull()
                                        .and()
                                        .maxMeasureIsNotNull(),
                                  )
                                  .and()
                                  .group(
                                    (q) => q
                                        .group(
                                          (q) => q
                                              .minMeasureIsNotNull()
                                              .and()
                                              .group(
                                                (q) => q
                                                    .minMeasureEqualTo(property
                                                        .propertyAreaSize!)
                                                    .or()
                                                    .minMeasureLessThan(property
                                                        .propertyAreaSize),
                                              ),
                                        )
                                        .and()
                                        .group(
                                          (q) => q
                                              .maxMeasureIsNotNull()
                                              .and()
                                              .group(
                                                (q) => q
                                                    .maxMeasureEqualTo(property
                                                        .propertyAreaSize!)
                                                    .or()
                                                    .maxMeasureGreaterThan(
                                                        property
                                                            .propertyAreaSize),
                                              ),
                                        ),
                                  ),
                            )
                            .or()
                            .group(
                              (q) => q
                                  .group(
                                    (q) => q
                                        .minMeasureIsNotNull()
                                        .and()
                                        .maxMeasureIsNull(),
                                  )
                                  .and()
                                  .group(
                                    (q) => q
                                        .minMeasureEqualTo(
                                            property.propertyAreaSize!)
                                        .or()
                                        .minMeasureLessThan(
                                            property.propertyAreaSize),
                                  ),
                            )
                            .or()
                            .group(
                              (q) => q
                                  .group(
                                    (q) => q
                                        .minMeasureIsNull()
                                        .and()
                                        .maxMeasureIsNotNull(),
                                  )
                                  .and()
                                  .group(
                                    (q) => q
                                        .maxMeasureEqualTo(
                                            property.propertyAreaSize!)
                                        .or()
                                        .maxMeasureGreaterThan(
                                            property.propertyAreaSize),
                                  ),
                            ),
                      ),
                ),
          ),
        )
        .and()
        .optional(
          property.buildingTypeId != null,
          (q) => q.group(
            (q) => q
                .buildingTypeIsNull()
                .or()
                .buildingTypeIsEmpty()
                .or()
                .buildingTypeElementEqualTo(property.buildingTypeId!),
          ),
        )
        .optional(
          property.constructionTypeId != null,
          (q) => q.group(
            (q) => q
                .constructionTypeIsNull()
                .or()
                .constructionTypeIsEmpty()
                .or()
                .constructionTypeElementEqualTo(property.constructionTypeId!),
          ),
        )
        .optional(
          property.schemeTypeId != null,
          (q) => q.group(
            (q) => q
                .schemeTypeIsNull()
                .or()
                .schemeTypeIsEmpty()
                .or()
                .schemeTypeElementEqualTo(property.schemeTypeId!),
          ),
        )
        .optional(
          property.propertyFurnishedStatusId != null,
          (q) => q.group(
            (q) => q
                .furnishedTypeIsNull()
                .or()
                .furnishedTypeIsEmpty()
                .or()
                .furnishedTypeElementEqualTo(
                  property.propertyFurnishedStatusId!,
                ),
          ),
        )
        .optional(
          property.bhkId != null,
          (q) => q.group(
            (q) => q
                .bhkIdsIsNull()
                .or()
                .bhkIdsIsEmpty()
                .or()
                .bhkIdsElementEqualTo(property.bhkId!),
          ),
        )
        .optional(
          property.additionalFurnishing != null &&
              property.additionalFurnishing!.isNotEmpty,
          (q) => q.group(
            (q) => q
                .additionalFurnishIsNull()
                .or()
                .additionalFurnishIsEmpty()
                .or()
                .anyOf(
                  property.additionalFurnishing!,
                  (q, element) => q.additionalFurnishElementEqualTo(element),
                ),
          ),
        )
        .optional(
          property.connectedRoads != null &&
              property.connectedRoads!.isNotEmpty,
          (q) => q.group(
            (q) => q
                .connectedRoadsIsNull()
                .or()
                .connectedRoadsIsEmpty()
                .or()
                .anyOf(
                  property.connectedRoads!,
                  (q, element) => q.group(
                    (q) => q
                        .connectedRoadsElementEqualTo(element)
                        .or()
                        .connectedRoadsElementGreaterThan(element),
                  ),
                ),
          ),
        )
        .and()
        .optional(
          property.bathRoomCount != null && property.bathRoomCount! > 0,
          (q) => q.group(
            (q) => q
                .bathroomCountIsNull()
                .or()
                .bathroomCountEqualTo(property.bathRoomCount!)
                .or()
                .bathroomCountGreaterThan(property.bathRoomCount!),
          ),
        )
        .and()
        .optional(
          property.roomCount != null && property.roomCount! > 0,
          (q) => q.group(
            (q) => q
                .roomCountIsNull()
                .or()
                .roomCountEqualTo(property.roomCount!)
                .or()
                .roomCountGreaterThan(property.roomCount!),
          ),
        )
        .and()
        .optional(
          property.floorCount != null && property.floorCount! > 0,
          (q) => q.group(
            (q) => q
                .floorCountIsNull()
                .or()
                .floorCountEqualTo(property.floorCount!)
                .or()
                .floorCountGreaterThan(property.floorCount!),
          ),
        )
        .and()
        .optional(
          property.totalFloorCount != null && property.totalFloorCount! > 0,
          (q) => q.group(
            (q) => q
                .totalFloorCountIsNull()
                .or()
                .totalFloorCountEqualTo(property.totalFloorCount!)
                .or()
                .totalFloorCountGreaterThan(property.totalFloorCount!),
          ),
        )
        .and()
        .optional(
          property.frontSize != null,
          (q) => q.group(
            (q) => q
                .frontSizeIsNull()
                .or()
                .frontSizeEqualTo(property.frontSize!)
                .or()
                .frontSizeGreaterThan(property.frontSize!),
          ),
        )
        .and()
        .optional(
          property.depthSize != null,
          (q) => q.group(
            (q) => q
                .depthSizeIsNull()
                .or()
                .depthSizeEqualTo(property.depthSize!)
                .or()
                .depthSizeGreaterThan(property.depthSize!),
          ),
        )
        .and()
        .optional(
          property.isWashRoomAvailable != null,
          (q) => q.group(
            (q) =>
                q.isWashroomAvailableIsNull().or().isWashroomAvailableEqualTo(
                      property.isWashRoomAvailable!,
                    ),
          ),
        )
        .and()
        .optional(
          property.balcony != null,
          (q) => q.group(
            (q) => q.isBalconyAvailableIsNull().or().isBalconyAvailableEqualTo(
                  property.balcony!,
                ),
          ),
        )
        .and()
        .optional(
          property.isCornerPiece != null,
          (q) => q.group(
            (q) => q.isCornerPieceIsNull().or().isCornerPieceEqualTo(
                  property.isCornerPiece!,
                ),
          ),
        )
        .and()
        .optional(
          property.lightConnection != null,
          (q) => q.group(
            (q) => q
                .isLightConnectionAvailableIsNull()
                .or()
                .isLightConnectionAvailableEqualTo(
                  property.lightConnection!,
                ),
          ),
        )
        .and()
        .optional(
          property.isWellAvailable != null,
          (q) => q.group(
            (q) => q.isWellAvailableIsNull().or().isWellAvailableEqualTo(
                  property.isWellAvailable!,
                ),
          ),
        )
        .and()
        .optional(
          property.isAllottedParking != null,
          (q) => q.group(
            (q) => q
                .isAllottedParkingAvailableIsNull()
                .or()
                .isAllottedParkingAvailableEqualTo(
                  property.isAllottedParking!,
                ),
          ),
        )
        .and()
        .optional(
          property.isParkingAvailable != null,
          (q) => q.group(
            (q) => q.isParkingAvailableIsNull().or().isParkingAvailableEqualTo(
                  property.isParkingAvailable!,
                ),
          ),
        )
        .and()
        .optional(
          property.isLiftAvailable != null,
          (q) => q.group(
            (q) => q.isLiftAvailableIsNull().or().isLiftAvailableEqualTo(
                  property.isLiftAvailable!,
                ),
          ),
        )
        .and()
        .optional(
          property.facingId != null,
          (q) => q.group(
            (q) => q
                .facingTypeIsNull()
                .or()
                .facingTypeIsEmpty()
                .or()
                .facingTypeElementEqualTo(property.facingId!),
          ),
        )
        .and()
        .optional(
          property.preferredCommunityValues != null &&
              property.preferredCommunityValues!.isNotEmpty,
          (q) => q.group(
            (q) => q
                .preferredCasteIsNull()
                .or()
                .preferredCasteIsEmpty()
                .or()
                .anyOf(
                  property.preferredCommunityValues!,
                  (q, element) => q.preferredCasteElementEqualTo(element),
                ),
          ),
        )
        .and()
        .optional(
          property.amenitiesValues != null &&
              property.amenitiesValues!.isNotEmpty,
          (q) => q.group(
            (q) => q
                .selectedAmenitiesIsNull()
                .or()
                .selectedAmenitiesIsEmpty()
                .or()
                .anyOf(
                  property.amenitiesValues!,
                  (q, element) => q.selectedAmenitiesElementEqualTo(element),
                ),
          ),
        )
        .and()
        .optional(
          true,
          (q) => q.group(
            (q) => q
                .optional(
                  //If Sell is Selected from Filter
                  property.propertyForIds != null &&
                      property.propertyForIds!
                          .contains(SaveDefaultData.propertyForSellId) &&
                      (property.minSellPrice != null ||
                          property.maxSellPrice != null),
                  (q) => q.group(
                    (q) => q //If Sell is selected in inquiry
                        .propertyForElementEqualTo(
                          SaveDefaultData.propertyForSellId,
                        )
                        .and()
                        .group(
                          (q) => q
                              .group(
                                (q) => q
                                    .sellPriceRangeMinIsNull()
                                    .and()
                                    .sellPriceRangeMaxIsNull(),
                              )
                              .or()
                              .group(
                                (q) => q //min and max both are given in inquiry
                                    .group(
                                      (q) => q
                                          .sellPriceRangeMinIsNotNull()
                                          .and()
                                          .sellPriceRangeMaxIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // inquiry min price <= property price <= inquiry max price
                                      property.minSellPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .group(
                                              (q) => q
                                                  .sellPriceRangeMinLessThan(
                                                    property.minSellPrice,
                                                  )
                                                  .or()
                                                  .sellPriceRangeMinEqualTo(
                                                    property.minSellPrice,
                                                  ),
                                            )
                                            .and()
                                            .group(
                                              (q) => q
                                                  .sellPriceRangeMaxGreaterThan(
                                                    property.minSellPrice,
                                                  )
                                                  .or()
                                                  .sellPriceRangeMaxEqualTo(
                                                    property.minSellPrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      property.maxSellPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .optional(
                                              // maxPrice ≤ value
                                              property.minSellPrice != null,
                                              (q) => q.group(
                                                (q) => q
                                                    .sellPriceRangeMaxIsNotNull()
                                                    .and()
                                                    .group(
                                                      (q) => q
                                                          .sellPriceRangeMaxLessThan(
                                                            property
                                                                .maxSellPrice,
                                                          )
                                                          .or()
                                                          .sellPriceRangeMaxEqualTo(
                                                            property
                                                                .maxSellPrice,
                                                          ),
                                                    ),
                                              ),
                                            )
                                            .or()
                                            .optional(
                                              // minPrice ≤ maxValue
                                              property.minSellPrice == null,
                                              (q) => q.group(
                                                (q) => q
                                                    .sellPriceRangeMinIsNotNull()
                                                    .and()
                                                    .group(
                                                      (q) => q
                                                          .sellPriceRangeMinLessThan(
                                                            property
                                                                .maxSellPrice,
                                                          )
                                                          .or()
                                                          .sellPriceRangeMinEqualTo(
                                                            property
                                                                .maxSellPrice,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                      ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q //only min is given in inquiry
                                    .group(
                                      (q) => q
                                          .sellPriceRangeMaxIsNull()
                                          .and()
                                          .sellPriceRangeMinIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // minPrice ≥ minValue
                                      property.minSellPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .sellPriceRangeMinIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .sellPriceRangeMinGreaterThan(
                                                    property.minSellPrice,
                                                  )
                                                  .or()
                                                  .sellPriceRangeMinEqualTo(
                                                    property.minSellPrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      // minPrice ≤ maxValue
                                      property.maxSellPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .sellPriceRangeMinIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .sellPriceRangeMinLessThan(
                                                    property.maxSellPrice,
                                                  )
                                                  .or()
                                                  .sellPriceRangeMinEqualTo(
                                                    property.maxSellPrice,
                                                  ),
                                            ),
                                      ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q //only max is given in inquiry
                                    .group(
                                      (q) => q
                                          .sellPriceRangeMinIsNull()
                                          .and()
                                          .sellPriceRangeMaxIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // maxPrice ≥ minValue
                                      property.minSellPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .sellPriceRangeMaxIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .sellPriceRangeMaxGreaterThan(
                                                    property.minSellPrice,
                                                  )
                                                  .or()
                                                  .sellPriceRangeMaxEqualTo(
                                                    property.minSellPrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      // maxPrice ≤ maxValue
                                      property.maxSellPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .sellPriceRangeMaxIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .sellPriceRangeMaxLessThan(
                                                    property.maxSellPrice,
                                                  )
                                                  .or()
                                                  .sellPriceRangeMaxEqualTo(
                                                    property.maxSellPrice,
                                                  ),
                                            ),
                                      ),
                                    ),
                              ),
                        ),
                  ),
                )
                // If any inquiry matches for any property so added or()
                .or()
                .optional(
                  //If Rent is Selected from Filter
                  property.propertyForIds != null &&
                      property.propertyForIds!
                          .contains(SaveDefaultData.propertyForRentId) &&
                      (property.minRentPrice != null ||
                          property.maxRentPrice != null),
                  (q) => q.group(
                    (q) => q
                        //If Rent is selected in property
                        .propertyForElementEqualTo(
                          SaveDefaultData.propertyForRentId,
                        )
                        .and()
                        .group(
                          (q) => q
                              .group(
                                (q) => q
                                    .rentPriceRangeMinIsNull()
                                    .and()
                                    .rentPriceRangeMaxIsNull(),
                              )
                              .or()
                              .group(
                                (q) => q //min and max both are given in inquiry
                                    .group(
                                      (q) => q
                                          .rentPriceRangeMinIsNotNull()
                                          .and()
                                          .rentPriceRangeMaxIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // inquiry min price <= property price <= inquiry max price
                                      property.minRentPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .group(
                                              (q) => q
                                                  .rentPriceRangeMinLessThan(
                                                    property.minRentPrice,
                                                  )
                                                  .or()
                                                  .rentPriceRangeMinEqualTo(
                                                    property.minRentPrice,
                                                  ),
                                            )
                                            .and()
                                            .group(
                                              (q) => q
                                                  .rentPriceRangeMaxGreaterThan(
                                                    property.minRentPrice,
                                                  )
                                                  .or()
                                                  .rentPriceRangeMaxEqualTo(
                                                    property.minRentPrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      property.maxRentPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .optional(
                                              // maxPrice ≤ value
                                              property.minRentPrice != null,
                                              (q) => q.group(
                                                (q) => q
                                                    .rentPriceRangeMaxIsNotNull()
                                                    .and()
                                                    .group(
                                                      (q) => q
                                                          .rentPriceRangeMaxLessThan(
                                                            property
                                                                .maxRentPrice,
                                                          )
                                                          .or()
                                                          .rentPriceRangeMaxEqualTo(
                                                            property
                                                                .maxRentPrice,
                                                          ),
                                                    ),
                                              ),
                                            )
                                            .or()
                                            .optional(
                                              // minPrice ≤ maxValue
                                              property.minRentPrice == null,
                                              (q) => q.group(
                                                (q) => q
                                                    .rentPriceRangeMinIsNotNull()
                                                    .and()
                                                    .group(
                                                      (q) => q
                                                          .rentPriceRangeMinLessThan(
                                                            property
                                                                .maxRentPrice,
                                                          )
                                                          .or()
                                                          .rentPriceRangeMinEqualTo(
                                                            property
                                                                .maxRentPrice,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                      ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q //only min is given in inquiry
                                    .group(
                                      (q) => q
                                          .rentPriceRangeMaxIsNull()
                                          .and()
                                          .rentPriceRangeMinIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // minPrice ≥ minValue
                                      property.minRentPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .rentPriceRangeMinIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .rentPriceRangeMinGreaterThan(
                                                    property.minRentPrice,
                                                  )
                                                  .or()
                                                  .rentPriceRangeMinEqualTo(
                                                    property.minRentPrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      // minPrice ≤ maxValue
                                      property.maxRentPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .rentPriceRangeMinIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .rentPriceRangeMinLessThan(
                                                    property.maxRentPrice,
                                                  )
                                                  .or()
                                                  .rentPriceRangeMinEqualTo(
                                                    property.maxRentPrice,
                                                  ),
                                            ),
                                      ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q //only max is given in inquiry
                                    .group(
                                      (q) => q
                                          .rentPriceRangeMinIsNull()
                                          .and()
                                          .rentPriceRangeMaxIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // maxPrice ≥ minValue
                                      property.minRentPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .rentPriceRangeMaxIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .rentPriceRangeMaxGreaterThan(
                                                    property.minRentPrice,
                                                  )
                                                  .or()
                                                  .rentPriceRangeMaxEqualTo(
                                                    property.minRentPrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      // maxPrice ≤ maxValue
                                      property.maxRentPrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .rentPriceRangeMaxIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .rentPriceRangeMaxLessThan(
                                                    property.maxRentPrice,
                                                  )
                                                  .or()
                                                  .rentPriceRangeMaxEqualTo(
                                                    property.maxRentPrice,
                                                  ),
                                            ),
                                      ),
                                    ),
                              ),
                        ),
                  ),
                )
                // If any inquiry matches for any property so added or()
                .or()
                .optional(
                  //If Lease is Selected from Filter
                  property.propertyForIds != null &&
                      property.propertyForIds!
                          .contains(SaveDefaultData.propertyForLeaseId) &&
                      (property.minLeasePrice != null ||
                          property.maxLeasePrice != null),
                  (q) => q.group(
                    (q) => q
                        //If Lease is selected in property
                        .propertyForElementEqualTo(
                          SaveDefaultData.propertyForLeaseId,
                        )
                        .and()
                        .group(
                          (q) => q
                              .group(
                                (q) => q
                                    .leasePriceRangeMinIsNull()
                                    .and()
                                    .leasePriceRangeMaxIsNull(),
                              )
                              .or()
                              .group(
                                (q) => q //min and max both are given in inquiry
                                    .group(
                                      (q) => q
                                          .leasePriceRangeMinIsNotNull()
                                          .and()
                                          .leasePriceRangeMaxIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // inquiry min price <= property price <= inquiry max price
                                      property.minLeasePrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .group(
                                              (q) => q
                                                  .leasePriceRangeMinLessThan(
                                                    property.minLeasePrice,
                                                  )
                                                  .or()
                                                  .leasePriceRangeMinEqualTo(
                                                    property.minLeasePrice,
                                                  ),
                                            )
                                            .and()
                                            .group(
                                              (q) => q
                                                  .leasePriceRangeMaxGreaterThan(
                                                    property.minLeasePrice,
                                                  )
                                                  .or()
                                                  .leasePriceRangeMaxEqualTo(
                                                    property.minLeasePrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      property.maxLeasePrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .optional(
                                              // maxPrice ≤ value
                                              property.minLeasePrice != null,
                                              (q) => q.group(
                                                (q) => q
                                                    .leasePriceRangeMaxIsNotNull()
                                                    .and()
                                                    .group(
                                                      (q) => q
                                                          .leasePriceRangeMaxLessThan(
                                                            property
                                                                .maxLeasePrice,
                                                          )
                                                          .or()
                                                          .leasePriceRangeMaxEqualTo(
                                                            property
                                                                .maxLeasePrice,
                                                          ),
                                                    ),
                                              ),
                                            )
                                            .or()
                                            .optional(
                                              // minPrice ≤ maxValue
                                              property.minLeasePrice == null,
                                              (q) => q.group(
                                                (q) => q
                                                    .leasePriceRangeMinIsNotNull()
                                                    .and()
                                                    .group(
                                                      (q) => q
                                                          .leasePriceRangeMinLessThan(
                                                            property
                                                                .maxLeasePrice,
                                                          )
                                                          .or()
                                                          .leasePriceRangeMinEqualTo(
                                                            property
                                                                .maxLeasePrice,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                      ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q //only min is given in inquiry
                                    .group(
                                      (q) => q
                                          .leasePriceRangeMaxIsNull()
                                          .and()
                                          .leasePriceRangeMinIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // minPrice ≥ minValue
                                      property.minLeasePrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .leasePriceRangeMinIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .leasePriceRangeMinGreaterThan(
                                                    property.minLeasePrice,
                                                  )
                                                  .or()
                                                  .leasePriceRangeMinEqualTo(
                                                    property.minLeasePrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      // minPrice ≤ maxValue
                                      property.maxLeasePrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .leasePriceRangeMinIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .leasePriceRangeMinLessThan(
                                                    property.maxLeasePrice,
                                                  )
                                                  .or()
                                                  .leasePriceRangeMinEqualTo(
                                                    property.maxLeasePrice,
                                                  ),
                                            ),
                                      ),
                                    ),
                              )
                              .or()
                              .group(
                                (q) => q //only max is given in inquiry
                                    .group(
                                      (q) => q
                                          .leasePriceRangeMinIsNull()
                                          .and()
                                          .leasePriceRangeMaxIsNotNull(),
                                    )
                                    .and()
                                    .optional(
                                      // maxPrice ≥ minValue
                                      property.minLeasePrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .leasePriceRangeMaxIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .leasePriceRangeMaxGreaterThan(
                                                    property.minLeasePrice,
                                                  )
                                                  .or()
                                                  .leasePriceRangeMaxEqualTo(
                                                    property.minLeasePrice,
                                                  ),
                                            ),
                                      ),
                                    )
                                    .and()
                                    .optional(
                                      // maxPrice ≤ maxValue
                                      property.maxLeasePrice != null,
                                      (q) => q.group(
                                        (q) => q
                                            .leasePriceRangeMaxIsNotNull()
                                            .and()
                                            .group(
                                              (q) => q
                                                  .leasePriceRangeMaxLessThan(
                                                    property.maxLeasePrice,
                                                  )
                                                  .or()
                                                  .leasePriceRangeMaxEqualTo(
                                                    property.maxLeasePrice,
                                                  ),
                                            ),
                                      ),
                                    ),
                              ),
                        ),
                  ),
                ),
          ),
        );
    return await (showCountOnly ? query.count() : query.findAll());
  }

  Future<List<DbProperty>> getSoldProperties() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.soldStatusId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getPropertiesByIds(List<int?>? propertyIds) async {
    final List<int> ids = [];
    if (propertyIds != null && propertyIds.isNotEmpty) {
      propertyIds.forEach(
        (element) {
          if (element != null) {
            ids.add(element);
          }
        },
      );
    } else {
      return [];
    }

    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .anyOf(
          ids,
          (q, element) => q.idEqualTo(element),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getPropertiesByIdsAndPropertyFor(
    List<int?>? propertyIds,
    int propertyFor,
  ) async {
    final List<int> ids = [];
    if (propertyIds != null && propertyIds.isNotEmpty) {
      propertyIds.forEach(
        (element) {
          if (element != null) {
            ids.add(element);
          }
        },
      );
    } else {
      return [];
    }

    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .anyOf(
          ids,
          (q, element) =>
              (q.idEqualTo(element).and().propertyForIdsElementEqualTo(
                    propertyFor,
                  )),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getUnsoldProperties() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getAllSellers() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getAllPropertiesFromNetwork() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(true)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbProperty>> getAllPropertiesFromNetworkByPropertyType(
    int propertyTypeId,
  ) async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(true)
        .and()
        .propertySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .propertyStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .and()
        .propertyTypeIdEqualTo(propertyTypeId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbPropertyAmenity>> getAmenities() async {
    final isar = await db;
    return await isar.dbPropertyAmenitys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .findAll();
  }

  Future<List<DbPropertyAmenity>> getAmenitiesBasedOnIds(
    List<int> amenitiesIds,
  ) async {
    final isar = await db;
    return await isar.dbPropertyAmenitys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .anyOf(
          amenitiesIds,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<DbPropertyAmenity>> getAmenitiesBasedOnName(
    List<String> amenitiesValue,
  ) async {
    final isar = await db;
    return await isar.dbPropertyAmenitys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .anyOf(
          amenitiesValue,
          (q, element) => q.nameEqualTo(element),
        )
        .findAll();
  }

  Future<List<DbPropertyBuildingType>> getBuildingTypeBasedOnIds(
    List<int> ids,
  ) async {
    final isar = await db;
    return await isar.dbPropertyBuildingTypes
        .filter()
        .anyOf(
          ids,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<void> savePropertyAmenities(List<DbPropertyAmenity> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyAmenitys.putAll(list);
        },
      );
    }
  }

  Future<void> savePropertyAmenity(DbPropertyAmenity amenity) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyAmenitys.put(amenity);
      },
    );
  }

  Future<void> deletePropertyAmenity(int id) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyAmenitys.delete(id);
      },
    );
  }

  Future<List<DbPropertyPreferredCast>> getPreferredCasts() async {
    final isar = await db;
    return await isar.dbPropertyPreferredCasts
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .findAll();
  }

  Future<List<DbPropertyPreferredCast>> getPreferredCastsBasedOnIds(
    List<int> preferredCastIds,
  ) async {
    final isar = await db;
    return await isar.dbPropertyPreferredCasts
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .anyOf(
          preferredCastIds,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<DbPropertyPreferredCast>> getPreferredCommunityBasedOnValues(
    List<String> communityValues,
  ) async {
    final isar = await db;
    return await isar.dbPropertyPreferredCasts
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .anyOf(
          communityValues,
          (q, element) => q.nameEqualTo(element),
        )
        .findAll();
  }

  Future<Stream<void>> watchOnPreferredCastChanges() async {
    final isar = await db;
    return await isar.dbPropertyPreferredCasts.watchLazy();
  }

  Future<List<DbPropertyBhkType>> getBhkTypes() async {
    final isar = await db;
    return await isar.dbPropertyBhkTypes.where().findAll();
  }

  Future<List<DbPropertyBhkType>> getBhkTypesById(List<int> id) async {
    final isar = await db;
    return await isar.dbPropertyBhkTypes
        .filter()
        .anyOf(
          id,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<DbPropertyBhkType>> getBhkTypesByIds(List<int> ids) async {
    final isar = await db;
    return await isar.dbPropertyBhkTypes
        .filter()
        .anyOf(
          ids,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<int>?> getBhkTypeIdByName(List<String>? name) async {
    if (name != null && name.isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyBhkTypes
          .filter()
          .anyOf(
            name,
            (q, element) => q.nameEqualTo(
              element,
              caseSensitive: false,
            ),
          )
          .findAll();
      if (info.isNotEmpty) {
        return info.map((e) => e.id).toList();
      }
    }
    return null;
  }

  Future<void> savePropertyBhkTypes(List<DbPropertyBhkType> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyBhkTypes.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyBuildingType>> getBuildingTypes() async {
    final isar = await db;
    return await isar.dbPropertyBuildingTypes.where().findAll();
  }

  Future<List<DbPropertyBuildingType>?> getBuildingTypesById(
      List<int> id) async {
    final isar = await db;
    final info = await isar.dbPropertyBuildingTypes
        .filter()
        .anyOf(
          id,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
    if (info.isNotEmpty) {
      return info;
    }
    return null;
  }

  Future<List<int>?> getBuildingTypeIdByName(List<String>? name) async {
    if (name != null && name.isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyBuildingTypes
          .filter()
          .anyOf(
            name,
            (q, element) => q.nameEqualTo(
              element,
              caseSensitive: false,
            ),
          )
          .findAll();
      if (info.isNotEmpty) {
        return info.map((e) => e.id).toList();
      }
    }
    return null;
  }

  Future<void> savePropertyBuildingTypes(
      List<DbPropertyBuildingType> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyBuildingTypes.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyConnectedRoad>> getConnectedRoads() async {
    final isar = await db;
    return await isar.dbPropertyConnectedRoads.where().findAll();
  }

  Future<DbPropertyConnectedRoad?> getConnectedRoadsById(int id) async {
    final isar = await db;
    return await isar.dbPropertyConnectedRoads
        .filter()
        .idEqualTo(id)
        .findFirst();
  }

  Future<int> getConnectedRoadIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyConnectedRoads
          .filter()
          .nameEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<void> savePropertyConnectedRoads(
      List<DbPropertyConnectedRoad> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyConnectedRoads.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyConstructionType>> getConstructionTypes() async {
    final isar = await db;
    return await isar.dbPropertyConstructionTypes.where().findAll();
  }

  Future<DbPropertyConstructionType?> getConstructionTypeById(int id) async {
    final isar = await db;
    return await isar.dbPropertyConstructionTypes
        .filter()
        .idEqualTo(id)
        .findFirst();
  }

  Future<List<DbPropertyConstructionType>> getConstructionTypeByIds(
      List<int> id) async {
    final isar = await db;
    return await isar.dbPropertyConstructionTypes
        .filter()
        .anyOf(
          id,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<DbPropertySchemeType>> getSchemeTypeByIds(List<int> id) async {
    final isar = await db;
    return await isar.dbPropertySchemeTypes
        .filter()
        .anyOf(
          id,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<int>?> getConstructionTypeIdByName(List<String>? name) async {
    if (name != null && name.isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyConstructionTypes
          .filter()
          .anyOf(
            name,
            (q, element) => q.nameEqualTo(
              element,
              caseSensitive: false,
            ),
          )
          .findAll();
      if (info.isNotEmpty) {
        return info.map((e) => e.id).toList();
      }
    }
    return null;
  }

  Future<void> savePropertyConstructionTypes(
      List<DbPropertyConstructionType> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyConstructionTypes.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertyFacingType>> getFacingTypes() async {
    final isar = await db;
    return await isar.dbPropertyFacingTypes.where().findAll();
  }

  Future<DbPropertyFacingType?> getFacingTypesById(int id) async {
    final isar = await db;
    return await isar.dbPropertyFacingTypes.filter().idEqualTo(id).findFirst();
  }

  Future<List<DbPropertyFacingType>> getFacingTypesByIds(List<int> ids) async {
    final isar = await db;
    return await isar.dbPropertyFacingTypes
        .filter()
        .anyOf(
          ids,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<int>?> getFacingTypeIdByName(List<String>? name) async {
    if (name != null && name.isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertyFacingTypes
          .filter()
          .anyOf(
            name,
            (q, element) => q.nameEqualTo(
              element,
              caseSensitive: false,
            ),
          )
          .findAll();
      if (info.isNotEmpty) {
        return info.map((e) => e.id).toList();
      }
    }
    return null;
  }

  Future<void> savePropertyFacingTypes(List<DbPropertyFacingType> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertyFacingTypes.putAll(list);
        },
      );
    }
  }

  Future<List<DbPropertySchemeType>> getSchemeTypes() async {
    final isar = await db;
    return await isar.dbPropertySchemeTypes.where().findAll();
  }

  Future<DbPropertySchemeType?> getSchemeTypesById(int id) async {
    final isar = await db;
    return await isar.dbPropertySchemeTypes.filter().idEqualTo(id).findFirst();
  }

  Future<List<DbPropertySchemeType>> getSchemeTypesByIds(List<int> ids) async {
    final isar = await db;
    return await isar.dbPropertySchemeTypes
        .filter()
        .anyOf(
          ids,
          (q, element) => q.idEqualTo(element),
        )
        .findAll();
  }

  Future<List<int>?> getSchemeTypeIdByName(List<String>? name) async {
    if (name != null && name.isNotEmpty) {
      final isar = await db;
      final info = await isar.dbPropertySchemeTypes
          .filter()
          .anyOf(
            name,
            (q, element) => q.nameEqualTo(
              element,
              caseSensitive: false,
            ),
          )
          .findAll();
      if (info.isNotEmpty) {
        return info.map((e) => e.id).toList();
      }
    }
    return null;
  }

  Future<void> savePropertySchemeTypes(List<DbPropertySchemeType> list) async {
    if (list.isNotEmpty) {
      final isar = await db;
      await isar.writeTxn(
        () async {
          await isar.dbPropertySchemeTypes.putAll(list);
        },
      );
    }
  }

  Future<List<DbSetting>> getSettings() async {
    final isar = await db;
    return await isar.dbSettings
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .findAll();
  }

  Future<List<DbSetting>> getSharingSettings() async {
    final isar = await db;
    return await isar.dbSettings
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .anyOf(
      [
        SaveDefaultData.settingShareBasicDetailsId,
        SaveDefaultData.settingShareOtherDetailsId,
        /*SaveDefaultData.settingShareImagesId,
        SaveDefaultData.settingShareLogoId,
        SaveDefaultData.settingShareWatermarkId,*/
      ],
      (q, element) => q.settingIdEqualTo(element),
    ).findAll();
  }

  Future<DbSetting?> getSettingOf(int id) async {
    final isar = await db;
    return await isar.dbSettings
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .settingIdEqualTo(id)
        .findFirst();
  }

  Future<void> updateSetting(DbSetting setting) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbSettings.put(setting);
      },
    );
  }

  Future<void> saveSettings(List<DbSetting> settings) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbSettings.putAll(settings);
      },
    );
  }

  Future<void> updateAppSettings(DbAppSettings value) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbAppSettings.put(value);
      },
    );
  }

  Future<DbAppSettings?> getAppSettings() async {
    final isar = await db;
    return await isar.dbAppSettings.where().findFirst();
  }

  Future<Stream<void>> watchOnAppSettings() async {
    final isar = await db;
    return await isar.dbAppSettings.watchLazy();
  }

  Future<void> savePreferredCast(DbPropertyPreferredCast cast) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyPreferredCasts.put(cast);
      },
    );
  }

  Future<void> savePreferredCasts(List<DbPropertyPreferredCast> casts) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyPreferredCasts.putAll(casts);
      },
    );
  }

  Future<void> deletePreferredCast(int id) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyPreferredCasts.delete(id);
      },
    );
  }

  Future<DbSavedFilter?> checkIfFilterExists({
    int? id,
    String? filterName,
    String? customerName,
    String? mobileNo,
  }) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .optional(
          id != null,
          (q) => q.idEqualTo(id!),
        )
        .optional(
          filterName != null,
          (q) => q.filterNameEqualTo(
            filterName!,
            caseSensitive: false,
          ),
        )
        .optional(
          customerName != null,
          (q) => q.filterNameEqualTo(
            customerName!,
            caseSensitive: false,
          ),
        )
        .optional(
          mobileNo != null,
          (q) => q.filterNameEqualTo(
            mobileNo!,
            caseSensitive: false,
          ),
        )
        .findFirst();
  }

  Future<List<DbSavedFilter>> getInquiryByBuyer({
    required String buyerName,
    required String? buyerPhone,
  }) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isFromBuyerEqualTo(true)
        .and()
        .optional(
          !AppConfig.showBuyerListWithClosedInquiries,
          (q) => q.inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId),
        )
        .and()
        .buyerNameIsNotEmpty()
        .and()
        .buyerNameEqualTo(buyerName)
        .and()
        .optional(
          buyerPhone != null && buyerPhone.trim().isNotEmpty,
          (q) => q.mobileNoEqualTo(buyerPhone!),
        )
        .findAll();
  }

  Future<List<DbSavedFilter>> getSavedFilters({
    String query = '',
    int? limit = null,
    int? filterToExclude = null,
    int? byPropertyType,
  }) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .isFromBuyerEqualTo(false)
        .and()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .optional(
          byPropertyType != null,
          (q) => q.propertyTypeElementEqualTo(byPropertyType!),
        )
        .and()
        .optional(
          query.trim().isNotEmpty,
          (q) => q.group(
            (q) => q
                .filterNameContains(query, caseSensitive: false)
                .or()
                .buyerNameContains(query, caseSensitive: false)
                .or()
                .mobileNoContains(query, caseSensitive: false),
          ),
        )
        .optional(
          filterToExclude != null,
          (q) => q.not().idEqualTo(filterToExclude!),
        )
        .optional(
          limit != null,
          (q) => q.sortByUpdatedAtDesc().limit(limit!),
        )
        .findAll();
  }

  Future<List<DbSavedFilter>> getAllSavedFilters({
    int? byPropertyType,
  }) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .isFromBuyerEqualTo(false)
        .and()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .optional(
          byPropertyType != null,
          (q) => q.propertyTypeElementEqualTo(byPropertyType!),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbSavedFilter>> getAllBuyers() async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .isFromBuyerEqualTo(true)
        .and()
        .userIdEqualTo(StaticFunctions.userId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbSavedFilter>> getUnsoldBuyers() async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .isFromBuyerEqualTo(true)
        .and()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<List<DbSavedFilter>> getAllActiveInquiries({
    int? byPropertyType,
    bool showBuyer = false,
  }) async {
    final isar = await db;
    return await isar.dbSavedFilters
        .filter()
        .isFromBuyerEqualTo(showBuyer)
        .and()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .and()
        .inquirySoldStatusIdEqualTo(SaveDefaultData.unSoldStatusId)
        .and()
        .inquiryStatusIdEqualTo(SaveDefaultData.activeStatusId)
        .optional(
          byPropertyType != null,
          (q) => q.propertyTypeElementEqualTo(byPropertyType!),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  Future<DbSavedFilter?> getSavedFilterById(int? id) async {
    if (id == null) {
      return null;
    }
    final isar = await db;
    return await isar.dbSavedFilters.filter().idEqualTo(id).findFirst();
  }

  Future<void> saveFilter(DbSavedFilter filter) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbSavedFilters.put(filter);
      },
    );
  }

  Future<void> deleteFilter(int id) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbSavedFilters.delete(id);
      },
    );
  }

  Future<Stream<void>> watchOnFilterChanges({int? id}) async {
    final isar = await db;
    if (id == null) {
      return await isar.dbSavedFilters.watchLazy();
    } else {
      return await isar.dbSavedFilters.watchObject(id);
    }
  }

  Future<Stream<void>> watchOnFiltersChangeById(int id) async {
    final isar = await db;
    return await isar.dbSavedFilters.watchObjectLazy(id);
  }

  Future<List<DbReminder>> getSavedReminders({
    DateTime? byDate,
  }) async {
    final isar = await db;
    final dateToFilter =
        byDate != null ? DateTime(byDate.year, byDate.month, byDate.day) : null;
    return await dateToFilter != null
        ? isar.dbReminders
            .filter()
            .userIdEqualTo(StaticFunctions.userId)
            .and()
            .group(
              (q) => q
                  .group(
                    (q) => q.reminderForAllDayEqualTo(true).and().group(
                          (q) => q
                              .selectedDateLessThan(dateToFilter)
                              .or()
                              .selectedDateEqualTo(dateToFilter),
                        ),
                  )
                  .or()
                  .group(
                    (q) => q
                        .reminderForAllDayEqualTo(false)
                        .and()
                        .selectedDateEqualTo(dateToFilter),
                  ),
            )
            .sortBySelectedTime()
            .findAll()
        : isar.dbReminders
            .filter()
            .userIdEqualTo(StaticFunctions.userId)
            .sortBySelectedTime()
            .findAll();
  }

  Future<int> getNumberOfSavedReminderForDate(DateTime dateTime) async {
    final isar = await db;
    var dateToFilter = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return await isar.dbReminders
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .group(
          (q) => q
              .group(
                (q) => q.reminderForAllDayEqualTo(true).and().group(
                      (q) => q
                          .selectedDateLessThan(dateToFilter)
                          .or()
                          .selectedDateEqualTo(dateToFilter),
                    ),
              )
              .or()
              .group(
                (q) => q
                    .reminderForAllDayEqualTo(false)
                    .and()
                    .selectedDateEqualTo(dateToFilter),
              ),
        )
        .count();
  }

  Future<List<DbReminder>> getRemindersBasedOnTags(String tag) async {
    final isar = await db;
    return await isar.dbReminders
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .tagEqualTo(tag)
        .findAll();
  }

  Future<void> deleteReminders(List<int> id) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbReminders.deleteAll(id);
      },
    );
  }

  Future<DbReminder?> checkIfReminderExists(int id) async {
    final isar = await db;
    return await isar.dbReminders.filter().idEqualTo(id).findFirst();
  }

  Future<void> saveReminder(DbReminder reminder) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbReminders.put(reminder);
      },
    );
  }

  Future<Stream<void>> watchOnReminderChanges() async {
    final isar = await db;
    return await isar.dbReminders.watchLazy();
  }

  Future<void> saveNotification(DbNotification notification) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbNotifications.put(notification);
      },
    );
  }

  Future<List<DbNotification>> getNotifications({
    int? byReminderId,
    bool onlyReminder = false,
    bool excludeDeleted = false,
  }) async {
    final isar = await db;
    return await isar.dbNotifications
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .optional(
          excludeDeleted,
          (q) => q.isDeletedEqualTo(false),
        )
        .and()
        .optional(
          onlyReminder,
          (q) => q.group(
            (q) => q
                .typeEqualTo(NotificationType.reminder.name)
                .and()
                .reminderIdIsNotNull(),
          ),
        )
        .and()
        .optional(
          byReminderId != null,
          (q) => q.group(
            (q) =>
                q.reminderIdIsNotNull().and().reminderIdEqualTo(byReminderId),
          ),
        )
        .sortByDateTimeDesc()
        .findAll();
  }

  Future<DbNotification?> checkIfNotificationExistsWith({
    int? notificationId,
    int? reminderId,
    DateTime? dateTime,
    String? description,
    bool? reminderForAllDay,
  }) async {
    final isar = await db;
    return await isar.dbNotifications
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .optional(
          notificationId != null,
          (q) => q.idEqualTo(notificationId!),
        )
        .and()
        .optional(
          reminderId != null,
          (q) => q.reminderIdEqualTo(reminderId!),
        )
        .and()
        .optional(
          reminderForAllDay != null,
          (q) => q.reminderForAllDayEqualTo(reminderForAllDay!),
        )
        .and()
        .optional(
          description != null,
          (q) => q.descriptionEqualTo(description!),
        )
        .and()
        .optional(
          dateTime != null,
          (q) => q.dateTimeEqualTo(dateTime!),
        )
        .findFirst();
  }

  Future<int> getUnreadNotificationCount() async {
    final currentDate = DateTime.now();
    final isar = await db;
    return await isar.dbNotifications
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .isDeletedEqualTo(false)
        .and()
        .isReadEqualTo(false)
        .and()
        .group(
          (q) => q.not().typeEqualTo(NotificationType.reminder.name).or().group(
                (q) =>
                    q.typeEqualTo(NotificationType.reminder.name).and().group(
                          (q) => q
                              .dateTimeLessThan(currentDate)
                              .or()
                              .dateTimeEqualTo(currentDate),
                        ),
              ),
        )
        .count();
  }

  Future<int> getLastAddedNotificationId() async {
    final isar = await db;
    final count = await isar.dbNotifications.where().count();
    return count + 1;
  }

  Future<Stream<void>> watchOnNotificationChanges() async {
    final isar = await db;
    return await isar.dbNotifications.watchLazy();
  }

  saveSubscriptions(
    List<DbSubscriptionPlan> subscriptionList,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbSubscriptionPlans.putAll(subscriptionList);
      },
    );
  }

  Future<List<DbSubscriptionPlan>> getSubscriptionPlans() async {
    final isar = await db;
    return await isar.dbSubscriptionPlans.where().findAll();
  }

  Future<DbSubscriptionPlan?> getSubscriptionPlanById(int? id) async {
    if (id == null) {
      return null;
    }
    final isar = await db;
    return await isar.dbSubscriptionPlans.where().idEqualTo(id).findFirst();
  }

  deletePlans() async {
    final isar = await db;
    final list = await isar.dbSubscriptionPlans.where().findAll();
    if (list.isNotEmpty) {
      final List<int> ids = [];
      list.forEach(
        (element) {
          ids.add(element.id);
        },
      );
      await isar.writeTxn(
        () async {
          return await isar.dbSubscriptionPlans.deleteAll(ids);
        },
      );
    }
  }

  Future<void> saveHistoryPlans(List<DbPlanHistory> subscriptionList) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPlanHistorys.putAll(subscriptionList);
      },
    );
  }

  Future<void> deleteHistoryPlans() async {
    final isar = await db;
    final list = await isar.dbPlanHistorys.where().findAll();
    if (list.isNotEmpty) {
      final List<int> ids = [];
      list.forEach(
        (element) {
          ids.add(element.id);
        },
      );
      await isar.writeTxn(
        () async {
          return await isar.dbPlanHistorys.deleteAll(ids);
        },
      );
    }
  }

  Future<List<DbPlanHistory>> getHistoryPlans() async {
    final isar = await db;
    return await isar.dbPlanHistorys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .findAll();
  }

  Future<void> saveBackupLocalInfo(
    List<DbBackupLocalInfo> backupLocalInfoList,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbBackupLocalInfos.putAll(backupLocalInfoList);
      },
    );
  }

  Future<void> updateBackupLocalInfo(DbBackupLocalInfo backupInfo) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbBackupLocalInfos.put(backupInfo);
      },
    );
  }

  Future<void> deleteAllBackupLocalInfo() async {
    final isar = await db;
    final list = await isar.dbBackupLocalInfos.where().findAll();
    if (list.isNotEmpty) {
      final List<int> ids = [];
      list.forEach(
        (element) {
          ids.add(element.id);
        },
      );
      await isar.writeTxn(
        () async {
          return await isar.dbBackupLocalInfos.deleteAll(ids);
        },
      );
    }
  }

  Future<DbBackupLocalInfo?> getPendingBackupInfo() async {
    final isar = await db;
    return await isar.dbBackupLocalInfos
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .statusEqualTo(Strings.backupRestoreTypePending)
        .findFirst();
  }

  Future<void> saveAllGoogleDriveFileInfo(
    List<DbGoogleDriveFileInfo> gDriveFileInfoList,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbGoogleDriveFileInfos.putAll(gDriveFileInfoList);
      },
    );
  }

  Future<void> saveGoogleDriveFileInfo(
    DbGoogleDriveFileInfo gDriveFileInfo,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbGoogleDriveFileInfos.put(gDriveFileInfo);
      },
    );
  }

  Future<void> updateGoogleDriveFileInfo(
    DbGoogleDriveFileInfo gDriveFileInfo,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbGoogleDriveFileInfos.put(gDriveFileInfo);
      },
    );
  }

  Future<DbGoogleDriveFileInfo?> getGoogleDriveFileInfoBasedOnStatus(
    String status,
  ) async {
    final isar = await db;
    return await isar.dbGoogleDriveFileInfos
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .statusEqualTo(status)
        .findFirst();
  }

  Future<List<DbGoogleDriveFileInfo>> getAllGoogleDriveFilesInfoBasedOnStatus(
    String status,
  ) async {
    final isar = await db;
    return await isar.dbGoogleDriveFileInfos
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .statusEqualTo(status)
        .findAll();
  }

  Future<void> deleteAllCompletedGoogleDriveInfo() async {
    final isar = await db;
    final list = await isar.dbGoogleDriveFileInfos.where().findAll();
    if (list.isNotEmpty) {
      final List<int> ids = [];
      list.forEach(
        (element) {
          ids.add(element.id);
        },
      );
      await isar.writeTxn(
        () async {
          return await isar.dbGoogleDriveFileInfos.deleteAll(ids);
        },
      );
    }
  }

  Future<List<DbProperty>> getPropertiesIncludesPhotos() async {
    final isar = await db;
    return await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .photosIsNotNull()
        .and()
        .photosIsNotEmpty()
        // only take shared by brooon false or if true then property should created by me
        .group(
          (q) => q.sharedByBrooonEqualTo(false).or().group(
                (q) => q
                    .sharedByBrooonEqualTo(true)
                    .and()
                    .brooonIdEqualTo(StaticFunctions.userId),
              ),
        )
        .findAll();
  }

  Future<List<DbPropertyPhotoMeta>> getPhotosOf(int propertyId) async {
    final isar = await db;
    return await isar.dbPropertyPhotoMetas
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertyIdEqualTo(propertyId)
        .findAll();
  }

  Future<void> savePhotoMeta(DbPropertyPhotoMeta photo) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyPhotoMetas.put(photo);
      },
    );
  }

  Future<void> deletePhotoMetaByProperty(int propertyId) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyPhotoMetas
            .filter()
            .userIdEqualTo(StaticFunctions.userId)
            .and()
            .propertyIdEqualTo(propertyId)
            .deleteAll();
      },
    );
  }

  Future<void> saveAllAppLinks(List<DbAppLinks> appLinks) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbAppLinks.putAll(appLinks);
      },
    );
  }

  Future<DbAppLinks?> getWebLinkById(int id) async {
    final isar = await db;
    return await isar.dbAppLinks.where().idEqualTo(id).findFirst();
  }

  Future<void> deleteAllAppLinks() async {
    final isar = await db;
    final list = await isar.dbAppLinks.where().findAll();
    if (list.isNotEmpty) {
      final List<int> ids = [];
      list.forEach(
        (element) {
          ids.add(element.id);
        },
      );
      await isar.writeTxn(
        () async {
          return await isar.dbAppLinks.deleteAll(ids);
        },
      );
    }
  }

  Future<void> savePrivacyLogInfo(DbAppPrivacyLogs logs) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbAppPrivacyLogs.put(logs);
      },
    );
  }

  Future<DbAppPrivacyLogs?> getAppPrivacyLogs() async {
    final isar = await db;
    return await isar.dbAppPrivacyLogs.where().findFirst();
  }

  savePurchasedStatus(List<DbPurchasedStatus> list) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPurchasedStatus.putAll(list);
      },
    );
  }

  Future<void> saveStatusToSync(
    DbStatusSync status,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbStatusSyncs.put(status);
      },
    );
  }

  Future<List<DbStatusSync>> getPropertyStatusToSync(
    String status,
  ) async {
    final isar = await db;
    return await isar.dbStatusSyncs
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .findAll();
  }

  Future<DbStatusSync?> getPropertyStatusWith(
    String type,
    String propertyId,
  ) async {
    final isar = await db;
    return await isar.dbStatusSyncs
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .syncTypeEqualTo(StatusSyncType.property.name)
        .and()
        .statusTypeEqualTo(type)
        .and()
        .propertyIdEqualTo(propertyId)
        .findFirst();
  }

  Future<DbStatusSync?> getInquiryStatusWith(
    String type,
    String inquiryId,
  ) async {
    final isar = await db;
    return await isar.dbStatusSyncs
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .syncTypeEqualTo(StatusSyncType.inquiry.name)
        .and()
        .statusTypeEqualTo(type)
        .and()
        .inquiryIdEqualTo(inquiryId)
        .findFirst();
  }

  Future<void> deletePropertyStatusBy(
    String type,
    String propertyId,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        return await isar.dbStatusSyncs
            .filter()
            .userIdEqualTo(StaticFunctions.userId)
            .and()
            .syncTypeEqualTo(StatusSyncType.property.name)
            .and()
            .statusTypeEqualTo(type)
            .and()
            .propertyIdEqualTo(propertyId)
            .deleteAll();
      },
    );
  }

  Future<void> deleteInquiryStatusBy(
    String type,
    String inquiryId,
  ) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        return await isar.dbStatusSyncs
            .filter()
            .userIdEqualTo(StaticFunctions.userId)
            .and()
            .syncTypeEqualTo(StatusSyncType.inquiry.name)
            .and()
            .statusTypeEqualTo(type)
            .and()
            .inquiryIdEqualTo(inquiryId)
            .deleteAll();
      },
    );
  }

  Future<List<DbStatusSync>> getPropertyStatusBy({
    String? type,
  }) async {
    final isar = await db;
    return await isar.dbStatusSyncs
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .syncTypeEqualTo(StatusSyncType.property.name)
        .and()
        .optional(
          type != null,
          (q) => q.statusTypeEqualTo(type!),
        )
        .findAll();
  }

  Future<List<DbStatusSync>> getInquiryStatusBy({
    String? type,
  }) async {
    final isar = await db;
    return await isar.dbStatusSyncs
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .syncTypeEqualTo(StatusSyncType.inquiry.name)
        .and()
        .optional(
          type != null,
          (q) => q.statusTypeEqualTo(type!),
        )
        .findAll();
  }

  updatePurchasedStatus(String purchaseId) async {
    final isar = await db;
    final data = await isar.dbPurchasedStatus
        .filter()
        .purchaseIDEqualTo(purchaseId)
        .findFirst();
    if (data != null) {
      data.uploadedToServer = true;
      data.updatedAt = DateTime.now();
      await isar.writeTxn(
        () async {
          await isar.dbPurchasedStatus.put(data);
        },
      );
    }
  }

  Future<List<DbPurchasedStatus>> getPendingToUploadPurchasedStatus() async {
    final isar = await db;
    return await isar.dbPurchasedStatus
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .purchaseStatusEqualTo(AppConfig.inAppStatusPurchased)
        .and()
        .uploadedToServerEqualTo(false)
        .findAll();
  }

  Future<void> saveBrooonPropertiesCount(
      DbBrooonPaginationCountSchema obj) async {
    obj.id = SaveDefaultData.brooonPropertyPaginationCountSchemaId;
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbBrooonPaginationCountSchemas.put(obj);
      },
    );
  }

  Future<DbBrooonPaginationCountSchema?>
      getBrooonPropertiesCountSchema() async {
    final isar = await db;
    return await isar.dbBrooonPaginationCountSchemas
        .where()
        .idEqualTo(SaveDefaultData.brooonPropertyPaginationCountSchemaId)
        .findFirst();
  }

  Future<void> saveBlockedBrooonersCount(
      DbBrooonPaginationCountSchema obj) async {
    obj.id = SaveDefaultData.brooonBlockedBrooonersPaginationCountSchemaId;
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbBrooonPaginationCountSchemas.put(obj);
      },
    );
  }

  Future<DbBrooonPaginationCountSchema?>
      getBlockedBrooonersCountSchema() async {
    final isar = await db;
    return await isar.dbBrooonPaginationCountSchemas
        .where()
        .idEqualTo(
            SaveDefaultData.brooonBlockedBrooonersPaginationCountSchemaId)
        .findFirst();
  }

  Future<void> saveBrooonInquiriesCount(
      DbBrooonPaginationCountSchema obj) async {
    obj.id = SaveDefaultData.brooonInquiryPaginationCountSchemaId;
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbBrooonPaginationCountSchemas.put(obj);
      },
    );
  }

  Future<DbBrooonPaginationCountSchema?> getBrooonInquiriesCountSchema() async {
    final isar = await db;
    return await isar.dbBrooonPaginationCountSchemas
        .where()
        .idEqualTo(SaveDefaultData.brooonInquiryPaginationCountSchemaId)
        .findFirst();
  }

  savePropertyVisitors(DbPropertyVisitors obj) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbPropertyVisitors.put(obj);
      },
    );
  }

  Future<List<DbPropertyVisitors>> getVisitors({
    String? propertyId,
    bool excludeEmptyBuyerName = false,
  }) async {
    final isar = await db;
    return await isar.dbPropertyVisitors
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .optional(
          excludeEmptyBuyerName,
          (q) => q.nameIsNotNull().and().nameIsNotEmpty(),
        )
        .and()
        .optional(propertyId != null, (q) => q.propertyIdEqualTo(propertyId!))
        .sortByAddedAtDesc()
        .findAll();
  }

  saveAdditionalFurnishing(List<DbAdditionalFurnish> list) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        await isar.dbAdditionalFurnishs.putAll(list);
      },
    );
  }

  Future<List<DbAdditionalFurnish>> getAdditionalFurnish() async {
    final isar = await db;
    return await isar.dbAdditionalFurnishs.where().findAll();
  }

  Future<int> getAdditionalFurnishIdByName(String? name) async {
    if (name != null && name.trim().isNotEmpty) {
      final isar = await db;
      final info = await isar.dbAdditionalFurnishs
          .filter()
          .nameEqualTo(
            name,
            caseSensitive: false,
          )
          .findFirst();
      if (info != null) {
        return info.id;
      }
    }
    return 0;
  }

  Future<int> getVisitorsCount(String propertyId) async {
    final isar = await db;
    return await isar.dbPropertyVisitors
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertyIdEqualTo(propertyId)
        .count();
  }

  deleteVisitors(String propertyId) async {
    final isar = await db;
    final list = await isar.dbPropertyVisitors
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .propertyIdEqualTo(propertyId)
        .findAll();
    if (list.isNotEmpty) {
      final List<int> ids = [];
      list.forEach(
        (element) {
          ids.add(element.id);
        },
      );
      await isar.writeTxn(
        () async {
          return await isar.dbPropertyVisitors.deleteAll(ids);
        },
      );
    }
  }

  saveLocationTags(List<DbLocationTags> list) async {
    final List<DbLocationTags> tags = [];
    final isar = await db;
    for (int i = 0; i < list.length; i++) {
      bool isNewTag =
          await isar.dbLocationTags.filter().tagEqualTo(list[i].tag).isEmpty();
      if (isNewTag) {
        bool isUniqueTag = true;
        if (tags.isNotEmpty) {
          isUniqueTag = tags.indexWhere((element) =>
                  element.tag!.trim().toLowerCase() ==
                  list[i].tag!.trim().toLowerCase()) ==
              -1;
        }
        if (isUniqueTag) {
          tags.add(list[i]);
        }
      }
    }
    if (tags.isNotEmpty) {
      await isar.writeTxn(
        () async {
          await isar.dbLocationTags.putAll(tags);
        },
      );
    }
  }

  Future<List<DbLocationTags>> getLocationTags() async {
    final isar = await db;
    return await isar.dbLocationTags.where().findAll();
  }

  Future<Map<String, dynamic>> exportDb() async {
    final isar = await db;
    final data = Map<String, dynamic>();
    final properties = await isar.dbPropertys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .and()
        .sharedByBrooonEqualTo(false)
        .exportJson();
    data[Strings.importExportPropertiesKey] = properties;
    final preferredCast = await isar.dbPropertyPreferredCasts
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .exportJson();
    data[Strings.importExportPreferredCastesKey] = preferredCast;
    final amenitiesManagement = await isar.dbPropertyAmenitys
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .exportJson();
    data[Strings.importExportAmenitiesKey] = amenitiesManagement;
    final savedFilters = await isar.dbSavedFilters
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .exportJson();
    data[Strings.importExportSavedFiltersKey] = savedFilters;
    final reminders = await isar.dbReminders
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .exportJson();
    data[Strings.importExportRemindersKey] = reminders;
    final visitors = await isar.dbPropertyVisitors
        .filter()
        .userIdEqualTo(StaticFunctions.userId)
        .exportJson();
    data[Strings.importExportVisitorsKey] = visitors;
    final locationTags = await isar.dbLocationTags.where().exportJson();
    data[Strings.importExportLocationTagsKey] = locationTags;
    return data;
  }

  importDb(LinkedHashMap map, String photoDirPath) async {
    final isar = await db;
    // property schema
    if (map.containsKey(Strings.importExportPropertiesKey)) {
      final propertyList = map[Strings.importExportPropertiesKey] as List;
      if (propertyList.isNotEmpty) {
        List<Map<String, dynamic>> propertyMap = [];
        propertyList.forEach(
          (element) {
            if (Platform.isIOS) {
              // update document directory path as in iOS directory name is changing every time
              if (element is Map<String, dynamic> &&
                  element.containsKey(AppConfig.propertyPhotosLocalKey)) {
                final photos =
                    element[AppConfig.propertyPhotosLocalKey] as List<dynamic>?;
                if (photos != null && photos.isNotEmpty) {
                  for (int i = 0; i < photos.length; i++) {
                    if (photos[i] is String && photos[i].isNotEmpty) {
                      final split = (photos[i] as String).split('/');
                      if (split.length > 2) {
                        photos[i] =
                            '${photoDirPath}/${split[split.length - 2]}/${split[split.length - 1]}';
                      }
                    }
                  }
                  element[AppConfig.propertyPhotosLocalKey] = photos;
                }
              }
            }
            propertyMap.add(element as Map<String, dynamic>);
          },
        );
        await isar.writeTxn(
          () async {
            await isar.dbPropertys.importJson(propertyMap);
          },
        );
      }
    }
    // preferred cast schema
    if (map.containsKey(Strings.importExportPreferredCastesKey)) {
      final preferredCastList =
          map[Strings.importExportPreferredCastesKey] as List;
      if (preferredCastList.isNotEmpty) {
        List<Map<String, dynamic>> preferredCastMap = [];
        preferredCastList.forEach(
          (element) {
            preferredCastMap.add(element as Map<String, dynamic>);
          },
        );
        await isar.writeTxn(
          () async {
            await isar.dbPropertyPreferredCasts.importJson(preferredCastMap);
          },
        );
      }
    }
    // amenities schema
    if (map.containsKey(Strings.importExportAmenitiesKey)) {
      final amenitiesList = map[Strings.importExportAmenitiesKey] as List;
      if (amenitiesList.isNotEmpty) {
        List<Map<String, dynamic>> amenitiesMap = [];
        amenitiesList.forEach(
          (element) {
            amenitiesMap.add(element as Map<String, dynamic>);
          },
        );
        await isar.writeTxn(
          () async {
            await isar.dbPropertyAmenitys.importJson(amenitiesMap);
          },
        );
      }
    }
    // reminder schema
    if (map.containsKey(Strings.importExportRemindersKey)) {
      final reminderList = map[Strings.importExportRemindersKey] as List;
      if (reminderList.isNotEmpty) {
        List<Map<String, dynamic>> reminderMap = [];
        reminderList.forEach(
          (element) {
            reminderMap.add(element as Map<String, dynamic>);
          },
        );
        await isar.writeTxn(
          () async {
            await isar.dbReminders.importJson(reminderMap);
          },
        );
      }
    }
    // visitors schema
    if (map.containsKey(Strings.importExportVisitorsKey)) {
      final visitorsList = map[Strings.importExportVisitorsKey] as List;
      if (visitorsList.isNotEmpty) {
        List<Map<String, dynamic>> visitorMap = [];
        visitorsList.forEach(
          (element) {
            visitorMap.add(element as Map<String, dynamic>);
          },
        );
        await isar.writeTxn(
          () async {
            await isar.dbPropertyVisitors.importJson(visitorMap);
          },
        );
      }
    }

    // location tags schema
    if (map.containsKey(Strings.importExportLocationTagsKey)) {
      final locationTagsList = map[Strings.importExportLocationTagsKey] as List;
      if (locationTagsList.isNotEmpty) {
        List<Map<String, dynamic>> locationTagsMap = [];
        locationTagsList.forEach(
          (element) {
            locationTagsMap.add(element as Map<String, dynamic>);
          },
        );
        await isar.writeTxn(
          () async {
            await isar.dbLocationTags.importJson(locationTagsMap);
          },
        );
      }
    }

    // saved filter schema
    if (map.containsKey(Strings.importExportSavedFiltersKey)) {
      final savedFilterList = map[Strings.importExportSavedFiltersKey] as List;
      if (savedFilterList.isNotEmpty) {
        List<Map<String, dynamic>> savedFilterMap = [];
        savedFilterList.forEach((element) {
          savedFilterMap.add(element as Map<String, dynamic>);
        });
        await isar.writeTxn(
          () async {
            await isar.dbSavedFilters.importJson(savedFilterMap);
          },
        );
      }
    }
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          DbUserInfoSchema,
          DbPropertyTypeSchema,
          DbPropertySchema,
          DbPropertyAmenitySchema,
          DbPropertyForSchema,
          DbPropertyFurnishedStatusSchema,
          DbPropertySoldStatusSchema,
          DbPropertyStatusSchema,
          DbPropertyPreferredCastSchema,
          DbPropertyPriceUnitSchema,
          DbPropertyAreaUnitSchema,
          DbSettingSchema,
          DbPropertyBhkTypeSchema,
          DbPropertyBuildingTypeSchema,
          DbPropertyConnectedRoadSchema,
          DbPropertyConstructionTypeSchema,
          DbPropertyFacingTypeSchema,
          DbPropertySchemeTypeSchema,
          DbAreaUnitValueSchema,
          DbSavedFilterSchema,
          DbReminderSchema,
          DbSubscriptionPlanSchema,
          DbPlanHistorySchema,
          DbAppSettingsSchema,
          DbBackupLocalInfoSchema,
          DbGoogleDriveFileInfoSchema,
          DbPropertyPhotoMetaSchema,
          DbNotificationSchema,
          DbAppLinksSchema,
          DbAppPrivacyLogsSchema,
          DbPurchasedStatusSchema,
          DbStatusSyncSchema,
          DbBrooonPaginationCountSchemaSchema,
          DbPropertyVisitorsSchema,
          DbAdditionalFurnishSchema,
          DbLocationTagsSchema,
          DbBlockedBrooonerSchema,
        ],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
