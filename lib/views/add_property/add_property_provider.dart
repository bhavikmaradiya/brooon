import 'dart:collection';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:path_provider/path_provider.dart';

import './model/add_property_args.dart';
import './model/options.dart';
import './model/price_enum.dart';
import '../../common_property_data_provider.dart';
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
import '../../localdb/properties/db_property_photos_meta.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../localdb/properties/db_property_price_unit.dart';
import '../../localdb/properties/db_property_scheme_type.dart';
import '../../localdb/properties/db_property_type.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/contacts_helper.dart';
import '../../utils/file_utils.dart';
import '../../utils/static_functions.dart';
import '../../utils/sync_helper.dart';
import '../../widgets/snack_bar_view.dart';
import '../buyers_sellers/model/buyer_seller_info.dart';
import '../choose_location/model/retrieve_location_arg.dart';
import '../property_details/model/property_visibility_option.dart';
import '../property_inquiry_status_helper/property_inquiry_status_helper.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class AddPropertyProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  final _isarService = IsarService();
  final _propertyBasicDetails = LinkedHashMap<String, dynamic>();
  final _propertySellerDetails = LinkedHashMap<String, dynamic>();
  final _propertyPriceDetails = LinkedHashMap<String, dynamic>();
  final _propertyGalleryDetails = LinkedHashMap<String, dynamic>();
  final List<String> _currentPropertyBasicDetailKeys = [];
  final int selectDeselectAllItemId = -1;
  final propertyNameController = TextEditingController();
  final firstConnectedRoadController = TextEditingController();
  final secondConnectedRoadController = TextEditingController();
  final propertyTypeController = TextEditingController();
  final propertyForController = TextEditingController();
  final propertyFurnishedStatusController = TextEditingController();
  final propertyBuildingTypeController = TextEditingController();
  final propertyFacingTypeController = TextEditingController();
  final propertyCornerPieceController = TextEditingController();
  final propertyLightConnectionController = TextEditingController();
  final propertyWellAvailableController = TextEditingController();
  final propertyParkingAvailableController = TextEditingController();
  final propertyAllottedParkingController = TextEditingController();
  final propertyLiftAvailableController = TextEditingController();
  final propertyWashRoomController = TextEditingController();
  final propertyBhkTypeController = TextEditingController();
  final propertyConnectedRoadController = TextEditingController();
  final propertyConstructionTypeController = TextEditingController();
  final propertySchemeTypeController = TextEditingController();
  final propertyPrivateLocationController = TextEditingController();
  final propertyPublicLocationController = TextEditingController();
  final propertyRoomsController = TextEditingController();
  final propertyBathRoomsController = TextEditingController();
  final propertyFloorsController = TextEditingController();
  final propertyTotalFloorsController = TextEditingController();
  final propertyFrontSizeController = TextEditingController();
  final propertyDepthSizeController = TextEditingController();
  final propertyTagsController = TextEditingController();
  final ownerNameController = TextEditingController();
  final sellerPhoneController = TextEditingController();
  final ownerEmailController = TextEditingController();
  final chainOfBrokersController = TextEditingController();
  final ownerCommentsController = TextEditingController();
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  final totalSizeController = TextEditingController();
  final totalSizeUnitController = TextEditingController();
  final sellPricePerSizeController = TextEditingController();
  final rentPricePerSizeController = TextEditingController();
  final leasePricePerSizeController = TextEditingController();
  final pricePerUnitSizeController = TextEditingController();
  final int _optionsYesId = 1;
  final int _optionsNoId = 2;
  AddPropertyArgs? _propertyArgs;
  DbProperty? _editProperty;
  List<DbPropertyType> propertyTypeList = [];
  List<DbPropertyFor> propertyForList = [];
  List<DbPropertyBuildingType> buildingTypeList = [];
  List<DbPropertyBuildingType> _allBuildingTypes = [];
  List<DbPropertyBhkType> bhkTypeList = [];
  List<DbPropertyConstructionType> constructionTypeList = [];
  List<DbPropertyFacingType> facingTypeList = [];
  List<Options> lightConnectionList = [];
  List<Options> wellAvailableList = [];
  List<Options> parkingAvailableList = [];
  List<Options> allottedParkingList = [];
  List<Options> liftAvailableList = [];
  List<Options> washRoomAvailableList = [];
  List<Options> balconyAvailableList = [];
  List<Options> cornerPieceList = [];
  List<DbPropertySchemeType> schemeTypeList = [];
  List<DbPropertyFurnishedStatus> furnishedStatusList = [];
  List<DbPropertyAreaUnit> areaUnitList = [];
  List<DbAdditionalFurnish> additionalFurnishList = [];

  List<DbPropertyAmenity> amenitiesList = [];
  List<DbPropertyPreferredCast> preferredCastList = [];
  List<DbPropertyAmenity> filterAmenitiesList = [];
  List<DbPropertyAmenity> _tempSelectedAmenitiesList = [];
  List<DbPropertyAmenity> _selectedAmenitiesList = [];

  List<DbPropertyPreferredCast> filterPreferredCastList = [];
  List<DbPropertyPreferredCast> _tempSelectedPreferredCastList = [];
  List<DbPropertyPreferredCast> _selectedPreferredCastList = [];

  List<DbPropertyPriceUnit> sellPriceRangeDropdownUnitList = [];
  List<DbPropertyPriceUnit> rentPriceRangeDropdownUnitList = [];
  List<DbPropertyPriceUnit> leasePriceRangeDropdownUnitList = [];

  final minSellPriceRangeController = TextEditingController();
  final maxSellPriceRangeController = TextEditingController();
  final minSellPriceUnitTextFieldController = TextEditingController();
  final maxSellPriceUnitTextFieldController = TextEditingController();
  int _minSellPriceUnit = -1;
  int _maxSellPriceUnit = -1;
  Size minSellPriceDropdownSize = Size(0, 0);
  Size maxSellPriceDropdownSize = Size(0, 0);
  String sellPriceRangeText = '';

  bool? isWashroomAvailable;
  bool? isBalconyAvailable;
  bool? isCornerPiece;
  bool? isLightConnectionAvailable;
  bool? isWellAvailable;
  bool? isAllottedParkingAvailable;
  bool? isParkingAvailable;
  bool? isLiftAvailable;
  bool _isAnyChangeInPropertyFor = false;
  bool _isAnyChangeInPropertyType = false;
  bool _isAnyChangeInVisibility = false;

  final minRentPriceRangeController = TextEditingController();
  final maxRentPriceRangeController = TextEditingController();
  final minRentPriceUnitTextFieldController = TextEditingController();
  final maxRentPriceUnitTextFieldController = TextEditingController();
  int _minRentPriceUnit = -1;
  int _maxRentPriceUnit = -1;
  Size minRentPriceDropdownSize = Size(0, 0);
  Size maxRentPriceDropdownSize = Size(0, 0);
  String rentPriceRangeText = '';

  final minLeasePriceRangeController = TextEditingController();
  final maxLeasePriceRangeController = TextEditingController();
  final minLeasePriceUnitTextFieldController = TextEditingController();
  final maxLeasePriceUnitTextFieldController = TextEditingController();
  int _minLeasePriceUnit = -1;
  int _maxLeasePriceUnit = -1;
  Size minLeasePriceDropdownSize = Size(0, 0);
  Size maxLeasePriceDropdownSize = Size(0, 0);
  String leasePriceRangeText = '';
  List<BuyerSellerInfo> _savedSellersList = [];

  List<DbLocationTags> _savedLocationTags = [];

  Size measureDropdownSize = Size(0, 0);
  final measureUnitTextFieldController = TextEditingController();
  int _selectedMeasureUnit = -1;

  FocusNode sellPricePerSizeFocusNode = FocusNode();
  FocusNode rentPricePerSizeFocusNode = FocusNode();
  FocusNode leasePricePerSizeFocusNode = FocusNode();

  int get selectedMeasureUnit => _selectedMeasureUnit;

  int get selectedMinSellPriceUnit => _minSellPriceUnit;

  int get selectedMaxSellPriceUnit => _maxSellPriceUnit;

  int get selectedMinRentPriceUnit => _minRentPriceUnit;

  int get selectedMaxRentPriceUnit => _maxRentPriceUnit;

  int get selectedMinLeasePriceUnit => _minLeasePriceUnit;

  int get selectedMaxLeasePriceUnit => _maxLeasePriceUnit;

  int get optionsYesId => _optionsYesId;

  int get optionsNoId => _optionsNoId;

  final List<String> _tagList = [];

  List<String> get tagList => _tagList;

  List<DbPropertyAmenity> get tempSelectedAmenitiesList =>
      _tempSelectedAmenitiesList;

  List<DbPropertyAmenity> get selectedAmenitiesList => _selectedAmenitiesList;

  List<DbPropertyPreferredCast> get tempSelectedPreferredCastList =>
      _tempSelectedPreferredCastList;

  List<DbPropertyPreferredCast> get selectedPreferredCastList =>
      _selectedPreferredCastList;

  List<int> chainOfBrokersList = [];

  final List<File> _selectedImages = [];

  List<File> get imagePaths => _selectedImages;
  RetrieveLocationArg? _privateLocationArg;
  RetrieveLocationArg? _publicLocationArg;
  int _selectedPropertyTypeId = -1;
  bool _isAddedInfoCorrect = false;
  bool _step1MandatoryFieldsFilled = false;
  bool _step2MandatoryFieldsFilled = false;
  bool _minMaxPriceValid = true;
  double _step1Percentage = 0.0;
  double _step2Percentage = 0.0;
  double _step3Percentage = 0.0;
  double _step4Percentage = 0.0;
  int _currentStep = 1;
  bool _isAnyAmenitiesSelected = false;
  bool _isAnyPreferredCastSelected = false;
  bool _exchangeAllowed = false;
  bool isNegotiable = false;
  bool _isEditedPropertyImageChanges = false;
  List<PropertyVisibility> propertyVisibilityList = [];

  RetrieveLocationArg? get privateLocationArguments => _privateLocationArg;

  RetrieveLocationArg? get publicLocationArguments => _publicLocationArg;

  double get step1Percentage => _step1Percentage;

  double get step2Percentage => _step2Percentage;

  double get step3Percentage => _step3Percentage;

  double get step4Percentage => _step4Percentage;

  int get currentStep => _currentStep;

  bool get isAddedInfoCorrect => _isAddedInfoCorrect;

  bool get isStep1MandatoryFieldsFilled => _step1MandatoryFieldsFilled;

  bool get isStep2MandatoryFieldsFilled => _step2MandatoryFieldsFilled;

  bool get isMinMaxPriceValid => _minMaxPriceValid;

  bool get isAnyAmenitiesSelected => _isAnyAmenitiesSelected;

  bool get isAnyPreferredCastSelected => _isAnyPreferredCastSelected;

  int get selectedPropertyTypeId => _selectedPropertyTypeId;

  bool get exchangedAllowed => _exchangeAllowed;

  init(
    BuildContext context,
    AddPropertyArgs? propertyArgs,
  ) async {
    localizationsContext = AppLocalizations.of(context)!;
    _isEditedPropertyImageChanges = false;
    _getSellerList();
    _getLocationList();
    final optionsList = [
      Options()
        ..id = _optionsYesId
        ..name = localizationsContext.yes,
      Options()
        ..id = _optionsNoId
        ..name = localizationsContext.no,
    ];
    _createVisibilityItems();

    bool isNeedToRefresh = false;
    if (propertyTypeList.isEmpty) {
      propertyTypeList = await _isarService.getPropertyTypes();
      isNeedToRefresh = true;
    }

    if (propertyForList.isEmpty) {
      propertyForList = await _isarService.getPropertyFor();
      isNeedToRefresh = true;
    }

    if (_allBuildingTypes.isEmpty || buildingTypeList.isEmpty) {
      _allBuildingTypes = await _isarService.getBuildingTypes();
      buildingTypeList.addAll(_allBuildingTypes);
      isNeedToRefresh = true;
    }

    if (bhkTypeList.isEmpty) {
      bhkTypeList = await _isarService.getBhkTypes();
      isNeedToRefresh = true;
    }

    if (constructionTypeList.isEmpty) {
      constructionTypeList = await _isarService.getConstructionTypes();
      isNeedToRefresh = true;
    }

    if (facingTypeList.isEmpty) {
      facingTypeList = await _isarService.getFacingTypes();
      isNeedToRefresh = true;
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

    if (washRoomAvailableList.isEmpty) {
      washRoomAvailableList.addAll(optionsList);
    }

    if (balconyAvailableList.isEmpty) {
      balconyAvailableList.addAll(optionsList);
    }

    if (schemeTypeList.isEmpty) {
      schemeTypeList = await _isarService.getSchemeTypes();
      isNeedToRefresh = true;
    }

    if (furnishedStatusList.isEmpty) {
      furnishedStatusList = await _isarService.getFurnishedStatus();
      isNeedToRefresh = true;
    }

    if (additionalFurnishList.isEmpty) {
      additionalFurnishList = await _isarService.getAdditionalFurnish();
      isNeedToRefresh = true;
    }

    if (areaUnitList.isEmpty) {
      areaUnitList = await _isarService.getPropertyAreaUnits();
      isNeedToRefresh = true;
    }

    if (amenitiesList.isEmpty) {
      amenitiesList = await _isarService.getAmenities();
      filterAmenitiesList.clear();
      filterAmenitiesList.addAll(amenitiesList);
      isNeedToRefresh = true;
    }
    if (preferredCastList.isEmpty) {
      await _getPreferredCastList();
      isNeedToRefresh = true;
    }
    if (chainOfBrokersList.isEmpty) {
      for (int count = 0; count <= AppConfig.maxChainOfBrokers; count++) {
        chainOfBrokersList.add(count);
      }
      isNeedToRefresh = true;
    }
    if (isNeedToRefresh) {
      notifyListeners();
    }
    resetCurrentPropertyBasicDetailKeys();
    _refreshPreferredCasts();
    initPriceRange();
    if (propertyArgs != null) {
      if (propertyArgs.addPropertyEnums == AddPropertyEnums.edit ||
          propertyArgs.addPropertyEnums == AddPropertyEnums.copy) {
        _propertyArgs = propertyArgs;
        await setDefaultValueToEditProperty();
      } else if (propertyArgs.addPropertyEnums == AddPropertyEnums.add &&
          propertyArgs.propertyTypeId != null) {
        // select default property type
        selectPropertyType(propertyArgs.propertyTypeId!);
        _isAnyChangeInPropertyType = false;
      }
    }
    _selectDefaultPriceUnitValues();
    if (totalSizeController.text.trim().isEmpty) {
      selectMeasureUnit(getDefaultPriceUnitId());
    }
    if (propertyForList.every((element) => !element.isSelected)) {
      selectPropertyFor(SaveDefaultData.propertyForSellId);
    }
    _isAnyChangeInPropertyFor = false;
  }

  updateNegotiationOption(bool value) {
    isNegotiable = value;
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.allowNegotiation,
      value,
    );
  }

  _selectDefaultPriceUnitValues() {
    //select default price unit values if its prices are empty
    if (minSellPriceRangeController.text.trim().isEmpty &&
        maxSellPriceRangeController.text.trim().isEmpty) {
      selectSellPriceUnit(
        id: SaveDefaultData.filterPriceUnitLac,
        isMin: true,
      );
      selectSellPriceUnit(
        id: SaveDefaultData.filterPriceUnitLac,
        isMin: false,
      );
    }
    if (minRentPriceRangeController.text.trim().isEmpty &&
        maxRentPriceRangeController.text.trim().isEmpty) {
      selectRentPriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: true,
      );
      selectRentPriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: false,
      );
    }
    if (minLeasePriceRangeController.text.trim().isEmpty &&
        maxLeasePriceRangeController.text.trim().isEmpty) {
      selectLeasePriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: true,
      );
      selectLeasePriceUnit(
        id: SaveDefaultData.filterPriceUnitThousand,
        isMin: false,
      );
    }
  }

  _createVisibilityItems() {
    propertyVisibilityList = [
      PropertyVisibility()
        ..id = SaveDefaultData.propertyVisibilityPrivateId
        ..icon = Strings.iconPropertyVisibilityPrivate
        ..title = localizationsContext.propertyVisibilityPrivateTitle
        ..subtitle = localizationsContext.propertyVisibilityPrivateSubtitle
        ..isSelected = true,
      PropertyVisibility()
        ..id = SaveDefaultData.propertyVisibilityPublicId
        ..icon = Strings.iconPropertyVisibilityPublic
        ..title = localizationsContext.propertyVisibilityPublicTitle
        ..subtitle = localizationsContext.propertyVisibilityPublicSubtitle,
    ];
  }

  selectBuildingType(int id) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final _buildingTypeToSelect =
        buildingTypeList.firstWhereOrNull((element) => element.id == id);
    final _selectedBuildingType =
        buildingTypeList.firstWhereOrNull((element) => element.isSelected);
    if (_selectedBuildingType == null || _selectedBuildingType.id != id) {
      buildingTypeList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_buildingTypeToSelect != null &&
          CommonPropertyDataProvider.checkForBuildingType(
              [_selectedPropertyType?.id])) {
        _buildingTypeToSelect.isSelected = true;
      }
    } else {
      _selectedBuildingType.isSelected = !_selectedBuildingType.isSelected;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.buildingType,
      null,
    );
  }

  selectPropertyVisibility(int id) async {
    final selectedVisibility = propertyVisibilityList
        .firstWhereOrNull((element) => element.isSelected);
    final visibilityToSelect =
        propertyVisibilityList.firstWhereOrNull((element) => element.id == id);
    if (visibilityToSelect != null &&
        (selectedVisibility == null || id != selectedVisibility.id)) {
      propertyVisibilityList.forEach((element) => element.isSelected = false);
      visibilityToSelect.isSelected = true;
    }
    _isAnyChangeInVisibility =
        propertyVisibilityList.any((element) => element.isSelected);
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.propertyMarkAsVisibility,
      null,
    );
  }

  resetCurrentPropertyBasicDetailKeys() {
    _currentPropertyBasicDetailKeys.clear();
    _currentPropertyBasicDetailKeys.addAll(
      [
        localizationsContext.propertyName,
        localizationsContext.propertyType,
        localizationsContext.propertyFor,
        localizationsContext.location,
        localizationsContext.publicLocation,
        localizationsContext.addressLandmark,
        localizationsContext.publicAddressLandmark,
        localizationsContext.preferredCast,
        localizationsContext.tags,
      ],
    );
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
      isWashroomAvailable =
          CommonPropertyDataProvider.checkForWashRoomAvailable(
                  [_selectedPropertyType?.id])
              ? isAvailable
              : null;
    } else {
      isWashroomAvailable = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.washRoomAvailable,
      null,
    );
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
      isBalconyAvailable = CommonPropertyDataProvider.isNotPlotOrLandMark(
              [_selectedPropertyType?.id])
          ? isAvailable
          : null;
    } else {
      isBalconyAvailable = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.balcony,
      null,
    );
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
      isCornerPiece = CommonPropertyDataProvider.checkForCornerPiece(
              [_selectedPropertyType?.id])
          ? isAvailable
          : null;
    } else {
      isCornerPiece = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.cornerPiece,
      null,
    );
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
      isLightConnectionAvailable =
          CommonPropertyDataProvider.checkForLightConnection(
                  [_selectedPropertyType?.id])
              ? isAvailable
              : null;
    } else {
      isLightConnectionAvailable = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.lightConnection,
      null,
    );
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
      isWellAvailable = CommonPropertyDataProvider.checkForWellAvailable(
              [_selectedPropertyType?.id])
          ? isAvailable
          : null;
    } else {
      isWellAvailable = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.wellAvailable,
      null,
    );
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
      isAllottedParkingAvailable =
          CommonPropertyDataProvider.checkForAllottedParkingAvailable(
                  [_selectedPropertyType?.id])
              ? isAvailable
              : null;
    } else {
      isAllottedParkingAvailable = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.allottedParking,
      null,
    );
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
      isParkingAvailable = CommonPropertyDataProvider.checkForParkingAvailable(
              [_selectedPropertyType?.id])
          ? isAvailable
          : null;
    } else {
      isParkingAvailable = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.parkingAvailable,
      null,
    );
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
      isLiftAvailable = CommonPropertyDataProvider.checkForLiftAvailable(
              [_selectedPropertyType?.id])
          ? isAvailable
          : null;
    } else {
      isLiftAvailable = null;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.liftAvailable,
      null,
    );
  }

  _getPreferredCastList() async {
    preferredCastList = await _isarService.getPreferredCasts();
    filterPreferredCastList.clear();
    filterPreferredCastList.addAll(preferredCastList);
  }

  bool goToNextStep() {
    if (currentStep != 4) {
      _currentStep += 1;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool goToPrevStep() {
    if (currentStep != 1) {
      _currentStep -= 1;
      notifyListeners();
      return true;
    }
    return false;
  }

  checkForPropertyInfoValid() {
    _isAddedInfoCorrect = propertyTypeList.any(
          (element) => element.isSelected,
        ) &&
        propertyForList.any(
          (element) => element.isSelected,
        ) &&
        ownerNameController.text.trim().isNotEmpty;

    // If basic property requirement is valid then only check for price
    if (_isAddedInfoCorrect) {
      if (propertyForList.isNotEmpty) {
        final selectedItems = propertyForList
            .where(
              (element) => element.isSelected,
            )
            .toList();
        if (selectedItems.isNotEmpty) {
          final sellMinPrice = minSellPriceRangeController.text
                  .toString()
                  .trim()
                  .isNotEmpty
              ? double.tryParse(
                  minSellPriceRangeController.text.trim().replaceAll(',', ''))
              : null;
          final rentMinPrice = minRentPriceRangeController.text
                  .toString()
                  .trim()
                  .isNotEmpty
              ? double.tryParse(
                  minRentPriceRangeController.text.trim().replaceAll(',', ''))
              : null;
          final leaseMinPrice = minLeasePriceRangeController.text
                  .toString()
                  .trim()
                  .isNotEmpty
              ? double.tryParse(
                  minLeasePriceRangeController.text.trim().replaceAll(',', ''))
              : null;

          for (int i = 0; i < selectedItems.length; i++) {
            final element = selectedItems[i];
            if (element.id == SaveDefaultData.propertyForSellId) {
              _isAddedInfoCorrect = !(sellPriceRangeText.toLowerCase() ==
                      localizationsContext.minMaxError.toLowerCase()) &&
                  (minSellPriceRangeController.text.toString().trim().isEmpty ||
                      (sellMinPrice != null && sellMinPrice > 0));
            } else if (element.id == SaveDefaultData.propertyForRentId) {
              _isAddedInfoCorrect = !(rentPriceRangeText.toLowerCase() ==
                      localizationsContext.minMaxError.toLowerCase()) &&
                  (minRentPriceRangeController.text.toString().trim().isEmpty ||
                      (rentMinPrice != null && rentMinPrice > 0));
            } else if (element.id == SaveDefaultData.propertyForLeaseId) {
              _isAddedInfoCorrect = !(leasePriceRangeText.toLowerCase() ==
                      localizationsContext.minMaxError.toLowerCase()) &&
                  (minLeasePriceRangeController.text
                          .toString()
                          .trim()
                          .isEmpty ||
                      (leaseMinPrice != null && leaseMinPrice > 0));
            }
            // if any of price ranges are incorrect then don't check further!
            if (!_isAddedInfoCorrect) {
              break;
            }
          }
        }
      }
    }
    notifyListeners();
  }

  updatePropertyDetails(
    String key,
    dynamic value, {
    String dropDownValue = '',
    bool isFieldDefaultValue = false,
  }) {
    if (key == localizationsContext.propertyName) {
      _propertyBasicDetails[key] = value;
    } else if (key == localizationsContext.propertyType) {
      resetCurrentPropertyBasicDetailKeys();
      final selected = propertyTypeList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selected != null) {
        _selectedPropertyTypeId = selected.id;
        _propertyBasicDetails[key] = selected.id;
        if (totalSizeController.text.trim().isEmpty) {
          selectMeasureUnit(getDefaultPriceUnitId());
        }
        notifyListeners();
      }
      checkForPropertyInfoValid();
    } else if (key == localizationsContext.propertyFor) {
      final selected = propertyForList
          .where(
            (element) => element.isSelected,
          )
          .toList();
      _propertyBasicDetails[key] = selected;
      checkForPropertyInfoValid();
    } else if (key == localizationsContext.buildingType) {
      final selectedItem = buildingTypeList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selectedItem != null) {
        _propertyBasicDetails[key] = selectedItem.id;
      } else {
        _propertyBasicDetails[key] = -1;
      }
    } else if (key == localizationsContext.facingType) {
      final selectedItem = facingTypeList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selectedItem != null) {
        _propertyBasicDetails[key] = selectedItem.id;
      } else {
        _propertyBasicDetails[key] = -1;
      }
    } else if (key == localizationsContext.cornerPiece) {
      _propertyBasicDetails[key] = isCornerPiece;
    } else if (key == localizationsContext.balcony) {
      _propertyBasicDetails[key] = isBalconyAvailable;
    } else if (key == localizationsContext.washRoomAvailable) {
      _propertyBasicDetails[key] = isWashroomAvailable;
    } else if (key == localizationsContext.lightConnection) {
      _propertyBasicDetails[key] = isLightConnectionAvailable;
    } else if (key == localizationsContext.parkingAvailable) {
      _propertyBasicDetails[key] = isParkingAvailable;
    } else if (key == localizationsContext.allottedParking) {
      _propertyBasicDetails[key] = isAllottedParkingAvailable;
    } else if (key == localizationsContext.wellAvailable) {
      _propertyBasicDetails[key] = isWellAvailable;
    } else if (key == localizationsContext.liftAvailable) {
      _propertyBasicDetails[key] = isLiftAvailable;
    } else if (key == localizationsContext.connectedRoad) {
      List<double> selected = [];
      if (firstConnectedRoadController.text.trim().isNotEmpty) {
        final firstRoad =
            double.tryParse(firstConnectedRoadController.text.trim());
        if (firstRoad != null) {
          selected.add(firstRoad);
        }
      }
      if (secondConnectedRoadController.text.trim().isNotEmpty) {
        final secondRoad =
            double.tryParse(secondConnectedRoadController.text.trim());
        if (secondRoad != null) {
          selected.add(secondRoad);
        }
      }
      _propertyBasicDetails[key] = selected;
    } else if (key == localizationsContext.scheme) {
      final selectedItem = schemeTypeList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selectedItem != null) {
        _propertyBasicDetails[key] = selectedItem.id;
      } else {
        _propertyBasicDetails[key] = -1;
      }
    } else if (key == localizationsContext.construction) {
      final selectedItem = constructionTypeList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selectedItem != null) {
        _propertyBasicDetails[key] = selectedItem.id;
      } else {
        _propertyBasicDetails[key] = -1;
      }
    } else if (key == localizationsContext.bhk) {
      final selectedItem = bhkTypeList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selectedItem != null) {
        _propertyBasicDetails[key] = selectedItem.id;
      } else {
        _propertyBasicDetails[key] = -1;
      }
    } else if (key == localizationsContext.frontSize) {
      _propertyBasicDetails[key] = value;
      if (isFieldDefaultValue) {
        propertyFrontSizeController.text = value.toString();
        StaticFunctions.fieldCursorPositionAtLast(propertyFrontSizeController);
      }
    } else if (key == localizationsContext.depthSize) {
      _propertyBasicDetails[key] = value;
      if (isFieldDefaultValue) {
        propertyDepthSizeController.text = value.toString();
        StaticFunctions.fieldCursorPositionAtLast(propertyDepthSizeController);
      }
    } else if (key == localizationsContext.furnishedStatus) {
      final selectedItem = furnishedStatusList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selectedItem != null) {
        _propertyBasicDetails[key] = selectedItem.id;
      } else {
        _propertyBasicDetails[key] = -1;
      }
      notifyListeners();
    } else if (key == localizationsContext.additionalFurnishing) {
      final selected = additionalFurnishList
          .where(
            (element) => element.isSelected,
          )
          .toList();
      _propertyBasicDetails[key] = selected;
    } else if (key == localizationsContext.addressLandmark) {
      _propertyBasicDetails[key] = value;
      if (isFieldDefaultValue) {
        propertyPrivateLocationController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(
          propertyPrivateLocationController,
        );
      }
    } else if (key == localizationsContext.publicAddressLandmark) {
      _propertyBasicDetails[key] = value;
      if (isFieldDefaultValue) {
        propertyPublicLocationController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(
          propertyPublicLocationController,
        );
      }
    } else if (key == localizationsContext.location) {
      _propertyBasicDetails[key] = value;
    } else if (key == localizationsContext.publicLocation) {
      _propertyBasicDetails[key] = value;
    } else if (key == localizationsContext.rooms) {
      _propertyBasicDetails[key] =
          value.toString().trim().isNotEmpty ? int.parse(value) : null;
      if (isFieldDefaultValue) {
        propertyRoomsController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(propertyRoomsController);
      }
    } else if (key == localizationsContext.bathRooms) {
      _propertyBasicDetails[key] =
          value.toString().trim().isNotEmpty ? int.parse(value) : null;
      if (isFieldDefaultValue) {
        propertyBathRoomsController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(propertyBathRoomsController);
      }
    } else if (key == localizationsContext.floors) {
      _propertyBasicDetails[key] =
          value.toString().trim().isNotEmpty ? int.parse(value) : null;
      if (isFieldDefaultValue) {
        propertyFloorsController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(propertyFloorsController);
      }
    } else if (key == localizationsContext.totalFloors) {
      _propertyBasicDetails[key] =
          value.toString().trim().isNotEmpty ? int.parse(value) : null;
      if (isFieldDefaultValue) {
        propertyTotalFloorsController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(
            propertyTotalFloorsController);
      }
    } else if (key == localizationsContext.amenities) {
      final selected = amenitiesList
          .where(
            (element) => element.isSelected,
          )
          .toList();
      _propertyBasicDetails[key] = selected;
    } else if (key == localizationsContext.preferredCast) {
      final selected = preferredCastList
          .where(
            (element) => element.isSelected,
          )
          .toList();
      _propertyBasicDetails[key] = selected;
    } else if (key == localizationsContext.tags) {
      _propertyBasicDetails[key] = value;
    } else if (key == localizationsContext.sellerName) {
      _propertySellerDetails[key] = value;
      if (isFieldDefaultValue) {
        ownerNameController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(ownerNameController);
      }
      checkForPropertyInfoValid();
    } else if (key == localizationsContext.sellerMobile) {
      _propertySellerDetails[key] = value;
      if (isFieldDefaultValue) {
        sellerPhoneController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(sellerPhoneController);
      }
    } else if (key == localizationsContext.email) {
      _propertySellerDetails[key] = value;
      if (isFieldDefaultValue) {
        ownerEmailController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(ownerEmailController);
      }
    } else if (key == localizationsContext.chainOfBrokers) {
      _propertySellerDetails[key] = value;
      if (isFieldDefaultValue) {
        chainOfBrokersController.text = value.toString();
        StaticFunctions.fieldCursorPositionAtLast(chainOfBrokersController);
      }
    } else if (key == localizationsContext.propertyNote) {
      _propertySellerDetails[key] = value;
      if (isFieldDefaultValue) {
        ownerCommentsController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(ownerCommentsController);
      }
    } else if (key == localizationsContext.allowExchange) {
      _propertySellerDetails[key] = value;
      notifyListeners();
    } else if (key == localizationsContext.allowNegotiation) {
      _propertySellerDetails[key] = value;
      notifyListeners();
    } else if (key == localizationsContext.minSellPriceTag ||
        key == localizationsContext.maxSellPriceTag ||
        key == localizationsContext.minRentPriceTag ||
        key == localizationsContext.maxRentPriceTag ||
        key == localizationsContext.minLeasePriceTag ||
        key == localizationsContext.maxLeasePriceTag) {
      if (value != null) {
        _propertyPriceDetails[key] = value.toString();
        checkForPropertyInfoValid();
      } else {
        _propertyPriceDetails.remove(key);
      }
    } else if (key == localizationsContext.minSellPriceUnitIdTag ||
        key == localizationsContext.maxSellPriceUnitIdTag ||
        key == localizationsContext.minRentPriceUnitIdTag ||
        key == localizationsContext.maxRentPriceUnitIdTag ||
        key == localizationsContext.minLeasePriceUnitIdTag ||
        key == localizationsContext.maxLeasePriceUnitIdTag) {
      if (value != null) {
        _propertyPriceDetails[key] = value;
        checkForPropertyInfoValid();
      }
    } else if (key == localizationsContext.totalSize) {
      _propertyPriceDetails[key] =
          value.toString().trim().isNotEmpty ? double.parse(value) : null;
      if (isFieldDefaultValue) {
        totalSizeController.text = value;
        StaticFunctions.fieldCursorPositionAtLast(totalSizeController);
      }
      if (!_propertyPriceDetails
          .containsKey(localizationsContext.totalSizeUnit)) {
        final unitInfo = areaUnitList.firstWhereOrNull(
            (element) => element.id == getDefaultPriceUnitId());
        if (unitInfo != null) {
          updatePropertyDetails(
            localizationsContext.totalSizeUnit,
            unitInfo.id,
            dropDownValue: unitInfo.unit,
          );
          // As we don't have separate unit for price per Size
          // we are adding same unit as total size unit!
          updatePropertyDetails(
            localizationsContext.priceBySizeUnit,
            unitInfo.id,
            dropDownValue: unitInfo.unit,
          );
        }
      }
    } else if (key == localizationsContext.totalSizeUnit) {
      _propertyPriceDetails[key] = value;
      totalSizeUnitController.text = dropDownValue;
      StaticFunctions.fieldCursorPositionAtLast(totalSizeUnitController);
      notifyListeners();
    } else if (key == localizationsContext.sellPriceBySizeTag) {
      final price = StaticFunctions.formatPrice(value.replaceAll(',', ''));
      _propertyPriceDetails[key] = price;
      if (isFieldDefaultValue) {
        sellPricePerSizeController.text = price;
        StaticFunctions.fieldCursorPositionAtLast(sellPricePerSizeController);
      }
    } else if (key == localizationsContext.rentPriceBySizeTag) {
      final price = StaticFunctions.formatPrice(value.replaceAll(',', ''));
      _propertyPriceDetails[key] = price;
      if (isFieldDefaultValue) {
        rentPricePerSizeController.text = price;
        StaticFunctions.fieldCursorPositionAtLast(rentPricePerSizeController);
      }
    } else if (key == localizationsContext.leasePriceBySizeTag) {
      final price = StaticFunctions.formatPrice(value.replaceAll(',', ''));
      _propertyPriceDetails[key] = price;
      if (isFieldDefaultValue) {
        leasePricePerSizeController.text = price;
        StaticFunctions.fieldCursorPositionAtLast(leasePricePerSizeController);
      }
    } else if (key == localizationsContext.priceBySizeUnit) {
      _propertyPriceDetails[key] = value;
      pricePerUnitSizeController.text = dropDownValue;
      StaticFunctions.fieldCursorPositionAtLast(pricePerUnitSizeController);
      notifyListeners();
    } else if (key == localizationsContext.uploadImages) {
      _propertyGalleryDetails[key] = value;
    } else if (key == localizationsContext.propertyMarkAsVisibility) {
      final selectedItem = propertyVisibilityList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (selectedItem != null) {
        _propertySellerDetails[key] =
            selectedItem.id == SaveDefaultData.propertyVisibilityPublicId;
      } else {
        _propertySellerDetails[key] = false;
      }
    }
  }

  int getSelectedDropDownItemId(String key) {
    if (_propertyBasicDetails.containsKey(key)) {
      return _propertyBasicDetails[key];
    } else if (_propertySellerDetails.containsKey(key)) {
      return _propertySellerDetails[key];
    } else if (_propertyPriceDetails.containsKey(key)) {
      return _propertyPriceDetails[key];
    }
    return -1;
  }

  bool isAmenitiesSelectedForId(int id) {
    if (id == selectDeselectAllItemId) {
      bool isAllSelected = false;
      if (_tempSelectedAmenitiesList.isNotEmpty) {
        final tempIterable =
            _tempSelectedAmenitiesList.where((element) => element.isSelected);
        isAllSelected = tempIterable.length == filterAmenitiesList.length;
      }
      return isAllSelected;
    } else {
      final data = _tempSelectedAmenitiesList
          .firstWhereOrNull((element) => element.id == id);
      if (data == null) {
        return false;
      }
      return data.isSelected;
    }
  }

  updateAmenitiesSelection(int id, [String? type = null]) {
    String typeAddOrRemove = '';
    if (type == null) {
      if (id == selectDeselectAllItemId) {
        typeAddOrRemove = Strings.typeAdd;
        if (_tempSelectedAmenitiesList.isNotEmpty) {
          final tempIterable =
              _tempSelectedAmenitiesList.where((element) => element.isSelected);
          final isAllSelected =
              tempIterable.length == filterAmenitiesList.length;
          if (isAllSelected) {
            typeAddOrRemove = Strings.typeRemove;
          }
        }
      } else {
        final data = _tempSelectedAmenitiesList
            .firstWhereOrNull((element) => element.id == id);
        if (data == null) {
          typeAddOrRemove = Strings.typeAdd;
        } else {
          typeAddOrRemove = Strings.typeRemove;
        }
      }
    } else {
      typeAddOrRemove = type;
    }
    if (typeAddOrRemove == Strings.typeAdd) {
      if (id == selectDeselectAllItemId) {
        _tempSelectedAmenitiesList.clear();
        filterAmenitiesList.forEach(
          (element) {
            element..isSelected = true;
            _tempSelectedAmenitiesList.add(element);
          },
        );
      } else {
        final data =
            filterAmenitiesList.firstWhere((element) => element.id == id);
        _tempSelectedAmenitiesList.add(
          data..isSelected = true,
        );
      }
    } else if (typeAddOrRemove == Strings.typeRemove) {
      if (id == selectDeselectAllItemId) {
        _tempSelectedAmenitiesList.clear();
      } else {
        _tempSelectedAmenitiesList.removeWhere((element) => element.id == id);
      }
    }
  }

  searchByAmenitiesName(String name) {
    filterAmenitiesList.clear();
    if (name.toString().trim().isEmpty) {
      filterAmenitiesList.addAll(amenitiesList);
    } else {
      filterAmenitiesList.addAll(
        amenitiesList.where(
          (element) => element.name
              .toString()
              .trim()
              .toLowerCase()
              .contains(name.toString().trim().toLowerCase()),
        ),
      );
    }
  }

  onResetAmenities() {
    searchByAmenitiesName('');
    _tempSelectedAmenitiesList.clear();
    _tempSelectedAmenitiesList.addAll(_selectedAmenitiesList);
  }

  onEditedPropertyFor(List<int>? forIds) async {
    if (forIds != null && forIds.isNotEmpty) {
      if (propertyForList.isEmpty) {
        propertyForList = await _isarService.getPropertyFor();
      }
      for (int j = 0; j < forIds.length; j++) {
        final index =
            propertyForList.indexWhere((element) => element.id == forIds[j]);
        if (index != (-1)) {
          propertyForList[index].isSelected = true;
        }
      }
      notifyListeners();
      updatePropertyDetails(
        localizationsContext.propertyFor,
        null,
      );
    }
  }

  onAmenitiesDone() {
    _selectedAmenitiesList.clear();
    _selectedAmenitiesList.addAll(_tempSelectedAmenitiesList);
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.amenities,
      selectedAmenitiesList,
    );
  }

  bool isPreferredCastSelectedForId(int id) {
    if (id == selectDeselectAllItemId) {
      bool isAllSelected = false;
      if (_tempSelectedPreferredCastList.isNotEmpty) {
        final tempIterable = _tempSelectedPreferredCastList
            .where((element) => element.isSelected);
        isAllSelected = tempIterable.length == filterPreferredCastList.length;
      }
      return isAllSelected;
    } else {
      final data = _tempSelectedPreferredCastList
          .firstWhereOrNull((element) => element.id == id);
      if (data == null) {
        return false;
      }
      return data.isSelected;
    }
  }

  updatePreferredCastSelection(int id, [String? type = null]) {
    String typeAddOrRemove = '';
    if (type == null) {
      if (id == selectDeselectAllItemId) {
        typeAddOrRemove = Strings.typeAdd;
        if (_tempSelectedPreferredCastList.isNotEmpty) {
          final tempIterable = _tempSelectedPreferredCastList
              .where((element) => element.isSelected);
          final isAllSelected =
              tempIterable.length == filterPreferredCastList.length;
          if (isAllSelected) {
            typeAddOrRemove = Strings.typeRemove;
          }
        }
      } else {
        final data = _tempSelectedPreferredCastList
            .firstWhereOrNull((element) => element.id == id);
        if (data == null) {
          typeAddOrRemove = Strings.typeAdd;
        } else {
          typeAddOrRemove = Strings.typeRemove;
        }
      }
    } else {
      typeAddOrRemove = type;
    }
    if (typeAddOrRemove == Strings.typeAdd) {
      if (id == selectDeselectAllItemId) {
        _tempSelectedPreferredCastList.clear();
        filterPreferredCastList.forEach(
          (element) {
            element..isSelected = true;
            _tempSelectedPreferredCastList.add(element);
          },
        );
      } else {
        final data =
            filterPreferredCastList.firstWhere((element) => element.id == id);
        _tempSelectedPreferredCastList.add(
          data..isSelected = true,
        );
      }
    } else if (typeAddOrRemove == Strings.typeRemove) {
      if (id == selectDeselectAllItemId) {
        _tempSelectedPreferredCastList.clear();
      } else {
        _tempSelectedPreferredCastList
            .removeWhere((element) => element.id == id);
      }
    }
  }

  searchByPreferredCastName(String name) {
    filterPreferredCastList.clear();
    if (name.toString().trim().isEmpty) {
      filterPreferredCastList.addAll(preferredCastList);
    } else {
      filterPreferredCastList.addAll(
        preferredCastList.where(
          (element) => element.name.toString().trim().toLowerCase().contains(
                name.toString().trim().toLowerCase(),
              ),
        ),
      );
    }
  }

  onResetPreferredCast() {
    searchByPreferredCastName('');
    _tempSelectedPreferredCastList.clear();
    _tempSelectedPreferredCastList.addAll(_selectedPreferredCastList);
  }

  onPreferredCastDone() {
    _selectedPreferredCastList.clear();
    _selectedPreferredCastList.addAll(_tempSelectedPreferredCastList);
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.preferredCast,
      selectedPreferredCastList,
    );
  }

  addOrDeleteTagList(bool isNeedToDelete, String value) {
    propertyTagsController.text = '';
    if (isNeedToDelete) {
      // delete tags
      _tagList.removeWhere((element) => element == value);
    } else {
      // add tags
      _tagList.add(value);
    }
    updatePropertyDetails(
      localizationsContext.tags,
      _tagList,
    );
    notifyListeners();
  }

  Future<String> _getPropertyPhotoDirectory() async {
    int propertyId;
    if (_isEditedPropertyForSave()) {
      propertyId = _editProperty!.id;
    } else {
      propertyId = await PropertyInquiryStatusHelper.nextPropertyId(
        isarService: _isarService,
      );
    }
    return await FileUtils.getPropertyPhotosDirectoryPath(propertyId);
  }

  Future<String> _createPropertyPhotoDirectory() async {
    final dirPath = await _getPropertyPhotoDirectory();
    final isDirExist = await Directory(dirPath).exists();
    if (!isDirExist) {
      await Directory(dirPath).create();
    }
    return dirPath;
  }

  _deletePropertyPhotoDirectoryIfNoPhotos() async {
    final dirPath = await _getPropertyPhotoDirectory();
    final isDirExist = await Directory(dirPath).exists();
    if (isDirExist) {
      await Directory(dirPath).delete(recursive: true);
    }
  }

  Future<bool> chooseFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      _selectedImages.add(File(photo.path));
      notifyListeners();
      updatePropertyDetails(localizationsContext.uploadImages, imagePaths);
      if (_isEditedPropertyForSave()) {
        _isEditedPropertyImageChanges = true;
      }
      return true;
    }
    return false;
  }

  Future<int> chooseFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> list = await picker.pickMultiImage();
    if (list.isNotEmpty) {
      final totalSelectedImages = _selectedImages.length + list.length;
      if (totalSelectedImages > AppConfig.maxImagesAllowed) {
        return 2;
      }
      for (var element in list) {
        _selectedImages.add(File(element.path));
      }
      notifyListeners();
      updatePropertyDetails(localizationsContext.uploadImages, imagePaths);
      if (_isEditedPropertyForSave()) {
        _isEditedPropertyImageChanges = true;
      }
      return 1;
    }
    return 0;
  }

  removeSelectedImage(int position) {
    _clearCacheImageFromPath(_selectedImages[position]);
    _selectedImages.removeAt(position);
    notifyListeners();
    updatePropertyDetails(localizationsContext.uploadImages, imagePaths);
    if (_isEditedPropertyForSave()) {
      _isEditedPropertyImageChanges = true;
    }
  }

  updateBasicPropertyDetailsKeys(String key) {
    if (!_currentPropertyBasicDetailKeys.contains(key)) {
      _currentPropertyBasicDetailKeys.add(key);
    }
  }

  _refreshPreferredCasts() async {
    final onChanges = await _isarService.watchOnPreferredCastChanges();
    onChanges.listen(
      (event) async {
        await _getPreferredCastList();
      },
    );
  }

  bool isMinMaxSellPriceFieldRequired() {
    return (_propertyBasicDetails[localizationsContext.propertyFor]
            as List<DbPropertyFor>)
        .any((element) => element.id == SaveDefaultData.propertyForSellId);
  }

  bool isMinMaxRentPriceFieldRequired() {
    return (_propertyBasicDetails[localizationsContext.propertyFor]
            as List<DbPropertyFor>)
        .any((element) => element.id == SaveDefaultData.propertyForRentId);
  }

  bool isMinMaxLeasePriceFieldRequired() {
    return (_propertyBasicDetails[localizationsContext.propertyFor]
            as List<DbPropertyFor>)
        .any((element) => element.id == SaveDefaultData.propertyForLeaseId);
  }

  int getDefaultPriceUnitId() {
    final propertyTypeId =
        _propertyBasicDetails[localizationsContext.propertyType];
    return StaticFunctions.getDefaultAreaUnitId(propertyTypeId);
  }

  _checkBasicDetailsKeyAvailable(String key) {
    return _currentPropertyBasicDetailKeys.contains(key);
  }

  updateLocationInfo(RetrieveLocationArg? arg) {
    _privateLocationArg = arg;
    notifyListeners();
    if (propertyPrivateLocationController.text.trim().isEmpty &&
        arg?.landMarkLocationForLocationField != null) {
      updatePropertyDetails(
        localizationsContext.addressLandmark,
        arg?.landMarkLocationForLocationField,
        isFieldDefaultValue: true,
      );
    }
  }

  updatePublicLocationInfo(RetrieveLocationArg? arg) {
    _publicLocationArg = arg;
    notifyListeners();
    if (propertyPublicLocationController.text.trim().isEmpty &&
        arg?.landMarkLocationForLocationField != null) {
      updatePropertyDetails(
        localizationsContext.publicAddressLandmark,
        arg?.landMarkLocationForLocationField,
        isFieldDefaultValue: true,
      );
    }
  }

  bool _isEditedPropertyForSave() {
    return _editProperty != null &&
        _propertyArgs?.addPropertyEnums == AddPropertyEnums.edit;
  }

  bool _isCopiedPropertyForSave() {
    return _editProperty != null &&
        _propertyArgs?.addPropertyEnums == AddPropertyEnums.copy;
  }

  Future<int> savePropertyDetails(
    CommonPropertyDataProvider commonPropertyDataProvider,
  ) async {
    String currentPropertyId = AppConfig.propertyIdLength;
    int localPropertyId = -1;
    if (_isEditedPropertyForSave()) {
      currentPropertyId = _editProperty!.propertyId!;
      localPropertyId = _editProperty!.id;
    } else {
      currentPropertyId = await PropertyInquiryStatusHelper.generatePropertyId(
        isarService: _isarService,
      );
      localPropertyId = await PropertyInquiryStatusHelper.nextPropertyId(
        isarService: _isarService,
      );
    }

    final List<String> selectedAmenitiesValues = [];
    final List<String> selectedPreferredCommunityValues = [];
    final List<String> images = [];
    final List<String> pTags = [];

    if (_checkBasicDetailsKeyAvailable(localizationsContext.tags)) {
      final propertyTags =
          _propertyBasicDetails[localizationsContext.tags] as List<String>?;
      if (propertyTags != null && propertyTags.isNotEmpty) {
        propertyTags.forEach(
          (element) {
            pTags.add(element);
          },
        );
      }
      if (propertyTagsController.text.toString().trim().isNotEmpty) {
        pTags.add(
          propertyTagsController.text.toString().trim(),
        );
      }
    }

    if (_checkBasicDetailsKeyAvailable(localizationsContext.amenities)) {
      final propertyAmenities =
          _propertyBasicDetails[localizationsContext.amenities]
              as List<DbPropertyAmenity>?;

      if (propertyAmenities != null && propertyAmenities.isNotEmpty) {
        propertyAmenities.forEach(
          (element) {
            selectedAmenitiesValues.add(element.name);
          },
        );
      }
    }

    if (_checkBasicDetailsKeyAvailable(localizationsContext.preferredCast)) {
      final propertyPreferredCasts =
          _propertyBasicDetails[localizationsContext.preferredCast]
              as List<DbPropertyPreferredCast>?;

      if (propertyPreferredCasts != null && propertyPreferredCasts.isNotEmpty) {
        propertyPreferredCasts.forEach(
          (element) {
            selectedPreferredCommunityValues.add(element.name);
          },
        );
      }
    }

    //Delete pdf when property is edited
    if (_isEditedPropertyForSave()) {
      final currentDirFiles =
          Directory(await _createPropertyPhotoDirectory()).listSync();
      final pdfFiles = currentDirFiles
          .where((element) => element.path.contains(Strings.pdfFileExtension));
      if (pdfFiles.isNotEmpty) {
        await Future.forEach(
          pdfFiles,
          (element) async {
            final filePath = element.path;
            if (filePath.contains(Strings.pdfFileExtension)) {
              await File(element.path).delete();
            }
          },
        );
      }
    }

    if (_propertyGalleryDetails.isNotEmpty) {
      if (_propertyGalleryDetails
          .containsKey(localizationsContext.uploadImages)) {
        final dirPath = await _createPropertyPhotoDirectory();
        List<File> selectedFiles =
            _propertyGalleryDetails[localizationsContext.uploadImages];
        if (_isEditedPropertyForSave() && _isEditedPropertyImageChanges) {
          // For Edit Property to Rearrange indexes as images name will conflict when user cancel old and set new image
          // Same time we are not deleting old files before clicking on save as user may not save it.
          // So we are adding all properties in cache directory and then rearrange indexes. cache dir will be removed once save
          final cacheDir = await getTemporaryDirectory();
          List<String> _tempPath = [];
          for (int tmpIndex = 0; tmpIndex < selectedFiles.length; tmpIndex++) {
            final String filePath =
                '${cacheDir.path}/${(DateTime.now().millisecondsSinceEpoch + tmpIndex)}${Strings.jpgFileExtension}';
            final File newImage =
                await File(selectedFiles[tmpIndex].path).copy(filePath);
            _tempPath.add(newImage.path);
          }
          // Delete Older images from directory as now we are having copy at cache directory
          final currentDirFiles = Directory(dirPath).listSync();
          if (currentDirFiles.isNotEmpty) {
            await Future.forEach(
              currentDirFiles,
              (element) async {
                final filePath = element.path;
                if (filePath.contains(Strings.jpgFileExtension) ||
                    filePath.contains(Strings.pdfFileExtension)) {
                  await File(element.path).delete();
                }
              },
            );
            await _isarService.deletePhotoMetaByProperty(localPropertyId);
          }
          // Rearrange indexes
          for (int fileIndex = 0; fileIndex < _tempPath.length; fileIndex++) {
            final String filePath =
                '$dirPath/${fileIndex}${Strings.jpgFileExtension}';
            final File newImage =
                await File(_tempPath[fileIndex]).copy(filePath);
            images.add(newImage.path);
            await _isarService.savePhotoMeta(
              DbPropertyPhotoMeta()
                ..userId = StaticFunctions.userId
                ..propertyId = localPropertyId
                ..imagePath = newImage.path,
            );

            final FileImage provider = FileImage(newImage);
            try {
              bool res = await provider.evict();
              debugPrint('eviction result: $res');
            } catch (error) {
              debugPrint('evict failure: ${error.toString()}');
            }
          }
        } else if (_isEditedPropertyForSave() &&
            !_isEditedPropertyImageChanges) {
          debugPrint(
              'no changes in images at time of edit so no need to rearrange indexes');
          images.addAll(selectedFiles.map((element) => element.path));
        } else {
          for (int fileIndex = 0;
              fileIndex < selectedFiles.length;
              fileIndex++) {
            final String filePath =
                '$dirPath/${fileIndex}${Strings.jpgFileExtension}';
            final File newImage =
                await File(selectedFiles[fileIndex].path).copy(filePath);
            images.add(newImage.path);
            await _isarService.savePhotoMeta(
              DbPropertyPhotoMeta()
                ..userId = StaticFunctions.userId
                ..propertyId = localPropertyId
                ..imagePath = newImage.path,
            );
          }
        }
      }
    }

    final propertyTypeId =
        _checkBasicDetailsKeyAvailable(localizationsContext.propertyType)
            ? _propertyBasicDetails[localizationsContext.propertyType]
            : -1;
    String propertyTypeValue = '';
    if (propertyTypeId != (-1)) {
      final info =
          await commonPropertyDataProvider.getPropertyTypeById(propertyTypeId);
      if (info != null) {
        propertyTypeValue = info.name;
      }
    }

    List<int> selectedPropertyForIds = [];
    if (_checkBasicDetailsKeyAvailable(localizationsContext.propertyFor)) {
      final propertyForIds =
          _propertyBasicDetails[localizationsContext.propertyFor]
              as List<DbPropertyFor>?;

      if (propertyForIds != null && propertyForIds.isNotEmpty) {
        propertyForIds.forEach(
          (element) {
            selectedPropertyForIds.add(element.id);
          },
        );
      }
      // sorting propertyFOR -> IF sell and Rent both are selected then sell should be first!
      selectedPropertyForIds.sort();
    }

    List<String> propertyForValue = [];
    if (selectedPropertyForIds.isNotEmpty) {
      for (int i = 0; i < selectedPropertyForIds.length; i++) {
        final info = await commonPropertyDataProvider
            .getPropertyForById(selectedPropertyForIds[i]);
        if (info != null) {
          propertyForValue.add(info.name);
        }
      }
    }

    int activeStatusId = SaveDefaultData.activeStatusId;
    String activeStatusValue = '';

    if (_isEditedPropertyForSave()) {
      activeStatusId = _editProperty?.propertyStatusId ?? activeStatusId;
      activeStatusValue =
          _editProperty?.propertyStatusValue ?? activeStatusValue;
    } else {
      if (activeStatusId != (-1)) {
        final info =
            await commonPropertyDataProvider.getPropertyStatus(activeStatusId);
        if (info != null) {
          activeStatusValue = info.name;
        }
      }
    }

    int priceUnitId = StaticFunctions.defaultPriceUnitId;
    String priceUnitValue = '';

    if (_isEditedPropertyForSave() || _isCopiedPropertyForSave()) {
      priceUnitId = _editProperty?.priceUnitId ?? priceUnitId;
      priceUnitValue = _editProperty?.priceUnitValue ?? priceUnitValue;
    } else {
      if (priceUnitId != (-1)) {
        final info = await commonPropertyDataProvider
            .getPropertyPriceUnitById(priceUnitId);
        if (info != null) {
          priceUnitValue = info.unit;
        }
      }
    }

    final areaUnitId =
        _propertyPriceDetails[localizationsContext.totalSizeUnit];
    String areaUnitValue = '';
    if (areaUnitId != (-1)) {
      final info =
          await commonPropertyDataProvider.getPropertyAreaUnitById(areaUnitId);
      if (info != null) {
        areaUnitValue = info.unit;
      }
    }

    final pricePerSizeUnitId =
        _propertyPriceDetails[localizationsContext.priceBySizeUnit];
    String pricePerSizeUnitValue = '';
    if (pricePerSizeUnitId != (-1)) {
      final pricePerSizeInfo = await commonPropertyDataProvider
          .getPropertyAreaUnitById(pricePerSizeUnitId);
      if (pricePerSizeInfo != null) {
        pricePerSizeUnitValue = pricePerSizeInfo.unit;
      }
    }

    List<String> selectedAdditionalFurnishing = [];
    final addFurnishList =
        _propertyBasicDetails[localizationsContext.additionalFurnishing]
            as List<DbAdditionalFurnish>?;
    if (addFurnishList != null && addFurnishList.isNotEmpty) {
      addFurnishList.forEach(
        (element) {
          selectedAdditionalFurnishing.add(element.name);
        },
      );
    }

    List<double> selectedConnectedRoads = [];
    final addConnectedRoads =
        _propertyBasicDetails[localizationsContext.connectedRoad]
            as List<double>?;
    if (addConnectedRoads != null && addConnectedRoads.isNotEmpty) {
      addConnectedRoads.forEach(
        (element) {
          selectedConnectedRoads.add(element);
        },
      );
    }

    int? buildingType =
        _propertyBasicDetails[localizationsContext.buildingType];

    String? minSellPrice =
        _propertyPriceDetails[localizationsContext.minSellPriceTag];
    String? maxSellPrice =
        _propertyPriceDetails[localizationsContext.maxSellPriceTag];

    int? minSellPriceUnitId =
        _propertyPriceDetails[localizationsContext.minSellPriceUnitIdTag];
    int? maxSellPriceUnitId =
        _propertyPriceDetails[localizationsContext.maxSellPriceUnitIdTag];

    String? minRentPrice =
        _propertyPriceDetails[localizationsContext.minRentPriceTag];
    String? maxRentPrice =
        _propertyPriceDetails[localizationsContext.maxRentPriceTag];

    int? minRentPriceUnitId =
        _propertyPriceDetails[localizationsContext.minRentPriceUnitIdTag];
    int? maxRentPriceUnitId =
        _propertyPriceDetails[localizationsContext.maxRentPriceUnitIdTag];

    String? minLeasePrice =
        _propertyPriceDetails[localizationsContext.minLeasePriceTag];
    String? maxLeasePrice =
        _propertyPriceDetails[localizationsContext.maxLeasePriceTag];

    int? minLeasePriceUnitId =
        _propertyPriceDetails[localizationsContext.minLeasePriceUnitIdTag];
    int? maxLeasePriceUnitId =
        _propertyPriceDetails[localizationsContext.maxLeasePriceUnitIdTag];

    String? sellPricePerSize =
        _propertyPriceDetails[localizationsContext.sellPriceBySizeTag];
    String? rentPricePerSize =
        _propertyPriceDetails[localizationsContext.rentPriceBySizeTag];
    String? leasePricePerSize =
        _propertyPriceDetails[localizationsContext.leasePriceBySizeTag];

    double? depthSize = null;
    if (_checkBasicDetailsKeyAvailable(localizationsContext.depthSize)) {
      final value = _propertyBasicDetails[localizationsContext.depthSize];
      if (value != null && value.toString().trim().isNotEmpty) {
        depthSize = double.parse(value);
      }
    }

    double? frontSize = null;
    if (_checkBasicDetailsKeyAvailable(localizationsContext.frontSize)) {
      final value = _propertyBasicDetails[localizationsContext.frontSize];
      if (value != null && value.toString().trim().isNotEmpty) {
        frontSize = double.parse(value);
      }
    }

    String? sellerName =
        _propertySellerDetails[localizationsContext.sellerName];
    String? sellerPhone =
        _propertySellerDetails[localizationsContext.sellerMobile];
    String? sellerEmail = _propertySellerDetails[localizationsContext.email];
    String? sellerNotes =
        _propertySellerDetails[localizationsContext.propertyNote];
    bool? propertyExchangeAllowed =
        _propertySellerDetails[localizationsContext.allowExchange];
    bool? propertyNegotiationAllowed =
        _propertySellerDetails[localizationsContext.allowNegotiation];
    int? brokerChain = null;
    final brokerChainString =
        _propertySellerDetails[localizationsContext.chainOfBrokers];
    if (brokerChainString != null &&
        brokerChainString!.toString().trim().isNotEmpty) {
      brokerChain = int.parse(brokerChainString!.toString().trim());
    }
    bool isPublicProperty = false;
    final pbProperty =
        _propertySellerDetails[localizationsContext.propertyMarkAsVisibility];
    if (pbProperty != null) {
      isPublicProperty =
          _propertySellerDetails[localizationsContext.propertyMarkAsVisibility];
    }

    String? addressLandmark =
        _propertyBasicDetails[localizationsContext.addressLandmark];
    if (addressLandmark != null) {
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
    }

    String? publicAddressLandmark =
        _propertyBasicDetails[localizationsContext.publicAddressLandmark];
    if (publicAddressLandmark != null) {
      final addressTags = publicAddressLandmark.split(
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
    }

    final currentDateTime = DateTime.now();

    DbProperty data = DbProperty()
      ..id = localPropertyId
      ..propertyId = currentPropertyId
      ..isSyncedWithServer = false
      ..isEdit = _isEditedPropertyForSave() &&
          (_editProperty?.isSyncedWithServer ?? false)
      ..userId = StaticFunctions.userId
      ..propertyName = 'My Property'
      ..propertyTypeId = propertyTypeId
      ..propertyTypeValue = propertyTypeValue
      ..propertyForIds = selectedPropertyForIds
      ..propertyForValues = propertyForValue
      ..propertyStatusId = activeStatusId
      ..propertyStatusValue = activeStatusValue
      ..propertySoldStatusId = SaveDefaultData.unSoldStatusId
      ..addedAt = _isEditedPropertyForSave()
          ? (_editProperty?.addedAt ?? currentDateTime)
          : currentDateTime
      ..updatedAt = currentDateTime
      ..propertyFurnishedStatusId =
          _checkBasicDetailsKeyAvailable(localizationsContext.furnishedStatus)
              ? _propertyBasicDetails[localizationsContext.furnishedStatus]
              : null
      ..additionalFurnishing = selectedAdditionalFurnishing
      ..latitude = _checkBasicDetailsKeyAvailable(localizationsContext.location)
          ? (_privateLocationArg?.coordinates != null)
              ? _privateLocationArg!.coordinates!.latitude
              : null
          : null
      ..longitude =
          _checkBasicDetailsKeyAvailable(localizationsContext.location)
              ? (_privateLocationArg?.coordinates != null)
                  ? _privateLocationArg!.coordinates!.longitude
                  : null
              : null
      ..area = _checkBasicDetailsKeyAvailable(localizationsContext.location)
          ? (_privateLocationArg != null)
              ? _privateLocationArg!.areaName
              : null
          : null
      ..addressLandMark =
          _checkBasicDetailsKeyAvailable(localizationsContext.addressLandmark)
              ? addressLandmark
              : null
      ..publicLatitude =
          _checkBasicDetailsKeyAvailable(localizationsContext.publicLocation)
              ? (_publicLocationArg?.coordinates != null)
                  ? _publicLocationArg!.coordinates!.latitude
                  : null
              : null
      ..publicLongitude =
          _checkBasicDetailsKeyAvailable(localizationsContext.publicLocation)
              ? (_publicLocationArg?.coordinates != null)
                  ? _publicLocationArg!.coordinates!.longitude
                  : null
              : null
      ..publicArea =
          _checkBasicDetailsKeyAvailable(localizationsContext.publicLocation)
              ? (_publicLocationArg != null)
                  ? _publicLocationArg!.areaName
                  : null
              : null
      ..publicAddressLandMark = _checkBasicDetailsKeyAvailable(
              localizationsContext.publicAddressLandmark)
          ? publicAddressLandmark
          : null
      ..roomCount = _checkBasicDetailsKeyAvailable(localizationsContext.rooms)
          ? _propertyBasicDetails[localizationsContext.rooms]
          : null
      ..bathRoomCount =
          _checkBasicDetailsKeyAvailable(localizationsContext.bathRooms)
              ? _propertyBasicDetails[localizationsContext.bathRooms]
              : null
      ..floorCount = _checkBasicDetailsKeyAvailable(localizationsContext.floors)
          ? _propertyBasicDetails[localizationsContext.floors]
          : null
      ..totalFloorCount =
          _checkBasicDetailsKeyAvailable(localizationsContext.totalFloors)
              ? _propertyBasicDetails[localizationsContext.totalFloors]
              : null
      ..amenitiesValues = selectedAmenitiesValues
      ..preferredCommunityValues = selectedPreferredCommunityValues
      ..tags = pTags
      ..buildingTypeId = propertyTypeId == SaveDefaultData.propertyTypeFlatId
          ? SaveDefaultData.propertyResidentialTypeId
          : _checkBasicDetailsKeyAvailable(localizationsContext.buildingType)
              ? (buildingType == (-1) ? null : buildingType)
              : null
      ..facingId =
          _checkBasicDetailsKeyAvailable(localizationsContext.facingType)
              ? _propertyBasicDetails[localizationsContext.facingType]
              : null
      ..isCornerPiece =
          _checkBasicDetailsKeyAvailable(localizationsContext.cornerPiece)
              ? _propertyBasicDetails[localizationsContext.cornerPiece]
              : null
      ..balcony = _checkBasicDetailsKeyAvailable(localizationsContext.balcony)
          ? _propertyBasicDetails[localizationsContext.balcony]
          : null
      ..connectedRoads =
          _checkBasicDetailsKeyAvailable(localizationsContext.connectedRoad)
              ? selectedConnectedRoads
              : null
      ..lightConnection =
          _checkBasicDetailsKeyAvailable(localizationsContext.lightConnection)
              ? _propertyBasicDetails[localizationsContext.lightConnection]
              : null
      ..isWellAvailable =
          _checkBasicDetailsKeyAvailable(localizationsContext.wellAvailable)
              ? _propertyBasicDetails[localizationsContext.wellAvailable]
              : null
      ..schemeTypeId =
          _checkBasicDetailsKeyAvailable(localizationsContext.scheme)
              ? _propertyBasicDetails[localizationsContext.scheme]
              : null
      ..bhkId = _checkBasicDetailsKeyAvailable(localizationsContext.bhk)
          ? _propertyBasicDetails[localizationsContext.bhk]
          : null
      ..frontSize = frontSize
      ..depthSize = depthSize
      ..frontSizeUnitId =
          frontSize != null ? SaveDefaultData.areaUnitFeetId : null
      ..depthSizeUnitId =
          depthSize != null ? SaveDefaultData.areaUnitFeetId : null
      ..frontSizeUnitValue =
          frontSize != null ? localizationsContext.feet : null
      ..depthSizeUnitValue =
          depthSize != null ? localizationsContext.feet : null
      ..constructionTypeId =
          _checkBasicDetailsKeyAvailable(localizationsContext.construction)
              ? _propertyBasicDetails[localizationsContext.construction]
              : null
      ..isParkingAvailable =
          _checkBasicDetailsKeyAvailable(localizationsContext.parkingAvailable)
              ? _propertyBasicDetails[localizationsContext.parkingAvailable]
              : null
      ..isLiftAvailable =
          _checkBasicDetailsKeyAvailable(localizationsContext.liftAvailable)
              ? _propertyBasicDetails[localizationsContext.liftAvailable]
              : null
      ..isAllottedParking =
          _checkBasicDetailsKeyAvailable(localizationsContext.allottedParking)
              ? _propertyBasicDetails[localizationsContext.allottedParking]
              : null
      ..isWashRoomAvailable =
          _checkBasicDetailsKeyAvailable(localizationsContext.washRoomAvailable)
              ? _propertyBasicDetails[localizationsContext.washRoomAvailable]
              : null
      ..sellerName = sellerName?.trim().toLowerCase().toTitleCase()
      ..sellerPhoneNo = sellerPhone?.trim()
      ..sellerEmail = sellerEmail?.trim()
      ..brokerChain = brokerChain
      ..comments = sellerNotes?.trim()
      ..exchangeAllowed = propertyExchangeAllowed ?? false
      ..negotiationAllowed = propertyNegotiationAllowed ?? false
      ..minSellPrice = isMinMaxSellPriceFieldRequired()
          ? (minSellPrice != null && minSellPrice.trim().isNotEmpty)
              ? double.parse(minSellPrice.replaceAll(',', ''))
              : null
          : null
      ..maxSellPrice = isMinMaxSellPriceFieldRequired()
          ? (maxSellPrice != null && maxSellPrice.trim().isNotEmpty)
              ? double.parse(maxSellPrice.replaceAll(',', ''))
              : null
          : null
      ..minRentPrice = isMinMaxRentPriceFieldRequired()
          ? (minRentPrice != null && minRentPrice.trim().isNotEmpty)
              ? double.parse(minRentPrice.replaceAll(',', ''))
              : null
          : null
      ..maxRentPrice = isMinMaxRentPriceFieldRequired()
          ? (maxRentPrice != null && maxRentPrice.trim().isNotEmpty)
              ? double.parse(maxRentPrice.replaceAll(',', ''))
              : null
          : null
      ..minLeasePrice = isMinMaxLeasePriceFieldRequired()
          ? (minLeasePrice != null && minLeasePrice.trim().isNotEmpty)
              ? double.parse(minLeasePrice.replaceAll(',', ''))
              : null
          : null
      ..maxLeasePrice = isMinMaxLeasePriceFieldRequired()
          ? (maxLeasePrice != null && maxLeasePrice.trim().isNotEmpty)
              ? double.parse(maxLeasePrice.replaceAll(',', ''))
              : null
          : null
      ..minSellPriceUnit = isMinMaxSellPriceFieldRequired()
          ? minSellPriceUnitId != null
              ? minSellPriceUnitId
              : SaveDefaultData.filterPriceUnitThousand
          : SaveDefaultData.filterPriceUnitThousand
      ..maxSellPriceUnit = isMinMaxSellPriceFieldRequired()
          ? maxSellPriceUnitId != null
              ? maxSellPriceUnitId
              : SaveDefaultData.filterPriceUnitThousand
          : SaveDefaultData.filterPriceUnitThousand
      ..minRentPriceUnit = isMinMaxRentPriceFieldRequired()
          ? minRentPriceUnitId != null
              ? minRentPriceUnitId
              : SaveDefaultData.filterPriceUnitThousand
          : SaveDefaultData.filterPriceUnitThousand
      ..maxRentPriceUnit = isMinMaxRentPriceFieldRequired()
          ? maxRentPriceUnitId != null
              ? maxRentPriceUnitId
              : SaveDefaultData.filterPriceUnitThousand
          : SaveDefaultData.filterPriceUnitThousand
      ..minLeasePriceUnit = isMinMaxLeasePriceFieldRequired()
          ? minLeasePriceUnitId != null
              ? minLeasePriceUnitId
              : SaveDefaultData.filterPriceUnitThousand
          : SaveDefaultData.filterPriceUnitThousand
      ..maxLeasePriceUnit = isMinMaxLeasePriceFieldRequired()
          ? maxLeasePriceUnitId != null
              ? maxLeasePriceUnitId
              : SaveDefaultData.filterPriceUnitThousand
          : SaveDefaultData.filterPriceUnitThousand
      ..priceUnitId = priceUnitId
      ..priceUnitValue = priceUnitValue
      ..propertyAreaSize = _propertyPriceDetails[localizationsContext.totalSize]
      ..propertyAreaUnitId = areaUnitId
      ..propertyAreaUnitValue = areaUnitValue
      ..propertySellPricePerArea = (isMinMaxSellPriceFieldRequired() &&
              sellPricePerSize != null &&
              sellPricePerSize.trim().isNotEmpty)
          ? double.parse(sellPricePerSize.replaceAll(',', ''))
          : null
      ..propertyRentPricePerArea = (isMinMaxRentPriceFieldRequired() &&
              rentPricePerSize != null &&
              rentPricePerSize.trim().isNotEmpty)
          ? double.parse(rentPricePerSize.replaceAll(',', ''))
          : null
      ..propertyLeasePricePerArea = (isMinMaxLeasePriceFieldRequired() &&
              leasePricePerSize != null &&
              leasePricePerSize.trim().isNotEmpty)
          ? double.parse(leasePricePerSize.replaceAll(',', ''))
          : null
      ..propertyPricePerAreaUnitId = pricePerSizeUnitId
      ..propertyPricePerAreaUnitValue = pricePerSizeUnitValue
      ..photos = images
      ..sharedByBrooon = false
      ..brooonId = null
      ..brooonName = null
      ..brooonPhoto = null
      ..isFavorite =
          _isEditedPropertyForSave() ? _editProperty!.isFavorite : false
      ..isPublicProperty = isPublicProperty;

    //reset property from all unmatch inquiry list
    if (_shouldResetFromUnMatch(data)) {
      data.unmatchInquiries = [];
      await _resetPropertyFromUnMatch(currentPropertyId);
    } else if (_isEditedPropertyForSave()) {
      data.unmatchInquiries = _editProperty?.unmatchInquiries ?? [];
    }

    final id = await _isarService.saveProperty(data);

    // check if property photos directory is empty then remove directory if exist
    if (images.isEmpty) {
      _deletePropertyPhotoDirectoryIfNoPhotos();
    }
    // upload detail to server
    SyncHelper.syncPropertyInfoWithServer(
      localizationsContext,
      commonPropertyDataProvider,
    );
    return id;
  }

  _shouldResetFromUnMatch(DbProperty data) {
    return _isEditedPropertyForSave() &&
        _editProperty != null &&
        (_editProperty!.minSellPrice != data.minSellPrice ||
            _editProperty!.minRentPrice != data.minRentPrice ||
            _editProperty!.minLeasePrice != data.minLeasePrice ||
            !ListEquality()
                .equals(_editProperty!.propertyForIds, data.propertyForIds) ||
            _editProperty!.propertyTypeId != data.propertyTypeId ||
            _editProperty!.propertyAreaSize != data.propertyAreaSize ||
            _editProperty!.area != data.area ||
            _editProperty!.addressLandMark != data.addressLandMark ||
            _editProperty!.latitude != data.latitude ||
            _editProperty!.longitude != data.longitude);
  }

  Future<DbProperty?> getSavedProperty(int id) async {
    final propertyInfo = await _isarService.getPropertyById(id);
    return propertyInfo;
  }

  setDefaultValueToEditProperty() async {
    _editProperty =
        await _isarService.getPropertyById(_propertyArgs!.propertyId);
    if (_editProperty != null) {
      updatePropertyDetails(
        localizationsContext.propertyName,
        _editProperty!.propertyName,
        isFieldDefaultValue: true,
      );

      selectPropertyType(
        _editProperty!.propertyTypeId,
      );

      onEditedPropertyFor(
        _editProperty!.propertyForIds,
      );

      if (_editProperty!.minSellPrice != null) {
        final value = StaticFunctions.shortPriceRangeValue(
          _editProperty!.minSellPrice!,
          _editProperty!.minSellPriceUnit,
        );
        minSellPriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(value.toString()),
        );
        selectSellPriceUnit(
          id: _editProperty!.minSellPriceUnit,
          isMin: true,
        );
      }

      if (_editProperty!.maxSellPrice != null) {
        final value = StaticFunctions.shortPriceRangeValue(
          _editProperty!.maxSellPrice!,
          _editProperty!.maxSellPriceUnit,
        );
        maxSellPriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(value.toString()),
        );
        selectSellPriceUnit(
          id: _editProperty!.maxSellPriceUnit,
          isMin: false,
        );
      }

      if (_editProperty!.minRentPrice != null) {
        final value = StaticFunctions.shortPriceRangeValue(
          _editProperty!.minRentPrice!,
          _editProperty!.minRentPriceUnit,
        );
        minRentPriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(value.toString()),
        );
        selectRentPriceUnit(
          id: _editProperty!.minRentPriceUnit,
          isMin: true,
        );
      }

      if (_editProperty!.maxRentPrice != null) {
        final value = StaticFunctions.shortPriceRangeValue(
          _editProperty!.maxRentPrice!,
          _editProperty!.maxRentPriceUnit,
        );
        maxRentPriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(value.toString()),
        );
        selectRentPriceUnit(
          id: _editProperty!.maxRentPriceUnit,
          isMin: false,
        );
      }

      if (_editProperty!.minLeasePrice != null) {
        final value = StaticFunctions.shortPriceRangeValue(
          _editProperty!.minLeasePrice!,
          _editProperty!.minLeasePriceUnit,
        );
        minLeasePriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(value.toString()),
        );
        selectLeasePriceUnit(
          id: _editProperty!.minLeasePriceUnit,
          isMin: true,
        );
      }

      if (_editProperty!.maxLeasePrice != null) {
        final value = StaticFunctions.shortPriceRangeValue(
          _editProperty!.maxLeasePrice!,
          _editProperty!.maxLeasePriceUnit,
        );
        maxLeasePriceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(value.toString()),
        );
        selectLeasePriceUnit(
          id: _editProperty!.maxLeasePriceUnit,
          isMin: false,
        );
      }

      if (_editProperty!.propertyAreaSize != null) {
        updatePropertyDetails(
          localizationsContext.totalSize,
          StaticFunctions.removeTrailingZeros(
            _editProperty!.propertyAreaSize.toString(),
          ),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.propertyAreaUnitId != null) {
        updatePropertyDetails(
          localizationsContext.totalSizeUnit,
          _editProperty!.propertyAreaUnitId,
          dropDownValue: areaUnitList
                  .firstWhereOrNull(
                    (element) =>
                        element.id == _editProperty!.propertyAreaUnitId,
                  )
                  ?.unit ??
              '',
        );
      }

      if (_editProperty!.propertySellPricePerArea != null) {
        updatePropertyDetails(
          localizationsContext.sellPriceBySizeTag,
          StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              _editProperty!.propertySellPricePerArea.toString(),
            ),
          ),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.propertyRentPricePerArea != null) {
        updatePropertyDetails(
          localizationsContext.rentPriceBySizeTag,
          StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              _editProperty!.propertyRentPricePerArea.toString(),
            ),
          ),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.propertyLeasePricePerArea != null) {
        updatePropertyDetails(
          localizationsContext.leasePriceBySizeTag,
          StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              _editProperty!.propertyLeasePricePerArea.toString(),
            ),
          ),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.propertyPricePerAreaUnitId != null) {
        updatePropertyDetails(
          localizationsContext.priceBySizeUnit,
          _editProperty!.propertyPricePerAreaUnitId,
          dropDownValue: areaUnitList
                  .firstWhereOrNull(
                    (element) =>
                        element.id == _editProperty!.propertyPricePerAreaUnitId,
                  )
                  ?.unit ??
              '',
        );
      }

      if (_editProperty!.photos != null) {
        _selectedImages.clear();
        for (var element in _editProperty!.photos!) {
          final File newImage = File(element);
          _selectedImages.add(newImage);
        }
        notifyListeners();
        updatePropertyDetails(
          localizationsContext.uploadImages,
          imagePaths,
        );
      }

      if (_editProperty!.buildingTypeId != null) {
        selectBuildingType(
          _editProperty!.buildingTypeId!,
        );
      }

      if (_editProperty!.constructionTypeId != null) {
        selectConstructionType(_editProperty!.constructionTypeId!);
      }

      if (_editProperty!.propertyFurnishedStatusId != null) {
        selectFurnished(_editProperty!.propertyFurnishedStatusId!);
      }

      if (_editProperty!.additionalFurnishing != null &&
          _editProperty!.additionalFurnishing!.isNotEmpty) {
        final List<DbAdditionalFurnish> savedAdditionalFurnishList = [];
        for (int i = 0; i < _editProperty!.additionalFurnishing!.length; i++) {
          final element = _editProperty!.additionalFurnishing![i];
          savedAdditionalFurnishList.add(
            DbAdditionalFurnish()
              ..id = await _isarService.getAdditionalFurnishIdByName(element)
              ..name = element
              ..isSelected = true,
          );
        }
        selectAdditionalFurnish(
          selection: savedAdditionalFurnishList,
        );
      }

      if (_editProperty!.bhkId != null) {
        selectBhkType(_editProperty!.bhkId!);
      }

      if (_editProperty!.facingId != null) {
        selectFacingType(_editProperty!.facingId!);
      }

      if (_editProperty!.isCornerPiece != null) {
        enableCornerPiece(_editProperty!.isCornerPiece!);
      }

      if (_editProperty!.balcony != null) {
        enableBalcony(_editProperty!.balcony!);
      }

      if (_editProperty!.isWashRoomAvailable != null) {
        enableWashroom(_editProperty!.isWashRoomAvailable!);
      }

      if (_editProperty!.lightConnection != null) {
        enableLightConnection(_editProperty!.lightConnection!);
      }

      if (_editProperty!.isParkingAvailable != null) {
        enableParking(_editProperty!.isParkingAvailable);
      }

      if (_editProperty!.isAllottedParking != null) {
        enableAllottedParking(_editProperty!.isAllottedParking!);
      }

      if (_editProperty!.isWellAvailable != null) {
        enableWell(_editProperty!.isWellAvailable);
      }

      if (_editProperty!.isLiftAvailable != null) {
        enableLift(_editProperty!.isLiftAvailable);
      }

      if (_editProperty!.connectedRoads != null &&
          _editProperty!.connectedRoads!.isNotEmpty) {
        firstConnectedRoadController.text = StaticFunctions.removeTrailingZeros(
                _editProperty!.connectedRoads!.firstOrNull?.toString() ?? '') ??
            '';
        if (_editProperty!.connectedRoads!.length > 1) {
          secondConnectedRoadController.text =
              StaticFunctions.removeTrailingZeros(
                      _editProperty!.connectedRoads!.lastOrNull?.toString() ??
                          '') ??
                  '';
        }
        updatePropertyDetails(
          localizationsContext.connectedRoad,
          null,
        );
      }

      if (_editProperty!.schemeTypeId != null) {
        selectSchemeType(_editProperty!.schemeTypeId!);
      }

      if (_editProperty!.frontSize != null) {
        updatePropertyDetails(
          localizationsContext.frontSize,
          StaticFunctions.removeTrailingZeros(
            _editProperty!.frontSize.toString().trim(),
          ),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.depthSize != null) {
        updatePropertyDetails(
          localizationsContext.depthSize,
          StaticFunctions.removeTrailingZeros(
            _editProperty!.depthSize.toString().trim(),
          ),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.addressLandMark != null) {
        updatePropertyDetails(
          localizationsContext.addressLandmark,
          _editProperty!.addressLandMark,
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.publicAddressLandMark != null) {
        updatePropertyDetails(
          localizationsContext.publicAddressLandmark,
          _editProperty!.publicAddressLandMark,
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.area != null) {
        updateLocationInfo(
          RetrieveLocationArg(
            areaName: _editProperty!.area,
            coordinates: LatLng(
              _editProperty!.latitude ?? 0,
              _editProperty!.longitude ?? 0,
            ),
          ),
        );
      }

      if (_editProperty!.roomCount != null) {
        updatePropertyDetails(
          localizationsContext.rooms,
          _editProperty!.roomCount.toString(),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.bathRoomCount != null) {
        updatePropertyDetails(
          localizationsContext.bathRooms,
          _editProperty!.bathRoomCount.toString(),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.floorCount != null) {
        updatePropertyDetails(
          localizationsContext.floors,
          _editProperty!.floorCount.toString(),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.totalFloorCount != null) {
        updatePropertyDetails(
          localizationsContext.totalFloors,
          _editProperty!.totalFloorCount.toString(),
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.amenitiesValues != null &&
          _editProperty!.amenitiesValues!.isNotEmpty) {
        final saved = await _isarService.getAmenitiesBasedOnName(
          _editProperty!.amenitiesValues!,
        );
        selectPropertyAmenity(
          selection: saved,
        );
      }

      if (_editProperty!.preferredCommunityValues != null &&
          _editProperty!.preferredCommunityValues!.isNotEmpty) {
        final saved = await _isarService.getPreferredCommunityBasedOnValues(
          _editProperty!.preferredCommunityValues!,
        );
        selectPropertyCast(
          selection: saved,
        );
      }

      if (_editProperty!.tags != null && _editProperty!.tags!.isNotEmpty) {
        _editProperty!.tags!.forEach(
          (element) {
            addOrDeleteTagList(
              false,
              element.trim(),
            );
          },
        );
      }

      if (_editProperty!.sellerName != null) {
        updatePropertyDetails(
          localizationsContext.sellerName,
          _editProperty!.sellerName,
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.sellerPhoneNo != null) {
        updatePropertyDetails(
          localizationsContext.sellerMobile,
          _editProperty!.sellerPhoneNo,
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.sellerEmail != null) {
        updatePropertyDetails(
          localizationsContext.email,
          _editProperty!.sellerEmail,
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.brokerChain != null) {
        updatePropertyDetails(
          localizationsContext.chainOfBrokers,
          _editProperty!.brokerChain,
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.comments != null) {
        updatePropertyDetails(
          localizationsContext.propertyNote,
          _editProperty!.comments,
          isFieldDefaultValue: true,
        );
      }

      if (_editProperty!.isPublicProperty) {
        selectPropertyVisibility(SaveDefaultData.propertyVisibilityPublicId);
      } else {
        selectPropertyVisibility(SaveDefaultData.propertyVisibilityPrivateId);
      }

      // For Exchange Allow flag
      updateAllowExchangeOption(
        _editProperty!.exchangeAllowed,
      );

      updateNegotiationOption(
        _editProperty!.negotiationAllowed,
      );
    }
  }

  openContactsToPickPhone() async {
    final contactInfo = await ContactHelper.chooseFromContacts();
    if (contactInfo != null) {
      if (contactInfo.name.trim().isNotEmpty) {
        updatePropertyDetails(
          localizationsContext.sellerName,
          contactInfo.name.trim(),
          isFieldDefaultValue: true,
        );
      }
      if (contactInfo.phoneNo.trim().isNotEmpty) {
        updatePropertyDetails(
          localizationsContext.sellerMobile,
          contactInfo.phoneNo.trim(),
          isFieldDefaultValue: true,
        );
      }

      if (contactInfo.email.trim().isNotEmpty) {
        updatePropertyDetails(
          localizationsContext.email,
          contactInfo.email.trim(),
          isFieldDefaultValue: true,
        );
      }
    }
  }

  updateAllowExchangeOption(bool value) {
    _exchangeAllowed = value;
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.allowExchange,
      value,
    );
  }

  calculateSellPriceBySize() {
    final sell = propertyForList.firstWhereOrNull(
      (element) => element.id == SaveDefaultData.propertyForSellId,
    );
    if (sell == null) {
      return;
    }

    double minPrice = 0;
    if (minSellPriceRangeController.text.trim().isNotEmpty) {
      minPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          minSellPriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _minSellPriceUnit,
      );
    }

    double maxPrice = 0;
    if (maxSellPriceRangeController.text.trim().isNotEmpty) {
      maxPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          maxSellPriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _maxSellPriceUnit,
      );
    }

    updatePropertyDetails(
      localizationsContext.sellPriceBySizeTag,
      _calcPriceBySizeHelper(
        minPrice,
        maxPrice,
        totalSizeController.text,
      ),
      isFieldDefaultValue: true,
    );
  }

  calculateRentPriceBySize() {
    final rent = propertyForList.firstWhereOrNull(
      (element) => element.id == SaveDefaultData.propertyForRentId,
    );
    if (rent == null) {
      return;
    }

    double minPrice = 0;
    if (minRentPriceRangeController.text.trim().isNotEmpty) {
      minPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          minRentPriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _minRentPriceUnit,
      );
    }

    double maxPrice = 0;
    if (maxRentPriceRangeController.text.trim().isNotEmpty) {
      maxPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          maxRentPriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _maxRentPriceUnit,
      );
    }

    updatePropertyDetails(
      localizationsContext.rentPriceBySizeTag,
      _calcPriceBySizeHelper(
        minPrice,
        maxPrice,
        totalSizeController.text,
      ),
      isFieldDefaultValue: true,
    );
  }

  calculateLeasePriceBySize() {
    final lease = propertyForList.firstWhereOrNull(
      (element) => element.id == SaveDefaultData.propertyForLeaseId,
    );
    if (lease == null) {
      return;
    }

    double minPrice = 0;
    if (minLeasePriceRangeController.text.trim().isNotEmpty) {
      minPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          minLeasePriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _minLeasePriceUnit,
      );
    }

    double maxPrice = 0;
    if (maxLeasePriceRangeController.text.trim().isNotEmpty) {
      maxPrice = StaticFunctions.convertPriceToFull(
        double.parse(
          maxLeasePriceRangeController.text.trim().replaceAll(',', ''),
        ),
        _maxLeasePriceUnit,
      );
    }

    updatePropertyDetails(
      localizationsContext.leasePriceBySizeTag,
      _calcPriceBySizeHelper(
        minPrice,
        maxPrice,
        totalSizeController.text,
      ),
      isFieldDefaultValue: true,
    );
  }

  onPriceBySizeChange({
    required PriceEnum priceEnum,
  }) {
    final measurementController = totalSizeController;
    final pricePerSizeController = priceEnum == PriceEnum.sell
        ? sellPricePerSizeController
        : priceEnum == PriceEnum.rent
            ? rentPricePerSizeController
            : leasePricePerSizeController;
    final priceRangeController = priceEnum == PriceEnum.sell
        ? minSellPriceRangeController
        : priceEnum == PriceEnum.rent
            ? minRentPriceRangeController
            : minLeasePriceRangeController;

    final focusNode = priceEnum == PriceEnum.sell
        ? sellPricePerSizeFocusNode
        : priceEnum == PriceEnum.rent
            ? rentPricePerSizeFocusNode
            : leasePricePerSizeFocusNode;

    if (focusNode.hasFocus &&
        measurementController.text.trim().isNotEmpty &&
        pricePerSizeController.text.trim().isNotEmpty) {
      final minPriceBySize = double.tryParse(
          pricePerSizeController.text.trim().replaceAll(',', ''));
      final minMeasure = double.tryParse(
          measurementController.text.trim().replaceAll(',', ''));
      if (minPriceBySize != null && minMeasure != null) {
        final priceFromUnit = minPriceBySize * minMeasure;
        // ------------------------------------------------
        final tempPriceUnit =
            StaticFunctions.getPriceUnitAccordingPriceBySizeChanges(
          priceFromUnit,
        );
        if (priceEnum == PriceEnum.sell) {
          selectSellPriceUnit(
            id: tempPriceUnit,
            isMin: true,
          );
        } else if (priceEnum == PriceEnum.rent) {
          selectRentPriceUnit(
            id: tempPriceUnit,
            isMin: true,
          );
        } else {
          selectLeasePriceUnit(
            id: tempPriceUnit,
            isMin: true,
          );
        }
        final value =
            StaticFunctions.shortPriceRangeValue(priceFromUnit, tempPriceUnit);
        // ------------------------------------------------
        priceRangeController.text = StaticFunctions.formatPrice(
          StaticFunctions.removeTrailingZeros(
            value.toStringAsFixed(AppConfig.pricingDecimalLimit),
          ),
        );
      }
    } else if (focusNode.hasFocus &&
        (measurementController.text.trim().isEmpty ||
            pricePerSizeController.text.trim().isEmpty)) {
      priceRangeController.text = '';
    }
    updatePropertyDetails(
      priceEnum == PriceEnum.sell
          ? localizationsContext.sellPriceBySizeTag
          : priceEnum == PriceEnum.rent
              ? localizationsContext.rentPriceBySizeTag
              : priceEnum == PriceEnum.lease
                  ? localizationsContext.leasePriceBySizeTag
                  : '',
      pricePerSizeController.text,
    );
    if (priceEnum == PriceEnum.sell) {
      setSellPriceRangeText();
    } else if (priceEnum == PriceEnum.rent) {
      setRentPriceRangeText();
    } else if (priceEnum == PriceEnum.lease) {
      setLeasePriceRangeText();
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

  _clearCacheImageFromPath(File file) async {
    final cacheDir = await getTemporaryDirectory();
    if (file.path.startsWith(cacheDir.path)) {
      if (await file.exists()) {
        await file.delete();
      }
    }
  }

  showSuccessScreen(
    BuildContext context,
    DbProperty savedProperty,
  ) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    if (AppConfig.showAddPropertySuccessScreen) {
      Navigator.pushReplacementNamed(
        context,
        Routes.addPropertySuccess,
        arguments: {
          'isEdit': _isEditedPropertyForSave(),
          'property': savedProperty,
        },
      );
    } else {
      SnackBarView.showSnackBar(
        context,
        _isEditedPropertyForSave()
            ? localizationsContext.propertyUpdatedSuccessfullyToast
            : localizationsContext.propertyAddedSuccessfullyToast,
        durationInSec: 1,
      );
      // Directly jump to dashboard
      _goToPropertyListOnAddSuccess(context);
    }
  }

  selectPropertyType(int propertyId) {
    final index = propertyTypeList.indexWhere(
      (element) => element.id == propertyId,
    );
    if (index != (-1)) {
      for (int i = 0; i < propertyTypeList.length; i++) {
        if (propertyTypeList[i].id != propertyTypeList[index].id) {
          propertyTypeList[i].isSelected = false;
        }
      }
      propertyTypeList[index].isSelected = !propertyTypeList[index].isSelected;
    }
    _isAnyChangeInPropertyType = propertyTypeList.any(
      (element) => element.isSelected,
    );
    _resetDataOnTypeChange();
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.propertyType,
      null,
    );
  }

  _resetDataOnTypeChange() {
    _resetBuildingTypes();
    _resetConstructionTypes();
    _resetFurnishedTypes();
    _resetAdditionalFurnishTypes();
    _resetBhkTypes();
    _resetConnectedRoadTypes();
    _resetBathroom();
    _resetFloors();
    _resetTotalFloors();
    _resetRooms();
    _resetFrontAndDepth();
    _resetFacingTypes();
    _resetAmenitiesTypes();
    enableWashroom(isWashroomAvailable);
    enableBalcony(isBalconyAvailable);
    enableCornerPiece(isCornerPiece);
    enableLightConnection(isLightConnectionAvailable);
    enableWell(isWellAvailable);
    enableAllottedParking(isAllottedParkingAvailable);
    enableParking(isParkingAvailable);
    enableLift(isLiftAvailable);
    notifyListeners();
  }

  _resetBuildingTypes() {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    final selectedBuildingType =
        buildingTypeList.firstWhereOrNull((element) => element.isSelected);
    final isBungalow =
        _selectedPropertyType == SaveDefaultData.propertyTypeBungalowId;
    final isPlot = _selectedPropertyType == SaveDefaultData.propertyTypePlotId;
    final isLand =
        _selectedPropertyType == SaveDefaultData.propertyTypeAgricultureLandId;
    buildingTypeList.clear();
    if (isBungalow || isPlot || isLand) {
      _allBuildingTypes.forEach((element) {
        element.isSelected = false;
        if (isBungalow &&
            (element.id == SaveDefaultData.propertyResidentialTypeId ||
                element.id == SaveDefaultData.propertyCommercialTypeId)) {
          if (!buildingTypeList.contains(element)) {
            buildingTypeList.add(element);
          }
        }
        if (isPlot &&
            (element.id == SaveDefaultData.propertyResidentialTypeId ||
                element.id == SaveDefaultData.propertyCommercialTypeId ||
                element.id == SaveDefaultData.propertyIndustrialTypeId)) {
          if (!buildingTypeList.contains(element)) {
            buildingTypeList.add(element);
          }
        }
        if (isLand &&
            (element.id == SaveDefaultData.propertyResidentialTypeId ||
                element.id == SaveDefaultData.propertyGreenTypeId ||
                element.id == SaveDefaultData.propertyFreeTypeId ||
                element.id == SaveDefaultData.propertyIndustrialTypeId)) {
          if (!buildingTypeList.contains(element)) {
            buildingTypeList.add(element);
          }
        }
      });
    }
    if (selectedBuildingType?.id != null) {
      selectBuildingType(selectedBuildingType!.id);
    } else {
      updatePropertyDetails(
        localizationsContext.buildingType,
        null,
      );
      notifyListeners();
    }
  }

  _resetConstructionTypes() {
    final selectedConstruction = constructionTypeList.firstWhereOrNull(
      (element) => element.isSelected,
    );
    if (selectedConstruction != null) {
      selectConstructionType(selectedConstruction.id);
    }
  }

  _resetFurnishedTypes() {
    final selectedFurnished = furnishedStatusList.firstWhereOrNull(
      (element) => element.isSelected,
    );
    if (selectedFurnished != null) {
      selectFurnished(selectedFurnished.id);
    }
  }

  _resetFacingTypes() {
    final selectedFacing = facingTypeList.firstWhereOrNull(
      (element) => element.isSelected,
    );
    if (selectedFacing != null) {
      selectFacingType(selectedFacing.id);
    }
  }

  _resetAmenitiesTypes() {
    final selectedAmenities =
        amenitiesList.where((element) => element.isSelected).toList();
    selectPropertyAmenity(selection: selectedAmenities);
  }

  _resetAdditionalFurnishTypes() {
    final selectedAdditionalFurnish =
        additionalFurnishList.where((element) => element.isSelected).toList();
    selectAdditionalFurnish(selection: selectedAdditionalFurnish);
  }

  _resetBathroom() {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    if (!CommonPropertyDataProvider.checkForBathRoom([_selectedPropertyType])) {
      propertyBathRoomsController.text = '';
      notifyListeners();
    }
  }

  _resetFloors() {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    if (!CommonPropertyDataProvider.checkForFloor([_selectedPropertyType])) {
      propertyFloorsController.text = '';
      notifyListeners();
    }
  }

  _resetTotalFloors() {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    if (!CommonPropertyDataProvider.checkForTotalFloor(
        [_selectedPropertyType])) {
      propertyTotalFloorsController.text = '';
      notifyListeners();
    }
  }

  _resetRooms() {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    if (!CommonPropertyDataProvider.checkForRoom([_selectedPropertyType])) {
      propertyRoomsController.text = '';
      notifyListeners();
    }
  }

  _resetFrontAndDepth() {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    if (!CommonPropertyDataProvider.checkForFrontDepthSize(
        [_selectedPropertyType])) {
      propertyFrontSizeController.text = '';
      propertyDepthSizeController.text = '';
      notifyListeners();
    }
  }

  _resetConnectedRoadTypes() {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected)?.id;
    if (!CommonPropertyDataProvider.checkForConnectedRoad(
        [_selectedPropertyType])) {
      firstConnectedRoadController.text = '';
      secondConnectedRoadController.text = '';
      notifyListeners();
    }
  }

  _resetBhkTypes() {
    final selectedBhk = bhkTypeList.firstWhereOrNull(
      (element) => element.isSelected,
    );
    if (selectedBhk != null) {
      selectBhkType(selectedBhk.id);
    }
  }

  void selectConstructionType(
    int type, {
    isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final _constructionToSelect =
        constructionTypeList.firstWhereOrNull((element) => element.id == type);
    final _selectedConstruction =
        constructionTypeList.firstWhereOrNull((element) => element.isSelected);
    if (_selectedConstruction == null ||
        isUserTapped == false ||
        _selectedConstruction.id != type) {
      constructionTypeList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_constructionToSelect != null &&
          CommonPropertyDataProvider.checkForConstruction(
              [_selectedPropertyType?.id])) {
        _constructionToSelect.isSelected = true;
      }
    } else {
      _selectedConstruction.isSelected = !_selectedConstruction.isSelected;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.construction,
      null,
    );
  }

  void selectSchemeType(
    int type, {
    isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    final _schemeToSelect =
        schemeTypeList.firstWhereOrNull((element) => element.id == type);
    final _selectedScheme =
        schemeTypeList.firstWhereOrNull((element) => element.isSelected);
    if (_selectedScheme == null ||
        isUserTapped == false ||
        _selectedScheme.id != type) {
      schemeTypeList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_schemeToSelect != null &&
          CommonPropertyDataProvider.checkForScheme(
              [_selectedPropertyType?.id])) {
        _schemeToSelect.isSelected = true;
      }
    } else {
      _selectedScheme.isSelected = !_selectedScheme.isSelected;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.scheme,
      null,
    );
  }

  selectPropertyFor(int selectedId) {
    final index = propertyForList.indexWhere(
      (element) => element.id == selectedId,
    );
    if (index != (-1)) {
      propertyForList[index].isSelected = !propertyForList[index].isSelected;
    }
    _isAnyChangeInPropertyFor = propertyForList.any(
      (element) => element.isSelected,
    );
    sellPricePerSizeFocusNode = FocusNode();
    rentPricePerSizeFocusNode = FocusNode();
    leasePricePerSizeFocusNode = FocusNode();
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.propertyFor,
      null,
    );
    _selectDefaultPriceUnitValues();
  }

  selectAdditionalFurnish({
    List<DbAdditionalFurnish> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType = propertyTypeList.firstWhereOrNull(
      (element) => element.isSelected,
    );
    if (selection.isNotEmpty &&
        CommonPropertyDataProvider.isNotPlotOrLandMark(
          [_selectedPropertyType?.id],
        )) {
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
          (element) {
            element.isSelected = selection.contains(element);
          },
        );
      }
    } else {
      additionalFurnishList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.additionalFurnishing,
      null,
    );
  }

  void selectFacingType(
    int type, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType = propertyTypeList.firstWhereOrNull(
      (element) => element.isSelected,
    );
    final _facingToSelect = facingTypeList.firstWhereOrNull(
      (element) => element.id == type,
    );
    final _selectedFacing = facingTypeList.firstWhereOrNull(
      (element) => element.isSelected,
    );
    if (isUserTapped == false ||
        _selectedFacing == null ||
        _selectedFacing.id != type) {
      facingTypeList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_facingToSelect != null &&
          CommonPropertyDataProvider.checkForFacingType(
            [_selectedPropertyType?.id],
          )) {
        _facingToSelect.isSelected = true;
      }
    } else {
      _selectedFacing.isSelected = !_selectedFacing.isSelected;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.facingType,
      null,
    );
  }

  void selectPropertyAmenity({
    List<DbPropertyAmenity> selection = const [],
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    if (selection.isNotEmpty &&
        CommonPropertyDataProvider.isNotPlotOrLandMark(
            [_selectedPropertyType?.id])) {
      if (isUserTapped) {
        selection.forEach(
          (element) {
            final elementToSelect =
                amenitiesList[amenitiesList.indexOf(element)];
            elementToSelect.isSelected = !elementToSelect.isSelected;
          },
        );
      } else {
        amenitiesList.forEach(
          (element) {
            element.isSelected = selection.contains(element);
          },
        );
      }
    } else {
      amenitiesList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.amenities,
      null,
    );
  }

  void selectPropertyCast({
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
          (element) {
            element.isSelected = selection.contains(element);
          },
        );
      }
    } else {
      preferredCastList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.preferredCast,
      null,
    );
  }

  void selectBhkType(
    int type, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    var _bhkToSelect =
        bhkTypeList.firstWhereOrNull((element) => element.id == type);
    var _selectedBhk =
        bhkTypeList.firstWhereOrNull((element) => element.isSelected);
    if (_selectedBhk == null ||
        isUserTapped == false ||
        _selectedBhk.id != type) {
      bhkTypeList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_bhkToSelect != null &&
          CommonPropertyDataProvider.checkForBhk(
            [_selectedPropertyType?.id],
          )) {
        _bhkToSelect.isSelected = true;
      }
    } else {
      _selectedBhk.isSelected = !_selectedBhk.isSelected;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.bhk,
      null,
    );
  }

  void selectFurnished(
    int type, {
    bool isUserTapped = false,
  }) {
    final _selectedPropertyType =
        propertyTypeList.firstWhereOrNull((element) => element.isSelected);
    var _furnishToSelect =
        furnishedStatusList.firstWhereOrNull((element) => element.id == type);
    var _selectedFurnish =
        furnishedStatusList.firstWhereOrNull((element) => element.isSelected);
    if (_selectedFurnish == null ||
        isUserTapped == false ||
        _selectedFurnish.id != type) {
      furnishedStatusList.forEach(
        (element) {
          element.isSelected = false;
        },
      );
      if (_furnishToSelect != null &&
          CommonPropertyDataProvider.isNotPlotOrLandMark(
              [_selectedPropertyType?.id])) {
        _furnishToSelect.isSelected = true;
      }
    } else {
      _selectedFurnish.isSelected = !_selectedFurnish.isSelected;
    }
    notifyListeners();
    updatePropertyDetails(
      localizationsContext.furnishedStatus,
      null,
    );
  }

  initPriceRange() {
    minSellPriceRangeController.text = '';
    maxSellPriceRangeController.text = '';
    minRentPriceRangeController.text = '';
    maxRentPriceRangeController.text = '';
    minLeasePriceRangeController.text = '';
    maxLeasePriceRangeController.text = '';

    sellPriceRangeDropdownUnitList = [
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

    rentPriceRangeDropdownUnitList = [
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

    leasePriceRangeDropdownUnitList = [
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

    selectSellPriceUnit(
      id: SaveDefaultData.filterPriceUnitThousand,
      isMin: false,
    );
    selectSellPriceUnit(
      id: SaveDefaultData.filterPriceUnitThousand,
      isMin: true,
    );
    selectRentPriceUnit(
      id: SaveDefaultData.filterPriceUnitThousand,
      isMin: false,
    );
    selectRentPriceUnit(
      id: SaveDefaultData.filterPriceUnitThousand,
      isMin: true,
    );
    selectLeasePriceUnit(
      id: SaveDefaultData.filterPriceUnitThousand,
      isMin: false,
    );
    selectLeasePriceUnit(
      id: SaveDefaultData.filterPriceUnitThousand,
      isMin: true,
    );
  }

  onSellPriceRangeDropdownSizeChange(bool isMin, Size newSize) {
    if (isMin) {
      minSellPriceDropdownSize = newSize;
    } else {
      maxSellPriceDropdownSize = newSize;
    }
    notifyListeners();
  }

  onRentPriceRangeDropdownSizeChange(bool isMin, Size newSize) {
    if (isMin) {
      minRentPriceDropdownSize = newSize;
    } else {
      maxRentPriceDropdownSize = newSize;
    }
    notifyListeners();
  }

  onLeasePriceRangeDropdownSizeChange(bool isMin, Size newSize) {
    if (isMin) {
      minLeasePriceDropdownSize = newSize;
    } else {
      maxLeasePriceDropdownSize = newSize;
    }
    notifyListeners();
  }

  selectSellPriceUnit({
    required int id,
    required bool isMin,
  }) {
    var unitToSelect = sellPriceRangeDropdownUnitList
        .firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      if (isMin) {
        _minSellPriceUnit = unitToSelect.id;
        minSellPriceUnitTextFieldController.text = unitToSelect.unit;
      } else {
        _maxSellPriceUnit = unitToSelect.id;
        maxSellPriceUnitTextFieldController.text = unitToSelect.unit;
      }
      StaticFunctions.fieldCursorPositionAtLast(
        isMin
            ? minSellPriceUnitTextFieldController
            : maxSellPriceUnitTextFieldController,
      );
    }
    setSellPriceRangeText();
    notifyListeners();
  }

  setSellPriceRangeText() {
    sellPriceRangeText = '';
    final minUnitString = StaticFunctions.getPriceUnitLongString(
      localizationsContext,
      _minSellPriceUnit,
    );
    final maxUnitString = StaticFunctions.getPriceUnitLongString(
      localizationsContext,
      _maxSellPriceUnit,
    );
    final enteredMinPrice =
        minSellPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                minSellPriceRangeController.text.trim().replaceAll(',', ''),
              )
            : null;
    final enteredMaxPrice =
        maxSellPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                maxSellPriceRangeController.text.trim().replaceAll(',', ''),
              )
            : null;

    final minPriceWithUnit = enteredMinPrice != null
        ? StaticFunctions.convertPriceToFull(
            enteredMinPrice,
            _minSellPriceUnit,
          )
        : null;
    final maxPriceWithUnit = enteredMaxPrice != null
        ? StaticFunctions.convertPriceToFull(
            enteredMaxPrice,
            _maxSellPriceUnit,
          )
        : null;

    if (minPriceWithUnit != null &&
        maxPriceWithUnit != null &&
        minPriceWithUnit > maxPriceWithUnit) {
      sellPriceRangeText = localizationsContext.minMaxError;
      notifyListeners();
      checkForPropertyInfoValid();
      return;
    }

    updatePropertyDetails(
      localizationsContext.minSellPriceTag,
      minPriceWithUnit,
    );

    updatePropertyDetails(
      localizationsContext.maxSellPriceTag,
      maxPriceWithUnit,
    );

    updatePropertyDetails(
      localizationsContext.minSellPriceUnitIdTag,
      _minSellPriceUnit,
    );

    updatePropertyDetails(
      localizationsContext.maxSellPriceUnitIdTag,
      _maxSellPriceUnit,
    );

    //TODO: Removed price unit symbol
    if (minSellPriceRangeController.text.toString().trim().isNotEmpty &&
        minPriceWithUnit != null) {
      /*sellPriceRangeText =
          '${StaticFunctions.defaultPriceUnit}${minSellPriceRangeController.text.toString().trim()} $minUnitString';*/
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
      sellPriceRangeText = '$priceToShow $unitString';
    }

    //TODO: Removed price unit symbol
    if (maxSellPriceRangeController.text.toString().trim().isNotEmpty &&
        maxPriceWithUnit != null) {
      if (sellPriceRangeText.trim().isNotEmpty) {
        sellPriceRangeText += ' - ';
      }
      /*sellPriceRangeText +=
          '${StaticFunctions.defaultPriceUnit}${maxSellPriceRangeController.text.toString().trim()} $maxUnitString';*/
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
      sellPriceRangeText += '$priceToShow $unitString';
    }
    notifyListeners();
  }

  selectRentPriceUnit({
    required int id,
    required bool isMin,
  }) {
    var unitToSelect = rentPriceRangeDropdownUnitList
        .firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      if (isMin) {
        _minRentPriceUnit = unitToSelect.id;
        minRentPriceUnitTextFieldController.text = unitToSelect.unit;
      } else {
        _maxRentPriceUnit = unitToSelect.id;
        maxRentPriceUnitTextFieldController.text = unitToSelect.unit;
      }
      StaticFunctions.fieldCursorPositionAtLast(
        isMin
            ? minRentPriceUnitTextFieldController
            : maxRentPriceUnitTextFieldController,
      );
    }
    setRentPriceRangeText();
    notifyListeners();
  }

  setRentPriceRangeText() {
    rentPriceRangeText = '';
    final minUnitString = StaticFunctions.getPriceUnitLongString(
      localizationsContext,
      _minRentPriceUnit,
    );
    final maxUnitString = StaticFunctions.getPriceUnitLongString(
      localizationsContext,
      _maxRentPriceUnit,
    );
    final enteredMinPrice =
        minRentPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                minRentPriceRangeController.text.trim().replaceAll(',', ''),
              )
            : null;
    final enteredMaxPrice =
        maxRentPriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                maxRentPriceRangeController.text.trim().replaceAll(',', ''),
              )
            : null;

    final minPriceWithUnit = enteredMinPrice != null
        ? StaticFunctions.convertPriceToFull(
            enteredMinPrice,
            _minRentPriceUnit,
          )
        : null;
    final maxPriceWithUnit = enteredMaxPrice != null
        ? StaticFunctions.convertPriceToFull(
            enteredMaxPrice,
            _maxRentPriceUnit,
          )
        : null;

    if (minPriceWithUnit != null &&
        maxPriceWithUnit != null &&
        minPriceWithUnit > maxPriceWithUnit) {
      rentPriceRangeText = localizationsContext.minMaxError;
      notifyListeners();
      checkForPropertyInfoValid();
      return;
    }

    updatePropertyDetails(
      localizationsContext.minRentPriceTag,
      minPriceWithUnit,
    );

    updatePropertyDetails(
      localizationsContext.maxRentPriceTag,
      maxPriceWithUnit,
    );

    updatePropertyDetails(
      localizationsContext.minRentPriceUnitIdTag,
      _minRentPriceUnit,
    );

    updatePropertyDetails(
      localizationsContext.maxRentPriceUnitIdTag,
      _maxRentPriceUnit,
    );

    //TODO: Removed price unit symbol
    if (minRentPriceRangeController.text.toString().trim().isNotEmpty &&
        minPriceWithUnit != null) {
      /*rentPriceRangeText =
          '${StaticFunctions.defaultPriceUnit}${minRentPriceRangeController.text.toString().trim()} $minUnitString';*/
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
      rentPriceRangeText = '$priceToShow $unitString';
    }

    //TODO: Removed price unit symbol
    if (maxRentPriceRangeController.text.toString().trim().isNotEmpty &&
        maxPriceWithUnit != null) {
      if (rentPriceRangeText.trim().isNotEmpty) {
        rentPriceRangeText += ' - ';
      }
      /*rentPriceRangeText +=
          '${StaticFunctions.defaultPriceUnit}${maxRentPriceRangeController.text.toString().trim()} $maxUnitString';*/
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
      rentPriceRangeText += '$priceToShow $unitString';
    }
    notifyListeners();
  }

  selectLeasePriceUnit({
    required int id,
    required bool isMin,
  }) {
    var unitToSelect = leasePriceRangeDropdownUnitList
        .firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      if (isMin) {
        _minLeasePriceUnit = unitToSelect.id;
        minLeasePriceUnitTextFieldController.text = unitToSelect.unit;
      } else {
        _maxLeasePriceUnit = unitToSelect.id;
        maxLeasePriceUnitTextFieldController.text = unitToSelect.unit;
      }
      StaticFunctions.fieldCursorPositionAtLast(
        isMin
            ? minLeasePriceUnitTextFieldController
            : maxLeasePriceUnitTextFieldController,
      );
    }
    setLeasePriceRangeText();
    notifyListeners();
  }

  setLeasePriceRangeText() {
    leasePriceRangeText = '';
    final minUnitString = StaticFunctions.getPriceUnitLongString(
      localizationsContext,
      _minLeasePriceUnit,
    );
    final maxUnitString = StaticFunctions.getPriceUnitLongString(
      localizationsContext,
      _maxLeasePriceUnit,
    );
    final enteredMinPrice =
        minLeasePriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                minLeasePriceRangeController.text.trim().replaceAll(',', ''),
              )
            : null;
    final enteredMaxPrice =
        maxLeasePriceRangeController.text.toString().trim().isNotEmpty
            ? double.tryParse(
                maxLeasePriceRangeController.text.trim().replaceAll(',', ''),
              )
            : null;

    final minPriceWithUnit = enteredMinPrice != null
        ? StaticFunctions.convertPriceToFull(
            enteredMinPrice,
            _minLeasePriceUnit,
          )
        : null;
    final maxPriceWithUnit = enteredMaxPrice != null
        ? StaticFunctions.convertPriceToFull(
            enteredMaxPrice,
            _maxLeasePriceUnit,
          )
        : null;

    if (minPriceWithUnit != null &&
        maxPriceWithUnit != null &&
        minPriceWithUnit > maxPriceWithUnit) {
      leasePriceRangeText = localizationsContext.minMaxError;
      notifyListeners();
      checkForPropertyInfoValid();
      return;
    }

    updatePropertyDetails(
      localizationsContext.minLeasePriceTag,
      minPriceWithUnit,
    );

    updatePropertyDetails(
      localizationsContext.maxLeasePriceTag,
      maxPriceWithUnit,
    );

    updatePropertyDetails(
      localizationsContext.minLeasePriceUnitIdTag,
      _minLeasePriceUnit,
    );

    updatePropertyDetails(
      localizationsContext.maxLeasePriceUnitIdTag,
      _maxLeasePriceUnit,
    );

    //TODO: Removed price unit symbol
    if (minLeasePriceRangeController.text.toString().trim().isNotEmpty &&
        minPriceWithUnit != null) {
      /*leasePriceRangeText =
          '${StaticFunctions.defaultPriceUnit}${minLeasePriceRangeController.text.toString().trim()} $minUnitString';*/
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
      leasePriceRangeText = '$priceToShow $unitString';
    }

    //TODO: Removed price unit symbol
    if (maxLeasePriceRangeController.text.toString().trim().isNotEmpty &&
        maxPriceWithUnit != null) {
      if (leasePriceRangeText.trim().isNotEmpty) {
        leasePriceRangeText += ' - ';
      }
      /*leasePriceRangeText +=
          '${StaticFunctions.defaultPriceUnit}${maxLeasePriceRangeController.text.toString().trim()} $maxUnitString';*/
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
      leasePriceRangeText += '$priceToShow $unitString';
    }
    notifyListeners();
  }

  onMeasureUnitDropdownSizeChange(Size newSize) {
    measureDropdownSize = newSize;
    notifyListeners();
  }

  selectMeasureUnit(int id) {
    final unitToSelect =
        areaUnitList.firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      _selectedMeasureUnit = unitToSelect.id;
      measureUnitTextFieldController.text = unitToSelect.shortName;
      StaticFunctions.fieldCursorPositionAtLast(measureUnitTextFieldController);
    }
    notifyListeners();
  }

  Iterable<BuyerSellerInfo> getFilteredSeller(String query) {
    Iterable<BuyerSellerInfo> filteredNameList = [];
    if (_savedSellersList.isNotEmpty &&
        ownerNameController.text.trim().isNotEmpty) {
      filteredNameList = _savedSellersList.where((element) =>
          (element.name != null &&
              element.name!.toLowerCase().contains(query.toLowerCase())) ||
          (element.phone != null && element.phone!.startsWith(query.trim())));
    }
    return filteredNameList;
  }

  selectSellerSuggestion(BuildContext context, BuyerSellerInfo selected) {
    ownerNameController.text = selected.name ?? '';
    sellerPhoneController.text = selected.phone ?? '';
    FocusScope.of(context).requestFocus(FocusNode());
    if (selected.name != null && selected.name!.trim().isNotEmpty) {
      updatePropertyDetails(
        localizationsContext.sellerName,
        selected.name!.trim(),
        isFieldDefaultValue: true,
      );
    }
    if (selected.phone != null && selected.phone!.trim().isNotEmpty) {
      updatePropertyDetails(
        localizationsContext.sellerMobile,
        selected.phone!.trim(),
        isFieldDefaultValue: true,
      );
    }
  }

  checkIfAnyChanges() {
    return ownerNameController.text.trim().isNotEmpty ||
        sellerPhoneController.text.trim().isNotEmpty ||
        _isAnyChangeInPropertyType ||
        _isAnyChangeInPropertyFor ||
        minSellPriceRangeController.text.trim().isNotEmpty ||
        maxSellPriceRangeController.text.trim().isNotEmpty ||
        minRentPriceRangeController.text.trim().isNotEmpty ||
        maxRentPriceRangeController.text.trim().isNotEmpty ||
        minLeasePriceRangeController.text.trim().isNotEmpty ||
        maxLeasePriceRangeController.text.trim().isNotEmpty ||
        firstConnectedRoadController.text.trim().isNotEmpty ||
        secondConnectedRoadController.text.trim().isNotEmpty ||
        propertyPrivateLocationController.text.trim().isNotEmpty ||
        propertyPublicLocationController.text.trim().isNotEmpty ||
        totalSizeController.text.trim().isNotEmpty ||
        _selectedImages.isNotEmpty ||
        buildingTypeList.any((element) => element.isSelected) ||
        constructionTypeList.any((element) => element.isSelected) ||
        schemeTypeList.any((element) => element.isSelected) ||
        furnishedStatusList.any((element) => element.isSelected) ||
        additionalFurnishList.any((element) => element.isSelected) ||
        bhkTypeList.any((element) => element.isSelected) ||
        propertyBathRoomsController.text.trim().isNotEmpty ||
        propertyRoomsController.text.trim().isNotEmpty ||
        propertyFloorsController.text.trim().isNotEmpty ||
        propertyTotalFloorsController.text.trim().isNotEmpty ||
        propertyFrontSizeController.text.trim().isNotEmpty ||
        propertyDepthSizeController.text.trim().isNotEmpty ||
        ownerCommentsController.text.trim().isNotEmpty ||
        chainOfBrokersController.text.trim().isNotEmpty ||
        _isAnyChangeInVisibility ||
        exchangedAllowed ||
        tagList.isNotEmpty ||
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
        amenitiesList.any((element) => element.isSelected);
  }

  _getSellerList() async {
    _savedSellersList =
        await CommonPropertyDataProvider.getAllSellerWithProperties();
  }

  Iterable<DbLocationTags> getFilteredLocation(
    String query,
    bool isPublic,
  ) {
    Iterable<DbLocationTags> filteredNameList = [];
    bool isValidText = false;
    if (isPublic) {
      isValidText = propertyPublicLocationController.text.trim().isNotEmpty;
    } else {
      isValidText = propertyPrivateLocationController.text.trim().isNotEmpty;
    }
    if (_savedLocationTags.isNotEmpty && isValidText) {
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

  selectLocationSuggestion(
    BuildContext context,
    DbLocationTags selected,
    bool isPublic,
  ) {
    String currentText = '';
    if (isPublic) {
      currentText = propertyPublicLocationController.text.toString();
    } else {
      currentText = propertyPrivateLocationController.text.toString();
    }
    final data = currentText.split(',').last;
    currentText = currentText.substring(
      0,
      currentText.lastIndexOf(data) < 0 ? 0 : currentText.lastIndexOf(data),
    );
    String newText = currentText +
        (currentText.trim().isEmpty ? '' : ' ') +
        (selected.tag ?? '');
    if (isPublic) {
      propertyPublicLocationController.text = newText;
    } else {
      propertyPrivateLocationController.text = newText;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    if (isPublic) {
      updatePropertyDetails(
        localizationsContext.publicAddressLandmark,
        newText,
        isFieldDefaultValue: true,
      );
    } else {
      updatePropertyDetails(
        localizationsContext.addressLandmark,
        newText,
        isFieldDefaultValue: true,
      );
    }
  }

  _resetPropertyFromUnMatch(String propertyId) async {
    final inquiriesWithThisUnMatchProperty = await _isarService
        .getUnmatchedInquiries(unmatchedPropertyId: propertyId);
    await Future.forEach(
      inquiriesWithThisUnMatchProperty,
      (element) async {
        final unmatchedPropertyList =
            List<String>.from(element.unmatchProperties.toList());
        unmatchedPropertyList.remove(propertyId);
        element.unmatchProperties = unmatchedPropertyList;
        await _isarService.saveFilter(element);
      },
    );
  }

  _getLocationList() async {
    final locations = await _isarService.getLocationTags();
    if (locations.isNotEmpty) {
      _savedLocationTags.clear();
      _savedLocationTags.addAll(locations);
      notifyListeners();
    }
  }

  goToDashboardOnAddSuccess(BuildContext context) {
    Navigator.popUntil(
      context,
      (route) {
        return route.settings.name == Routes.home;
      },
    );
  }

  goToPropertyDetailOnAddSuccess(
    BuildContext context,
    DbProperty savedProperty,
  ) {
    Navigator.popUntil(
      context,
      (route) {
        return route.settings.name == Routes.home;
      },
    );
    Navigator.of(context).pushNamed(
      Routes.propertyDetail,
      arguments: savedProperty,
    );
  }

  _goToPropertyListOnAddSuccess(
    BuildContext context,
  ) {
    Navigator.popUntil(
      context,
      (route) {
        return route.settings.name == Routes.home;
      },
    );
    Navigator.pushNamed(
      context,
      Routes.viewAllProperties,
      arguments: ViewAllScreenArg(
        heading: localizationsContext.homeProperties,
        count: 0,
        showDataFor: ViewAllFromType.properties,
        viewAllFromToHandleTabs: ViewAllTabsVisibilityType.fromAddProperties,
      ),
    );
  }
}
