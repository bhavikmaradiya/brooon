import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

import './model/add_buyer_args.dart';
import '../../common_property_data_provider.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/helpers/db_locations_tags.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_additional_furnish.dart';
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
import '../../utils/contacts_helper.dart';
import '../../utils/file_utils.dart';
import '../../utils/static_functions.dart';
import '../../utils/sync_helper.dart';
import '../add_property/model/options.dart';
import '../add_property/model/price_enum.dart';
import '../buyers_sellers/model/buyer_seller_info.dart';
import '../choose_location/model/retrieve_location_arg.dart';
import '../property_inquiry_status_helper/property_inquiry_status_helper.dart';

class AddBuyerProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  final _isarService = IsarService();
  final buyerNameFieldController = TextEditingController();
  final buyerPhoneFieldController = TextEditingController();
  bool _validBuyerDetail = false;

  bool? isWashroomAvailable;
  bool? isBalconyAvailable;
  bool? isCornerPiece;
  bool? isLightConnectionAvailable;
  bool? isWellAvailable;
  bool? isAllottedParkingAvailable;
  bool? isParkingAvailable;
  bool? isLiftAvailable;
  bool _isAnyChangeInPropertyFor = false;
  bool isNegotiable = false;

  List<DbPropertyFor> propertyForList = [];
  List<DbPropertyType> propertyTypeList = [];
  List<DbPropertyConstructionType> constructionTypeList = [];
  List<DbPropertyBuildingType> _allBuildingTypes = [];
  List<DbPropertyBuildingType> buildingTypeList = [];
  List<DbPropertyAmenity> propertyAmenityList = [];
  List<DbPropertyFurnishedStatus> furnishedList = [];
  List<DbAdditionalFurnish> additionalFurnishList = [];
  List<DbPropertyFacingType> facingTypeList = [];
  List<DbPropertyBhkType> bhkTypeList = [];
  List<DbPropertySchemeType> schemeTypeList = [];
  List<DbPropertyPreferredCast> preferredCastList = [];

  List<DbPropertyPriceUnit> priceRangeDropdownUnitList = [];
  List<DbPropertyAreaUnit> measurementDropdownUnitList = [];
  List<Options> washRoomAvailableList = [];
  List<Options> balconyAvailableList = [];
  List<Options> cornerPieceList = [];
  List<Options> lightConnectionList = [];
  List<Options> wellAvailableList = [];
  List<Options> parkingAvailableList = [];
  List<Options> allottedParkingList = [];
  List<Options> liftAvailableList = [];
  List<DbLocationTags> _savedLocationTags = [];

  final int _optionsYesId = 1;
  final int _optionsNoId = 2;

  final minMeasureRangeController = TextEditingController();
  final maxMeasureRangeController = TextEditingController();

  final sellMinPriceRangeController = TextEditingController();
  final sellMaxPriceRangeController = TextEditingController();
  final rentMinPriceRangeController = TextEditingController();
  final rentMaxPriceRangeController = TextEditingController();
  final leaseMinPriceRangeController = TextEditingController();
  final leaseMaxPriceRangeController = TextEditingController();

  final ownerCommentsController = TextEditingController();

  final measureUnitTextFieldController = TextEditingController();

  var sellMinPriceUnitTextFieldController = TextEditingController();
  var sellMaxPriceUnitTextFieldController = TextEditingController();
  var rentMinPriceUnitTextFieldController = TextEditingController();
  var rentMaxPriceUnitTextFieldController = TextEditingController();
  var leaseMinPriceUnitTextFieldController = TextEditingController();
  var leaseMaxPriceUnitTextFieldController = TextEditingController();

  final sellMinPricePerSizeController = TextEditingController();
  final sellMaxPricePerSizeController = TextEditingController();
  final rentMinPricePerSizeController = TextEditingController();
  final rentMaxPricePerSizeController = TextEditingController();
  final leaseMinPricePerSizeController = TextEditingController();
  final leaseMaxPricePerSizeController = TextEditingController();

  FocusNode sellMinPricePerSizeFocusNode = FocusNode();
  FocusNode sellMaxPricePerSizeFocusNode = FocusNode();
  FocusNode rentMinPricePerSizeFocusNode = FocusNode();
  FocusNode rentMaxPricePerSizeFocusNode = FocusNode();
  FocusNode leaseMinPricePerSizeFocusNode = FocusNode();
  FocusNode leaseMaxPricePerSizeFocusNode = FocusNode();

  int _sellMinPriceUnit = -1;
  int _sellMaxPriceUnit = -1;
  int _rentMinPriceUnit = -1;
  int _rentMaxPriceUnit = -1;
  int _leaseMinPriceUnit = -1;
  int _leaseMaxPriceUnit = -1;
  int _selectedMeasureUnit = -1;
  String sellPriceRangeText = '';
  String rentPriceRangeText = '';
  String leasePriceRangeText = '';

  Size measureDropdownSize = Size(0, 0);
  Size sellMinPriceDropdownSize = Size(0, 0);
  Size sellMaxPriceDropdownSize = Size(0, 0);
  Size rentMinPriceDropdownSize = Size(0, 0);
  Size rentMaxPriceDropdownSize = Size(0, 0);
  Size leaseMinPriceDropdownSize = Size(0, 0);
  Size leaseMaxPriceDropdownSize = Size(0, 0);

  final propertyLocationController = TextEditingController();

  RetrieveLocationArg? _locationArg;
  DbSavedFilter? buyerInquiryToEdit;
  AddBuyerArgs? _buyerArgs;

  RetrieveLocationArg? get locationArguments => _locationArg;

  final frontSizeTextFieldController = TextEditingController();
  final depthSizeTextFieldController = TextEditingController();
  final firstConnectedRoadFieldController = TextEditingController();
  final secondConnectedRoadFieldController = TextEditingController();
  final roomsTextFieldController = TextEditingController();
  final bathroomsTextFieldController = TextEditingController();
  final floorsTextFieldController = TextEditingController();
  final totalFloorsTextFieldController = TextEditingController();
  bool _isAnyChangeInPropertyType = false;

  List<BuyerSellerInfo> _savedBuyersList = [];

  int get selectedSellMinPriceUnit => _sellMinPriceUnit;

  int get selectedRentMinPriceUnit => _rentMinPriceUnit;

  int get selectedLeaseMinPriceUnit => _leaseMinPriceUnit;

  bool get isValidBuyerDetails => _validBuyerDetail;

  int get selectedSellMaxPriceUnit => _sellMaxPriceUnit;

  int get selectedRentMaxPriceUnit => _rentMaxPriceUnit;

  int get selectedLeaseMaxPriceUnit => _leaseMaxPriceUnit;

  int get selectedMeasureUnit => _selectedMeasureUnit;

  int get optionsYesId => _optionsYesId;

  int get optionsNoId => _optionsNoId;

  init(AppLocalizations localizationsContext, AddBuyerArgs? buyerArgs) async {
    this.localizationsContext = localizationsContext;
    propertyAmenityList = await _isarService.getAmenities();
    preferredCastList = await _isarService.getPreferredCasts();
    furnishedList = await _isarService.getFurnishedStatus();
    propertyForList = await _isarService.getPropertyFor();
    propertyTypeList = await _isarService.getPropertyTypes();
    constructionTypeList = await _isarService.getConstructionTypes();
    schemeTypeList = await _isarService.getSchemeTypes();
    _allBuildingTypes = await _isarService.getBuildingTypes();
    measurementDropdownUnitList = await _isarService.getPropertyAreaUnits();
    _savedBuyersList =
        await CommonPropertyDataProvider.getAllBuyersWithInquiries();
    _getLocationList();
    buildingTypeList.addAll(_allBuildingTypes);
    if (additionalFurnishList.isEmpty) {
      additionalFurnishList = await _isarService.getAdditionalFurnish();
    }
    if (facingTypeList.isEmpty) {
      facingTypeList = await _isarService.getFacingTypes();
    }
    if (bhkTypeList.isEmpty) {
      bhkTypeList = await _isarService.getBhkTypes();
    }
    sellMinPriceRangeController.text = '';
    sellMaxPriceRangeController.text = '';
    rentMinPriceRangeController.text = '';
    rentMaxPriceRangeController.text = '';
    leaseMinPriceRangeController.text = '';
    leaseMaxPriceRangeController.text = '';
    roomsTextFieldController.text = '';
    floorsTextFieldController.text = '';
    totalFloorsTextFieldController.text = '';
    bathroomsTextFieldController.text = '';
    frontSizeTextFieldController.text = '';
    depthSizeTextFieldController.text = '';
    minMeasureRangeController.text = '';
    maxMeasureRangeController.text = '';
    _selectedMeasureUnit = -1;

    final optionsList = [
      Options()
        ..id = _optionsYesId
        ..name = localizationsContext.yes,
      Options()
        ..id = _optionsNoId
        ..name = localizationsContext.no,
    ];

    if (cornerPieceList.isEmpty) {
      cornerPieceList.addAll(optionsList);
    }
    if (washRoomAvailableList.isEmpty) {
      washRoomAvailableList.addAll(optionsList);
    }
    if (balconyAvailableList.isEmpty) {
      balconyAvailableList.addAll(optionsList);
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
    if (buyerArgs != null) {
      if (buyerArgs.inquiryEnum == InquiryEnums.edit ||
          buyerArgs.inquiryEnum == InquiryEnums.copy) {
        _buyerArgs = buyerArgs;
        this.buyerInquiryToEdit = await _isarService.getSavedFilterById(
          buyerArgs.inquiryId,
        );
      } else if (buyerArgs.inquiryEnum == InquiryEnums.add &&
          buyerArgs.propertyTypeId != null) {
        // select default property type
        selectPropertyType(buyerArgs.propertyTypeId!);
        _isAnyChangeInPropertyType = false;
      }
    }
    selectPropertyFor(SaveDefaultData.propertyForSellId);
    _isAnyChangeInPropertyFor = false;
    _selectDefaultMeasurement();
    _refillSavedValues();
  }

  _refillSavedValues() async {
    if (buyerInquiryToEdit != null) {
      buyerNameFieldController.text = buyerInquiryToEdit!.buyerName;
      buyerPhoneFieldController.text = buyerInquiryToEdit!.mobileNo;
      ownerCommentsController.text = buyerInquiryToEdit!.notes ?? '';
      updateNegotiationOption(buyerInquiryToEdit!.isNegotiable);
      if (buyerInquiryToEdit!.bathroomCount != null &&
          buyerInquiryToEdit!.bathroomCount! > 0) {
        bathroomsTextFieldController.text =
            buyerInquiryToEdit!.bathroomCount!.toString();
      } else {
        bathroomsTextFieldController.text = '';
      }

      if (buyerInquiryToEdit!.frontSize != null) {
        frontSizeTextFieldController.text = StaticFunctions.removeTrailingZeros(
            buyerInquiryToEdit!.frontSize!.toString());
      } else {
        frontSizeTextFieldController.text = '';
      }

      if (buyerInquiryToEdit!.depthSize != null) {
        depthSizeTextFieldController.text = StaticFunctions.removeTrailingZeros(
            buyerInquiryToEdit!.depthSize!.toString());
      } else {
        depthSizeTextFieldController.text = '';
      }

      if (buyerInquiryToEdit!.roomCount != null &&
          buyerInquiryToEdit!.roomCount! > 0) {
        roomsTextFieldController.text =
            buyerInquiryToEdit!.roomCount!.toString();
      } else {
        roomsTextFieldController.text = '';
      }

      if (buyerInquiryToEdit!.floorCount != null &&
          buyerInquiryToEdit!.floorCount! > 0) {
        floorsTextFieldController.text =
            buyerInquiryToEdit!.floorCount!.toString();
      } else {
        floorsTextFieldController.text = '';
      }

      if (buyerInquiryToEdit!.totalFloorCount != null &&
          buyerInquiryToEdit!.totalFloorCount! > 0) {
        totalFloorsTextFieldController.text =
            buyerInquiryToEdit!.totalFloorCount!.toString();
      } else {
        totalFloorsTextFieldController.text = '';
      }

      if (buyerInquiryToEdit!.location != null &&
          buyerInquiryToEdit!.location!.trim().isNotEmpty) {
        propertyLocationController.text = buyerInquiryToEdit!.location!;
      } else {
        propertyLocationController.text = '';
      }

      if (buyerInquiryToEdit?.area != null) {
        updateLocationInfo(
          RetrieveLocationArg(
            areaName: buyerInquiryToEdit!.area,
            coordinates: LatLng(
              buyerInquiryToEdit?.latitude ?? 0,
              buyerInquiryToEdit?.longitude ?? 0,
            ),
          ),
        );
      }

      if (propertyForList.isNotEmpty) {
        propertyForList.forEach((element) {
          element.isSelected = false;
        });
        if (buyerInquiryToEdit!.propertyFor != null &&
            buyerInquiryToEdit!.propertyFor!.isNotEmpty) {
          buyerInquiryToEdit!.propertyFor!.forEach(
            (elementToSelect) {
              propertyForList
                  .firstWhereOrNull((element) => element.id == elementToSelect)
                  ?.isSelected = true;
            },
          );
        }
      }

      if (buyerInquiryToEdit!.sellPriceRangeMin != null &&
          buyerInquiryToEdit!.sellPriceRangeMin! > 0) {
        sellMinPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            buyerInquiryToEdit!.sellPriceRangeMin!,
            buyerInquiryToEdit!.sellMinPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(
          id: buyerInquiryToEdit!.sellMinPriceUnit,
          isMin: true,
          priceFor: PriceEnum.sell,
        );
      }

      if (buyerInquiryToEdit!.sellPriceRangeMax != null &&
          buyerInquiryToEdit!.sellPriceRangeMax! > 0) {
        sellMaxPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            buyerInquiryToEdit!.sellPriceRangeMax!,
            buyerInquiryToEdit!.sellMaxPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(
          id: buyerInquiryToEdit!.sellMaxPriceUnit,
          isMin: false,
          priceFor: PriceEnum.sell,
        );
      }

      if (buyerInquiryToEdit!.rentPriceRangeMin != null &&
          buyerInquiryToEdit!.rentPriceRangeMin! > 0) {
        rentMinPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            buyerInquiryToEdit!.rentPriceRangeMin!,
            buyerInquiryToEdit!.rentMinPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(
          id: buyerInquiryToEdit!.rentMinPriceUnit,
          isMin: true,
          priceFor: PriceEnum.rent,
        );
      }

      if (buyerInquiryToEdit!.rentPriceRangeMax != null &&
          buyerInquiryToEdit!.rentPriceRangeMax! > 0) {
        rentMaxPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            buyerInquiryToEdit!.rentPriceRangeMax!,
            buyerInquiryToEdit!.rentMaxPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(
          id: buyerInquiryToEdit!.rentMaxPriceUnit,
          isMin: false,
          priceFor: PriceEnum.rent,
        );
      }

      if (buyerInquiryToEdit!.leasePriceRangeMin != null &&
          buyerInquiryToEdit!.leasePriceRangeMin! > 0) {
        leaseMinPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            buyerInquiryToEdit!.leasePriceRangeMin!,
            buyerInquiryToEdit!.leaseMinPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(
          id: buyerInquiryToEdit!.leaseMinPriceUnit,
          isMin: true,
          priceFor: PriceEnum.lease,
        );
      }

      if (buyerInquiryToEdit!.leasePriceRangeMax != null &&
          buyerInquiryToEdit!.leasePriceRangeMax! > 0) {
        leaseMaxPriceRangeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          StaticFunctions.shortPriceRangeValue(
            buyerInquiryToEdit!.leasePriceRangeMax!,
            buyerInquiryToEdit!.leaseMaxPriceUnit,
          ).toString(),
        ));
        selectPriceUnit(
          id: buyerInquiryToEdit!.leaseMaxPriceUnit,
          isMin: false,
          priceFor: PriceEnum.lease,
        );
      }

      if (buyerInquiryToEdit!.sellMinPricePerSize != null &&
          buyerInquiryToEdit!.sellMinPricePerSize! > 0) {
        sellMinPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          buyerInquiryToEdit!.sellMinPricePerSize.toString(),
        ));
      }

      if (buyerInquiryToEdit!.sellMaxPricePerSize != null &&
          buyerInquiryToEdit!.sellMaxPricePerSize! > 0) {
        sellMaxPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          buyerInquiryToEdit!.sellMaxPricePerSize.toString(),
        ));
      }

      if (buyerInquiryToEdit!.rentMinPricePerSize != null &&
          buyerInquiryToEdit!.rentMinPricePerSize! > 0) {
        rentMinPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          buyerInquiryToEdit!.rentMinPricePerSize.toString(),
        ));
      }

      if (buyerInquiryToEdit!.rentMaxPricePerSize != null &&
          buyerInquiryToEdit!.rentMaxPricePerSize! > 0) {
        rentMaxPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          buyerInquiryToEdit!.rentMaxPricePerSize.toString(),
        ));
      }

      if (buyerInquiryToEdit!.leaseMinPricePerSize != null &&
          buyerInquiryToEdit!.leaseMinPricePerSize! > 0) {
        leaseMinPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          buyerInquiryToEdit!.leaseMinPricePerSize.toString(),
        ));
      }

      if (buyerInquiryToEdit!.leaseMaxPricePerSize != null &&
          buyerInquiryToEdit!.leaseMaxPricePerSize! > 0) {
        leaseMaxPricePerSizeController.text =
            StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(
          buyerInquiryToEdit!.leaseMaxPricePerSize.toString(),
        ));
      }

      selectMeasureUnit(
          buyerInquiryToEdit!.measureUnit ?? SaveDefaultData.areaUnitSqFtId);

      if (buyerInquiryToEdit!.constructionType != null &&
          buyerInquiryToEdit!.constructionType!.isNotEmpty) {
        final selectedConstructionType = constructionTypeList
            .where((element) =>
                buyerInquiryToEdit!.constructionType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectConstructionType(selection: selectedConstructionType);
      } else {
        selectConstructionType();
      }

      if (buyerInquiryToEdit!.schemeType != null &&
          buyerInquiryToEdit!.schemeType!.isNotEmpty) {
        final selectedSchemeType = schemeTypeList
            .where((element) =>
                buyerInquiryToEdit!.schemeType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectSchemeType(selection: selectedSchemeType);
      } else {
        selectSchemeType();
      }

      if (buyerInquiryToEdit!.buildingType != null &&
          buyerInquiryToEdit!.buildingType!.isNotEmpty) {
        final selectedBuildingType = buildingTypeList
            .where((element) =>
                buyerInquiryToEdit!.buildingType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectBuildingType(selection: selectedBuildingType);
      } else {
        selectBuildingType();
      }

      minMeasureRangeController.text =
          buyerInquiryToEdit!.minMeasure != null && _selectedMeasureUnit != -1
              ? StaticFunctions.removeTrailingZeros(
                  buyerInquiryToEdit!.minMeasure.toString(),
                )
              : '';
      maxMeasureRangeController.text =
          buyerInquiryToEdit!.maxMeasure != null && _selectedMeasureUnit != -1
              ? StaticFunctions.removeTrailingZeros(
                  buyerInquiryToEdit!.maxMeasure.toString(),
                )
              : '';
      enableWashroom(buyerInquiryToEdit!.isWashroomAvailable);
      enableBalcony(buyerInquiryToEdit!.isBalconyAvailable);
      enableCornerPiece(buyerInquiryToEdit!.isCornerPiece);
      enableLightConnection(buyerInquiryToEdit!.isLightConnectionAvailable);
      enableWell(buyerInquiryToEdit!.isWellAvailable);
      enableAllottedParking(buyerInquiryToEdit!.isAllottedParkingAvailable);
      enableParking(buyerInquiryToEdit!.isParkingAvailable);
      enableLift(buyerInquiryToEdit!.isLiftAvailable);

      if (buyerInquiryToEdit!.furnishedType != null &&
          buyerInquiryToEdit!.furnishedType!.isNotEmpty) {
        final selectedFurnished = furnishedList
            .where((element) =>
                buyerInquiryToEdit!.furnishedType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectFurnished(selection: selectedFurnished);
      } else {
        selectFurnished();
      }

      if (buyerInquiryToEdit!.bhkIds != null &&
          buyerInquiryToEdit!.bhkIds!.isNotEmpty) {
        final selectedBhks = bhkTypeList
            .where((element) =>
                buyerInquiryToEdit!.bhkIds!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectBhkType(selection: selectedBhks);
      } else {
        selectBhkType();
      }

      if (buyerInquiryToEdit!.facingType != null &&
          buyerInquiryToEdit!.facingType!.isNotEmpty) {
        final selectedFacing = facingTypeList
            .where((element) =>
                buyerInquiryToEdit!.facingType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectFacingType(selection: selectedFacing);
      } else {
        selectFacingType();
      }

      if (buyerInquiryToEdit!.connectedRoads != null &&
          buyerInquiryToEdit!.connectedRoads!.isNotEmpty) {
        firstConnectedRoadFieldController
            .text = StaticFunctions.removeTrailingZeros(
                buyerInquiryToEdit!.connectedRoads!.firstOrNull?.toString() ??
                    '') ??
            '';
        if (buyerInquiryToEdit!.connectedRoads!.length > 1) {
          secondConnectedRoadFieldController
              .text = StaticFunctions.removeTrailingZeros(
                  buyerInquiryToEdit!.connectedRoads!.lastOrNull?.toString() ??
                      '') ??
              '';
        } else {
          secondConnectedRoadFieldController.text = '';
        }
      } else {
        firstConnectedRoadFieldController.text = '';
        secondConnectedRoadFieldController.text = '';
      }

      if (buyerInquiryToEdit!.additionalFurnish != null &&
          buyerInquiryToEdit!.additionalFurnish!.isNotEmpty) {
        final selectedAdditionalFurnish = additionalFurnishList
            .where((element) =>
                buyerInquiryToEdit!.additionalFurnish!
                    .firstWhereOrNull((name) => name == element.name) !=
                null)
            .toList();
        selectAdditionalFurnish(selection: selectedAdditionalFurnish);
      } else {
        selectAdditionalFurnish();
      }

      if (buyerInquiryToEdit!.preferredCaste != null &&
          buyerInquiryToEdit!.preferredCaste!.isNotEmpty) {
        final selectedPreferredCaste = preferredCastList
            .where((element) =>
                buyerInquiryToEdit!.preferredCaste!
                    .firstWhereOrNull((name) => name == element.name) !=
                null)
            .toList();
        selectPreferredCaste(selection: selectedPreferredCaste);
      } else {
        selectPreferredCaste();
      }

      if (propertyAmenityList.isNotEmpty &&
          buyerInquiryToEdit!.selectedAmenities != null &&
          buyerInquiryToEdit!.selectedAmenities!.isNotEmpty) {
        final selectedAmenities = propertyAmenityList
            .where((element) =>
                buyerInquiryToEdit!.selectedAmenities!
                    .firstWhereOrNull((name) => name.contains(element.name)) !=
                null)
            .toList();
        selectPropertyAmenity(selection: selectedAmenities);
      } else {
        selectPropertyAmenity();
      }

      if (buyerInquiryToEdit!.propertyType != null &&
          buyerInquiryToEdit!.propertyType!.isNotEmpty) {
        final selectedPropertyType = propertyTypeList
            .where((element) =>
                buyerInquiryToEdit!.propertyType!
                    .firstWhereOrNull((id) => id == element.id) !=
                null)
            .toList();
        selectPropertyType(selectedPropertyType.first.id);
      }
      validateBuyerData();
    }
    notifyListeners();
  }

  onMeasureUnitDropdownSizeChange(Size newSize) {
    measureDropdownSize = newSize;
    notifyListeners();
  }

  updateLocationInfo(RetrieveLocationArg? arg) {
    _locationArg = arg;
    notifyListeners();
    if (propertyLocationController.text.trim().isEmpty &&
        arg?.landMarkLocationForLocationField != null) {
      propertyLocationController.text = arg!.landMarkLocationForLocationField!;
      StaticFunctions.fieldCursorPositionAtLast(propertyLocationController);
    }
  }

  _selectDefaultPriceUnitValues() {
    //select default price unit values if its prices are empty
    if (sellMinPriceRangeController.text.trim().isEmpty &&
        sellMaxPriceRangeController.text.trim().isEmpty) {
      selectPriceUnit(
        id: SaveDefaultData.filterPriceUnitLac,
        isMin: true,
        priceFor: PriceEnum.sell,
      );
      selectPriceUnit(
        id: SaveDefaultData.filterPriceUnitLac,
        isMin: false,
        priceFor: PriceEnum.sell,
      );
    }
    if (rentMinPriceRangeController.text.trim().isEmpty &&
        rentMaxPriceRangeController.text.trim().isEmpty) {
      selectPriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: true,
        priceFor: PriceEnum.rent,
      );
      selectPriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: false,
        priceFor: PriceEnum.rent,
      );
    }
    if (leaseMinPriceRangeController.text.trim().isEmpty &&
        leaseMaxPriceRangeController.text.trim().isEmpty) {
      selectPriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: true,
        priceFor: PriceEnum.lease,
      );
      selectPriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: false,
        priceFor: PriceEnum.lease,
      );
    }
  }

  updateNegotiationOption(bool value) {
    isNegotiable = value;
    notifyListeners();
  }

  onPriceRangeDropdownSizeChange({
    required bool isMin,
    required Size newSize,
    required PriceEnum priceFor,
  }) {
    if (priceFor == PriceEnum.sell) {
      if (isMin) {
        sellMinPriceDropdownSize = newSize;
      } else {
        sellMaxPriceDropdownSize = newSize;
      }
    } else if (priceFor == PriceEnum.rent) {
      if (isMin) {
        rentMinPriceDropdownSize = newSize;
      } else {
        rentMaxPriceDropdownSize = newSize;
      }
    } else if (priceFor == PriceEnum.lease) {
      if (isMin) {
        leaseMinPriceDropdownSize = newSize;
      } else {
        leaseMaxPriceDropdownSize = newSize;
      }
    }
    notifyListeners();
  }

  void selectPriceUnit({
    required int id,
    required bool isMin,
    required PriceEnum priceFor,
  }) {
    var unitToSelect = priceRangeDropdownUnitList
        .firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      if (isMin) {
        if (priceFor == PriceEnum.sell) {
          _sellMinPriceUnit = unitToSelect.id;
          sellMinPriceUnitTextFieldController.text = unitToSelect.unit;
        } else if (priceFor == PriceEnum.rent) {
          _rentMinPriceUnit = unitToSelect.id;
          rentMinPriceUnitTextFieldController.text = unitToSelect.unit;
        } else if (priceFor == PriceEnum.lease) {
          _leaseMinPriceUnit = unitToSelect.id;
          leaseMinPriceUnitTextFieldController.text = unitToSelect.unit;
        }
      } else {
        if (priceFor == PriceEnum.sell) {
          _sellMaxPriceUnit = unitToSelect.id;
          sellMaxPriceUnitTextFieldController.text = unitToSelect.unit;
        } else if (priceFor == PriceEnum.rent) {
          _rentMaxPriceUnit = unitToSelect.id;
          rentMaxPriceUnitTextFieldController.text = unitToSelect.unit;
        } else if (priceFor == PriceEnum.lease) {
          _leaseMaxPriceUnit = unitToSelect.id;
          leaseMaxPriceUnitTextFieldController.text = unitToSelect.unit;
        }
      }
      if (priceFor == PriceEnum.sell) {
        StaticFunctions.fieldCursorPositionAtLast(
          isMin
              ? sellMinPriceUnitTextFieldController
              : sellMaxPriceUnitTextFieldController,
        );
      } else if (priceFor == PriceEnum.rent) {
        StaticFunctions.fieldCursorPositionAtLast(
          isMin
              ? rentMinPriceUnitTextFieldController
              : rentMaxPriceUnitTextFieldController,
        );
      } else if (priceFor == PriceEnum.lease) {
        StaticFunctions.fieldCursorPositionAtLast(
          isMin
              ? leaseMinPriceUnitTextFieldController
              : leaseMaxPriceUnitTextFieldController,
        );
      }
    }
    setPriceRangeText(priceFor);
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

  _getPriceUnitString(int unitId) {
    return unitId == SaveDefaultData.filterPriceUnitThousand
        ? localizationsContext.thousand
        : unitId == SaveDefaultData.filterPriceUnitLac
            ? localizationsContext.lakh
            : unitId == SaveDefaultData.filterPriceUnitCrore
                ? localizationsContext.crore
                : '';
  }

  setPriceRangeText(PriceEnum priceFor) {
    validateBuyerData();

    calculatePriceBySize(
      isItMinRange: false,
    );
    calculatePriceBySize(
      isItMinRange: true,
    );

    if (priceFor == PriceEnum.sell) {
      sellPriceRangeText = '';
    } else if (priceFor == PriceEnum.rent) {
      rentPriceRangeText = '';
    } else if (priceFor == PriceEnum.lease) {
      leasePriceRangeText = '';
    }

    int minPriceUnit = -1;
    int maxPriceUnit = -1;

    if (priceFor == PriceEnum.sell) {
      minPriceUnit = _sellMinPriceUnit;
      maxPriceUnit = _sellMaxPriceUnit;
    } else if (priceFor == PriceEnum.rent) {
      minPriceUnit = _rentMinPriceUnit;
      maxPriceUnit = _rentMaxPriceUnit;
    } else if (priceFor == PriceEnum.lease) {
      minPriceUnit = _leaseMinPriceUnit;
      maxPriceUnit = _leaseMaxPriceUnit;
    }

    late TextEditingController minPriceRangeController;
    late TextEditingController maxPriceRangeController;

    if (priceFor == PriceEnum.sell) {
      minPriceRangeController = sellMinPriceRangeController;
      maxPriceRangeController = sellMaxPriceRangeController;
    } else if (priceFor == PriceEnum.rent) {
      minPriceRangeController = rentMinPriceRangeController;
      maxPriceRangeController = rentMaxPriceRangeController;
    } else if (priceFor == PriceEnum.lease) {
      minPriceRangeController = leaseMinPriceRangeController;
      maxPriceRangeController = leaseMaxPriceRangeController;
    }

    final minUnitString = _getPriceUnitString(minPriceUnit);
    final maxUnitString = _getPriceUnitString(maxPriceUnit);
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
        ? StaticFunctions.convertPriceToFull(enteredMinPrice, minPriceUnit)
        : null;
    final maxPriceWithUnit = enteredMaxPrice != null
        ? StaticFunctions.convertPriceToFull(enteredMaxPrice, maxPriceUnit)
        : null;

    if (minPriceWithUnit != null &&
        maxPriceWithUnit != null &&
        minPriceWithUnit > maxPriceWithUnit) {
      if (priceFor == PriceEnum.sell) {
        sellPriceRangeText = localizationsContext.minMaxError;
      } else if (priceFor == PriceEnum.rent) {
        rentPriceRangeText = localizationsContext.minMaxError;
      } else if (priceFor == PriceEnum.lease) {
        leasePriceRangeText = localizationsContext.minMaxError;
      }
      notifyListeners();
      return;
    }

    //TODO: Removed price unit symbol
    if (minPriceRangeController.text.toString().trim().isNotEmpty &&
        minPriceWithUnit != null) {
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
      if (priceFor == PriceEnum.sell) {
        /*sellPriceRangeText =
          '${StaticFunctions.defaultPriceUnit}${minPriceRangeController.text.toString().trim()} $minUnitString';*/
        sellPriceRangeText = '$priceToShow $unitString';
      } else if (priceFor == PriceEnum.rent) {
        /*rentPriceRangeText =
          '${StaticFunctions.defaultPriceUnit}${minPriceRangeController.text.toString().trim()} $minUnitString';*/
        rentPriceRangeText = '$priceToShow $unitString';
      } else if (priceFor == PriceEnum.lease) {
        /*leasePriceRangeText =
          '${StaticFunctions.defaultPriceUnit}${minPriceRangeController.text.toString().trim()} $minUnitString';*/
        leasePriceRangeText = '$priceToShow $unitString';
      }
    }

    if (maxPriceRangeController.text.toString().trim().isNotEmpty &&
        maxPriceWithUnit != null) {
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
      if (priceFor == PriceEnum.sell) {
        if (sellPriceRangeText.trim().isNotEmpty) {
          sellPriceRangeText += ' - ';
        }
        //TODO: Removed price unit symbol
        /*sellPriceRangeText +=
          '${StaticFunctions.defaultPriceUnit}${maxPriceRangeController.text.toString().trim()} $maxUnitString';*/
        sellPriceRangeText += '$priceToShow $unitString';
      } else if (priceFor == PriceEnum.rent) {
        if (rentPriceRangeText.trim().isNotEmpty) {
          rentPriceRangeText += ' - ';
        }
        //TODO: Removed price unit symbol
        /*rentPriceRangeText +=
          '${StaticFunctions.defaultPriceUnit}${maxPriceRangeController.text.toString().trim()} $maxUnitString';*/
        rentPriceRangeText += '$priceToShow $unitString';
      } else if (priceFor == PriceEnum.lease) {
        if (leasePriceRangeText.trim().isNotEmpty) {
          leasePriceRangeText += ' - ';
        }
        //TODO: Removed price unit symbol
        /*leasePriceRangeText +=
          '${StaticFunctions.defaultPriceUnit}${maxPriceRangeController.text.toString().trim()} $maxUnitString';*/
        leasePriceRangeText += '$priceToShow $unitString';
      }
    }
    notifyListeners();
  }

  validateBuyerData() {
    final selectedPropertyFor = propertyForList
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();

    bool isSellPriceValid = false;
    bool isRentPriceValid = false;
    bool isLeasePriceValid = false;

    if (selectedPropertyFor.contains(SaveDefaultData.propertyForSellId)) {
      final enteredMinPrice =
          sellMinPriceRangeController.text.toString().trim().isNotEmpty
              ? double.tryParse(
                  sellMinPriceRangeController.text.trim().replaceAll(',', ''))
              : null;
      final enteredMaxPrice =
          sellMaxPriceRangeController.text.toString().trim().isNotEmpty
              ? double.tryParse(
                  sellMaxPriceRangeController.text.trim().replaceAll(',', ''))
              : null;

      final minPriceWithUnit = enteredMinPrice != null
          ? StaticFunctions.convertPriceToFull(
              enteredMinPrice,
              _sellMinPriceUnit,
            )
          : null;
      final maxPriceWithUnit = enteredMaxPrice != null
          ? StaticFunctions.convertPriceToFull(
              enteredMaxPrice,
              _sellMaxPriceUnit,
            )
          : null;
      isSellPriceValid = ((minPriceWithUnit != null &&
              maxPriceWithUnit != null &&
              minPriceWithUnit > 0 &&
              maxPriceWithUnit > 0 &&
              minPriceWithUnit <= maxPriceWithUnit) ||
          ((minPriceWithUnit == null || maxPriceWithUnit == null) &&
              ((sellMinPriceRangeController.text.toString().trim().isNotEmpty &&
                      minPriceWithUnit! > 0) ||
                  (sellMaxPriceRangeController.text
                          .toString()
                          .trim()
                          .isNotEmpty &&
                      maxPriceWithUnit! > 0))) ||
          (minPriceWithUnit == null && maxPriceWithUnit == null));
    } else {
      isSellPriceValid = true;
    }

    if (selectedPropertyFor.contains(SaveDefaultData.propertyForRentId)) {
      final enteredMinPrice =
          rentMinPriceRangeController.text.toString().trim().isNotEmpty
              ? double.tryParse(
                  rentMinPriceRangeController.text.trim().replaceAll(',', ''))
              : null;
      final enteredMaxPrice =
          rentMaxPriceRangeController.text.toString().trim().isNotEmpty
              ? double.tryParse(
                  rentMaxPriceRangeController.text.trim().replaceAll(',', ''))
              : null;

      final minPriceWithUnit = enteredMinPrice != null
          ? StaticFunctions.convertPriceToFull(
              enteredMinPrice,
              _rentMinPriceUnit,
            )
          : null;
      final maxPriceWithUnit = enteredMaxPrice != null
          ? StaticFunctions.convertPriceToFull(
              enteredMaxPrice,
              _rentMaxPriceUnit,
            )
          : null;
      isRentPriceValid = ((minPriceWithUnit != null &&
              maxPriceWithUnit != null &&
              minPriceWithUnit > 0 &&
              maxPriceWithUnit > 0 &&
              minPriceWithUnit <= maxPriceWithUnit) ||
          ((minPriceWithUnit == null || maxPriceWithUnit == null) &&
              ((rentMinPriceRangeController.text.toString().trim().isNotEmpty &&
                      minPriceWithUnit! > 0) ||
                  (rentMaxPriceRangeController.text
                          .toString()
                          .trim()
                          .isNotEmpty &&
                      maxPriceWithUnit! > 0))) ||
          (minPriceWithUnit == null && maxPriceWithUnit == null));
    } else {
      isRentPriceValid = true;
    }

    if (selectedPropertyFor.contains(SaveDefaultData.propertyForLeaseId)) {
      final enteredMinPrice =
          leaseMinPriceRangeController.text.toString().trim().isNotEmpty
              ? double.tryParse(
                  leaseMinPriceRangeController.text.trim().replaceAll(',', ''))
              : null;
      final enteredMaxPrice =
          leaseMaxPriceRangeController.text.toString().trim().isNotEmpty
              ? double.tryParse(
                  leaseMaxPriceRangeController.text.trim().replaceAll(',', ''))
              : null;

      final minPriceWithUnit = enteredMinPrice != null
          ? StaticFunctions.convertPriceToFull(
              enteredMinPrice,
              _leaseMinPriceUnit,
            )
          : null;
      final maxPriceWithUnit = enteredMaxPrice != null
          ? StaticFunctions.convertPriceToFull(
              enteredMaxPrice,
              _leaseMaxPriceUnit,
            )
          : null;
      isLeasePriceValid = ((minPriceWithUnit != null &&
              maxPriceWithUnit != null &&
              minPriceWithUnit > 0 &&
              maxPriceWithUnit > 0 &&
              minPriceWithUnit <= maxPriceWithUnit) ||
          ((minPriceWithUnit == null || maxPriceWithUnit == null) &&
              ((leaseMinPriceRangeController.text
                          .toString()
                          .trim()
                          .isNotEmpty &&
                      minPriceWithUnit! > 0) ||
                  (leaseMaxPriceRangeController.text
                          .toString()
                          .trim()
                          .isNotEmpty &&
                      maxPriceWithUnit! > 0))) ||
          (minPriceWithUnit == null && maxPriceWithUnit == null));
    } else {
      isLeasePriceValid = true;
    }

    _validBuyerDetail = buyerNameFieldController.text.trim().isNotEmpty &&
        (buyerPhoneFieldController.text.trim().isEmpty ||
            buyerPhoneFieldController.text.length ==
                AppConfig.mobileNoFieldLength) &&
        propertyTypeList.any(
          (element) => element.isSelected,
        ) &&
        propertyForList.any(
          (element) => element.isSelected,
        ) &&
        isSellPriceValid &&
        isRentPriceValid &&
        isLeasePriceValid;
    notifyListeners();
  }

  void selectPropertyFor(int id) {
    final index = propertyForList.indexWhere((element) => element.id == id);
    if (index != (-1)) {
      propertyForList[index].isSelected = !propertyForList[index].isSelected;
    }
    _isAnyChangeInPropertyFor =
        propertyForList.any((element) => element.isSelected);
    sellMinPricePerSizeFocusNode = FocusNode();
    sellMaxPricePerSizeFocusNode = FocusNode();
    rentMinPricePerSizeFocusNode = FocusNode();
    rentMaxPricePerSizeFocusNode = FocusNode();
    leaseMinPricePerSizeFocusNode = FocusNode();
    leaseMaxPricePerSizeFocusNode = FocusNode();
    notifyListeners();
    validateBuyerData();
    _selectDefaultPriceUnitValues();
  }

  _selectDefaultMeasurement() {
    if (minMeasureRangeController.text.trim().isEmpty &&
        maxMeasureRangeController.text.trim().isEmpty) {
      selectMeasureUnit(getDefaultPriceUnitId());
    }
  }

  int getDefaultPriceUnitId() {
    final propertyTypeId =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    return StaticFunctions.getDefaultAreaUnitId(propertyTypeId);
  }

  calculatePriceBySize({
    bool isItMinRange = false,
  }) {
    final selectedPropertyFor =
        propertyForList.where((e) => e.isSelected).map((e) => e.id).toList();
    double sellMinPrice = 0;
    double rentMinPrice = 0;
    double leaseMinPrice = 0;
    if (selectedPropertyFor.contains(SaveDefaultData.propertyForSellId)) {
      if (sellMinPriceRangeController.text.trim().isNotEmpty) {
        sellMinPrice = StaticFunctions.convertPriceToFull(
          double.parse(
            sellMinPriceRangeController.text.trim().replaceAll(',', ''),
          ),
          _sellMinPriceUnit,
        );
      }
    }
    if (selectedPropertyFor.contains(SaveDefaultData.propertyForRentId)) {
      if (rentMinPriceRangeController.text.trim().isNotEmpty) {
        rentMinPrice = StaticFunctions.convertPriceToFull(
          double.parse(
            rentMinPriceRangeController.text.trim().replaceAll(',', ''),
          ),
          _rentMinPriceUnit,
        );
      }
    }
    if (selectedPropertyFor.contains(SaveDefaultData.propertyForLeaseId)) {
      if (leaseMinPriceRangeController.text.trim().isNotEmpty) {
        leaseMinPrice = StaticFunctions.convertPriceToFull(
          double.parse(
            leaseMinPriceRangeController.text.trim().replaceAll(',', ''),
          ),
          _leaseMinPriceUnit,
        );
      }
    }

    double sellMaxPrice = 0;
    double rentMaxPrice = 0;
    double leaseMaxPrice = 0;
    if (selectedPropertyFor.contains(SaveDefaultData.propertyForSellId)) {
      if (sellMaxPriceRangeController.text.trim().isNotEmpty) {
        sellMaxPrice = StaticFunctions.convertPriceToFull(
          double.parse(
            sellMaxPriceRangeController.text.trim().replaceAll(',', ''),
          ),
          _sellMaxPriceUnit,
        );
      }
    }
    if (selectedPropertyFor.contains(SaveDefaultData.propertyForRentId)) {
      if (rentMaxPriceRangeController.text.trim().isNotEmpty) {
        rentMaxPrice = StaticFunctions.convertPriceToFull(
          double.parse(
            rentMaxPriceRangeController.text.trim().replaceAll(',', ''),
          ),
          _rentMaxPriceUnit,
        );
      }
    }
    if (selectedPropertyFor.contains(SaveDefaultData.propertyForLeaseId)) {
      if (leaseMaxPriceRangeController.text.trim().isNotEmpty) {
        leaseMaxPrice = StaticFunctions.convertPriceToFull(
          double.parse(
            leaseMaxPriceRangeController.text.trim().replaceAll(',', ''),
          ),
          _leaseMaxPriceUnit,
        );
      }
    }

    final sellCalculatedValue =
        selectedPropertyFor.contains(SaveDefaultData.propertyForSellId)
            ? _calcPriceBySizeHelper(
                isItMinRange ? sellMinPrice : 0,
                !isItMinRange ? sellMaxPrice : 0,
                isItMinRange
                    ? minMeasureRangeController.text
                    : maxMeasureRangeController.text,
              )
            : null;
    final rentCalculatedValue =
        selectedPropertyFor.contains(SaveDefaultData.propertyForRentId)
            ? _calcPriceBySizeHelper(
                isItMinRange ? rentMinPrice : 0,
                !isItMinRange ? rentMaxPrice : 0,
                isItMinRange
                    ? minMeasureRangeController.text
                    : maxMeasureRangeController.text,
              )
            : null;
    final leaseCalculatedValue =
        selectedPropertyFor.contains(SaveDefaultData.propertyForLeaseId)
            ? _calcPriceBySizeHelper(
                isItMinRange ? leaseMinPrice : 0,
                !isItMinRange ? leaseMaxPrice : 0,
                isItMinRange
                    ? minMeasureRangeController.text
                    : maxMeasureRangeController.text,
              )
            : null;
    if (((isItMinRange && !sellMinPricePerSizeFocusNode.hasFocus) ||
            (!isItMinRange && !sellMaxPricePerSizeFocusNode.hasFocus)) &&
        sellCalculatedValue != null) {
      if (isItMinRange) {
        sellMinPricePerSizeController.text = sellCalculatedValue;
      } else {
        sellMaxPricePerSizeController.text = sellCalculatedValue;
      }
    }
    if (((isItMinRange && !rentMinPricePerSizeFocusNode.hasFocus) ||
            (!isItMinRange && !rentMaxPricePerSizeFocusNode.hasFocus)) &&
        rentCalculatedValue != null) {
      if (isItMinRange) {
        rentMinPricePerSizeController.text = rentCalculatedValue;
      } else {
        rentMaxPricePerSizeController.text = rentCalculatedValue;
      }
    }
    if (((isItMinRange && !leaseMinPricePerSizeFocusNode.hasFocus) ||
            (!isItMinRange && !leaseMaxPricePerSizeFocusNode.hasFocus)) &&
        leaseCalculatedValue != null) {
      if (isItMinRange) {
        leaseMinPricePerSizeController.text = leaseCalculatedValue;
      } else {
        leaseMaxPricePerSizeController.text = leaseCalculatedValue;
      }
    }
  }

  onPriceBySizeChange({
    bool isItMinRange = false,
    required PriceEnum priceFor,
  }) {
    late TextEditingController minPriceRangeController;
    late TextEditingController maxPriceRangeController;
    late TextEditingController minPricePerSizeController;
    late TextEditingController maxPricePerSizeController;

    late FocusNode minPriceBySizeFocusNode;
    late FocusNode maxPriceBySizeFocusNode;

    if (priceFor == PriceEnum.sell) {
      minPriceRangeController = sellMinPriceRangeController;
      maxPriceRangeController = sellMaxPriceRangeController;
      minPriceBySizeFocusNode = sellMinPricePerSizeFocusNode;
      maxPriceBySizeFocusNode = sellMaxPricePerSizeFocusNode;
      minPricePerSizeController = sellMinPricePerSizeController;
      maxPricePerSizeController = sellMaxPricePerSizeController;
    } else if (priceFor == PriceEnum.rent) {
      minPriceRangeController = rentMinPriceRangeController;
      maxPriceRangeController = rentMaxPriceRangeController;
      minPriceBySizeFocusNode = rentMinPricePerSizeFocusNode;
      maxPriceBySizeFocusNode = rentMaxPricePerSizeFocusNode;
      minPricePerSizeController = rentMinPricePerSizeController;
      maxPricePerSizeController = rentMaxPricePerSizeController;
    } else if (priceFor == PriceEnum.lease) {
      minPriceRangeController = leaseMinPriceRangeController;
      maxPriceRangeController = leaseMaxPriceRangeController;
      minPriceBySizeFocusNode = leaseMinPricePerSizeFocusNode;
      maxPriceBySizeFocusNode = leaseMaxPricePerSizeFocusNode;
      minPricePerSizeController = leaseMinPricePerSizeController;
      maxPricePerSizeController = leaseMaxPricePerSizeController;
    }

    if (isItMinRange) {
      if (minPriceBySizeFocusNode.hasFocus &&
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
            isMin: isItMinRange,
            priceFor: priceFor,
          );
          final value = StaticFunctions.shortPriceRangeValue(
            priceFromUnit,
            tempPriceUnit,
          );
          // ------------------------------------------------
          minPriceRangeController.text = StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              value.toStringAsFixed(AppConfig.pricingDecimalLimit),
            ),
          );
        }
      } else if (minPriceBySizeFocusNode.hasFocus &&
          (minMeasureRangeController.text.trim().isEmpty ||
              minPricePerSizeController.text.trim().isEmpty)) {
        minPriceRangeController.text = '';
      }
    } else {
      if (maxPriceBySizeFocusNode.hasFocus &&
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
            isMin: isItMinRange,
            priceFor: priceFor,
          );
          final value = StaticFunctions.shortPriceRangeValue(
            priceFromUnit,
            tempPriceUnit,
          );
          // ------------------------------------------------
          maxPriceRangeController.text = StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              value.toStringAsFixed(AppConfig.pricingDecimalLimit),
            ),
          );
        }
      } else if (maxPriceBySizeFocusNode.hasFocus &&
          (maxMeasureRangeController.text.trim().isEmpty ||
              maxPricePerSizeController.text.trim().isEmpty)) {
        maxPriceRangeController.text = '';
      }
    }
    setPriceRangeText(priceFor);
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

  selectPropertyType(int id) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final _propertyTypeToSelect =
        propertyTypeList.firstWhereOrNull((element) => element.id == id);
    if (_selectedPropertyType == null || _selectedPropertyType.id != id) {
      propertyTypeList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_propertyTypeToSelect != null) {
        _propertyTypeToSelect.isSelected = true;
      }
    } else {
      _selectedPropertyType.isSelected = !_selectedPropertyType.isSelected;
    }
    notifyListeners();
    _isAnyChangeInPropertyType = propertyTypeList.any(
      (element) => element.isSelected,
    );
    _resetSelectionOnPropertyTypeChange();
    _selectDefaultMeasurement();
    validateBuyerData();
  }

  /*selectPropertyFor(int id) {
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
    _isAnyChangeInPropertyFor =
        propertyForList.any((element) => element.isSelected);
    notifyListeners();
    validateBuyerData();
    _selectDefaultPriceUnitValues();
  }*/

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

    final selectedSchemeType =
        schemeTypeList.where((element) => element.isSelected).toList();
    selectSchemeType(selection: selectedSchemeType);

    final selectedFacing =
        facingTypeList.where((element) => element.isSelected).toList();
    selectFacingType(selection: selectedFacing);

    final selectedBhk =
        bhkTypeList.where((element) => element.isSelected).toList();
    selectBhkType(selection: selectedBhk);

    final selectedConstruction =
        constructionTypeList.where((element) => element.isSelected).toList();
    selectConstructionType(selection: selectedConstruction);

    final selectedAmenities =
        propertyAmenityList.where((element) => element.isSelected).toList();
    selectPropertyAmenity(selection: selectedAmenities);

    final selectedPreferredCaste =
        preferredCastList.where((element) => element.isSelected).toList();
    selectPreferredCaste(selection: selectedPreferredCaste);

    final selectedAdditionalFurnish =
        additionalFurnishList.where((element) => element.isSelected).toList();
    selectAdditionalFurnish(selection: selectedAdditionalFurnish);
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
      firstConnectedRoadFieldController.text = '';
      secondConnectedRoadFieldController.text = '';
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
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isWashroomAvailable == null ||
        isWashroomAvailable != isAvailable) {
      final isPropertyOfficeOrShowroom = _selectedPropertyType == null ||
          CommonPropertyDataProvider.checkForWashRoomAvailable(
              [_selectedPropertyType.id]);
      isWashroomAvailable = isPropertyOfficeOrShowroom ? isAvailable : null;
    } else {
      isWashroomAvailable = null;
    }
    notifyListeners();
  }

  void enableBalcony(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isBalconyAvailable == null ||
        isBalconyAvailable != isAvailable) {
      final isPropertyOtherThanPlotAndAgricult =
          _selectedPropertyType == null ||
              CommonPropertyDataProvider.isNotPlotOrLandMark(
                  [_selectedPropertyType.id]);
      isBalconyAvailable =
          isPropertyOtherThanPlotAndAgricult ? isAvailable : null;
    } else {
      isBalconyAvailable = null;
    }
    notifyListeners();
  }

  void enableCornerPiece(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isCornerPiece == null ||
        isCornerPiece != isAvailable) {
      final shouldShowCornerPiece = _selectedPropertyType == null ||
          CommonPropertyDataProvider.checkForCornerPiece(
              [_selectedPropertyType.id]);
      isCornerPiece = shouldShowCornerPiece ? isAvailable : null;
    } else {
      isCornerPiece = null;
    }
    notifyListeners();
  }

  void enableLightConnection(
    bool? isAvailable, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isLightConnectionAvailable == null ||
        isLightConnectionAvailable != isAvailable) {
      isLightConnectionAvailable = _selectedPropertyType == null ||
              CommonPropertyDataProvider.checkForLightConnection(
                  [_selectedPropertyType.id])
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
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isWellAvailable == null ||
        isWellAvailable != isAvailable) {
      isWellAvailable = _selectedPropertyType == null ||
              CommonPropertyDataProvider.checkForWellAvailable(
                  [_selectedPropertyType.id])
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
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isAllottedParkingAvailable == null ||
        isAllottedParkingAvailable != isAvailable) {
      isAllottedParkingAvailable = _selectedPropertyType == null ||
              CommonPropertyDataProvider.checkForAllottedParkingAvailable(
                  [_selectedPropertyType.id])
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
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isParkingAvailable == null ||
        isParkingAvailable != isAvailable) {
      isParkingAvailable = _selectedPropertyType == null ||
              CommonPropertyDataProvider.checkForParkingAvailable(
                  [_selectedPropertyType.id])
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
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (isUserTapped == false ||
        isLiftAvailable == null ||
        isLiftAvailable != isAvailable) {
      isLiftAvailable = _selectedPropertyType == null ||
              CommonPropertyDataProvider.checkForLiftAvailable(
                  [_selectedPropertyType.id])
          ? isAvailable
          : null;
    } else {
      isLiftAvailable = null;
    }
    notifyListeners();
  }

  void selectConstructionType({
    List<DbPropertyConstructionType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final isConstruction = _selectedPropertyType == null ||
        CommonPropertyDataProvider.checkForConstruction(
            [_selectedPropertyType.id]);

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

  openContactsToPickPhone() async {
    final contactInfo = await ContactHelper.chooseFromContacts();
    if (contactInfo != null) {
      if (contactInfo.name.trim().isNotEmpty) {
        buyerNameFieldController.text = contactInfo.name.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(buyerNameFieldController);
      }
      if (contactInfo.phoneNo.trim().isNotEmpty) {
        buyerPhoneFieldController.text = contactInfo.phoneNo.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(buyerPhoneFieldController);
      }
      validateBuyerData();
    }
  }

  void selectPropertyAmenity({
    List<DbPropertyAmenity> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final isPropertyOtherThanPlotAndAgriculture =
        _selectedPropertyType == null ||
            CommonPropertyDataProvider.isNotPlotOrLandMark(
                [_selectedPropertyType.id]);
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
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final isPropertyOtherThanPlotAndAgriculture =
        _selectedPropertyType == null ||
            CommonPropertyDataProvider.isNotPlotOrLandMark(
                [_selectedPropertyType.id]);
    if (selection.isNotEmpty && isPropertyOtherThanPlotAndAgriculture) {
      if (isUserTapped) {
        selection.forEach((element) {
          final elementToSelect =
              additionalFurnishList[additionalFurnishList.indexOf(element)];
          elementToSelect.isSelected = !elementToSelect.isSelected;
        });
      } else {
        additionalFurnishList.forEach((element) {
          element.isSelected = selection.contains(element);
        });
      }
    } else {
      additionalFurnishList.forEach((element) {
        element.isSelected = false;
      });
    }
    notifyListeners();
  }

  void selectFacingType({
    List<DbPropertyFacingType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);

    final isBungalowOrPlotOnly = _selectedPropertyType == null ||
        CommonPropertyDataProvider.checkForFacingType(
            [_selectedPropertyType.id]);

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
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);

    final isBungalowOrFlatOnly = _selectedPropertyType == null ||
        CommonPropertyDataProvider.checkForBhk([_selectedPropertyType.id]);

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

  void selectSchemeType({
    List<DbPropertySchemeType> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);

    final shouldShowScheme = _selectedPropertyType == null ||
        CommonPropertyDataProvider.checkForScheme([_selectedPropertyType.id]);

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

  checkIfAnyChanges() {
    return buyerNameFieldController.text.trim().isNotEmpty ||
        buyerPhoneFieldController.text.trim().isNotEmpty ||
        _isAnyChangeInPropertyType ||
        _isAnyChangeInPropertyFor ||
        sellMinPriceRangeController.text.trim().isNotEmpty ||
        sellMaxPriceRangeController.text.trim().isNotEmpty ||
        rentMinPriceRangeController.text.trim().isNotEmpty ||
        rentMaxPriceRangeController.text.trim().isNotEmpty ||
        leaseMinPriceRangeController.text.trim().isNotEmpty ||
        leaseMaxPriceRangeController.text.trim().isNotEmpty ||
        propertyLocationController.text.trim().isNotEmpty ||
        minMeasureRangeController.text.trim().isNotEmpty ||
        maxMeasureRangeController.text.trim().isNotEmpty ||
        firstConnectedRoadFieldController.text.trim().isNotEmpty ||
        secondConnectedRoadFieldController.text.trim().isNotEmpty ||
        buildingTypeList.any((element) => element.isSelected) ||
        constructionTypeList.any((element) => element.isSelected) ||
        schemeTypeList.any((element) => element.isSelected) ||
        furnishedList.any((element) => element.isSelected) ||
        additionalFurnishList.any((element) => element.isSelected) ||
        bhkTypeList.any((element) => element.isSelected) ||
        bathroomsTextFieldController.text.trim().isNotEmpty ||
        roomsTextFieldController.text.trim().isNotEmpty ||
        floorsTextFieldController.text.trim().isNotEmpty ||
        totalFloorsTextFieldController.text.trim().isNotEmpty ||
        frontSizeTextFieldController.text.trim().isNotEmpty ||
        depthSizeTextFieldController.text.trim().isNotEmpty ||
        isWashroomAvailable != null ||
        isBalconyAvailable != null ||
        isCornerPiece != null ||
        isLightConnectionAvailable != null ||
        isWellAvailable != null ||
        isAllottedParkingAvailable != null ||
        isParkingAvailable != null ||
        isLiftAvailable != null ||
        facingTypeList.any((element) => element.isSelected) ||
        preferredCastList.any((element) => element.isSelected) ||
        propertyAmenityList.any((element) => element.isSelected);
  }

  Future<String> _getInquiryDirectory() async {
    int inquiryId;
    if (_buyerArgs != null &&
        _buyerArgs!.inquiryEnum == InquiryEnums.edit &&
        buyerInquiryToEdit != null) {
      inquiryId = buyerInquiryToEdit!.id;
    } else {
      inquiryId = await PropertyInquiryStatusHelper.nextInquiryId(
        isarService: _isarService,
      );
    }
    return await FileUtils.getInquiryPhotosDirectoryPath(inquiryId);
  }

  Future<String> _createInquiryDirectory() async {
    final dirPath = await _getInquiryDirectory();
    final isDirExist = await Directory(dirPath).exists();
    if (!isDirExist) {
      await Directory(dirPath).create();
    }
    return dirPath;
  }

  saveBuyerDetails(BuildContext context) async {
    if (_validBuyerDetail) {
      CommonPropertyDataProvider commonPropertyDataProvider =
          Provider.of<CommonPropertyDataProvider>(
        context,
        listen: false,
      );
      final inquiryToSave = DbSavedFilter();
      inquiryToSave.userId = StaticFunctions.userId;
      inquiryToSave.isFromBuyer = true;
      inquiryToSave.buyerName =
          buyerNameFieldController.text.toTitleCase().trim();
      inquiryToSave.mobileNo = buyerPhoneFieldController.text;

      final selectedPropertyFor =
          propertyForList.where((element) => element.isSelected);
      if (selectedPropertyFor.isNotEmpty) {
        inquiryToSave.propertyFor =
            selectedPropertyFor.map((e) => e.id).toList();
        inquiryToSave.propertyForValues = selectedPropertyFor
            .map((e) => e.id == SaveDefaultData.propertyForSellId
                ? localizationsContext.buy
                : e.name)
            .toList();
      } else {
        inquiryToSave.propertyFor = null;
        inquiryToSave.propertyForValues = null;
      }

      final selectedPropertyType =
          propertyTypeList.where((element) => element.isSelected);
      if (selectedPropertyType.isNotEmpty) {
        inquiryToSave.propertyType =
            selectedPropertyType.map((e) => e.id).toList();
        inquiryToSave.propertyTypeValues =
            selectedPropertyType.map((e) => e.name).toList();
      } else {
        inquiryToSave.propertyType = null;
        inquiryToSave.propertyTypeValues = null;
      }

      final selectedConstructionType =
          constructionTypeList.where((element) => element.isSelected);
      if (selectedConstructionType.isNotEmpty) {
        inquiryToSave.constructionType =
            selectedConstructionType.map((e) => e.id).toList();
      } else {
        inquiryToSave.constructionType = null;
      }

      final selectedSchemeType =
          schemeTypeList.where((element) => element.isSelected);
      if (selectedSchemeType.isNotEmpty) {
        inquiryToSave.schemeType = selectedSchemeType.map((e) => e.id).toList();
      } else {
        inquiryToSave.schemeType = null;
      }

      if (_selectedMeasureUnit != -1) {
        var selectedUnit = measurementDropdownUnitList
            .firstWhereOrNull((element) => element.id == _selectedMeasureUnit);
        inquiryToSave.measureUnit = selectedUnit!.id;
        inquiryToSave.measureUnitValue = selectedUnit.unit;
        if (minMeasureRangeController.text.trim().isNotEmpty) {
          inquiryToSave.minMeasure =
              double.tryParse(minMeasureRangeController.text.trim());
        } else {
          inquiryToSave.minMeasure = null;
        }
        if (maxMeasureRangeController.text.trim().isNotEmpty) {
          inquiryToSave.maxMeasure =
              double.tryParse(maxMeasureRangeController.text.trim());
        } else {
          inquiryToSave.maxMeasure = null;
        }
      } else {
        inquiryToSave.measureUnit = null;
        inquiryToSave.measureUnitValue = null;
        inquiryToSave.maxMeasure = null;
        inquiryToSave.minMeasure = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForSellId) &&
          sellMinPriceRangeController.text.trim().isNotEmpty &&
          double.tryParse(sellMinPriceRangeController.text
                  .trim()
                  .replaceAll(',', '')) !=
              null) {
        final minPrice = double.tryParse(
            sellMinPriceRangeController.text.trim().replaceAll(',', ''));
        if (minPrice != null) {
          inquiryToSave.sellPriceRangeMin =
              StaticFunctions.convertPriceToFull(minPrice, _sellMinPriceUnit);
          inquiryToSave.sellMinPriceUnit = _sellMinPriceUnit;
        } else {
          inquiryToSave.sellPriceRangeMin = null;
        }
      } else {
        inquiryToSave.sellPriceRangeMin = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForRentId) &&
          rentMinPriceRangeController.text.trim().isNotEmpty &&
          double.tryParse(rentMinPriceRangeController.text
                  .trim()
                  .replaceAll(',', '')) !=
              null) {
        final minPrice = double.tryParse(
            rentMinPriceRangeController.text.trim().replaceAll(',', ''));
        if (minPrice != null) {
          inquiryToSave.rentPriceRangeMin =
              StaticFunctions.convertPriceToFull(minPrice, _rentMinPriceUnit);
          inquiryToSave.rentMinPriceUnit = _rentMinPriceUnit;
        } else {
          inquiryToSave.rentPriceRangeMin = null;
        }
      } else {
        inquiryToSave.rentPriceRangeMin = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForLeaseId) &&
          leaseMinPriceRangeController.text.trim().isNotEmpty &&
          double.tryParse(leaseMinPriceRangeController.text
                  .trim()
                  .replaceAll(',', '')) !=
              null) {
        final minPrice = double.tryParse(
            leaseMinPriceRangeController.text.trim().replaceAll(',', ''));
        if (minPrice != null) {
          inquiryToSave.leasePriceRangeMin =
              StaticFunctions.convertPriceToFull(minPrice, _leaseMinPriceUnit);
          inquiryToSave.leaseMinPriceUnit = _leaseMinPriceUnit;
        } else {
          inquiryToSave.leasePriceRangeMin = null;
        }
      } else {
        inquiryToSave.leasePriceRangeMin = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForSellId) &&
          sellMaxPriceRangeController.text.trim().isNotEmpty &&
          double.tryParse(sellMaxPriceRangeController.text
                  .trim()
                  .replaceAll(',', '')) !=
              null) {
        double? maxPrice = double.tryParse(
            sellMaxPriceRangeController.text.trim().replaceAll(',', ''));
        if (inquiryToSave.sellPriceRangeMin != null &&
            maxPrice != null &&
            StaticFunctions.convertPriceToFull(maxPrice, _sellMaxPriceUnit) <
                inquiryToSave.sellPriceRangeMin!) {
          sellMaxPriceRangeController.text = '';
        }
        if (sellMaxPriceRangeController.text.trim().isNotEmpty &&
            maxPrice != null) {
          inquiryToSave.sellPriceRangeMax =
              StaticFunctions.convertPriceToFull(maxPrice, _sellMaxPriceUnit);
          inquiryToSave.sellMaxPriceUnit = _sellMaxPriceUnit;
        } else {
          inquiryToSave.sellPriceRangeMax = null;
        }
      } else {
        inquiryToSave.sellPriceRangeMax = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForRentId) &&
          rentMaxPriceRangeController.text.trim().isNotEmpty &&
          double.tryParse(rentMaxPriceRangeController.text
                  .trim()
                  .replaceAll(',', '')) !=
              null) {
        double? maxPrice = double.tryParse(
            rentMaxPriceRangeController.text.trim().replaceAll(',', ''));
        if (inquiryToSave.rentPriceRangeMin != null &&
            maxPrice != null &&
            StaticFunctions.convertPriceToFull(maxPrice, _rentMaxPriceUnit) <
                inquiryToSave.rentPriceRangeMin!) {
          rentMaxPriceRangeController.text = '';
        }
        if (rentMaxPriceRangeController.text.trim().isNotEmpty &&
            maxPrice != null) {
          inquiryToSave.rentPriceRangeMax =
              StaticFunctions.convertPriceToFull(maxPrice, _rentMaxPriceUnit);
          inquiryToSave.rentMaxPriceUnit = _rentMaxPriceUnit;
        } else {
          inquiryToSave.rentPriceRangeMax = null;
        }
      } else {
        inquiryToSave.rentPriceRangeMax = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForLeaseId) &&
          leaseMaxPriceRangeController.text.trim().isNotEmpty &&
          double.tryParse(leaseMaxPriceRangeController.text
                  .trim()
                  .replaceAll(',', '')) !=
              null) {
        double? maxPrice = double.tryParse(
            leaseMaxPriceRangeController.text.trim().replaceAll(',', ''));
        if (inquiryToSave.leasePriceRangeMin != null &&
            maxPrice != null &&
            StaticFunctions.convertPriceToFull(maxPrice, _leaseMaxPriceUnit) <
                inquiryToSave.leasePriceRangeMin!) {
          leaseMaxPriceRangeController.text = '';
        }
        if (leaseMaxPriceRangeController.text.trim().isNotEmpty &&
            maxPrice != null) {
          inquiryToSave.leasePriceRangeMax =
              StaticFunctions.convertPriceToFull(maxPrice, _leaseMaxPriceUnit);
          inquiryToSave.leaseMaxPriceUnit = _leaseMaxPriceUnit;
        } else {
          inquiryToSave.leasePriceRangeMax = null;
        }
      } else {
        inquiryToSave.leasePriceRangeMax = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForSellId) &&
          sellMinPricePerSizeController.text.trim().isNotEmpty) {
        inquiryToSave.sellMinPricePerSize = double.tryParse(
            sellMinPricePerSizeController.text.trim().replaceAll(',', ''));
      } else {
        inquiryToSave.sellMinPricePerSize = null;
      }
      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForRentId) &&
          rentMinPricePerSizeController.text.trim().isNotEmpty) {
        inquiryToSave.rentMinPricePerSize = double.tryParse(
            rentMinPricePerSizeController.text.trim().replaceAll(',', ''));
      } else {
        inquiryToSave.rentMinPricePerSize = null;
      }
      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForLeaseId) &&
          leaseMinPricePerSizeController.text.trim().isNotEmpty) {
        inquiryToSave.leaseMinPricePerSize = double.tryParse(
            leaseMinPricePerSizeController.text.trim().replaceAll(',', ''));
      } else {
        inquiryToSave.leaseMinPricePerSize = null;
      }

      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForSellId) &&
          sellMaxPricePerSizeController.text.trim().isNotEmpty) {
        inquiryToSave.sellMaxPricePerSize = double.tryParse(
            sellMaxPricePerSizeController.text.trim().replaceAll(',', ''));
      } else {
        inquiryToSave.sellMaxPricePerSize = null;
      }
      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForRentId) &&
          rentMaxPricePerSizeController.text.trim().isNotEmpty) {
        inquiryToSave.rentMaxPricePerSize = double.tryParse(
            rentMaxPricePerSizeController.text.trim().replaceAll(',', ''));
      } else {
        inquiryToSave.rentMaxPricePerSize = null;
      }
      if (inquiryToSave.propertyFor!
              .contains(SaveDefaultData.propertyForLeaseId) &&
          leaseMaxPricePerSizeController.text.trim().isNotEmpty) {
        inquiryToSave.leaseMaxPricePerSize = double.tryParse(
            leaseMaxPricePerSizeController.text.trim().replaceAll(',', ''));
      } else {
        inquiryToSave.leaseMaxPricePerSize = null;
      }

      if (ownerCommentsController.text.trim().isNotEmpty) {
        inquiryToSave.notes = ownerCommentsController.text;
      } else {
        inquiryToSave.notes = null;
      }

      inquiryToSave.isWashroomAvailable = isWashroomAvailable;
      inquiryToSave.isBalconyAvailable = isBalconyAvailable;
      inquiryToSave.isCornerPiece = isCornerPiece;
      inquiryToSave.isLightConnectionAvailable = isLightConnectionAvailable;
      inquiryToSave.isWellAvailable = isWellAvailable;
      inquiryToSave.isAllottedParkingAvailable = isAllottedParkingAvailable;
      inquiryToSave.isParkingAvailable = isParkingAvailable;
      inquiryToSave.isLiftAvailable = isLiftAvailable;

      inquiryToSave.bathroomCount =
          bathroomsTextFieldController.text.trim().isNotEmpty
              ? int.tryParse(bathroomsTextFieldController.text.trim())
              : null;

      inquiryToSave.depthSize =
          depthSizeTextFieldController.text.trim().isNotEmpty
              ? double.tryParse(depthSizeTextFieldController.text.trim())
              : null;

      inquiryToSave.frontSize =
          frontSizeTextFieldController.text.trim().isNotEmpty
              ? double.tryParse(frontSizeTextFieldController.text.trim())
              : null;

      inquiryToSave.roomCount = roomsTextFieldController.text.trim().isNotEmpty
          ? int.tryParse(roomsTextFieldController.text.trim())
          : null;

      inquiryToSave.floorCount =
          floorsTextFieldController.text.trim().isNotEmpty
              ? int.tryParse(floorsTextFieldController.text.trim())
              : null;

      inquiryToSave.totalFloorCount =
          totalFloorsTextFieldController.text.trim().isNotEmpty
              ? int.tryParse(totalFloorsTextFieldController.text.trim())
              : null;

      final List<double> selectedRoads = [];
      if (firstConnectedRoadFieldController.text.trim().isNotEmpty) {
        final firstRoad =
            double.tryParse(firstConnectedRoadFieldController.text);
        if (firstRoad != null) {
          selectedRoads.add(firstRoad);
        }
      }
      if (secondConnectedRoadFieldController.text.trim().isNotEmpty) {
        final secondRoad =
            double.tryParse(secondConnectedRoadFieldController.text);
        if (secondRoad != null) {
          selectedRoads.add(secondRoad);
        }
      }
      inquiryToSave.connectedRoads =
          selectedRoads.isNotEmpty ? selectedRoads : null;

      final selectedFurnished =
          furnishedList.where((element) => element.isSelected).toList();
      inquiryToSave.furnishedType = selectedFurnished.isNotEmpty
          ? selectedFurnished.map((e) => e.id).toList()
          : null;

      final selectedAdditionalFurnished =
          additionalFurnishList.where((element) => element.isSelected).toList();
      inquiryToSave.additionalFurnish = selectedAdditionalFurnished.isNotEmpty
          ? selectedAdditionalFurnished.map((e) => e.name).toList()
          : null;

      final selectedAmenities =
          propertyAmenityList.where((element) => element.isSelected);
      if (selectedAmenities.isNotEmpty) {
        inquiryToSave.selectedAmenities =
            selectedAmenities.map((e) => e.name).toList();
      } else {
        inquiryToSave.selectedAmenities = null;
      }

      final selectedPreferredCaste =
          preferredCastList.where((element) => element.isSelected);
      if (selectedPreferredCaste.isNotEmpty) {
        inquiryToSave.preferredCaste =
            selectedPreferredCaste.map((e) => e.name).toList();
      } else {
        inquiryToSave.preferredCaste = null;
      }

      final selectedFacingType =
          facingTypeList.where((element) => element.isSelected);
      if (selectedFacingType.isNotEmpty) {
        inquiryToSave.facingType = selectedFacingType.map((e) => e.id).toList();
      } else {
        inquiryToSave.facingType = null;
      }

      final selectedBhkIds = bhkTypeList.where((element) => element.isSelected);
      if (selectedBhkIds.isNotEmpty) {
        inquiryToSave.bhkIds = selectedBhkIds.map((e) => e.id).toList();
      } else {
        inquiryToSave.bhkIds = null;
      }

      final selectedBuildingType =
          buildingTypeList.where((element) => element.isSelected);
      if (selectedBuildingType.isNotEmpty) {
        inquiryToSave.buildingType =
            selectedBuildingType.map((e) => e.id).toList();
      } else {
        if (selectedPropertyType.any(
            (element) => element.id == SaveDefaultData.propertyTypeFlatId)) {
          inquiryToSave.buildingType = [
            SaveDefaultData.propertyResidentialTypeId
          ];
        } else {
          inquiryToSave.buildingType = null;
        }
      }

      inquiryToSave.isNegotiable = isNegotiable;

      final addressLandmark = propertyLocationController.text.trim();
      if (addressLandmark.isNotEmpty) {
        inquiryToSave.location = addressLandmark;
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
                    ..tag =
                        element.toString().trim().toLowerCase().toTitleCase(),
                );
              }
            },
          );
          if (_tags.isNotEmpty) {
            _isarService.saveLocationTags(_tags);
          }
        }
      } else {
        inquiryToSave.location = null;
      }

      if (_locationArg != null) {
        if (_locationArg?.areaName != null) {
          inquiryToSave.area = _locationArg!.areaName!;
        }
        if (_locationArg?.coordinates != null) {
          inquiryToSave.latitude = _locationArg!.coordinates!.latitude;
          inquiryToSave.longitude = _locationArg!.coordinates!.longitude;
        }
      }

      int activeStatusId = SaveDefaultData.activeStatusId;
      String activeStatusValue = '';

      if (_buyerArgs != null &&
          _buyerArgs!.inquiryEnum == InquiryEnums.edit &&
          buyerInquiryToEdit != null) {
        activeStatusId = buyerInquiryToEdit?.inquiryStatusId ?? activeStatusId;
        activeStatusValue =
            buyerInquiryToEdit?.inquiryStatusValue ?? activeStatusValue;
      } else {
        if (activeStatusId != (-1)) {
          final info = await commonPropertyDataProvider
              .getPropertyStatus(activeStatusId);
          if (info != null) {
            activeStatusValue = info.name;
          }
        }
      }

      inquiryToSave.isSyncedWithServer = false;
      inquiryToSave.inquiryStatusId = activeStatusId;
      inquiryToSave.inquiryStatusValue = activeStatusValue;
      inquiryToSave.inquirySoldStatusId = SaveDefaultData.unSoldStatusId;
      inquiryToSave.updatedAt = DateTime.now();

      if (_buyerArgs != null &&
          _buyerArgs!.inquiryEnum == InquiryEnums.edit &&
          buyerInquiryToEdit != null) {
        inquiryToSave.id = buyerInquiryToEdit!.id;
        inquiryToSave.inquiryId = buyerInquiryToEdit!.inquiryId;
        inquiryToSave.addedAt = buyerInquiryToEdit!.addedAt;
        inquiryToSave.isFavorite = buyerInquiryToEdit!.isFavorite;
        inquiryToSave.isPublicInquiry = buyerInquiryToEdit!.isPublicInquiry;
      } else {
        inquiryToSave.id = await PropertyInquiryStatusHelper.nextInquiryId(
          isarService: _isarService,
        );
        inquiryToSave.addedAt = inquiryToSave.updatedAt;
        inquiryToSave.inquiryId =
            await PropertyInquiryStatusHelper.generateInquiryId(
          isarService: _isarService,
        );
      }

      if (_shouldResetFromUnMatch(inquiryToSave)) {
        inquiryToSave.unmatchProperties = [];
        await _resetInquiryFromUnMatch(buyerInquiryToEdit!.inquiryId!);
      } else if (_buyerArgs != null &&
          _buyerArgs!.inquiryEnum == InquiryEnums.edit) {
        inquiryToSave.unmatchProperties =
            buyerInquiryToEdit?.unmatchProperties ?? [];
      }

      final inquiryDirectoryPath = await _getInquiryDirectory();
      final directory = Directory(inquiryDirectoryPath);
      if (directory.listSync().length > 0) {
        await directory.delete(recursive: true);
        _createInquiryDirectory();
      }

      // filter search by
      // -> need to show matching properties so added filter search by - properties
      inquiryToSave.filterSearchBy = [
        SaveDefaultData.filterSearchByPropertiesId
      ];

      await _isarService.saveFilter(inquiryToSave).then(
        (value) async {
          SyncHelper.syncInquiryInfoWithServer(
            localizationsContext,
            commonPropertyDataProvider,
          );
          Navigator.pushReplacementNamed(
            context,
            Routes.addBuyerSuccess,
            arguments: {
              'isEdit': _buyerArgs?.inquiryEnum == InquiryEnums.edit,
              'inquiry': inquiryToSave,
            },
          );
        },
      );
    }
  }

  _shouldResetFromUnMatch(DbSavedFilter data) {
    return _buyerArgs != null &&
        _buyerArgs!.inquiryEnum == InquiryEnums.edit &&
        buyerInquiryToEdit != null &&
        ((buyerInquiryToEdit!.sellPriceRangeMin != data.sellPriceRangeMin ||
                buyerInquiryToEdit!.sellPriceRangeMax !=
                    data.sellPriceRangeMax) ||
            (buyerInquiryToEdit!.rentPriceRangeMin != data.rentPriceRangeMin ||
                buyerInquiryToEdit!.rentPriceRangeMax !=
                    data.rentPriceRangeMax) ||
            (buyerInquiryToEdit!.leasePriceRangeMin !=
                    data.leasePriceRangeMin ||
                buyerInquiryToEdit!.leasePriceRangeMax !=
                    data.leasePriceRangeMax) ||
            !ListEquality()
                .equals(buyerInquiryToEdit!.propertyFor, data.propertyFor) ||
            !ListEquality()
                .equals(buyerInquiryToEdit!.propertyType, data.propertyType) ||
            buyerInquiryToEdit!.minMeasure != data.minMeasure ||
            buyerInquiryToEdit!.maxMeasure != data.maxMeasure ||
            buyerInquiryToEdit!.area != data.area ||
            buyerInquiryToEdit!.location != data.location ||
            buyerInquiryToEdit!.latitude != data.latitude ||
            buyerInquiryToEdit!.longitude != data.longitude);
  }

  _resetInquiryFromUnMatch(String inquiryId) async {
    final propertiesWithThisUnmatchInquiry = await _isarService
        .getUnmatchedProperties(unmatchedInquiryId: inquiryId);
    await Future.forEach(
      propertiesWithThisUnmatchInquiry,
      (element) async {
        final unmatchedInquiryList =
            List<String>.from(element.unmatchInquiries.toList());
        unmatchedInquiryList.remove(inquiryId);
        element.unmatchInquiries = unmatchedInquiryList;
        await _isarService.saveProperty(element);
      },
    );
  }

  Iterable<BuyerSellerInfo> getFilteredBuyers(String query) {
    Iterable<BuyerSellerInfo> filteredData = [];
    if (_savedBuyersList.isNotEmpty &&
        buyerNameFieldController.text.trim().isNotEmpty) {
      filteredData = _savedBuyersList.where((element) =>
          (element.name != null &&
              element.name!.toLowerCase().contains(query.toLowerCase())) ||
          (element.phone != null && element.phone!.startsWith(query.trim())));
    }
    return filteredData;
  }

  selectBuyerSuggestion(BuildContext context, BuyerSellerInfo selected) {
    buyerNameFieldController.text = selected.name ?? '';
    buyerPhoneFieldController.text = selected.phone ?? '';
    FocusScope.of(context).requestFocus(FocusNode());
    validateBuyerData();
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
}
