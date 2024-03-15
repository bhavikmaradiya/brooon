import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './app_settings/db_app_settings.dart';
import './isar_service.dart';
import './properties/db_additional_furnish.dart';
import './properties/db_area_unit_values.dart';
import './properties/db_property_area_unit.dart';
import './properties/db_property_bhk_type.dart';
import './properties/db_property_building_type.dart';
import './properties/db_property_connected_road.dart';
import './properties/db_property_construction_type.dart';
import './properties/db_property_facing_type.dart';
import './properties/db_property_for.dart';
import './properties/db_property_furnished_status.dart';
import './properties/db_property_price_unit.dart';
import './properties/db_property_scheme_type.dart';
import './properties/db_property_sold_status.dart';
import './properties/db_property_status.dart';
import './properties/db_property_type.dart';
import '../const/string_const.dart';
import '../utils/app_config.dart';
import '../utils/static_functions.dart';

class SaveDefaultData {
  final _isarService = IsarService();
  late AppLocalizations localizationsContext;

  static const areaUnitSqFtId = 1;
  static const areaUnitSqMtId = 2;
  static const areaUnitYdId = 3;
  static const areaUnitGunthaId = 4;
  static const areaUnitBighaId = 5;
  static const areaUnitAcreId = 6;
  static const areaUnitHectareId = 7;
  static const areaUnitFeetId = 8;
  static const activeStatusId = 1;
  static const inActiveStatusId = 2;
  static const priceUnitRupeeId = 1;
  static const priceUnitDollarId = 2;
  static const soldStatusId = 1;
  static const unSoldStatusId = 2;
  static const propertyForAllId = 0;
  static const propertyForSellId = 1;
  static const propertyForRentId = 2;
  static const propertyForLeaseId = 3;
  static const propertyGreenTypeId = 1;
  static const propertyFreeTypeId = 2;
  static const propertyResidentialTypeId = 3;
  static const propertyCommercialTypeId = 4;
  static const propertyIndustrialTypeId = 5;
  static const propertyTypeBungalowId = 1;
  static const propertyTypeFlatId = 2;
  static const propertyTypeShowRoomId = 3;
  static const propertyTypeOfficeId = 4;
  static const propertyTypePlotId = 5;
  static const propertyTypeAgricultureLandId = 6;

  static const propertyVisibilityPrivateId = 1;
  static const propertyVisibilityPublicId = 2;

  static const filterPriceUnitThousand = 1;
  static const filterPriceUnitLac = 2;
  static const filterPriceUnitCrore = 3;

  static const int filterSearchByPropertiesId = 1;
  static const int filterSearchByInquiriesId = 2;

  static const yesOptionId = 1;
  static const noOptionId = 2;

  static const settingNotificationId = 1;
  static const settingRadiusId = 2;
  static const settingUploadWatermarkId = 3;
  static const settingShareId = 4;
  static const settingShareBasicDetailsId = 5;
  static const settingShareOtherDetailsId = 6;
  static const settingShareLogoId = 7;
  static const settingShareImagesId = 8;
  static const settingShareWatermarkId = 9;
  static const settingAppReminderId = 10;
  static const settingCastManagementId = 11;
  static const settingPublicPropertyId = 12;
  static const settingAmenitiesManagementId = 13;
  static const settingConfigOptionId = 14;
  static const settingNearByDistanceId = 15;
  static const settingMySearchDistanceId = 16;
  static const settingBrooonSearchDistanceId = 17;
  static const settingBlockedBrooonerId = 18;

  static const constructionTypeOldId = 1;
  static const constructionTypeNewId = 2;

  static const watermarkTypeImageId = 1;
  static const watermarkTypeTextId = 2;
  static const watermarkTypeImageString = 'image';
  static const watermarkTypeTextString = 'text';

  static const aboutUsLinkId = 0;
  static const privacyLinkId = 1;
  static const termsLinkId = 2;
  static const faqsLinkId = 3;
  static const facebookLinkId = 4;
  static const twitterLinkId = 5;
  static const linkedInLinkId = 6;
  static const instagramLinkId = 7;

  static const brooonPropertyPaginationCountSchemaId = 1;
  static const brooonInquiryPaginationCountSchemaId = 2;
  static const brooonBlockedBrooonersPaginationCountSchemaId = 3;

  init(BuildContext context) async {
    this.localizationsContext = AppLocalizations.of(context)!;
    await _savePropertyTypes();
    await _savePropertyFor();
    await _saveFurnishedStatus();
    await _savePropertyStatus();
    await _savePropertyPriceUnit();
    await _savePropertySoldStatus();
    await _savePropertyAreaUnit();
    await _savePropertyBhkTypes();
    await _savePropertyBuildingTypes();
    await _savePropertyConnectedRoads();
    await _savePropertyConstructionTypes();
    await _savePropertyFacingTypes();
    await _savePropertySchemeTypes();
    await _saveUnitValues();
    await _saveAppSettings();
    await _saveAdditionalFurnishing();
    final data = await _isarService.getDefaultPriceUnit();
    StaticFunctions.defaultPriceUnit = data?.unit ?? '';
    StaticFunctions.defaultPriceUnitId = data?.id ?? priceUnitRupeeId;
  }

  _saveAppSettings() async {
    final appSettings = await _isarService.getAppSettings();
    if (appSettings == null) {
      await _isarService.updateAppSettings(DbAppSettings());
    }
  }

  _savePropertyTypes() async {
    final list = await _isarService.getPropertyTypes();
    if (list.isEmpty) {
      final List<DbPropertyType> propertyTypes = [];
      propertyTypes.addAll(
        [
          DbPropertyType()
            ..id = propertyTypeBungalowId
            ..name = this.localizationsContext.propertyTypeBungalow
            ..assetPath = Strings.iconPropertyTypeBungalow,
          DbPropertyType()
            ..id = propertyTypeFlatId
            ..name = this.localizationsContext.propertyTypeFlat
            ..assetPath = Strings.iconPropertyTypeFlat,
          DbPropertyType()
            ..id = propertyTypeShowRoomId
            ..name = this.localizationsContext.propertyTypeShowroom
            ..assetPath = Strings.iconPropertyTypeShowroom,
          DbPropertyType()
            ..id = propertyTypeOfficeId
            ..name = this.localizationsContext.propertyTypeOffice
            ..assetPath = Strings.iconPropertyTypeOffice,
          DbPropertyType()
            ..id = propertyTypePlotId
            ..name = this.localizationsContext.propertyTypePlot
            ..assetPath = Strings.iconPropertyTypePlot,
          DbPropertyType()
            ..id = propertyTypeAgricultureLandId
            ..name = this.localizationsContext.propertyTypeAgricultureLand
            ..assetPath = Strings.iconPropertyTypeAgricultureLand,
        ],
      );
      await _isarService.savePropertyTypes(propertyTypes);
    }
  }

  _saveUnitValues() async {
    final list = await _isarService.getUnitValues();
    if (list.isEmpty) {
      List<DbAreaUnitValue> unitValues = [
        DbAreaUnitValue()
          ..fromId = areaUnitYdId
          ..toId = areaUnitSqFtId
          ..value = 9,
        DbAreaUnitValue()
          ..fromId = areaUnitAcreId
          ..toId = areaUnitSqFtId
          ..value = 43560,
        DbAreaUnitValue()
          ..fromId = areaUnitBighaId
          ..toId = areaUnitSqFtId
          ..value = 17424,
        DbAreaUnitValue()
          ..fromId = areaUnitGunthaId
          ..toId = areaUnitSqFtId
          ..value = 1089,
        DbAreaUnitValue()
          ..fromId = areaUnitHectareId
          ..toId = areaUnitSqFtId
          ..value = 107639.150512,
        DbAreaUnitValue()
          ..fromId = areaUnitSqMtId
          ..toId = areaUnitSqFtId
          ..value = 10.763915,
        DbAreaUnitValue()
          ..fromId = areaUnitYdId
          ..toId = areaUnitAcreId
          ..value = 0.000206612,
        DbAreaUnitValue()
          ..fromId = areaUnitBighaId
          ..toId = areaUnitAcreId
          ..value = 0.399999,
        DbAreaUnitValue()
          ..fromId = areaUnitGunthaId
          ..toId = areaUnitAcreId
          ..value = 0.025000,
        DbAreaUnitValue()
          ..fromId = areaUnitHectareId
          ..toId = areaUnitAcreId
          ..value = 2.471058954464,
        DbAreaUnitValue()
          ..fromId = areaUnitSqMtId
          ..toId = areaUnitAcreId
          ..value = 0.000247105,
        DbAreaUnitValue()
          ..fromId = areaUnitYdId
          ..toId = areaUnitBighaId
          ..value = 0.000517,
        DbAreaUnitValue()
          ..fromId = areaUnitGunthaId
          ..toId = areaUnitBighaId
          ..value = 0.062500,
        DbAreaUnitValue()
          ..fromId = areaUnitHectareId
          ..toId = areaUnitBighaId
          ..value = 6.177637,
        DbAreaUnitValue()
          ..fromId = areaUnitSqMtId
          ..toId = areaUnitBighaId
          ..value = 0.000618,
        DbAreaUnitValue()
          ..fromId = areaUnitYdId
          ..toId = areaUnitGunthaId
          ..value = 0.008264,
        DbAreaUnitValue()
          ..fromId = areaUnitHectareId
          ..toId = areaUnitGunthaId
          ..value = 98.842195,
        DbAreaUnitValue()
          ..fromId = areaUnitSqMtId
          ..toId = areaUnitGunthaId
          ..value = 0.009884,
        DbAreaUnitValue()
          ..fromId = areaUnitYdId
          ..toId = areaUnitHectareId
          ..value = 0.000083613,
        DbAreaUnitValue()
          ..fromId = areaUnitSqMtId
          ..toId = areaUnitHectareId
          ..value = 0.0001,
        DbAreaUnitValue()
          ..fromId = areaUnitYdId
          ..toId = areaUnitSqMtId
          ..value = 0.836127,
      ];
      await _isarService.saveUnitValues(unitValues);
    }
  }

  _savePropertyFor() async {
    final list = await _isarService.getPropertyFor();
    if (list.isEmpty) {
      final List<DbPropertyFor> propertyFor = [];
      propertyFor.add(
        DbPropertyFor()
          ..id = propertyForSellId
          ..name = localizationsContext.sell,
      );
      propertyFor.add(
        DbPropertyFor()
          ..id = propertyForRentId
          ..name = localizationsContext.rent,
      );
      propertyFor.add(
        DbPropertyFor()
          ..id = propertyForLeaseId
          ..name = localizationsContext.lease,
      );
      await _isarService.savePropertyFor(propertyFor);
    }
  }

  _saveFurnishedStatus() async {
    final list = await _isarService.getFurnishedStatus();
    if (list.isEmpty) {
      final List<DbPropertyFurnishedStatus> furnishedStatus = [];
      furnishedStatus.add(
        DbPropertyFurnishedStatus()
          ..id = 1
          ..name = localizationsContext.furnished,
      );
      furnishedStatus.add(
        DbPropertyFurnishedStatus()
          ..id = 2
          ..name = localizationsContext.semiFurnished,
      );
      furnishedStatus.add(
        DbPropertyFurnishedStatus()
          ..id = 3
          ..name = localizationsContext.unFurnished,
      );
      await _isarService.saveFurnishedStatus(furnishedStatus);
    }
  }

  _savePropertyStatus() async {
    final list = await _isarService.getPropertyStatus();
    if (list.isEmpty) {
      final List<DbPropertyStatus> propertyStatus = [];
      propertyStatus.add(
        DbPropertyStatus()
          ..id = activeStatusId
          ..name = localizationsContext.active,
      );
      propertyStatus.add(
        DbPropertyStatus()
          ..id = inActiveStatusId
          ..name = localizationsContext.inActive,
      );
      await _isarService.savePropertyStatus(propertyStatus);
    }
  }

  _savePropertyPriceUnit() async {
    final list = await _isarService.getPropertyPriceUnit();
    if (list.isEmpty) {
      final List<DbPropertyPriceUnit> propertyPriceUnit = [];
      propertyPriceUnit.add(
        DbPropertyPriceUnit()
          ..id = priceUnitRupeeId
          ..unit = AppConfig.rupeeSymbol
          ..isDefaultUnit = true,
      );
      propertyPriceUnit.add(
        DbPropertyPriceUnit()
          ..id = priceUnitDollarId
          ..unit = '\$',
      );
      await _isarService.savePropertyPriceUnit(propertyPriceUnit);
    }
  }

  _savePropertySoldStatus() async {
    final list = await _isarService.getPropertySoldStatus();
    if (list.isEmpty) {
      final List<DbPropertySoldStatus> propertySoldStatus = [];
      propertySoldStatus.add(
        DbPropertySoldStatus()
          ..id = soldStatusId
          ..name = localizationsContext.sold,
      );
      propertySoldStatus.add(
        DbPropertySoldStatus()
          ..id = unSoldStatusId
          ..name = localizationsContext.unSold,
      );
      await _isarService.savePropertySoldStatus(propertySoldStatus);
    }
  }

  _savePropertyAreaUnit() async {
    final list = await _isarService.getPropertyAreaUnits();
    if (list.isEmpty) {
      final List<DbPropertyAreaUnit> propertyAreaUnit = [];
      propertyAreaUnit.addAll(
        [
          DbPropertyAreaUnit()
            ..id = areaUnitSqFtId
            ..unit = localizationsContext.sqft
            ..shortName = localizationsContext.sqftShortName,
          DbPropertyAreaUnit()
            ..id = areaUnitSqMtId
            ..unit = localizationsContext.sqmt
            ..shortName = localizationsContext.sqmtShortName,
          DbPropertyAreaUnit()
            ..id = areaUnitYdId
            ..unit = localizationsContext.yd
            ..shortName = localizationsContext.ydShortName,
          DbPropertyAreaUnit()
            ..id = areaUnitAcreId
            ..unit = localizationsContext.acre
            ..shortName = localizationsContext.acreShortName,
          DbPropertyAreaUnit()
            ..id = areaUnitHectareId
            ..unit = localizationsContext.hectare
            ..shortName = localizationsContext.hectareShortName,
          DbPropertyAreaUnit()
            ..id = areaUnitBighaId
            ..unit = localizationsContext.bigha
            ..shortName = localizationsContext.bighaShortName,
          DbPropertyAreaUnit()
            ..id = areaUnitGunthaId
            ..unit = localizationsContext.guntha
            ..shortName = localizationsContext.gunthaShortName,
        ],
      );
      await _isarService.savePropertyAreaUnit(propertyAreaUnit);
    }
  }

  _savePropertyBhkTypes() async {
    final list = await _isarService.getBhkTypes();
    if (list.isEmpty) {
      final List<DbPropertyBhkType> bhkTypes = [
        DbPropertyBhkType()
          ..id = 1
          ..name = localizationsContext.oneBhk,
        DbPropertyBhkType()
          ..id = 2
          ..name = localizationsContext.twoBhk,
        DbPropertyBhkType()
          ..id = 3
          ..name = localizationsContext.threeBhk,
        DbPropertyBhkType()
          ..id = 4
          ..name = localizationsContext.fourBhk,
        DbPropertyBhkType()
          ..id = 5
          ..name = localizationsContext.fiveBhk,
        DbPropertyBhkType()
          ..id = 6
          ..name = localizationsContext.fivePlusBhk,
      ];
      await _isarService.savePropertyBhkTypes(bhkTypes);
    }
  }

  _savePropertyBuildingTypes() async {
    final list = await _isarService.getBuildingTypes();
    if (list.isEmpty) {
      final List<DbPropertyBuildingType> buildingTypes = [
        DbPropertyBuildingType()
          ..id = propertyGreenTypeId
          ..name = localizationsContext.green
          ..isForAgricultureOnly = true,
        DbPropertyBuildingType()
          ..id = propertyFreeTypeId
          ..name = localizationsContext.free
          ..isForAgricultureOnly = true,
        DbPropertyBuildingType()
          ..id = propertyResidentialTypeId
          ..name = localizationsContext.residential,
        DbPropertyBuildingType()
          ..id = propertyCommercialTypeId
          ..name = localizationsContext.commercial,
        DbPropertyBuildingType()
          ..id = propertyIndustrialTypeId
          ..name = localizationsContext.industrial,
      ];
      await _isarService.savePropertyBuildingTypes(buildingTypes);
    }
  }

  _savePropertyConnectedRoads() async {
    final list = await _isarService.getConnectedRoads();
    if (list.isEmpty) {
      final List<DbPropertyConnectedRoad> connectedRoads = [
        DbPropertyConnectedRoad()
          ..id = 1
          ..name = localizationsContext.ft40,
        DbPropertyConnectedRoad()
          ..id = 2
          ..name = localizationsContext.ft80,
        DbPropertyConnectedRoad()
          ..id = 3
          ..name = localizationsContext.ft100,
        DbPropertyConnectedRoad()
          ..id = 4
          ..name = localizationsContext.ft120,
        DbPropertyConnectedRoad()
          ..id = 5
          ..name = localizationsContext.ft150,
      ];
      await _isarService.savePropertyConnectedRoads(connectedRoads);
    }
  }

  _savePropertyConstructionTypes() async {
    final list = await _isarService.getConstructionTypes();
    if (list.isEmpty) {
      final List<DbPropertyConstructionType> constructionTypes = [
        DbPropertyConstructionType()
          ..id = constructionTypeOldId
          ..name = localizationsContext.oldText,
        DbPropertyConstructionType()
          ..id = constructionTypeNewId
          ..name = localizationsContext.newText,
      ];
      await _isarService.savePropertyConstructionTypes(constructionTypes);
    }
  }

  _savePropertyFacingTypes() async {
    final list = await _isarService.getFacingTypes();
    if (list.isEmpty) {
      final List<DbPropertyFacingType> facingTypes = [
        DbPropertyFacingType()
          ..id = 1
          ..name = localizationsContext.north,
        DbPropertyFacingType()
          ..id = 2
          ..name = localizationsContext.east,
        DbPropertyFacingType()
          ..id = 3
          ..name = localizationsContext.south,
        DbPropertyFacingType()
          ..id = 4
          ..name = localizationsContext.west,
        DbPropertyFacingType()
          ..id = 5
          ..name = localizationsContext.northEast,
        DbPropertyFacingType()
          ..id = 6
          ..name = localizationsContext.northWest,
        DbPropertyFacingType()
          ..id = 7
          ..name = localizationsContext.southEast,
        DbPropertyFacingType()
          ..id = 8
          ..name = localizationsContext.southWest,
      ];
      await _isarService.savePropertyFacingTypes(facingTypes);
    }
  }

  _savePropertySchemeTypes() async {
    final list = await _isarService.getSchemeTypes();
    if (list.isEmpty) {
      final List<DbPropertySchemeType> schemeTypes = [
        DbPropertySchemeType()
          ..id = 1
          ..name = localizationsContext.oldText,
        DbPropertySchemeType()
          ..id = 2
          ..name = localizationsContext.newText,
      ];
      await _isarService.savePropertySchemeTypes(schemeTypes);
    }
  }

  _saveAdditionalFurnishing() async {
    final list = await _isarService.getAdditionalFurnish();
    if (list.isEmpty) {
      final List<DbAdditionalFurnish> furnishing = [
        DbAdditionalFurnish()
          ..id = 1
          ..name = localizationsContext.gasConnection,
        DbAdditionalFurnish()
          ..id = 2
          ..name = localizationsContext.fridge,
        DbAdditionalFurnish()
          ..id = 3
          ..name = localizationsContext.sofa,
        DbAdditionalFurnish()
          ..id = 4
          ..name = localizationsContext.ac,
        DbAdditionalFurnish()
          ..id = 5
          ..name = localizationsContext.diningTable,
        DbAdditionalFurnish()
          ..id = 6
          ..name = localizationsContext.fans,
      ];
      await _isarService.saveAdditionalFurnishing(furnishing);
    }
  }
}
