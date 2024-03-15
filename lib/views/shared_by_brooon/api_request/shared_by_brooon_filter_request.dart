import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common_property_data_provider.dart';
import '../../../localdb/properties/db_saved_filter.dart';

class SharedByBrooonFilterRequest {
  final AppLocalizations localizationsContext;
  final CommonPropertyDataProvider commonPropertyDataProvider;

  const SharedByBrooonFilterRequest({
    required this.localizationsContext,
    required this.commonPropertyDataProvider,
  });

  Future<List<String?>> _getBhks(List<int> bhkIds) async {
    final List<String> bhks = [];
    for (int i = 0; i < bhkIds.length; i++) {
      final data =
          await commonPropertyDataProvider.getPropertyBhkById(bhkIds[i]);
      if (data != null) {
        bhks.add(data.name);
      }
    }
    return bhks;
  }

  Future<List<String?>> _getBuildingTypes(List<int> buildingTypeIds) async {
    final data = await commonPropertyDataProvider.getPropertyBuildingTypeById(
      buildingTypeIds,
    );
    if (data != null && data.isNotEmpty) {
      return data.map((e) => e.name).toList();
    }
    return [];
  }

  Future<List<String>?> _getConstructions(List<int> constructionIds) async {
    final List<String> constructions = [];
    for (int i = 0; i < constructionIds.length; i++) {
      final data = await commonPropertyDataProvider.getConstructionTypeById(
        constructionIds[i],
      );
      if (data != null) {
        constructions.add(data.name);
      }
    }
    return constructions;
  }

  Future<List<String>?> _getFacings(List<int> facingIds) async {
    final List<String> facings = [];
    for (int i = 0; i < facingIds.length; i++) {
      final data = await commonPropertyDataProvider.getPropertyFacingTypeById(
        facingIds[i],
      );
      if (data != null) {
        facings.add(data.name);
      }
    }
    return facings;
  }

  Future<String?> _getMeasure(int? measureId) async {
    if (measureId != null && measureId != (-1)) {
      final info =
          await commonPropertyDataProvider.getPropertyAreaUnitById(measureId);
      if (info != null) {
        return info.unit;
      }
    }
    return null;
  }

  Future<List<String>?> _getSchemeTypes(List<int> schemeTypeIds) async {
    final List<String> schemeTypes = [];
    for (int i = 0; i < schemeTypeIds.length; i++) {
      final data = await commonPropertyDataProvider.getPropertySchemeTypeById(
        schemeTypeIds[i],
      );
      if (data != null) {
        schemeTypes.add(data.name);
      }
    }
    return schemeTypes;
  }

  Future<List<String>?> _getPropertyFors(List<int> forIds) async {
    final List<String> fors = [];
    for (int i = 0; i < forIds.length; i++) {
      final data = await commonPropertyDataProvider.getPropertyForById(
        forIds[i],
      );
      if (data != null) {
        fors.add(data.name);
      }
    }
    return fors;
  }

  Future<List<String>?> _getPropertyTypes(List<int> typeIds) async {
    final List<String> types = [];
    for (int i = 0; i < typeIds.length; i++) {
      final data = await commonPropertyDataProvider.getPropertyTypeById(
        typeIds[i],
      );
      if (data != null) {
        types.add(data.name);
      }
    }
    return types;
  }

  Future<Map<String, dynamic>> toMap(
    int? propertyTypeId,
    DbSavedFilter? filter,
  ) async {
    Map<String, dynamic> body = {};
    if (filter != null) {
      if (filter.additionalFurnish != null &&
          filter.additionalFurnish!.isNotEmpty) {
        body['additional_furnish'] = filter.additionalFurnish;
      }
      if (filter.bathroomCount != null) {
        body['bathroom_count'] = filter.bathroomCount;
      }
      if (filter.bhkIds != null && filter.bhkIds!.isNotEmpty) {
        body['bhk'] = await _getBhks(filter.bhkIds!);
      }
      if (filter.buildingType != null && filter.buildingType!.isNotEmpty) {
        body['building_type'] = await _getBuildingTypes(filter.buildingType!);
      }
      if (filter.connectedRoads != null && filter.connectedRoads!.isNotEmpty) {
        body['connected_roads'] = filter.connectedRoads!;
      }
      if (filter.constructionType != null &&
          filter.constructionType!.isNotEmpty) {
        body['construction_type'] =
            await _getConstructions(filter.constructionType!);
      }
      if (filter.frontSize != null) {
        body['front_size'] = filter.frontSize;
      }
      if (filter.depthSize != null) {
        body['depth_size'] = filter.depthSize;
      }
      if (filter.facingType != null && filter.facingType!.isNotEmpty) {
        body['facing_type'] = await _getFacings(filter.facingType!);
      }
      if (filter.furnishedType != null && filter.furnishedType!.isNotEmpty) {
        body['furnished_type'] = filter.furnishedType;
      }
      if (filter.floorCount != null) {
        body['floor_count'] = filter.floorCount;
      }
      if (filter.isAllottedParkingAvailable != null) {
        body['is_allotted_parking_available'] =
            filter.isAllottedParkingAvailable;
      }
      if (filter.isBalconyAvailable != null) {
        body['is_balcony_available'] = filter.isBalconyAvailable;
      }
      if (filter.isCornerPiece != null) {
        body['is_corner_piece'] = filter.isCornerPiece;
      }
      if (filter.isLightConnectionAvailable != null) {
        body['is_light_connection_available'] =
            filter.isLightConnectionAvailable;
      }
      if (filter.isParkingAvailable != null) {
        body['is_parking_available'] = filter.isParkingAvailable;
      }
      if (filter.isWashroomAvailable != null) {
        body['is_washroom_available'] = filter.isWashroomAvailable;
      }
      if (filter.isWellAvailable != null) {
        body['is_well_available'] = filter.isWellAvailable;
      }
      if (filter.maxMeasure != null) {
        body['max_measure'] = filter.maxMeasure;
      }
      if (filter.minMeasure != null) {
        body['min_measure'] = filter.minMeasure;
      }
      if (filter.measureUnit != null) {
        body['measure_unit'] = await _getMeasure(filter.measureUnit);
      }
      if (filter.preferredCaste != null && filter.preferredCaste!.isNotEmpty) {
        body['preferred_caste'] = filter.preferredCaste;
      }
      if (filter.selectedAmenities != null &&
          filter.selectedAmenities!.isNotEmpty) {
        body['selected_amenities'] = filter.selectedAmenities;
      }
      if (filter.sellPriceRangeMax != null) {
        body['price_range_max'] = filter.sellPriceRangeMax;
      }
      if (filter.sellPriceRangeMin != null) {
        body['price_range_min'] = filter.sellPriceRangeMin;
      }
      if (filter.sellMinPricePerSize != null) {
        body['min_price_per_size'] = filter.sellMinPricePerSize;
      }
      if (filter.sellMaxPricePerSize != null) {
        body['max_price_per_size'] = filter.sellMaxPricePerSize;
      }
      if (filter.location != null && filter.location!.trim().isNotEmpty) {
        body['location'] = filter.location;
      } else if (filter.area != null && filter.area!.trim().isNotEmpty) {
        body['location'] = filter.area;
      }
      if (filter.latitude != null) {
        body['latitude'] = filter.latitude;
      }
      if (filter.longitude != null) {
        body['longitude'] = filter.longitude;
      }
      if (filter.roomCount != null) {
        body['room_count'] = filter.roomCount;
      }
      if (filter.totalFloorCount != null) {
        body['total_floor_count'] = filter.totalFloorCount;
      }
      if (filter.propertyType != null && filter.propertyType!.isNotEmpty) {
        body['property_type'] = await _getPropertyTypes(filter.propertyType!);
      }
      if (filter.propertyFor != null && filter.propertyFor!.isNotEmpty) {
        body['property_for'] = await _getPropertyFors(filter.propertyFor!);
      }
      if (filter.schemeType != null && filter.schemeType!.isNotEmpty) {
        body['scheme_type'] = await _getSchemeTypes(filter.schemeType!);
      }
      body['is_negotiable'] = filter.isNegotiable;
    } else if (propertyTypeId != null && propertyTypeId != -1) {
      body['property_type'] = await _getPropertyTypes([propertyTypeId]);
    }
    return body;
  }
}
