import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import './model/filter_search_by.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/helpers/db_locations_tags.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_additional_furnish.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_property_amenity.dart';
import '../../localdb/properties/db_property_area_unit.dart';
import '../../localdb/properties/db_property_bhk_type.dart';
import '../../localdb/properties/db_property_building_type.dart';
import '../../localdb/properties/db_property_construction_type.dart';
import '../../localdb/properties/db_property_facing_type.dart';
import '../../localdb/properties/db_property_for.dart';
import '../../localdb/properties/db_property_furnished_status.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../localdb/properties/db_property_price_unit.dart';
import '../../localdb/properties/db_property_scheme_type.dart';
import '../../localdb/properties/db_property_type.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../views/filter/model/filter_screen_arg.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/property_helpers/location_filter_helper.dart';
import '../add_property/model/options.dart';
import '../choose_location/model/retrieve_location_arg.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class FilterProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;

  List<FilterSearchBy> filterSearchBy = [];
  List<DbPropertyFor> propertyForList = [];
  List<DbPropertyType> propertyTypeList = [];
  List<DbPropertyAmenity> propertyAmenityList = [];
  List<DbPropertyPreferredCast> preferredCastList = [];
  List<DbAdditionalFurnish> additionalFurnishList = [];

  bool? isWashroomAvailable;
  bool? isBalconyAvailable;
  bool? isCornerPiece;
  bool? isLightConnectionAvailable;
  bool? isWellAvailable;
  bool? isAllottedParkingAvailable;
  bool? isParkingAvailable;
  bool? isLiftAvailable;

  final frontSizeTextFieldController = TextEditingController();
  final depthSizeTextFieldController = TextEditingController();
  final roomsTextFieldController = TextEditingController();
  final bathroomsTextFieldController = TextEditingController();
  final floorsTextFieldController = TextEditingController();
  final totalFloorsTextFieldController = TextEditingController();

  bool includeInactiveProperty = false;
  bool includeClosedProperty = false;
  List<DbPropertyFurnishedStatus> furnishedList = [];
  List<DbPropertyBhkType> bhkTypeList = [];
  List<DbPropertyFacingType> facingTypeList = [];
  List<DbPropertyAreaUnit> measurementDropdownUnitList = [];
  List<DbPropertyPriceUnit> priceRangeDropdownUnitList = [];
  List<DbPropertyConstructionType> constructionTypeList = [];
  List<DbPropertySchemeType> schemeTypeList = [];
  List<DbPropertyBuildingType> buildingTypeList = [];
  List<DbPropertyBuildingType> _allBuildingTypes = [];

  List<Options> washRoomAvailableList = [];
  List<Options> balconyAvailableList = [];
  List<Options> cornerPieceList = [];
  List<Options> lightConnectionList = [];
  List<Options> wellAvailableList = [];
  List<Options> parkingAvailableList = [];
  List<Options> allottedParkingList = [];
  List<Options> liftAvailableList = [];

  int _selectedMeasureUnit = -1;
  List<DbSavedFilter> originalFilterList = [];
  List<DbSavedFilter> filterListToDisplay = [];
  final minMeasureRangeController = TextEditingController();
  final maxMeasureRangeController = TextEditingController();

  final firstConnectedRoadController = TextEditingController();
  final secondConnectedRoadController = TextEditingController();

  Size measureDropdownSize = Size(0, 0);
  Size minPriceDropdownSize = Size(0, 0);
  Size maxPriceDropdownSize = Size(0, 0);
  final filterQueryFieldController = TextEditingController();
  final searchFieldController = TextEditingController();
  final minPriceRangeController = TextEditingController();
  final maxPriceRangeController = TextEditingController();
  int _minPriceUnit = -1;
  int _maxPriceUnit = -1;
  final searchFieldFocusNode = FocusNode();
  final measureUnitTextFieldController = TextEditingController();
  final minPriceUnitTextFieldController = TextEditingController();
  final maxPriceUnitTextFieldController = TextEditingController();
  final _isarService = IsarService();
  DbSavedFilter? filterToEdit;
  bool doesFilterExists = false;
  FilterScreenArg? arg;
  StreamSubscription<void>? filterWatcher;
  String _filterTitle = '';
  String priceRangeText = '';
  bool isValid = false;
  List<int> _selectedPropertySequence = [];
  List<DbLocationTags> _savedLocationTags = [];

  final minPricePerSizeController = TextEditingController();
  final maxPricePerSizeController = TextEditingController();

  final minPricePerSizeFocusNode = FocusNode();
  final maxPricePerSizeFocusNode = FocusNode();

  final int _optionsYesId = 1;
  final int _optionsNoId = 2;

  final propertyLocationController = TextEditingController();

  RetrieveLocationArg? _locationArg;

  RetrieveLocationArg? get locationArguments => _locationArg;

  int get optionsYesId => _optionsYesId;

  int get optionsNoId => _optionsNoId;

  String get filterTitle => _filterTitle;

  void init(BuildContext context, FilterScreenArg? arg) {
    this.arg = arg;
    this.filterToEdit = arg?.filterToApply;
    this.localizationsContext = AppLocalizations.of(context)!;
    setData();
    _listenFilterList(context);
    _getLocationList();
    notifyListeners();
  }

  onMeasureUnitDropdownSizeChange(Size newSize) {
    measureDropdownSize = newSize;
    notifyListeners();
  }

  onPriceRangeDropdownSizeChange(bool isMin, Size newSize) {
    if (isMin) {
      minPriceDropdownSize = newSize;
    } else {
      maxPriceDropdownSize = newSize;
    }
    notifyListeners();
  }

  updateLocationInfo(RetrieveLocationArg? arg) {
    _locationArg = arg;
    notifyListeners();
    /*if (arg?.areaName != null) {
      propertyLocationController.text = arg!.areaName!;
      StaticFunctions.fieldCursorPositionAtLast(propertyLocationController);
    }*/
  }

  enableInactiveProperty() {
    includeInactiveProperty = !includeInactiveProperty;
    notifyListeners();
  }

  enableClosedProperty() {
    includeClosedProperty = !includeClosedProperty;
    notifyListeners();
  }

  Future<String> getFilterTitle(
    AppLocalizations localization,
    int? propertyType,
  ) async {
    _filterTitle = localization.filter;
    /*
    // Property type is available now. No need to show Filter properties | Bungalow
    // As we are not going to restrict user to change property type
    if (propertyType != null) {
      final _propertyType =
          await _isarService.getPropertyTypeById(propertyType);
      if (_propertyType != null) {
        _filterTitle = '${localization.filter} | ${_propertyType.name}';
      }
    } else*/
    if (filterToEdit != null &&
        doesFilterExists &&
        filterToEdit!.filterName.trim().isNotEmpty) {
      _filterTitle = '${localization.filter} | ${filterToEdit!.filterName}';
    }
    return _filterTitle;
  }

  _getPriceUnitString(int unitId) {
    return unitId == SaveDefaultData.filterPriceUnitThousand
        ? localizationsContext.thousand
        : unitId == SaveDefaultData.filterPriceUnitLac
            ? localizationsContext.lakh
            : unitId == SaveDefaultData.filterPriceUnitCrore
                ? localizationsContext.crore
                : '';
  }

  validateData() {
    final enteredMinPrice =
        minPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                minPriceRangeController.text.trim().replaceAll(',', ''))
            : null;
    final enteredMaxPrice =
        maxPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                maxPriceRangeController.text.trim().replaceAll(',', ''))
            : null;

    final minPriceWithUnit = enteredMinPrice != null
        ? StaticFunctions.convertPriceToFull(enteredMinPrice, _minPriceUnit)
        : null;
    final maxPriceWithUnit = enteredMaxPrice != null
        ? StaticFunctions.convertPriceToFull(enteredMaxPrice, _maxPriceUnit)
        : null;

    isValid = propertyTypeList.any((element) => element.isSelected) &&
        propertyForList.any((element) => element.isSelected) &&
        filterSearchBy.any((element) => element.isSelected) &&
        ((minPriceWithUnit != null &&
                maxPriceWithUnit != null &&
                minPriceWithUnit > 0 &&
                maxPriceWithUnit > 0 &&
                minPriceWithUnit <= maxPriceWithUnit) ||
            ((minPriceWithUnit == null || maxPriceWithUnit == null) &&
                ((minPriceRangeController.text.toString().trim().isNotEmpty &&
                        minPriceWithUnit! > 0) ||
                    (maxPriceRangeController.text
                            .toString()
                            .trim()
                            .isNotEmpty &&
                        maxPriceWithUnit! > 0))) ||
            (minPriceWithUnit == null && maxPriceWithUnit == null));
    notifyListeners();
  }

  calculatePriceBySize({
    bool isItMinRange = false,
  }) {
    double minPrice = 0;
    if (minPriceRangeController.text.trim().isNotEmpty) {
      minPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          minPriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _minPriceUnit,
      );
    }

    double maxPrice = 0;
    if (maxPriceRangeController.text.trim().isNotEmpty) {
      maxPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          maxPriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _maxPriceUnit,
      );
    }

    final value = _calcPriceBySizeHelper(
      isItMinRange ? minPrice : 0,
      !isItMinRange ? maxPrice : 0,
      isItMinRange
          ? minMeasureRangeController.text
          : maxMeasureRangeController.text,
    );
    if (isItMinRange) {
      minPricePerSizeController.text = value;
    } else {
      maxPricePerSizeController.text = value;
    }
  }

  String _calcPriceBySizeHelper(
    double minPrice,
    double maxPrice,
    String totalSize,
  ) {
    double calculatePriceWith = 0;
    double tSize = 0;
    String pricePerSize = '';
    if (maxPrice == 0 && minPrice != 0 && totalSize.isNotEmpty) {
      calculatePriceWith = minPrice;
      tSize = double.parse(totalSize);
    } else if (maxPrice != 0 && totalSize.isNotEmpty) {
      calculatePriceWith = maxPrice;
      tSize = double.parse(totalSize);
    }
    if (calculatePriceWith != 0 && tSize != 0) {
      pricePerSize = StaticFunctions.formatPrice(
        (calculatePriceWith ~/ tSize).toString(),
      );
    } else {
      pricePerSize = '';
    }
    return pricePerSize;
  }

  setPriceRangeText() {
    validateData();
    if (!minPricePerSizeFocusNode.hasFocus) {
      calculatePriceBySize(isItMinRange: true);
    }
    if (!maxPricePerSizeFocusNode.hasFocus) {
      calculatePriceBySize(isItMinRange: false);
    }
    priceRangeText = '';
    final minUnitString = _getPriceUnitString(_minPriceUnit);
    final maxUnitString = _getPriceUnitString(_maxPriceUnit);
    final enteredMinPrice =
        minPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                minPriceRangeController.text.trim().replaceAll(',', ''))
            : null;
    final enteredMaxPrice =
        maxPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                maxPriceRangeController.text.trim().replaceAll(',', ''))
            : null;

    final minPriceWithUnit = enteredMinPrice != null
        ? StaticFunctions.convertPriceToFull(enteredMinPrice, _minPriceUnit)
        : null;
    final maxPriceWithUnit = enteredMaxPrice != null
        ? StaticFunctions.convertPriceToFull(enteredMaxPrice, _maxPriceUnit)
        : null;

    if (minPriceWithUnit != null &&
        maxPriceWithUnit != null &&
        minPriceWithUnit > maxPriceWithUnit) {
      priceRangeText = localizationsContext.minMaxError;
      notifyListeners();
      return;
    }

    //TODO: Removed price unit symbol
    if (minPriceRangeController.text.toString().trim().isNotEmpty &&
        minPriceWithUnit != null) {
      /*priceRangeText =
          '${StaticFunctions.defaultPriceUnit}${minPriceRangeController.text.toString().trim()} $minUnitString';*/
      final priceUnit = StaticFunctions.getPriceUnitAccordingPriceBySizeChanges(
          minPriceWithUnit);
      final unitString = StaticFunctions.getPriceUnitLongString(
        localizationsContext,
        priceUnit,
      );
      final value =
          StaticFunctions.shortPriceRangeValue(minPriceWithUnit, priceUnit);
      final priceToShow = StaticFunctions.formatPrice(
        StaticFunctions.removeTrailingZeros(
          value.toStringAsFixed(AppConfig.pricingDecimalLimit),
        ),
      );
      priceRangeText = '$priceToShow $unitString';
    }

    //TODO: Removed price unit symbol
    if (maxPriceRangeController.text.toString().trim().isNotEmpty &&
        maxPriceWithUnit != null) {
      if (priceRangeText.trim().isNotEmpty) {
        priceRangeText += ' - ';
      }
      /*priceRangeText +=
          '${StaticFunctions.defaultPriceUnit}${maxPriceRangeController.text.toString().trim()} $maxUnitString';*/
      final priceUnit = StaticFunctions.getPriceUnitAccordingPriceBySizeChanges(
          maxPriceWithUnit);
      final unitString = StaticFunctions.getPriceUnitLongString(
        localizationsContext,
        priceUnit,
      );
      final value =
          StaticFunctions.shortPriceRangeValue(maxPriceWithUnit, priceUnit);
      final priceToShow = StaticFunctions.formatPrice(
        StaticFunctions.removeTrailingZeros(
          value.toStringAsFixed(AppConfig.pricingDecimalLimit),
        ),
      );
      priceRangeText += '$priceToShow $unitString';
    }
    notifyListeners();
  }

  _refillSavedValues() async {
    doesFilterExists = filterToEdit != null &&
        (await _isarService.checkIfFilterExists(id: filterToEdit!.id)) != null;
    if (filterToEdit != null) {
      includeInactiveProperty = filterToEdit!.includeInactiveProperty;
      includeClosedProperty = filterToEdit!.includeClosedProperty;

      if (filterToEdit!.filterSearchBy != null) {
        final isPropertiesSelected = filterToEdit!.filterSearchBy!.any(
          (element) => element == SaveDefaultData.filterSearchByPropertiesId,
        );
        final isInquiriesSelected = filterToEdit!.filterSearchBy!.any(
          (element) => element == SaveDefaultData.filterSearchByInquiriesId,
        );
        filterSearchBy = _setFilterSearchBy(
          isPropertiesSelected: isPropertiesSelected,
          isInquiriesSelected: isInquiriesSelected,
        );
      }

      if (filterToEdit!.bathroomCount != null &&
          filterToEdit!.bathroomCount! > 0) {
        bathroomsTextFieldController.text =
            filterToEdit!.bathroomCount!.toString();
      } else {
        bathroomsTextFieldController.text = '';
      }

      if (filterToEdit!.frontSize != null) {
        frontSizeTextFieldController.text = StaticFunctions.removeTrailingZeros(
            filterToEdit!.frontSize!.toString());
      } else {
        frontSizeTextFieldController.text = '';
      }

      if (filterToEdit!.depthSize != null) {
        depthSizeTextFieldController.text = StaticFunctions.removeTrailingZeros(
            filterToEdit!.depthSize!.toString());
      } else {
        depthSizeTextFieldController.text = '';
      }

      if (filterToEdit!.roomCount != null && filterToEdit!.roomCount! > 0) {
        roomsTextFieldController.text = filterToEdit!.roomCount!.toString();
      } else {
        roomsTextFieldController.text = '';
      }

      if (filterToEdit!.floorCount != null && filterToEdit!.floorCount! > 0) {
        floorsTextFieldController.text = filterToEdit!.floorCount!.toString();
      } else {
        floorsTextFieldController.text = '';
      }

      if (filterToEdit!.totalFloorCount != null &&
          filterToEdit!.totalFloorCount! > 0) {
        totalFloorsTextFieldController.text =
            filterToEdit!.totalFloorCount!.toString();
      } else {
        totalFloorsTextFieldController.text = '';
      }

      if (AppConfig.shouldEnableStringQuery) {
        if (filterToEdit!.stringQuery != null &&
            filterToEdit!.stringQuery!.trim().isNotEmpty) {
          filterQueryFieldController.text = filterToEdit!.stringQuery!;
        } else {
          filterQueryFieldController.text = '';
        }
      }

      if (filterToEdit!.location != null &&
          filterToEdit!.location!.trim().isNotEmpty) {
        propertyLocationController.text = filterToEdit!.location!;
      } else {
        propertyLocationController.text = '';
      }

      if (filterToEdit!.area != null &&
          filterToEdit!.area!.trim().isNotEmpty &&
          filterToEdit!.latitude != null &&
          filterToEdit!.longitude != null &&
          filterToEdit!.latitude != 0 &&
          filterToEdit!.longitude != 0) {
        _locationArg = RetrieveLocationArg(
          areaName: filterToEdit!.area!.trim(),
          coordinates: LatLng(
            filterToEdit!.latitude!,
            filterToEdit!.longitude!,
          ),
        );
      }

      if (propertyForList.isNotEmpty) {
        propertyForList.forEach((element) {
          element.isSelected = false;
        });
        if (filterToEdit!.propertyFor != null &&
            filterToEdit!.propertyFor!.isNotEmpty) {
          filterToEdit!.propertyFor!.forEach((elementToSelect) {
            propertyForList
                .firstWhereOrNull((element) => element.id == elementToSelect)
                ?.isSelected = true;
          });
        }
      }

      if (filterToEdit!.sellPriceRangeMin != null &&
          filterToEdit!.sellPriceRangeMin! > 0) {
        minPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            filterToEdit!.sellPriceRangeMin!,
            filterToEdit!.sellMinPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(id: filterToEdit!.sellMinPriceUnit, isMin: true);
      }

      if (filterToEdit!.sellPriceRangeMax != null &&
          filterToEdit!.sellPriceRangeMax! > 0) {
        maxPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            filterToEdit!.sellPriceRangeMax!,
            filterToEdit!.sellMaxPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(id: filterToEdit!.sellMaxPriceUnit, isMin: false);
      }

      if (filterToEdit!.sellMinPricePerSize != null &&
          filterToEdit!.sellMinPricePerSize! > 0) {
        minPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          filterToEdit!.sellMinPricePerSize.toString(),
        ));
      }

      if (filterToEdit!.sellMaxPricePerSize != null &&
          filterToEdit!.sellMaxPricePerSize! > 0) {
        maxPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          filterToEdit!.sellMaxPricePerSize.toString(),
        ));
      }

      selectMeasureUnit(
          filterToEdit!.measureUnit ?? SaveDefaultData.areaUnitSqFtId);

      if (filterToEdit!.constructionType != null &&
          filterToEdit!.constructionType!.isNotEmpty) {
        final selectedConstructionType = constructionTypeList
            .where((element) =>
                filterToEdit!.constructionType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectConstructionType(selection: selectedConstructionType);
      } else {
        selectConstructionType();
      }

      if (filterToEdit!.schemeType != null &&
          filterToEdit!.schemeType!.isNotEmpty) {
        final selectedSchemeType = schemeTypeList
            .where((element) =>
                filterToEdit!.schemeType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectSchemeType(selection: selectedSchemeType);
      } else {
        selectSchemeType();
      }

      if (filterToEdit!.buildingType != null &&
          filterToEdit!.buildingType!.isNotEmpty) {
        final selectedBuildingType = buildingTypeList
            .where((element) =>
                filterToEdit!.buildingType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectBuildingType(selection: selectedBuildingType);
      } else {
        selectBuildingType();
      }

      minMeasureRangeController.text =
          filterToEdit!.minMeasure != null && _selectedMeasureUnit != -1
              ? StaticFunctions.removeTrailingZeros(
                  filterToEdit!.minMeasure.toString(),
                )
              : '';
      maxMeasureRangeController.text =
          filterToEdit!.maxMeasure != null && _selectedMeasureUnit != -1
              ? StaticFunctions.removeTrailingZeros(
                  filterToEdit!.maxMeasure.toString(),
                )
              : '';
      enableWashroom(filterToEdit!.isWashroomAvailable);
      enableBalcony(filterToEdit!.isBalconyAvailable);
      enableCornerPiece(filterToEdit!.isCornerPiece);
      enableLightConnection(filterToEdit!.isLightConnectionAvailable);
      enableWell(filterToEdit!.isWellAvailable);
      enableAllottedParking(filterToEdit!.isAllottedParkingAvailable);
      enableParking(filterToEdit!.isParkingAvailable);
      enableLift(filterToEdit!.isLiftAvailable);

      if (filterToEdit!.furnishedType != null &&
          filterToEdit!.furnishedType!.isNotEmpty) {
        final selectedFurnished = furnishedList
            .where((element) =>
                filterToEdit!.furnishedType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectFurnished(selection: selectedFurnished);
      } else {
        selectFurnished();
      }

      if (filterToEdit!.bhkIds != null && filterToEdit!.bhkIds!.isNotEmpty) {
        final selectedBhks = bhkTypeList
            .where((element) =>
                filterToEdit!.bhkIds!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectBhkType(selection: selectedBhks);
      } else {
        selectBhkType();
      }

      if (filterToEdit!.facingType != null &&
          filterToEdit!.facingType!.isNotEmpty) {
        final selectedFacing = facingTypeList
            .where((element) =>
                filterToEdit!.facingType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectFacingType(selection: selectedFacing);
      } else {
        selectFacingType();
      }

      if (filterToEdit!.connectedRoads != null &&
          filterToEdit!.connectedRoads!.isNotEmpty) {
        firstConnectedRoadController.text = StaticFunctions.removeTrailingZeros(
                filterToEdit!.connectedRoads!.firstOrNull?.toString() ?? '') ??
            '';
        if (filterToEdit!.connectedRoads!.length > 1) {
          secondConnectedRoadController
              .text = StaticFunctions.removeTrailingZeros(
                  filterToEdit!.connectedRoads!.lastOrNull?.toString() ?? '') ??
              '';
        } else {
          secondConnectedRoadController.text = '';
        }
      } else {
        firstConnectedRoadController.text = '';
        secondConnectedRoadController.text = '';
      }

      if (filterToEdit!.additionalFurnish != null &&
          filterToEdit!.additionalFurnish!.isNotEmpty) {
        final selectedAdditionalFurnish = additionalFurnishList
            .where((element) =>
                filterToEdit!.additionalFurnish!
                    .firstWhereOrNull((name) => name == element.name) !=
                null)
            .toList();
        selectAdditionalFurnish(selection: selectedAdditionalFurnish);
      } else {
        selectAdditionalFurnish();
      }

      if (filterToEdit!.preferredCaste != null &&
          filterToEdit!.preferredCaste!.isNotEmpty) {
        final selectedPreferredCaste = preferredCastList
            .where((element) =>
                filterToEdit!.preferredCaste!
                    .firstWhereOrNull((name) => name == element.name) !=
                null)
            .toList();
        selectPreferredCaste(selection: selectedPreferredCaste);
      } else {
        selectPreferredCaste();
      }

      if (propertyAmenityList.isNotEmpty &&
          filterToEdit!.selectedAmenities != null &&
          filterToEdit!.selectedAmenities!.isNotEmpty) {
        final selectedAmenities = propertyAmenityList
            .where((element) =>
                filterToEdit!.selectedAmenities!
                    .firstWhereOrNull((name) => name.contains(element.name)) !=
                null)
            .toList();
        selectPropertyAmenity(selection: selectedAmenities);
      } else {
        selectPropertyAmenity();
      }

      if (filterToEdit!.propertyType != null &&
          filterToEdit!.propertyType!.isNotEmpty) {
        final selectedPropertyType = propertyTypeList
            .where((element) =>
                filterToEdit!.propertyType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectPropertyType(selection: selectedPropertyType);
      } else {
        selectPropertyType();
      }
      validateData();
    }
    notifyListeners();
  }

  List<FilterSearchBy> _setFilterSearchBy({
    bool isPropertiesSelected = true,
    bool isInquiriesSelected = false,
  }) {
    return [
      FilterSearchBy(
        id: SaveDefaultData.filterSearchByPropertiesId,
        value: localizationsContext.properties,
        isSelected: isPropertiesSelected,
      ),
      FilterSearchBy(
        id: SaveDefaultData.filterSearchByInquiriesId,
        value: localizationsContext.inquires,
        isSelected: isInquiriesSelected,
      ),
    ];
  }

  Future<void> setData({
    shouldReset = false,
  }) async {
    if (filterToEdit == null) {
      bool isOnlyInquiry = _isOnlyInquiriesTabAvailable();
      filterSearchBy = _setFilterSearchBy(
        isPropertiesSelected: !isOnlyInquiry,
        isInquiriesSelected: isOnlyInquiry,
      );
    } else {
      filterSearchBy = _setFilterSearchBy(
        isPropertiesSelected: false,
      );
    }
    final optionsList = [
      Options()
        ..id = _optionsYesId
        ..name = localizationsContext.yes,
      Options()
        ..id = _optionsNoId
        ..name = localizationsContext.no,
    ];
    priceRangeDropdownUnitList = [
      DbPropertyPriceUnit()
        ..id = SaveDefaultData.filterPriceUnitThousand
        ..unit = localizationsContext.thousandUnit,
      DbPropertyPriceUnit()
        ..id = SaveDefaultData.filterPriceUnitLac
        ..unit = localizationsContext.lac,
      DbPropertyPriceUnit()
        ..id = SaveDefaultData.filterPriceUnitCrore
        ..unit = localizationsContext.cr,
    ];

    if (washRoomAvailableList.isEmpty) {
      washRoomAvailableList.addAll(optionsList);
    }
    if (balconyAvailableList.isEmpty) {
      balconyAvailableList.addAll(optionsList);
    }
    if (cornerPieceList.isEmpty) {
      cornerPieceList.addAll(optionsList);
    }
    if (lightConnectionList.isEmpty) {
      lightConnectionList.addAll(optionsList);
    }

    if (wellAvailableList.isEmpty) {
      wellAvailableList.addAll(optionsList);
    }

    if (parkingAvailableList.isEmpty) {
      parkingAvailableList.addAll(optionsList);
    }

    if (allottedParkingList.isEmpty) {
      allottedParkingList.addAll(optionsList);
    }

    if (liftAvailableList.isEmpty) {
      liftAvailableList.addAll(optionsList);
    }

    searchFieldController.text = '';
    if (!shouldReset && arg?.searchText != null) {
      filterQueryFieldController.text = arg!.searchText!;
    } else {
      filterQueryFieldController.text = '';
    }

    includeInactiveProperty = arg?.showInactiveAndClosedProperty == true;
    includeClosedProperty = arg?.showInactiveAndClosedProperty == true;

    minPriceRangeController.text = '';
    maxPriceRangeController.text = '';
    roomsTextFieldController.text = '';
    floorsTextFieldController.text = '';
    totalFloorsTextFieldController.text = '';
    bathroomsTextFieldController.text = '';
    frontSizeTextFieldController.text = '';
    depthSizeTextFieldController.text = '';
    minMeasureRangeController.text = '';
    maxMeasureRangeController.text = '';
    measureUnitTextFieldController.text = '';
    propertyLocationController.text = '';
    minPricePerSizeController.text = '';
    maxPricePerSizeController.text = '';
    firstConnectedRoadController.text = '';
    secondConnectedRoadController.text = '';

    _locationArg = null;

    enableWashroom(null);
    enableBalcony(null);
    enableCornerPiece(null);
    enableLightConnection(null);
    enableWell(null);
    enableAllottedParking(null);
    enableParking(null);
    enableLift(null);

    _selectedMeasureUnit = -1;
    constructionTypeList = await _isarService.getConstructionTypes();
    schemeTypeList = await _isarService.getSchemeTypes();
    propertyForList = await _isarService.getPropertyFor();

    propertyTypeList = await _isarService.getPropertyTypes();

    measurementDropdownUnitList = await _isarService.getPropertyAreaUnits();
    selectMeasureUnit(SaveDefaultData.areaUnitSqFtId);
    selectPriceUnit(id: SaveDefaultData.filterPriceUnitThousand, isMin: false);
    selectPriceUnit(id: SaveDefaultData.filterPriceUnitThousand, isMin: true);
    filterListToDisplay = await _isarService.getSavedFilters(
      limit: AppConfig.savedFilterDisplayLimit,
      filterToExclude: filterToEdit?.id ?? null,
      byPropertyType: arg?.propertyType,
    );
    originalFilterList = filterListToDisplay;
    propertyAmenityList = await _isarService.getAmenities();
    preferredCastList = await _isarService.getPreferredCasts();
    additionalFurnishList = await _isarService.getAdditionalFurnish();
    furnishedList = await _isarService.getFurnishedStatus();
    bhkTypeList = await _isarService.getBhkTypes();
    facingTypeList = await _isarService.getFacingTypes();
    _allBuildingTypes = await _isarService.getBuildingTypes();
    buildingTypeList.clear();
    buildingTypeList.addAll(_allBuildingTypes);
    final propertyTypeToSelect = arg?.propertyType != null
        ? propertyTypeList
            .firstWhereOrNull((element) => element.id == arg?.propertyType)
        : null;
    selectPropertyType(
      selection: propertyTypeToSelect != null ? [propertyTypeToSelect] : [],
    );
    if (!shouldReset) {
      _refillSavedValues();
    }
    notifyListeners();
  }

  selectFilterSearchBy({
    required int selectedId,
    bool isUserTapped = false,
  }) {
    for (int k = 0; k < filterSearchBy.length; k++) {
      if (filterSearchBy[k].id == selectedId) {
        filterSearchBy[k].isSelected = true; // !filterSearchBy[k].isSelected;
      } else {
        filterSearchBy[k].isSelected = false;
      }
    }
    notifyListeners();
    validateData();
  }

  void onItemSelected(
    BuildContext context, {
    required DbSavedFilter filter,
    bool isEditPressed = true,
  }) {
    if (!isEditPressed) {
      applyFilter(context, selectedFilter: filter);
    } else {
      this.filterToEdit = filter;
      _refillSavedValues();
    }
    notifyListeners();
  }

  _selectSinglePropertyFor(int id) {
    final _selectedPropertyFor =
        propertyForList.firstWhereOrNull((element) => element.isSelected);
    final _propertyForToSelect =
        propertyForList.firstWhereOrNull((element) => element.id == id);
    if (_selectedPropertyFor == null || _selectedPropertyFor.id != id) {
      propertyForList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_propertyForToSelect != null) {
        _propertyForToSelect.isSelected = true;
      }
    } else {
      _selectedPropertyFor.isSelected = !_selectedPropertyFor.isSelected;
    }
    notifyListeners();
  }

  _selectMultiPropertyFor(int id) {
    final index = propertyForList.indexWhere((element) => element.id == id);
    if (index != (-1)) {
      propertyForList[index].isSelected = !propertyForList[index].isSelected;
    }
    notifyListeners();
  }

  void selectPropertyFor(int id) {
    if (filterToEdit?.isFromBuyer == true) {
      _selectSinglePropertyFor(id);
    } else {
      _selectMultiPropertyFor(id);
    }
    notifyListeners();
    validateData();
  }

  void selectPropertyType({
    List<DbPropertyType> selection = const [],
    bool isUserTapped = false,
  }) {
    if (filterToEdit?.isFromBuyer == true) {
      if (selection.isEmpty) {
        propertyTypeList.forEach(
          (element) {
            element.isSelected = false;
            _selectedPropertySequence.removeWhere((id) => id == element.id);
          },
        );
      } else {
        _selectSinglePropertyType(selection.first.id);
      }
    } else {
      _selectMultiPropertyType(
        selection: selection,
        isUserTapped: isUserTapped,
      );
    }
    _resetSelectionOnPropertyTypeChange();
    _selectDefaultMeasurement();
  }

  _selectDefaultMeasurement() {
    if (minMeasureRangeController.text.trim().isEmpty &&
        maxMeasureRangeController.text.trim().isEmpty) {
      selectMeasureUnit(getDefaultPriceUnitId());
    }
  }

  onPriceBySizeChange({
    bool isItMinRange = false,
  }) {
    if (minPricePerSizeFocusNode.hasFocus &&
        isItMinRange &&
        minMeasureRangeController.text.trim().isNotEmpty &&
        minPricePerSizeController.text.trim().isNotEmpty) {
      final minPriceBySize = double.tryParse(
          minPricePerSizeController.text.trim().replaceAll(',', ''));
      final minMeasure = double.tryParse(
          minMeasureRangeController.text.trim().replaceAll(',', ''));
      if (minPriceBySize != null && minMeasure != null) {
        final priceFromUnit = minPriceBySize * minMeasure;

        // ------------------------------------------------
        final tempPriceUnit =
            StaticFunctions.getPriceUnitAccordingPriceBySizeChanges(
          priceFromUnit,
        );
        selectPriceUnit(
          id: tempPriceUnit,
          isMin: true,
        );
        final value =
            StaticFunctions.shortPriceRangeValue(priceFromUnit, tempPriceUnit);
        // ------------------------------------------------

        minPriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(
            value.toStringAsFixed(AppConfig.pricingDecimalLimit),
          ),
        );
      }
    } else if (isItMinRange &&
        minPricePerSizeFocusNode.hasFocus &&
        (minMeasureRangeController.text.trim().isEmpty ||
            minPricePerSizeController.text.trim().isEmpty)) {
      minPriceRangeController.text = '';
    }

    if (maxPricePerSizeFocusNode.hasFocus &&
        !isItMinRange &&
        maxMeasureRangeController.text.trim().isNotEmpty &&
        maxPricePerSizeController.text.trim().isNotEmpty) {
      final maxPriceBySize = double.tryParse(
          maxPricePerSizeController.text.trim().replaceAll(',', ''));
      final maxMeasure = double.tryParse(
          maxMeasureRangeController.text.trim().replaceAll(',', ''));
      if (maxPriceBySize != null && maxMeasure != null) {
        final priceFromUnit = maxPriceBySize * maxMeasure;

        // ------------------------------------------------
        final tempPriceUnit =
            StaticFunctions.getPriceUnitAccordingPriceBySizeChanges(
          priceFromUnit,
        );
        selectPriceUnit(
          id: tempPriceUnit,
          isMin: false,
        );
        final value =
            StaticFunctions.shortPriceRangeValue(priceFromUnit, tempPriceUnit);
        // ------------------------------------------------

        maxPriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(
            value.toStringAsFixed(AppConfig.pricingDecimalLimit),
          ),
        );
      }
    } else if (!isItMinRange &&
        maxPricePerSizeFocusNode.hasFocus &&
        (maxMeasureRangeController.text.trim().isEmpty ||
            maxPricePerSizeController.text.trim().isEmpty)) {
      maxPriceRangeController.text = '';
    }
    setPriceRangeText();
  }

  int getDefaultPriceUnitId() {
    final propertyTypeId = _selectedPropertySequence.isNotEmpty
        ? _selectedPropertySequence.last
        : null;
    return StaticFunctions.getDefaultAreaUnitId(propertyTypeId);
  }

  _selectMultiPropertyType({
    List<DbPropertyType> selection = const [],
    bool isUserTapped = false,
  }) {
    if (selection.isNotEmpty) {
      if (isUserTapped) {
        selection.forEach(
          (element) {
            final elementToSelect =
                propertyTypeList[propertyTypeList.indexOf(element)];
            elementToSelect.isSelected = !elementToSelect.isSelected;
            if (elementToSelect.isSelected) {
              _selectedPropertySequence.add(elementToSelect.id);
            } else {
              _selectedPropertySequence
                  .removeWhere((id) => id == elementToSelect.id);
            }
          },
        );
      } else {
        propertyTypeList.forEach(
          (element) {
            element.isSelected = selection.contains(element);
            if (element.isSelected) {
              _selectedPropertySequence.add(element.id);
            } else {
              _selectedPropertySequence.removeWhere((id) => id == element.id);
            }
          },
        );
      }
    } else {
      propertyTypeList.forEach(
        (element) {
          element.isSelected = false;
          _selectedPropertySequence.removeWhere((id) => id == element.id);
        },
      );
    }
    notifyListeners();
  }

  _selectSinglePropertyType(int id) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final _propertyTypeToSelect =
        propertyTypeList.firstWhereOrNull((element) => element.id == id);
    if (_selectedPropertyType == null || _selectedPropertyType.id != id) {
      propertyTypeList.forEach(
        (element) {
          element.isSelected = false;
          _selectedPropertySequence.removeWhere((id) => id == element.id);
        },
      );
      if (_propertyTypeToSelect != null) {
        _propertyTypeToSelect.isSelected = true;
        _selectedPropertySequence.add(_propertyTypeToSelect.id);
      }
    } else {
      _selectedPropertyType.isSelected = !_selectedPropertyType.isSelected;
      if (_selectedPropertyType.isSelected) {
        _selectedPropertySequence.add(_selectedPropertyType.id);
      } else {
        _selectedPropertySequence
            .removeWhere((id) => id == _selectedPropertyType.id);
      }
    }
    notifyListeners();
  }

  _resetSelectionOnPropertyTypeChange() {
    enableWashroom(isWashroomAvailable);
    enableBalcony(isBalconyAvailable);
    enableCornerPiece(isCornerPiece);
    enableLightConnection(isLightConnectionAvailable);
    enableWell(isWellAvailable);
    enableAllottedParking(isAllottedParkingAvailable);
    enableParking(isParkingAvailable);
    enableLift(isLiftAvailable);

    _resetBuildingTypes();
    _resetBathroom();
    _resetFloors();
    _resetTotalFloors();
    _resetRooms();
    _resetFrontAndDepth();
    _resetConnectedRoads();

    final selectedFurnished =
        furnishedList.where((element) => element.isSelected).toList();
    selectFurnished(selection: selectedFurnished);

    final selectedBhks =
        bhkTypeList.where((element) => element.isSelected).toList();
    selectBhkType(selection: selectedBhks);

    final selectedFacing =
        facingTypeList.where((element) => element.isSelected).toList();
    selectFacingType(selection: selectedFacing);

    final selectedConstruction =
        constructionTypeList.where((element) => element.isSelected).toList();
    selectConstructionType(selection: selectedConstruction);

    final selectedSchemeType =
        schemeTypeList.where((element) => element.isSelected).toList();
    selectSchemeType(selection: selectedSchemeType);

    final selectedAmenities =
        propertyAmenityList.where((element) => element.isSelected).toList();
    selectPropertyAmenity(selection: selectedAmenities);

    final selectedPreferredCaste =
        preferredCastList.where((element) => element.isSelected).toList();
    selectPreferredCaste(selection: selectedPreferredCaste);

    final selectedAdditionalFurnish =
        additionalFurnishList.where((element) => element.isSelected).toList();
    selectAdditionalFurnish(selection: selectedAdditionalFurnish);
    validateData();
  }

  _resetBathroom() {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (_selectedPropertyTypes.isNotEmpty &&
        !CommonPropertyDataProvider.checkForBathRoom(_selectedPropertyTypes)) {
      bathroomsTextFieldController.text = '';
      notifyListeners();
    }
  }

  _resetFloors() {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (_selectedPropertyTypes.isNotEmpty &&
        !CommonPropertyDataProvider.checkForFloor(_selectedPropertyTypes)) {
      floorsTextFieldController.text = '';
      notifyListeners();
    }
  }

  _resetTotalFloors() {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (_selectedPropertyTypes.isNotEmpty &&
        !CommonPropertyDataProvider.checkForTotalFloor(
            _selectedPropertyTypes)) {
      totalFloorsTextFieldController.text = '';
      notifyListeners();
    }
  }

  _resetRooms() {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (_selectedPropertyTypes.isNotEmpty &&
        !CommonPropertyDataProvider.checkForRoom(_selectedPropertyTypes)) {
      roomsTextFieldController.text = '';
      notifyListeners();
    }
  }

  _resetFrontAndDepth() {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (_selectedPropertyTypes.isNotEmpty &&
        !CommonPropertyDataProvider.checkForFrontDepthSize(
            _selectedPropertyTypes)) {
      frontSizeTextFieldController.text = '';
      depthSizeTextFieldController.text = '';
      notifyListeners();
    }
  }

  _resetConnectedRoads() {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (_selectedPropertyTypes.isNotEmpty &&
        !CommonPropertyDataProvider.checkForConnectedRoad(
            _selectedPropertyTypes)) {
      firstConnectedRoadController.text = '';
      secondConnectedRoadController.text = '';
      notifyListeners();
    }
  }

  _resetBuildingTypes() {
    final selectedBuildingTypes =
        buildingTypeList.where((element) => element.isSelected).toList();
    final _selectedPropertyTypes =
        propertyTypeList.where((element) => element.isSelected);
    final doesContainBungalow = _selectedPropertyTypes.firstWhereOrNull(
            (element) =>
                element.id == SaveDefaultData.propertyTypeBungalowId) !=
        null;
    final doesContainPlot = _selectedPropertyTypes.firstWhereOrNull(
            (element) => element.id == SaveDefaultData.propertyTypePlotId) !=
        null;
    final doesContainAlgriLand = _selectedPropertyTypes.firstWhereOrNull(
            (element) =>
                element.id == SaveDefaultData.propertyTypeAgricultureLandId) !=
        null;
    buildingTypeList.clear();
    if (_selectedPropertyTypes.isEmpty ||
        doesContainBungalow ||
        doesContainPlot ||
        doesContainAlgriLand) {
      _allBuildingTypes.forEach(
        (element) {
          element.isSelected = false;
          if (_selectedPropertyTypes.isEmpty ||
              doesContainBungalow &&
                  (element.id == SaveDefaultData.propertyResidentialTypeId ||
                      element.id == SaveDefaultData.propertyCommercialTypeId)) {
            if (!buildingTypeList.contains(element)) {
              buildingTypeList.add(element);
            }
          }
          if (_selectedPropertyTypes.isEmpty ||
              doesContainPlot &&
                  (element.id == SaveDefaultData.propertyResidentialTypeId ||
                      element.id == SaveDefaultData.propertyCommercialTypeId ||
                      element.id == SaveDefaultData.propertyIndustrialTypeId)) {
            if (!buildingTypeList.contains(element)) {
              buildingTypeList.add(element);
            }
          }
          if (_selectedPropertyTypes.isEmpty ||
              doesContainAlgriLand &&
                  (element.id == SaveDefaultData.propertyResidentialTypeId ||
                      element.id == SaveDefaultData.propertyGreenTypeId ||
                      element.id == SaveDefaultData.propertyFreeTypeId ||
                      element.id == SaveDefaultData.propertyIndustrialTypeId)) {
            if (!buildingTypeList.contains(element)) {
              buildingTypeList.add(element);
            }
          }
        },
      );
    }
    selectBuildingType(selection: selectedBuildingTypes);
  }

  applyFilter(
    BuildContext context, {
    DbSavedFilter? selectedFilter,
  }) async {
    var filterToApply =
        this.filterToEdit == null ? DbSavedFilter() : this.filterToEdit;
    if (filterQueryFieldController.text.trim().isNotEmpty) {
      filterToApply!.stringQuery = filterQueryFieldController.text.trim();
    } else {
      filterToApply!.stringQuery = null;
    }

    final selectedSearchFor = filterSearchBy.where(
      (element) => element.isSelected,
    );
    if (selectedSearchFor.isNotEmpty) {
      filterToApply.filterSearchBy =
          selectedSearchFor.map((e) => e.id).toList();
    } else {
      filterToApply.filterSearchBy = null;
    }

    final selectedPropertyFor = propertyForList.where(
      (element) => element.isSelected,
    );
    if (selectedPropertyFor.isNotEmpty) {
      filterToApply.propertyFor = selectedPropertyFor.map((e) => e.id).toList();
    } else {
      filterToApply.propertyFor = null;
    }

    final selectedPropertyType =
        propertyTypeList.where((element) => element.isSelected);
    if (selectedPropertyType.isNotEmpty) {
      filterToApply.propertyType =
          selectedPropertyType.map((e) => e.id).toList();
    } else {
      filterToApply.propertyType = null;
    }

    if (_selectedMeasureUnit != -1) {
      filterToApply.measureUnit = _selectedMeasureUnit;
      if (minMeasureRangeController.text.trim().isNotEmpty) {
        filterToApply.minMeasure =
            double.tryParse(minMeasureRangeController.text.trim());
      } else {
        filterToApply.minMeasure = null;
      }
      if (maxMeasureRangeController.text.trim().isNotEmpty) {
        filterToApply.maxMeasure =
            double.tryParse(maxMeasureRangeController.text.trim());
      } else {
        filterToApply.maxMeasure = null;
      }
    } else {
      filterToApply.measureUnit = null;
      filterToApply.maxMeasure = null;
      filterToApply.minMeasure = null;
    }

    final selectedConstruction =
        constructionTypeList.where((element) => element.isSelected);
    if (selectedConstruction.isNotEmpty) {
      filterToApply.constructionType =
          selectedConstruction.map((e) => e.id).toList();
    } else {
      filterToApply.constructionType = null;
    }

    final selectedSchemeType =
        schemeTypeList.where((element) => element.isSelected);
    if (selectedSchemeType.isNotEmpty) {
      filterToApply.schemeType = selectedSchemeType.map((e) => e.id).toList();
    } else {
      filterToApply.schemeType = null;
    }

    if (minPriceRangeController.text.trim().isNotEmpty &&
        double.tryParse(
                minPriceRangeController.text.trim().replaceAll(',', '')) !=
            null) {
      final minPrice = double.tryParse(
          minPriceRangeController.text.trim().replaceAll(',', ''));
      if (minPrice != null) {
        filterToApply.sellPriceRangeMin =
            StaticFunctions.convertPriceToFull(minPrice, _minPriceUnit);
        filterToApply.sellMinPriceUnit = _minPriceUnit;
      } else {
        filterToApply.sellPriceRangeMin = null;
      }
    } else {
      filterToApply.sellPriceRangeMin = null;
    }

    if (maxPriceRangeController.text.trim().isNotEmpty &&
        double.tryParse(
                maxPriceRangeController.text.trim().replaceAll(',', '')) !=
            null) {
      double? maxPrice = double.tryParse(
          maxPriceRangeController.text.trim().replaceAll(',', ''));
      if (filterToApply.sellPriceRangeMin != null &&
          maxPrice != null &&
          StaticFunctions.convertPriceToFull(maxPrice, _maxPriceUnit) <
              filterToApply.sellPriceRangeMin!) {
        maxPriceRangeController.text = '';
      }
      if (maxPriceRangeController.text.trim().isNotEmpty && maxPrice != null) {
        filterToApply.sellPriceRangeMax =
            StaticFunctions.convertPriceToFull(maxPrice, _maxPriceUnit);
        filterToApply.sellMaxPriceUnit = _maxPriceUnit;
      } else {
        filterToApply.sellPriceRangeMax = null;
      }
    } else {
      filterToApply.sellPriceRangeMax = null;
    }

    if (filterToApply.sellPriceRangeMin != null &&
        filterToApply.minMeasure != null &&
        minPricePerSizeController.text.trim().isNotEmpty) {
      filterToApply.sellMinPricePerSize = double.tryParse(
          minPricePerSizeController.text.trim().replaceAll(',', ''));
    } else {
      filterToApply.sellMinPricePerSize = null;
    }
    if (filterToApply.sellPriceRangeMax != null &&
        filterToApply.maxMeasure != null &&
        maxPricePerSizeController.text.trim().isNotEmpty) {
      filterToApply.sellMaxPricePerSize = double.tryParse(
          maxPricePerSizeController.text.trim().replaceAll(',', ''));
    } else {
      filterToApply.sellMaxPricePerSize = null;
    }

    filterToApply.isWashroomAvailable = isWashroomAvailable;
    filterToApply.isBalconyAvailable = isBalconyAvailable;
    filterToApply.isCornerPiece = isCornerPiece;
    filterToApply.isLightConnectionAvailable = isLightConnectionAvailable;
    filterToApply.isWellAvailable = isWellAvailable;
    filterToApply.isAllottedParkingAvailable = isAllottedParkingAvailable;
    filterToApply.isParkingAvailable = isParkingAvailable;
    filterToApply.isLiftAvailable = isLiftAvailable;
    filterToApply.includeInactiveProperty = includeInactiveProperty;
    filterToApply.includeClosedProperty = includeClosedProperty;

    filterToApply.bathroomCount =
        bathroomsTextFieldController.text.trim().isNotEmpty
            ? int.tryParse(bathroomsTextFieldController.text.trim())
            : null;

    filterToApply.depthSize =
        depthSizeTextFieldController.text.trim().isNotEmpty
            ? double.tryParse(depthSizeTextFieldController.text.trim())
            : null;

    filterToApply.frontSize =
        frontSizeTextFieldController.text.trim().isNotEmpty
            ? double.tryParse(frontSizeTextFieldController.text.trim())
            : null;

    filterToApply.roomCount = roomsTextFieldController.text.trim().isNotEmpty
        ? int.tryParse(roomsTextFieldController.text.trim())
        : null;

    filterToApply.floorCount = floorsTextFieldController.text.trim().isNotEmpty
        ? int.tryParse(floorsTextFieldController.text.trim())
        : null;

    filterToApply.totalFloorCount =
        totalFloorsTextFieldController.text.trim().isNotEmpty
            ? int.tryParse(totalFloorsTextFieldController.text.trim())
            : null;

    final selectedFurnished =
        furnishedList.where((element) => element.isSelected).toList();
    filterToApply.furnishedType = selectedFurnished.isNotEmpty
        ? selectedFurnished.map((e) => e.id).toList()
        : null;

    final selectedBhks =
        bhkTypeList.where((element) => element.isSelected).toList();
    filterToApply.bhkIds =
        selectedBhks.isNotEmpty ? selectedBhks.map((e) => e.id).toList() : null;

    final selectedFacing =
        facingTypeList.where((element) => element.isSelected).toList();
    filterToApply.facingType = selectedFacing.isNotEmpty
        ? selectedFacing.map((e) => e.id).toList()
        : null;

    final addressLandmark = propertyLocationController.text.trim();
    if (addressLandmark.isNotEmpty) {
      filterToApply.location = addressLandmark;
      final addressTags = addressLandmark.split(
        AppConfig.addressLandmarkTagSeparator,
      );
      if (addressTags.isNotEmpty) {
        List<DbLocationTags> _tags = [];
        addressTags.forEach(
          (element) {
            if (element.toString().trim().isNotEmpty) {
              _tags.add(
                DbLocationTags()
                  ..tag = element.toString().trim().toLowerCase().toTitleCase(),
              );
            }
          },
        );
        if (_tags.isNotEmpty) {
          _isarService.saveLocationTags(_tags);
        }
      }
    } else {
      filterToApply.location = null;
    }

    if (_locationArg != null) {
      if (_locationArg?.areaName != null) {
        filterToApply.area = _locationArg!.areaName!;
      }
      if (_locationArg?.coordinates != null) {
        filterToApply.latitude = _locationArg!.coordinates!.latitude;
        filterToApply.longitude = _locationArg!.coordinates!.longitude;
      }
    } else {
      filterToApply.area = null;
      filterToApply.latitude = null;
      filterToApply.longitude = null;
    }

    final List<double> selectedRoads = [];
    if (firstConnectedRoadController.text.trim().isNotEmpty) {
      final firstRoad = double.tryParse(firstConnectedRoadController.text);
      if (firstRoad != null) {
        selectedRoads.add(firstRoad);
      }
    }
    if (secondConnectedRoadController.text.trim().isNotEmpty) {
      final secondRoad = double.tryParse(secondConnectedRoadController.text);
      if (secondRoad != null) {
        selectedRoads.add(secondRoad);
      }
    }
    filterToApply.connectedRoads =
        selectedRoads.isNotEmpty ? selectedRoads : null;

    final selectedBuilding =
        buildingTypeList.where((element) => element.isSelected).toList();
    filterToApply.buildingType = selectedBuilding.isNotEmpty
        ? selectedBuilding.map((e) => e.id).toList()
        : null;

    final selectedAmenities =
        propertyAmenityList.where((element) => element.isSelected);
    if (selectedAmenities.isNotEmpty) {
      filterToApply.selectedAmenities =
          selectedAmenities.map((e) => e.name).toList();
    } else {
      filterToApply.selectedAmenities = null;
    }

    final selectedPreferredCaste =
        preferredCastList.where((element) => element.isSelected);
    if (selectedPreferredCaste.isNotEmpty) {
      filterToApply.preferredCaste =
          selectedPreferredCaste.map((e) => e.name).toList();
    } else {
      filterToApply.preferredCaste = null;
    }

    final selectedAdditionalFurnish = additionalFurnishList.where(
      (element) => element.isSelected,
    );
    if (selectedAdditionalFurnish.isNotEmpty) {
      filterToApply.additionalFurnish =
          selectedAdditionalFurnish.map((e) => e.name).toList();
    } else {
      filterToApply.additionalFurnish = null;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final filterFromDb = await _isarService.checkIfFilterExists(
      id: filterToApply.id,
    );
    if (ModalRoute.of(context)?.settings.arguments == null ||
        (ModalRoute.of(context)?.settings.arguments as FilterScreenArg)
                .fromRoute !=
            Routes.viewAllProperties) {
      if (selectedFilter == null &&
          filterFromDb != null &&
          _checkIfAnyChangesToSave(
            filterFromDb: filterFromDb,
            filterToApply: filterToApply,
          )) {
        _showUpdateFilterDialog(
          context,
          filterFromDb: filterFromDb,
          filterToApply: filterToApply,
        );
      } else {
        Navigator.pushNamed(
          context,
          Routes.viewAllProperties,
          arguments: ViewAllScreenArg(
            heading: '',
            count: 0,
            showDataFor: ViewAllFromType.filter,
            filterObj: selectedFilter != null ? selectedFilter : filterToApply,
            isFilterSearchByPropertiesInquiries: true,
            viewAllFromToHandleTabs: _getViewAllTabVisibilityType(),
          ),
        ).then((value) async {
          if (filterToEdit != null) {
            filterToEdit = await _isarService.checkIfFilterExists(
              id: filterToEdit!.id,
            );
            _refillSavedValues();
            notifyListeners();
          }
          _notifyFilterListChanges();
        });
      }
    } else {
      if (selectedFilter == null &&
          filterFromDb != null &&
          _checkIfAnyChangesToSave(
            filterFromDb: filterFromDb,
            filterToApply: filterToApply,
          )) {
        _showUpdateFilterDialog(
          context,
          filterFromDb: filterFromDb,
          filterToApply: filterToApply,
          isFromEdit: true,
        );
      } else {
        Navigator.pop(
          context,
          selectedFilter != null ? selectedFilter : filterToApply,
        );
      }
    }
  }

  bool _checkIfAnyChangesToSave({
    required DbSavedFilter filterFromDb,
    required DbSavedFilter filterToApply,
  }) {
    return (!ListEquality().equals(
          filterFromDb.filterSearchBy,
          filterToApply.filterSearchBy,
        ) ||
        !ListEquality().equals(
          filterFromDb.propertyType,
          filterToApply.propertyType,
        ) ||
        !ListEquality().equals(
          filterFromDb.propertyFor,
          filterToApply.propertyFor,
        ) ||
        !ListEquality().equals(
          filterFromDb.constructionType,
          filterToApply.constructionType,
        ) ||
        !ListEquality().equals(
          filterFromDb.schemeType,
          filterToApply.schemeType,
        ) ||
        !ListEquality().equals(
          filterFromDb.preferredCaste,
          filterToApply.preferredCaste,
        ) ||
        !ListEquality().equals(
          filterFromDb.additionalFurnish,
          filterToApply.additionalFurnish,
        ) ||
        !ListEquality().equals(
          filterFromDb.buildingType,
          filterToApply.buildingType,
        ) ||
        !ListEquality().equals(
          filterFromDb.facingType,
          filterToApply.facingType,
        ) ||
        !ListEquality().equals(
          filterFromDb.bhkIds,
          filterToApply.bhkIds,
        ) ||
        !ListEquality().equals(
          filterFromDb.connectedRoads,
          filterToApply.connectedRoads,
        ) ||
        filterFromDb.location != filterToApply.location ||
        filterFromDb.area != filterToApply.area ||
        filterFromDb.latitude != filterToApply.latitude ||
        filterFromDb.longitude != filterToApply.longitude ||
        filterFromDb.stringQuery != filterToApply.stringQuery ||
        filterFromDb.sellPriceRangeMin != filterToApply.sellPriceRangeMin ||
        filterFromDb.sellPriceRangeMax != filterToApply.sellPriceRangeMax ||
        filterFromDb.rentPriceRangeMin != filterToApply.rentPriceRangeMin ||
        filterFromDb.rentPriceRangeMax != filterToApply.rentPriceRangeMax ||
        filterFromDb.leasePriceRangeMin != filterToApply.leasePriceRangeMin ||
        filterFromDb.leasePriceRangeMax != filterToApply.leasePriceRangeMax ||
        filterFromDb.measureUnit != filterToApply.measureUnit ||
        filterFromDb.minMeasure != filterToApply.minMeasure ||
        filterFromDb.maxMeasure != filterToApply.maxMeasure ||
        filterFromDb.isWashroomAvailable != filterToApply.isWashroomAvailable ||
        filterFromDb.isBalconyAvailable != filterToApply.isBalconyAvailable ||
        filterFromDb.isCornerPiece != filterToApply.isCornerPiece ||
        filterFromDb.isLightConnectionAvailable !=
            filterToApply.isLightConnectionAvailable ||
        filterFromDb.isWellAvailable != filterToApply.isWellAvailable ||
        filterFromDb.isAllottedParkingAvailable !=
            filterToApply.isAllottedParkingAvailable ||
        filterFromDb.isParkingAvailable != filterToApply.isParkingAvailable ||
        filterFromDb.isLiftAvailable != filterToApply.isLiftAvailable ||
        filterFromDb.bathroomCount != filterToApply.bathroomCount ||
        filterFromDb.roomCount != filterToApply.roomCount ||
        filterFromDb.totalFloorCount != filterToApply.totalFloorCount ||
        filterFromDb.floorCount != filterToApply.floorCount ||
        filterFromDb.frontSize != filterToApply.frontSize ||
        filterFromDb.depthSize != filterToApply.depthSize ||
        filterFromDb.includeInactiveProperty !=
            filterToApply.includeInactiveProperty ||
        filterFromDb.includeClosedProperty !=
            filterToApply.includeClosedProperty ||
        ((filterFromDb.furnishedType != null &&
                filterToApply.furnishedType != null &&
                !ListEquality().equals(
                  filterFromDb.furnishedType,
                  filterToApply.furnishedType,
                )) ||
            ((filterFromDb.furnishedType == null ||
                    filterToApply.furnishedType == null) &&
                filterFromDb.furnishedType != filterToApply.furnishedType)) ||
        ((filterFromDb.selectedAmenities != null &&
                filterToApply.selectedAmenities != null &&
                !ListEquality().equals(
                  filterFromDb.selectedAmenities,
                  filterToApply.selectedAmenities,
                )) ||
            ((filterFromDb.selectedAmenities == null ||
                    filterToApply.selectedAmenities == null) &&
                filterFromDb.selectedAmenities !=
                    filterToApply.selectedAmenities)));
  }

  _showUpdateFilterDialog(
    BuildContext context, {
    required DbSavedFilter filterFromDb,
    required DbSavedFilter filterToApply,
    bool isFromEdit = false,
  }) {
    showDialog(
        context: context,
        builder: (dialogContext) {
          String mobileNo = filterFromDb.mobileNo.trim().isNotEmpty
              ? '| ${filterFromDb.mobileNo}'
              : '';
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalMargin.w,
            ),
            backgroundColor: StaticFunctions.getColor(
              context,
              ColorEnum.whiteColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimensions.dialogContainerRadius.r,
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: Dimensions.dialogVerticalMargin.h,
                horizontal: Dimensions.dialogHorizontalMargin.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localizationsContext.updateFilterTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Dimensions.updateFilterDialogTitleTextSize.sp,
                      fontWeight: FontWeight.w600,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        Dimensions.updateFilterDialogContentAndDividerSpace.h,
                  ),
                  SizedBox(
                    width: Dimensions.updateFilterDialogDividerWidth.w,
                    child: Divider(
                      height: Dimensions.updateFilterDialogDividerHeight.h,
                      thickness: Dimensions.updateFilterDialogDividerHeight.h,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        Dimensions.updateFilterDialogContentAndDividerSpace.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (filterFromDb.filterName.trim().isNotEmpty)
                        Text(
                          filterFromDb.filterName,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions
                                .updateFilterDialogFilterNameTextSize.sp,
                            color: StaticFunctions.getColor(
                              dialogContext,
                              ColorEnum.blackColor,
                            ),
                          ),
                        ),
                      Text(
                        "${filterFromDb.buyerName} $mobileNo",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:
                              Dimensions.updateFilterDialogCustomerTextSize.sp,
                          color: StaticFunctions.getColor(
                            dialogContext,
                            ColorEnum.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions
                        .updateFilterDialogContentAndButtonBetweenSpace.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          text: localizationsContext.updateFilterBtnNo,
                          onClick: () {
                            Navigator.pop(dialogContext);
                            if (isFromEdit) {
                              Navigator.pop(context, filterToApply);
                            } else {
                              Navigator.pushNamed(
                                context,
                                Routes.viewAllProperties,
                                arguments: ViewAllScreenArg(
                                  heading: '',
                                  count: 0,
                                  showDataFor: ViewAllFromType.filter,
                                  filterObj: filterToApply,
                                  isFilterSearchByPropertiesInquiries: true,
                                  viewAllFromToHandleTabs:
                                      _getViewAllTabVisibilityType(),
                                ),
                              ).then(
                                (value) async {
                                  if (filterToEdit != null) {
                                    filterToEdit =
                                        await _isarService.checkIfFilterExists(
                                      id: filterToEdit!.id,
                                    );
                                    _refillSavedValues();
                                    notifyListeners();
                                  }
                                  _notifyFilterListChanges();
                                },
                              );
                            }
                          },
                          textSize:
                              Dimensions.updateFilterDialogButtonsTextSize.sp,
                          textColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.themeColor,
                          ),
                          bgColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.themeColorOpacity3Percentage,
                          ),
                          borderColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.grayColor,
                          ),
                          fontWeight: FontWeight.w700,
                          borderRadius:
                              Dimensions.updateFilterDialogButtonsRadius.r,
                          borderWidth:
                              Dimensions.updateFilterDialogButtonsBorderWidth.w,
                        ),
                      ),
                      SizedBox(
                        width:
                            Dimensions.updateFilterDialogButtonsBetweenSpace.w,
                      ),
                      Expanded(
                        child: ButtonWidget(
                          text: localizationsContext.updateFilterBtnYes,
                          onClick: () async {
                            filterToApply.updatedAt = DateTime.now();
                            await _isarService.saveFilter(filterToApply);
                            Navigator.pop(dialogContext);
                            if (isFromEdit) {
                              Navigator.pop(context, filterToApply);
                            } else {
                              Navigator.pushNamed(
                                context,
                                Routes.viewAllProperties,
                                arguments: ViewAllScreenArg(
                                  heading: '',
                                  count: 0,
                                  showDataFor: ViewAllFromType.filter,
                                  filterObj: filterToApply,
                                  isFilterSearchByPropertiesInquiries: true,
                                  viewAllFromToHandleTabs:
                                      _getViewAllTabVisibilityType(),
                                ),
                              ).then(
                                (value) async {
                                  if (filterToEdit != null) {
                                    filterToEdit =
                                        await _isarService.checkIfFilterExists(
                                      id: filterToEdit!.id,
                                    );
                                    _refillSavedValues();
                                    notifyListeners();
                                  }
                                  _notifyFilterListChanges();
                                },
                              );
                            }
                          },
                          textSize:
                              Dimensions.updateFilterDialogButtonsTextSize.sp,
                          textColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.whiteColor,
                          ),
                          bgColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.themeColor,
                          ),
                          borderRadius:
                              Dimensions.updateFilterDialogButtonsRadius.r,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  void selectMeasureUnit(int id) {
    var unitToSelect = measurementDropdownUnitList
        .firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      _selectedMeasureUnit = unitToSelect.id;
      measureUnitTextFieldController.text = unitToSelect.shortName;
      StaticFunctions.fieldCursorPositionAtLast(measureUnitTextFieldController);
    }
    notifyListeners();
  }

  void selectPriceUnit({
    required int id,
    required bool isMin,
  }) {
    var unitToSelect = priceRangeDropdownUnitList
        .firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      if (isMin) {
        _minPriceUnit = unitToSelect.id;
        minPriceUnitTextFieldController.text = unitToSelect.unit;
      } else {
        _maxPriceUnit = unitToSelect.id;
        maxPriceUnitTextFieldController.text = unitToSelect.unit;
      }
      StaticFunctions.fieldCursorPositionAtLast(
        isMin
            ? minPriceUnitTextFieldController
            : maxPriceUnitTextFieldController,
      );
    }
    setPriceRangeText();
    notifyListeners();
  }

  Future<void> deleteFilter(BuildContext context, DbSavedFilter filter) async {
    await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DialogWidget(
            title: '',
            titleWidget: Container(
              child: Text.rich(
                TextSpan(
                  text: localizationsContext.dialogDeleteFilterMsg1,
                  style: TextStyle(
                    color: StaticFunctions.getColor(
                      dialogContext,
                      ColorEnum.blackColor,
                    ),
                    fontSize: Dimensions.dialogTextSize.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: filter.filterName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: localizationsContext.dialogDeleteFilterMsg2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            icon: Strings.iconDelete,
            positiveButton: localizationsContext.btnDeleteFilter,
            negativeButton: localizationsContext.btnCancelFilter,
            onNegativeButtonClick: () {
              Navigator.pop(dialogContext);
            },
            onPositiveButtonClick: () async {
              Navigator.pop(dialogContext);
              await _isarService.deleteFilter(filter.id);
              _notifyFilterListChanges();
            },
          );
        });
  }

  int get selectedMeasureUnit => _selectedMeasureUnit;

  int get selectedMinPriceUnit => _minPriceUnit;

  int get selectedMaxPriceUnit => _maxPriceUnit;

  void selectFurnished({
    List<DbPropertyFurnishedStatus> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();

    final isPropertyOtherThanPlotAndAgriculture = _selectedPropertyTypes
            .isEmpty ||
        CommonPropertyDataProvider.isNotPlotOrLandMark(_selectedPropertyTypes);

    if (selection.isNotEmpty && isPropertyOtherThanPlotAndAgriculture) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect = furnishedList[furnishedList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        furnishedList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      furnishedList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void enableWashroom(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isWashroomAvailable == null ||
        isWashroomAvailable != isAvailable) {
      final isPropertyOfficeOrShowroom = _selectedPropertyTypes.isEmpty ||
          CommonPropertyDataProvider.checkForWashRoomAvailable(
              _selectedPropertyTypes);
      isWashroomAvailable = isPropertyOfficeOrShowroom ? isAvailable : null;
    } else {
      isWashroomAvailable = null;
    }
    notifyListeners();
  }

  void enableLightConnection(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isLightConnectionAvailable == null ||
        isLightConnectionAvailable != isAvailable) {
      isLightConnectionAvailable = _selectedPropertyTypes.isEmpty ||
              CommonPropertyDataProvider.checkForLightConnection(
                  _selectedPropertyTypes)
          ? isAvailable
          : null;
    } else {
      isLightConnectionAvailable = null;
    }
    notifyListeners();
  }

  void enableWell(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isWellAvailable == null ||
        isWellAvailable != isAvailable) {
      isWellAvailable = _selectedPropertyTypes.isEmpty ||
              CommonPropertyDataProvider.checkForWellAvailable(
                  _selectedPropertyTypes)
          ? isAvailable
          : null;
    } else {
      isWellAvailable = null;
    }
    notifyListeners();
  }

  void enableAllottedParking(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isAllottedParkingAvailable == null ||
        isAllottedParkingAvailable != isAvailable) {
      isAllottedParkingAvailable = _selectedPropertyTypes.isEmpty ||
              CommonPropertyDataProvider.checkForAllottedParkingAvailable(
                  _selectedPropertyTypes)
          ? isAvailable
          : null;
    } else {
      isAllottedParkingAvailable = null;
    }
    notifyListeners();
  }

  void enableParking(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isParkingAvailable == null ||
        isParkingAvailable != isAvailable) {
      isParkingAvailable = _selectedPropertyTypes.isEmpty ||
              CommonPropertyDataProvider.checkForParkingAvailable(
                  _selectedPropertyTypes)
          ? isAvailable
          : null;
    } else {
      isParkingAvailable = null;
    }
    notifyListeners();
  }

  void enableLift(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isLiftAvailable == null ||
        isLiftAvailable != isAvailable) {
      isLiftAvailable = _selectedPropertyTypes.isEmpty ||
              CommonPropertyDataProvider.checkForLiftAvailable(
                  _selectedPropertyTypes)
          ? isAvailable
          : null;
    } else {
      isLiftAvailable = null;
    }
    notifyListeners();
  }

  void enableCornerPiece(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isCornerPiece == null ||
        isCornerPiece != isAvailable) {
      final shouldShowCornerPiece = _selectedPropertyTypes.isEmpty ||
          CommonPropertyDataProvider.checkForCornerPiece(
              _selectedPropertyTypes);
      isCornerPiece = shouldShowCornerPiece ? isAvailable : null;
    } else {
      isCornerPiece = null;
    }
    notifyListeners();
  }

  void enableBalcony(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (isUserTapped == false ||
        isBalconyAvailable == null ||
        isBalconyAvailable != isAvailable) {
      final isPropertyOtherThanPlotAndAgricult =
          _selectedPropertyTypes.isEmpty ||
              CommonPropertyDataProvider.isNotPlotOrLandMark(
                  _selectedPropertyTypes);
      isBalconyAvailable =
          isPropertyOtherThanPlotAndAgricult ? isAvailable : null;
    } else {
      isBalconyAvailable = null;
    }
    notifyListeners();
  }

  void selectFacingType({
    List<DbPropertyFacingType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();

    final isBungalowOrPlotOnly = _selectedPropertyTypes.isEmpty ||
        CommonPropertyDataProvider.checkForFacingType(_selectedPropertyTypes);

    if (selection.isNotEmpty && isBungalowOrPlotOnly) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect =
              facingTypeList[facingTypeList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        facingTypeList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      facingTypeList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void selectBhkType({
    List<DbPropertyBhkType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();

    final isBungalowOrFlatOnly = _selectedPropertyTypes.isEmpty ||
        CommonPropertyDataProvider.checkForBhk(_selectedPropertyTypes);

    if (selection.isNotEmpty && isBungalowOrFlatOnly) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect = bhkTypeList[bhkTypeList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        bhkTypeList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      bhkTypeList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void selectConstructionType({
    List<DbPropertyConstructionType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();

    final isConstruction = _selectedPropertyTypes.isEmpty ||
        CommonPropertyDataProvider.checkForConstruction(_selectedPropertyTypes);

    if (selection.isNotEmpty && isConstruction) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect =
              constructionTypeList[constructionTypeList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        constructionTypeList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      constructionTypeList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void selectSchemeType({
    List<DbPropertySchemeType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();

    final shouldShowScheme = _selectedPropertyTypes.isEmpty ||
        CommonPropertyDataProvider.checkForScheme(_selectedPropertyTypes);

    if (selection.isNotEmpty && shouldShowScheme) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect =
              schemeTypeList[schemeTypeList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        schemeTypeList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      schemeTypeList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void selectBuildingType({
    List<DbPropertyBuildingType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();

    final shouldShowBuildingType = _selectedPropertyTypes.isEmpty ||
        CommonPropertyDataProvider.checkForBuildingType(_selectedPropertyTypes);

    if (selection.isNotEmpty && shouldShowBuildingType) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect =
              buildingTypeList[buildingTypeList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        buildingTypeList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      buildingTypeList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void selectPropertyAmenity({
    List<DbPropertyAmenity> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    final isPropertyOtherThanPlotAndAgriculture = _selectedPropertyTypes
            .isEmpty ||
        CommonPropertyDataProvider.isNotPlotOrLandMark(_selectedPropertyTypes);
    if (selection.isNotEmpty && isPropertyOtherThanPlotAndAgriculture) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect =
              propertyAmenityList[propertyAmenityList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        propertyAmenityList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      propertyAmenityList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void selectPreferredCaste({
    List<DbPropertyPreferredCast> selection = const [],
    bool isUserTapped = false,
  }) {
    if (selection.isNotEmpty) {
      if (isUserTapped) {
        selection.forEach(
          (element) {
            final elementToSelect =
                preferredCastList[preferredCastList.indexOf(element)];
            elementToSelect.isSelected = !elementToSelect.isSelected;
          },
        );
      } else {
        preferredCastList.forEach(
          (element) => element.isSelected = selection.contains(element),
        );
      }
    } else {
      preferredCastList.forEach(
        (element) => element.isSelected = false,
      );
    }
    notifyListeners();
  }

  void selectAdditionalFurnish({
    List<DbAdditionalFurnish> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyTypes = propertyTypeList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    if (selection.isNotEmpty &&
        (_selectedPropertyTypes.isEmpty ||
            CommonPropertyDataProvider.isNotPlotOrLandMark(
                _selectedPropertyTypes))) {
      if (isUserTapped) {
        selection.forEach(
          (element) {
            final elementToSelect =
                additionalFurnishList[additionalFurnishList.indexOf(element)];
            elementToSelect.isSelected = !elementToSelect.isSelected;
          },
        );
      } else {
        additionalFurnishList.forEach(
          (element) => element.isSelected = selection.contains(element),
        );
      }
    } else {
      additionalFurnishList.forEach(
        (element) => element.isSelected = false,
      );
    }
    notifyListeners();
  }

  searchFilter() async {
    if (searchFieldController.text.trim().length >= 3) {
      filterListToDisplay = await _isarService.getSavedFilters(
        limit: AppConfig.savedFilterDisplayLimit,
        query: searchFieldController.text,
        filterToExclude: filterToEdit?.id ?? null,
        byPropertyType: arg?.propertyType,
      );
    } else if (searchFieldController.text.trim().isEmpty) {
      filterListToDisplay = await _isarService.getSavedFilters(
        limit: AppConfig.savedFilterDisplayLimit,
        filterToExclude: filterToEdit?.id ?? null,
        byPropertyType: arg?.propertyType,
      );
      originalFilterList = filterListToDisplay;
    }
    notifyListeners();
  }

  Future<void> _notifyFilterListChanges() async {
    if (searchFieldController.text.trim().length < 3) {
      filterListToDisplay = await _isarService.getSavedFilters(
        limit: AppConfig.savedFilterDisplayLimit,
        filterToExclude: filterToEdit?.id ?? null,
        byPropertyType: arg?.propertyType,
      );
      originalFilterList = filterListToDisplay;
      notifyListeners();
    } else {
      searchFilter();
    }
  }

  _listenFilterList(context) async {
    filterWatcher?.cancel();
    final onChanges = await _isarService.watchOnFilterChanges();
    filterWatcher = onChanges.listen(
      (event) async {
        await _notifyFilterListChanges();
      },
    );
  }

  static Future<int> getPropertiesCountOfFilter({
    ViewAllFromType type = ViewAllFromType.filter,
    required DbSavedFilter filter,
    bool excludeUnmatched = false,
  }) async {
    dynamic properties = await IsarService().getFilteredProperties(
      type: type,
      filterToApply: filter,
      excludeUnmatched: excludeUnmatched,
    );
    if (properties is List<DbProperty> && properties.isNotEmpty) {
      properties =
          LocationFilterHelper.applyLocationFilterForPropertiesIfRequired(
        typedLocation: filter.location,
        latitude: filter.latitude,
        longitude: filter.longitude,
        filteredList: properties,
      );
    }
    return properties.length;
  }

  Iterable<DbLocationTags> getFilteredLocation(String query) {
    Iterable<DbLocationTags> filteredNameList = [];
    if (_savedLocationTags.isNotEmpty &&
        propertyLocationController.text.trim().isNotEmpty) {
      final updatedQuery =
          query.split(',').last.toString().trim().toLowerCase();
      if (updatedQuery.isNotEmpty) {
        filteredNameList = _savedLocationTags.where(
          (element) {
            return (element.tag != null &&
                element.tag!.toLowerCase().startsWith(
                      updatedQuery,
                    ));
          },
        );
      }
    }
    return filteredNameList;
  }

  selectLocationSuggestion(BuildContext context, DbLocationTags selected) {
    String currentText = propertyLocationController.text.toString();
    final data = currentText.split(',').last;
    currentText = currentText.substring(
      0,
      currentText.lastIndexOf(data) < 0 ? 0 : currentText.lastIndexOf(data),
    );
    String newText = currentText +
        (currentText.trim().isEmpty ? '' : ' ') +
        (selected.tag ?? '');
    propertyLocationController.text = newText;
    FocusScope.of(context).requestFocus(FocusNode());
  }

  _getLocationList() async {
    final locations = await _isarService.getLocationTags();
    if (locations.isNotEmpty) {
      _savedLocationTags.clear();
      _savedLocationTags.addAll(locations);
      notifyListeners();
    }
  }

  bool getPropertyForNameBasedOnSearchBy() {
    if (filterSearchBy.isNotEmpty) {
      return filterSearchBy
              .firstWhereOrNull((element) =>
                  element.id == SaveDefaultData.filterSearchByPropertiesId)
              ?.isSelected ??
          true;
    } else {
      return true;
    }
  }

  _getViewAllTabVisibilityType() {
    final data = filterSearchBy.firstWhere((element) => element.isSelected);
    if (data.id == SaveDefaultData.filterSearchByInquiriesId) {
      return ViewAllTabsVisibilityType.fromInquiriesFilter;
    }
    return ViewAllTabsVisibilityType.fromPropertiesFilter;
  }

  bool _isOnlyInquiriesTabAvailable() {
    if (arg == null) {
      return false;
    }
    return arg!.tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeViewAllBrooonInquiries ||
        arg!.tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeViewAllMyInquiries ||
        arg!.tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeInquiriesType ||
        arg!.tabVisibilityType ==
            ViewAllTabsVisibilityType.fromBuyersInquiries ||
        arg!.tabVisibilityType ==
            ViewAllTabsVisibilityType.fromSellersMatchingInquiries ||
        arg!.tabVisibilityType ==
            ViewAllTabsVisibilityType.fromInquiriesNotification ||
        arg!.tabVisibilityType == ViewAllTabsVisibilityType.fromDrawerInquiries;
  }

  onDispose() {
    filterWatcher?.cancel();
  }
}
