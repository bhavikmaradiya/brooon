import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import './model/property_details_section.dart';
import './model/property_for_type.dart';
import './model/property_visibility_option.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_property_amenity.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../localdb/properties/db_property_visitors.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/file_utils.dart';
import '../../utils/phone_number_input_formatter.dart';
import '../../utils/static_functions.dart';
import '../../utils/sync_helper.dart';
import '../../widgets/arrow_clipper.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_menu/menu_item_model.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/snack_bar_view.dart';
import '../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../widgets/suggestion_field_item.dart';
import '../../widgets/text_field_widget.dart';
import '../add_property/model/add_property_args.dart';
import '../blocked_broooners/utils/block_utils.dart';
import '../close_deal/close_deal_model.dart';
import '../close_deal/close_property.dart';
import '../common_widget/public_property_confirmation/public_property_confirmation.dart';
import '../property_inquiry_status_helper/property_inquiry_status_helper.dart';
import '../report/report_public_property.dart';
import '../share/share_utils.dart';
import '../visitors/add_visitor_provider.dart';

class PropertyDetailsProvider extends ChangeNotifier {
  AppLocalizations? _localizationsContext;
  final _isarService = IsarService();
  DbProperty? _selectedProperty;
  Size toolBarSize = Size.zero;
  Size appBarSize = Size.zero;
  bool _isPropertyActive = true;
  List<DbPropertyAmenity> propertyAmenityList = [];
  List<DbPropertyPreferredCast> preferredCastList = [];
  final List<MenuItemModel> _menuItem = [];
  final int favoriteMenuItem = 0;
  final int editMenuItem = 1;
  final int copyMenuItem = 2;
  final int deleteMenuItem = 3;
  final int shareMenuItem = 4;
  final int visitorMenuItem = 5;
  final int reportMenuItem = 6;
  final int blockMenuItem = 7;
  final int closeDealMenuItem = 8;

  final ownerDetailSectionId = 1;
  final otherDetailSectionId = 2;
  final featureDetailSectionId = 3;
  final closingDetailSectionId = 4;
  final brooonDetailSectionId = 5;

  bool _isSoldProperty = false;
  bool _isContactDetailAvailable = false;
  bool _isLocationDetailAvailable = false;
  OverlayEntry? _menuOverlay;
  late OverlayEntry _backgroundOverlay;
  bool _isPropertyMenuOpened = false;
  bool _isPropertyVisibilityMenuOpened = false;
  final propertyMenuButtonKey = GlobalKey<State>();
  final propertyVisibilityButtonKey = GlobalKey<State>();
  StreamSubscription<void>? _onPropertyChangesStream;
  List<PropertyDetailsSection> propertyDetailsSectionList = [];
  List<PropertyVisibility> propertyVisibilityList = [];
  List<PropertyForType> availablePropertyForTypes = [];
  late CommonPropertyDataProvider _commonPropertyDataProvider;
  bool isReadOnlyMode = false;

  bool get isContactDetailAvailable => _isContactDetailAvailable;

  bool get isLocationDetailAvailable => _isLocationDetailAvailable;

  DbProperty? get selectedProperty => _selectedProperty;

  bool get isPropertyActive => _isPropertyActive;

  bool get isPropertySold => _isSoldProperty;

  List<MenuItemModel> get getPropertyMenu => _menuItem;

  set setToolBarSize(Size size) {
    toolBarSize = size;
    notifyListeners();
  }

  set setAppBarSize(Size size) {
    appBarSize = size;
    notifyListeners();
  }

  init(
    DbProperty? property,
    CommonPropertyDataProvider commonPropertyDataProvider,
    AppLocalizations localizationsContext,
  ) async {
    isReadOnlyMode = property?.isReadOnly ?? false;
    _commonPropertyDataProvider = commonPropertyDataProvider;
    if (property != null && !property.sharedByBrooon) {
      _selectedProperty = await _isarService.getPropertyById(property.id);
    } else {
      // shared by broooner's properties are not being stored in local db so use direct
      _selectedProperty = property;
    }
    _isSoldProperty =
        _selectedProperty?.propertySoldStatusId == SaveDefaultData.soldStatusId;
    _isPropertyActive =
        _selectedProperty?.propertyStatusId == SaveDefaultData.activeStatusId;
    if (_selectedProperty?.amenitiesValues != null &&
        _selectedProperty!.amenitiesValues!.isNotEmpty) {
      propertyAmenityList = await _isarService
          .getAmenitiesBasedOnName(_selectedProperty!.amenitiesValues!);
    }
    if (_selectedProperty?.preferredCommunityValues != null &&
        _selectedProperty!.preferredCommunityValues!.isNotEmpty) {
      preferredCastList = await _isarService.getPreferredCommunityBasedOnValues(
          _selectedProperty!.preferredCommunityValues!);
    }
    _divideDataIntoSection(
      commonPropertyDataProvider,
      localizationsContext,
    );

    _localizationsContext = localizationsContext;
    _backgroundOverlay = _getDummyBackgroundOverlay();
    _createMenuItem();
    _createVisibilityItems();
    _checkForContactDetails();
    _checkForLocationDetails();
    if (_selectedProperty?.sharedByBrooon == false) {
      _watchOnPropertyChanges();
    }
    _availablePropertyForValues();
    notifyListeners();
  }

  _availablePropertyForValues() {
    if (_selectedProperty?.propertyForIds != null) {
      final map = StaticFunctions.getPropertyFormattedPrice(
        localizationsContext: _localizationsContext!,
        property: _selectedProperty,
      );

      if (map.keys.contains(SaveDefaultData.propertyForSellId)) {
        availablePropertyForTypes.add(
          PropertyForType()
            ..icon = Strings.iconForSell
            ..name = _localizationsContext!.forSell
            ..priceRange = map[SaveDefaultData.propertyForSellId]!
            ..areaUnit = _selectedProperty?.propertyAreaUnitValue
            ..pricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedProperty?.propertySellPricePerArea?.toString() ??
                        '')),
        );
      }

      if (map.keys.contains(SaveDefaultData.propertyForRentId)) {
        availablePropertyForTypes.add(
          PropertyForType()
            ..icon = Strings.iconForRent
            ..name = _localizationsContext!.forRent
            ..priceRange = map[SaveDefaultData.propertyForRentId]!
            ..areaUnit = _selectedProperty?.propertyAreaUnitValue
            ..pricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedProperty?.propertyRentPricePerArea?.toString() ??
                        '')),
        );
      }

      if (map.keys.contains(SaveDefaultData.propertyForLeaseId)) {
        availablePropertyForTypes.add(
          PropertyForType()
            ..icon = Strings.iconForLease
            ..name = _localizationsContext!.forLease
            ..priceRange = map[SaveDefaultData.propertyForLeaseId]!
            ..areaUnit = _selectedProperty?.propertyAreaUnitValue
            ..pricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedProperty?.propertyLeasePricePerArea?.toString() ??
                        '')),
        );
      }
    }
  }

  _createVisibilityItems() {
    propertyVisibilityList = [
      PropertyVisibility()
        ..id = SaveDefaultData.propertyVisibilityPrivateId
        ..icon = Strings.iconPropertyVisibilityPrivate
        ..title = _localizationsContext!.propertyVisibilityPrivateTitle
        ..subtitle = _localizationsContext!.propertyVisibilityPrivateSubtitle
        ..isSelected = !_selectedProperty!.isPublicProperty,
      PropertyVisibility()
        ..id = SaveDefaultData.propertyVisibilityPublicId
        ..icon = Strings.iconPropertyVisibilityPublic
        ..title = _localizationsContext!.propertyVisibilityPublicTitle
        ..subtitle = _localizationsContext!.propertyVisibilityPublicSubtitle
        ..isSelected = _selectedProperty!.isPublicProperty,
    ];
  }

  updatePropertyStatus(
    CommonPropertyDataProvider? commonPropertyDataProvider,
    bool value,
  ) async {
    if (_selectedProperty != null && commonPropertyDataProvider != null) {
      _selectedProperty!.propertyStatusId = value
          ? SaveDefaultData.activeStatusId
          : SaveDefaultData.inActiveStatusId;
      final info = await commonPropertyDataProvider
          .getPropertyStatus(_selectedProperty!.propertyStatusId);
      if (info != null) {
        _selectedProperty!.propertyStatusValue = info.name;
      }
      await _isarService.saveProperty(_selectedProperty!);

      _isPropertyActive = value;
      notifyListeners();
      await _savePropertyStatusToSync(
        statusType: StatusTypeToSync.activeInactive,
        status: _isPropertyActive,
        shouldUpload: true,
      );
    }
  }

  _selectPropertyVisibility(BuildContext context, int id) async {
    final selectedVisibility = propertyVisibilityList
        .firstWhereOrNull((element) => element.isSelected);
    final PropertyVisibility? visibilityToSelect =
        propertyVisibilityList.firstWhereOrNull((element) => element.id == id);
    if (visibilityToSelect != null &&
        (selectedVisibility == null || id != selectedVisibility.id)) {
      if (id == SaveDefaultData.propertyVisibilityPublicId) {
        final markAsPublic =
            await PublicPropertyConfirmation.showConfirmationPicker(
          context,
          _localizationsContext!,
        );
        if (markAsPublic) {
          _updatePropertyVisibility(visibilityToSelect);
        }
      } else {
        await showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return DialogWidget(
              title: _localizationsContext!
                  .messageVisibilityChangeDialog(visibilityToSelect.title),
              icon: visibilityToSelect.icon,
              positiveButton: _localizationsContext!.yes,
              negativeButton: _localizationsContext!.cancel,
              onNegativeButtonClick: () {
                Navigator.pop(dialogContext);
              },
              onPositiveButtonClick: () async {
                Navigator.pop(dialogContext);
                _updatePropertyVisibility(visibilityToSelect);
              },
            );
          },
        );
      }
    }
  }

  _updatePropertyVisibility(PropertyVisibility visibilityToSelect) async {
    propertyVisibilityList.forEach(
      (element) => element.isSelected = false,
    );
    visibilityToSelect.isSelected = true;
    _selectedProperty!.isPublicProperty =
        visibilityToSelect.id == SaveDefaultData.propertyVisibilityPublicId;
    await _isarService.saveProperty(_selectedProperty!);
    notifyListeners();
    await _savePropertyStatusToSync(
      statusType: StatusTypeToSync.privatePublic,
      status: _selectedProperty!.isPublicProperty,
      shouldUpload: true,
    );
  }

  List<File> retrievePhotosFiles() {
    List<File> propertyPhotosFiles = [];
    if (_selectedProperty?.photos != null &&
        _selectedProperty!.photos!.isNotEmpty) {
      _selectedProperty!.photos!.forEach(
        (element) {
          propertyPhotosFiles.add(File(element));
        },
      );
    }
    return propertyPhotosFiles;
  }

  _divideDataIntoSection(
    CommonPropertyDataProvider commonPropertyDataProvider,
    AppLocalizations localizationsContext,
  ) async {
    propertyDetailsSectionList.clear();

    LinkedHashMap<String, String> ownerDetails = LinkedHashMap();
    if (_selectedProperty!.sellerName != null &&
        _selectedProperty!.sellerName!.trim().isNotEmpty) {
      ownerDetails[localizationsContext.sellerName] =
          _selectedProperty!.sellerName!;
    }
    if (_selectedProperty!.sellerPhoneNo != null &&
        _selectedProperty!.sellerPhoneNo!.trim().isNotEmpty) {
      ownerDetails[localizationsContext.sellerMobile] =
          _selectedProperty!.sellerPhoneNo!;
    }
    // Don't need to show email info as design for email is removed.
    /*if (_selectedProperty!.sellerEmail != null &&
        _selectedProperty!.sellerEmail!.trim().isNotEmpty) {
      otherDetails[localizationsContext.sellerEmail] =
          _selectedProperty!.sellerEmail!;
    }*/

    if (ownerDetails.isNotEmpty) {
      PropertyDetailsSection ownerDetailsSection = PropertyDetailsSection()
        ..id = ownerDetailSectionId
        ..sectionTitle = localizationsContext.ownerDetails
        ..sectionData = ownerDetails;
      propertyDetailsSectionList.add(ownerDetailsSection);
    }

    if(_selectedProperty!.sharedByBrooon){
      LinkedHashMap<String, String> brooonDetails = LinkedHashMap();
      // Fake entry - will not show anywhere
      brooonDetails[''] = '';
        PropertyDetailsSection brooonDetailsSection = PropertyDetailsSection()
          ..id = brooonDetailSectionId
          ..sectionTitle = localizationsContext.propertyDetailTitleBrooonDetails
          ..sectionData = brooonDetails;
        propertyDetailsSectionList.add(brooonDetailsSection);
    }

    LinkedHashMap<String, String> propertyFeatures = LinkedHashMap();
    if (_selectedProperty?.buildingTypeId != null) {
      final buildingTypeObj = await commonPropertyDataProvider
          .getPropertyBuildingTypeById([_selectedProperty!.buildingTypeId!]);
      if (buildingTypeObj != null && buildingTypeObj.isNotEmpty) {
        propertyFeatures[localizationsContext.buildingType] =
            buildingTypeObj.first.name;
      }
    }
    if (_selectedProperty?.constructionTypeId != null) {
      final constructionTypeObj = await commonPropertyDataProvider
          .getConstructionTypeById(_selectedProperty?.constructionTypeId);
      if (constructionTypeObj != null) {
        propertyFeatures[localizationsContext.construction] =
            constructionTypeObj.name;
      }
    }
    if (_selectedProperty?.propertyFurnishedStatusId != null) {
      final furnishedStatusObj = await commonPropertyDataProvider
          .getFurnishedStatusById(_selectedProperty?.propertyFurnishedStatusId);
      if (furnishedStatusObj != null) {
        propertyFeatures[localizationsContext.furnishedStatus] =
            furnishedStatusObj.name;
      }
    }
    if (_selectedProperty?.additionalFurnishing != null &&
        _selectedProperty!.additionalFurnishing!.isNotEmpty) {
      String additionalFurnish = '';
      _selectedProperty!.additionalFurnishing!.forEachIndexed(
        (index, element) {
          additionalFurnish += '$element';
          if (index != _selectedProperty!.additionalFurnishing!.length - 1) {
            additionalFurnish += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.additionalFurnishing] =
          additionalFurnish;
    }
    if (_selectedProperty?.bhkId != null) {
      final bhkObj = await commonPropertyDataProvider
          .getPropertyBhkById(_selectedProperty?.bhkId);
      if (bhkObj != null) {
        propertyFeatures[localizationsContext.bhk] = bhkObj.name;
      }
    }
    if (_selectedProperty?.bathRoomCount != null &&
        _selectedProperty!.bathRoomCount! > 0) {
      propertyFeatures[localizationsContext.bathRooms] =
          _selectedProperty!.bathRoomCount!.toString();
    }
    if (_selectedProperty?.roomCount != null &&
        _selectedProperty!.roomCount! > 0) {
      propertyFeatures[localizationsContext.rooms] =
          _selectedProperty!.roomCount!.toString();
    }
    if (_selectedProperty?.floorCount != null &&
        _selectedProperty!.floorCount! > 0) {
      propertyFeatures[localizationsContext.floors] =
          _selectedProperty!.floorCount!.toString();
    }
    if (_selectedProperty?.totalFloorCount != null &&
        _selectedProperty!.totalFloorCount! > 0) {
      propertyFeatures[localizationsContext.totalFloors] =
          _selectedProperty!.totalFloorCount!.toString();
    }
    if (_selectedProperty?.isWashRoomAvailable != null) {
      propertyFeatures[localizationsContext.washRoomAvailable] =
          _selectedProperty!.isWashRoomAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.balcony != null) {
      propertyFeatures[localizationsContext.balcony] =
          _selectedProperty!.balcony!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.isCornerPiece != null) {
      propertyFeatures[localizationsContext.cornerPiece] =
          _selectedProperty!.isCornerPiece!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.isAllottedParking != null) {
      propertyFeatures[localizationsContext.allottedParking] =
          _selectedProperty!.isAllottedParking!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.isParkingAvailable != null) {
      propertyFeatures[localizationsContext.parkingAvailable] =
          _selectedProperty!.isParkingAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.isLiftAvailable != null) {
      propertyFeatures[localizationsContext.liftAvailable] =
          _selectedProperty!.isLiftAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.lightConnection != null) {
      propertyFeatures[localizationsContext.lightConnection] =
          _selectedProperty!.lightConnection!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.isWellAvailable != null) {
      propertyFeatures[localizationsContext.wellAvailable] =
          _selectedProperty!.isWellAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedProperty?.connectedRoads != null &&
        _selectedProperty!.connectedRoads!.isNotEmpty) {
      String connectedRoads = '';
      for (int i = 0; i < _selectedProperty!.connectedRoads!.length; i++) {
        connectedRoads +=
            '${StaticFunctions.removeTrailingZeros(_selectedProperty!.connectedRoads![i].toString())}';
        if (i != _selectedProperty!.connectedRoads!.length - 1) {
          connectedRoads += ' / ';
        }
      }

      if (connectedRoads.trim().isNotEmpty) {
        propertyFeatures[
                '${localizationsContext.connectedRoad} (${localizationsContext.ft})'] =
            connectedRoads;
      }
    }
    if (_selectedProperty?.schemeTypeId != null) {
      final schemeTypeObj = await commonPropertyDataProvider
          .getPropertySchemeTypeById(_selectedProperty?.schemeTypeId);
      if (schemeTypeObj != null) {
        propertyFeatures[localizationsContext.scheme] = schemeTypeObj.name;
      }
    }
    if (_selectedProperty?.facingId != null) {
      final facingObj = await commonPropertyDataProvider
          .getPropertyFacingTypeById(_selectedProperty?.facingId);
      if (facingObj != null) {
        propertyFeatures[localizationsContext.facingType] = facingObj.name;
      }
    }
    if (_selectedProperty?.frontSize != null &&
        _selectedProperty!.frontSize!.toString().trim().isNotEmpty) {
      propertyFeatures[localizationsContext.frontSize] =
          '${StaticFunctions.removeTrailingZeros(_selectedProperty!.frontSize!.toString().trim())} ${(_selectedProperty!.frontSizeUnitValue) ?? localizationsContext.feet}';
    }
    if (_selectedProperty?.depthSize != null &&
        _selectedProperty!.depthSize!.toString().trim().isNotEmpty) {
      propertyFeatures[localizationsContext.depthSize] =
          '${StaticFunctions.removeTrailingZeros(_selectedProperty!.depthSize!.toString().trim())} ${(_selectedProperty!.depthSizeUnitValue) ?? localizationsContext.feet}';
    }
    if (_selectedProperty?.amenitiesValues != null &&
        _selectedProperty!.amenitiesValues!.isNotEmpty) {
      String amenities = '';
      _selectedProperty!.amenitiesValues!.forEachIndexed(
        (index, element) {
          amenities += '$element';
          if (index != propertyAmenityList.length - 1) {
            amenities += ', ';
          }
        },
      );
      if (amenities.trim().isNotEmpty) {
        propertyFeatures[localizationsContext.amenities] = amenities;
      }
    }

    if (propertyFeatures.isNotEmpty) {
      PropertyDetailsSection propertyFeatureSection = PropertyDetailsSection()
        ..id = featureDetailSectionId
        ..sectionTitle =
            localizationsContext.propertyDetailTitlePropertyFeatures
        ..sectionData = propertyFeatures;
      propertyDetailsSectionList.add(propertyFeatureSection);
    }

    LinkedHashMap<String, String> otherDetails = LinkedHashMap();
    if (_selectedProperty?.preferredCommunityValues != null &&
        _selectedProperty!.preferredCommunityValues!.isNotEmpty) {
      String casts = '';
      _selectedProperty!.preferredCommunityValues!.forEachIndexed(
        (index, element) {
          casts += '$element';
          if (index != preferredCastList.length - 1) {
            casts += ', ';
          }
        },
      );
      if (casts.trim().isNotEmpty) {
        otherDetails[localizationsContext.preferredCast] = casts;
      }
    }

    if (_selectedProperty?.brokerChain != null) {
      otherDetails[localizationsContext.chainOfBrokers] =
          (_selectedProperty!.brokerChain! == 0)
              ? localizationsContext.directChain
              : _selectedProperty!.brokerChain!.toString();
    }

    otherDetails[localizationsContext.allowExchange] =
        (_selectedProperty?.exchangeAllowed != null &&
                _selectedProperty!.exchangeAllowed == true)
            ? localizationsContext.yes
            : localizationsContext.no;

    if (_selectedProperty?.comments != null &&
        _selectedProperty!.comments!.trim().isNotEmpty) {
      otherDetails[localizationsContext.propertyNote] =
          _selectedProperty!.comments!;
    }

    if (_selectedProperty?.tags != null &&
        _selectedProperty!.tags!.isNotEmpty) {
      String tags = '';
      _selectedProperty!.tags!.forEachIndexed(
        (index, element) {
          tags += '${element}';
          if (index != _selectedProperty!.tags!.length - 1) {
            tags += ', ';
          }
        },
      );
      if (tags.trim().isNotEmpty) {
        otherDetails[localizationsContext.tags] = tags;
      }
    }

    if (otherDetails.isNotEmpty) {
      PropertyDetailsSection otherDetailsSection = PropertyDetailsSection()
        ..id = otherDetailSectionId
        ..sectionTitle = localizationsContext.propertyDetailTitleOtherDetails
        ..sectionData = otherDetails;
      propertyDetailsSectionList.add(otherDetailsSection);
    }

    _closedDealSection(localizationsContext);

    notifyListeners();
  }

  _closedDealSection(
    AppLocalizations localizationsContext,
  ) {
    if (_selectedProperty?.propertySoldStatusId ==
            SaveDefaultData.soldStatusId ||
        _isSoldProperty) {
      LinkedHashMap<String, String> closingDetails = LinkedHashMap();
      // Fake entry - will not show anywhere
      closingDetails[''] = '';
      PropertyDetailsSection closingDetailSection = PropertyDetailsSection()
        ..id = closingDetailSectionId
        ..sectionTitle = localizationsContext.closingDetails
        ..sectionData = closingDetails;
      propertyDetailsSectionList.add(closingDetailSection);
    } else {
      final index = propertyDetailsSectionList.indexWhere(
        (element) => element.id == closingDetailSectionId,
      );
      if (index != -1) {
        propertyDetailsSectionList.removeAt(index);
        notifyListeners();
      }
    }
  }

  List<Widget> _createMenuItems(
    BuildContext buildContext, {
    required List<MenuItemModel> menuItem,
    required Function(int id) onItemSelected,
  }) {
    final List<Widget> menuList = [];
    for (int index = 0; index < menuItem.length; index++) {
      menuList.add(
        Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onItemSelected(menuItem[index].id),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  index == 0 ? Dimensions.popupMenuShapeRadius.r : 0,
                ),
                topRight: Radius.circular(
                  index == 0 ? Dimensions.popupMenuShapeRadius.r : 0,
                ),
                bottomLeft: Radius.circular(
                  index == menuItem.length - 1
                      ? Dimensions.popupMenuShapeRadius.r
                      : 0,
                ),
                bottomRight: Radius.circular(
                  index == menuItem.length - 1
                      ? Dimensions.popupMenuShapeRadius.r
                      : 0,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      Dimensions.propertyDetailPopupMenuItemHorizontalPadding.w,
                  vertical:
                      Dimensions.propertyDetailPopupMenuItemVerticalPadding.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (menuItem[index].icon != null &&
                            menuItem[index].icon.toString().trim().isNotEmpty)
                          SvgPicture.asset(
                            menuItem[index].icon!,
                            width: menuItem[index].iconWidth ??
                                Dimensions.popupMenuIconSize.w,
                            height: menuItem[index].iconHeight ??
                                Dimensions.popupMenuIconSize.w,
                          ),
                        if (menuItem[index].icon != null &&
                            menuItem[index].icon.toString().trim().isNotEmpty)
                          SizedBox(
                            width: menuItem[index].titleIconBetweenSpacing ??
                                Dimensions.popupMenuIconTextSpacing.w,
                          ),
                        Text(
                          menuItem[index].title,
                          style: TextStyle(
                            color: StaticFunctions.getColor(
                              buildContext,
                              ColorEnum.blackColor,
                            ),
                            fontWeight: menuItem[index].titleFontWeight ??
                                FontWeight.w400,
                            fontSize: menuItem[index].titleTextSize ??
                                Dimensions.popupMenuTextSize.sp,
                          ),
                        ),
                      ],
                    ),
                    if (menuItem[index].subtitle != null)
                      SizedBox(
                        height:
                            Dimensions.popupMenuTitleSubtitleBetweenSpacing.h,
                      ),
                    if (menuItem[index].subtitle != null)
                      Text(
                        menuItem[index].subtitle!,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                            buildContext,
                            ColorEnum.gray90Color,
                          ),
                          fontSize: Dimensions.popupMenuSubTextSize.sp,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      if (index != menuItem.length - 1) {
        menuList.add(
          LightDivider(),
        );
      }
    }
    return menuList;
  }

  openPropertyMenu(BuildContext context, bool isExpanded) async {
    closeMenu();
    final RenderBox? popupButtonObject =
        propertyMenuButtonKey.currentContext?.findRenderObject() as RenderBox?;
    final List<Widget> menuList = _createMenuItems(
      context,
      menuItem: _menuItem,
      onItemSelected: (selectedId) {
        closeMenu();
        _onPropertyMenuItemSelected(context, selectedId);
      },
    );
    if (!_isPropertyMenuOpened &&
        menuList.isNotEmpty &&
        popupButtonObject != null) {
      final RenderBox? overlay =
          Overlay.of(context)?.context.findRenderObject() as RenderBox?;
      if (overlay != null) {
        _menuOverlay = _overlayEntryBuilder(
          buttonKey: propertyMenuButtonKey,
          menuWidgets: menuList,
          isExpanded: isExpanded,
          menuWidth: MediaQuery.of(context).size.width * 0.45,
          marginEnd: isExpanded
              ? Dimensions.screenHorizontalMargin.w / 2.5
              : Dimensions.screenHorizontalMargin.w / 3,
        );
        if (_menuOverlay != null) {
          Overlay.of(context)?.insert(_backgroundOverlay);
          Overlay.of(context)?.insert(_menuOverlay!);
          _isPropertyMenuOpened = true;
        }
      }
    }
  }

  openPropertyVisibilityMenu(BuildContext context) async {
    closeMenu();
    if (isReadOnlyMode) {
      return;
    }
    final RenderBox? popupButtonObject =
        propertyVisibilityButtonKey.currentContext?.findRenderObject()
            as RenderBox?;
    final List<MenuItemModel> menuItems = [];
    propertyVisibilityList.forEachIndexed(
      (i, element) {
        menuItems.add(
          MenuItemModel(
            id: element.id,
            title: element.title,
            subtitle: element.subtitle,
            icon: element.icon,
            titleFontWeight: FontWeight.w600,
            titleTextSize:
                Dimensions.propertyDetailSelectedVisibilityTextSize.sp,
            titleIconBetweenSpacing: Dimensions
                .propertyDetailVisibilityPopupTitleAndIconBetweenSpacing.w,
            iconHeight: i == 1
                ? Dimensions.propertyDetailVisibilityPublicIconHeight.h
                : Dimensions.propertyDetailVisibilityPrivateIconHeight.h,
            iconWidth: i == 1
                ? Dimensions.propertyDetailVisibilityPublicIconWidth.h
                : Dimensions.propertyDetailVisibilityPrivateIconWidth.h,
          ),
        );
      },
    );
    final List<Widget> menuList = _createMenuItems(
      context,
      menuItem: menuItems,
      onItemSelected: (selectedId) {
        closeMenu();
        _selectPropertyVisibility(context, selectedId);
      },
    );
    if (!_isPropertyVisibilityMenuOpened &&
        menuList.isNotEmpty &&
        popupButtonObject != null) {
      final RenderBox? overlay =
          Overlay.of(context)?.context.findRenderObject() as RenderBox?;
      if (overlay != null) {
        _menuOverlay = _overlayEntryBuilder(
          buttonKey: propertyVisibilityButtonKey,
          menuWidgets: menuList,
          menuWidth: MediaQuery.of(context).size.width * 0.6,
          marginEnd: Dimensions.screenHorizontalMargin.w,
        );
        if (_menuOverlay != null) {
          Overlay.of(context)?.insert(_backgroundOverlay);
          Overlay.of(context)?.insert(_menuOverlay!);
          _isPropertyVisibilityMenuOpened = true;
        }
      }
    }
  }

  _blockBroker(BuildContext context) async {
    if (_selectedProperty?.brooonId != null &&
        _selectedProperty?.brooonCode != null) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DialogWidget(
            title: _localizationsContext!.blockBrokerDialogTitle,
            icon: Strings.iconBlock,
            positiveButton: _localizationsContext!.yesSure,
            negativeButton: _localizationsContext!.no,
            onNegativeButtonClick: () {
              Navigator.pop(dialogContext);
            },
            onPositiveButtonClick: () async {
              // To close dialog
              Navigator.pop(dialogContext);
              final isBlocked = await BlockUtils.blockBrokerApi(
                context,
                brooonId: _selectedProperty!.brooonId!,
                brooonCode: _selectedProperty!.brooonCode!,
                brooonName: _selectedProperty!.brooonName,
                brooonPhone: _selectedProperty!.brooonPhone,
                brooonPhoto: _selectedProperty!.brooonPhoto,
              );
              if (isBlocked) {
                Navigator.pop(context);
              }
            },
          );
        },
      );
    }
  }

  _onPropertyMenuItemSelected(BuildContext context, int? selectedId) {
    if (selectedId != null) {
      if (selectedId == editMenuItem) {
        // edit functionality
        Navigator.pushNamed(
          context,
          Routes.addProperty,
          arguments: AddPropertyArgs(
            addPropertyEnums: AddPropertyEnums.edit,
            propertyId: _selectedProperty!.id,
          ),
        );
      } else if (selectedId == copyMenuItem) {
        // copy functionality
        Navigator.pushNamed(
          context,
          Routes.addProperty,
          arguments: AddPropertyArgs(
            addPropertyEnums: AddPropertyEnums.copy,
            propertyId: _selectedProperty!.id,
          ),
        );
      } else if (selectedId == deleteMenuItem) {
        _deleteProperty(context);
      } else if (selectedId == blockMenuItem) {
        _blockBroker(context);
      } else if (selectedId == shareMenuItem) {
        ShareUtils.showPropertySharePicker(
          context,
          _localizationsContext!,
          _selectedProperty,
        );
      } else if (selectedId == visitorMenuItem) {
        _addVisitorDialog(context);
      } else if (selectedId == favoriteMenuItem) {
        _makeFavoriteUnFavorite();
      } else if (selectedId == reportMenuItem) {
        ReportPublicProperty.showReportPicker(
          buildContext: context,
          localizationsContext: _localizationsContext!,
          selectedProperty: _selectedProperty,
        );
      } else if (selectedId == closeDealMenuItem) {
        _fillBuyerDetailsDialog(context);
      }
    }
  }

  _addVisitorDialog(context) {
    AddVisitorProvider? provider;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (dialogContext) {
        return ChangeNotifierProvider(
          create: (_) => AddVisitorProvider(),
          builder: (context, _) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (provider == null) {
                provider ??=
                    Provider.of<AddVisitorProvider>(context, listen: false);
                provider!.init();
              }
            });
            return Padding(
              padding: MediaQuery.of(dialogContext).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColoredBox(
                    color: StaticFunctions.getColor(
                      dialogContext,
                      ColorEnum.themeColorOpacity6Percentage,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.screenHorizontalMargin.w,
                        right: (Dimensions.screenHorizontalMargin / 2).w,
                        top: Dimensions.bottomSheetTitleVerticalPadding.h,
                        bottom: Dimensions.bottomSheetTitleVerticalPadding.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _localizationsContext!.addVisitorDetails,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.bottomSheetTitleTextSize.sp,
                              color: StaticFunctions.getColor(
                                dialogContext,
                                ColorEnum.blackColor,
                              ),
                            ),
                          ),
                          Container(
                            width: Dimensions.closeIconSize.w,
                            height: Dimensions.closeIconSize.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.closeIconRippleRadius.r,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(dialogContext);
                                },
                                borderRadius: BorderRadius.circular(
                                  Dimensions.closeIconRippleRadius.r,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    Dimensions.closeIconPadding.w,
                                  ),
                                  child: SvgPicture.asset(
                                    Strings.iconBottomSheetClose,
                                    width: Dimensions.closeIconSize.w,
                                    height: Dimensions.closeIconSize.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenHorizontalMargin.w,
                      vertical: Dimensions.screenVerticalMarginBottom.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Selector<AddVisitorProvider, TextEditingController>(
                          selector: (_, state) =>
                              state.visitorNameFieldController,
                          builder: (context, controller, child) {
                            return TextFieldWithDropdown(
                              getImmediateSuggestions: false,
                              hideOnEmpty: true,
                              hideKeyboardOnDrag: false,
                              hideSuggestionsOnKeyboardHide: false,
                              suggestionsBoxDecoration:
                                  SuggestionsBoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadius.r,
                                ),
                              ),
                              textFieldConfiguration:
                                  SuggestionFieldConfiguration(
                                controller: controller,
                                autofocus: true,
                                label: _localizationsContext!.visitorName,
                                placeholder: _localizationsContext!.enterName,
                                suffixIconPath: Strings.iconPhoneBook,
                                onSuffixIconClick: () =>
                                    provider?.openContactsToPickPhone(),
                                onChanged: (value) {
                                  provider?.validateVisitorData();
                                },
                              ),
                              suggestionsCallback: (pattern) {
                                return provider!.getFilteredVisitors(pattern);
                              },
                              loadingBuilder: (context) => SizedBox(),
                              noItemsFoundBuilder: (context) => SizedBox(),
                              itemBuilder: (context,
                                  DbPropertyVisitors suggestion,
                                  bool showDivider) {
                                return SuggestionItemWidget(
                                  title: suggestion.name!,
                                  subtitle: suggestion.mobileNo,
                                  showDivider: showDivider,
                                );
                              },
                              onSuggestionSelected:
                                  (DbPropertyVisitors suggestion) {
                                provider?.selectVisitorSuggestion(
                                  context,
                                  suggestion,
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              Dimensions.visitorDialogContentBetweenSpacing.h,
                        ),
                        Selector<AddVisitorProvider, TextEditingController>(
                          selector: (_, state) =>
                              state.visitorPhoneFieldController,
                          builder: (context, controller, child) {
                            return TextFieldWidget(
                              label: _localizationsContext!.visitorMobile,
                              hint: _localizationsContext!.enterPhone,
                              controller: controller,
                              maxLength: AppConfig.mobileNoFieldLength,
                              keyBoardType: TextInputType.phone,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                PhoneNumberTextInputFormatter(),
                              ],
                              keepLabelAlwaysOnTop: true,
                              onValueChanged:
                                  (int? currentIndex, String value) =>
                                      provider!.validateVisitorData(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: Dimensions.screenHorizontalMargin.w,
                      right: Dimensions.screenHorizontalMargin.w,
                      bottom: Dimensions.screenVerticalMarginBottom.h,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            text: _localizationsContext!.cancelVisitor,
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
                              ColorEnum.borderColorE0,
                            ),
                            fontWeight: FontWeight.w700,
                            onClick: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.addPropertyButtonSpacing.w,
                        ),
                        Expanded(
                          child: Selector<AddVisitorProvider, bool>(
                            selector: (_, state) => state.validVisitorDetails,
                            builder: (context, isValid, child) {
                              return ButtonWidget(
                                text: _localizationsContext!.addVisitor,
                                textColor: StaticFunctions.getColor(
                                  context,
                                  isValid
                                      ? ColorEnum.whiteColor
                                      : ColorEnum.gray90Color,
                                ),
                                bgColor: StaticFunctions.getColor(
                                  context,
                                  isValid
                                      ? ColorEnum.themeColor
                                      : ColorEnum.themeColorOpacity3Percentage,
                                ),
                                borderColor: StaticFunctions.getColor(
                                  context,
                                  isValid
                                      ? ColorEnum.themeColor
                                      : ColorEnum.borderColorE0,
                                ),
                                fontWeight: FontWeight.w700,
                                onClick: () async {
                                  if (isValid) {
                                    Navigator.pop(context);
                                    final visitorCount = await provider!
                                        .addVisitor(_selectedProperty);
                                    if (_selectedProperty != null) {
                                      _selectedProperty!
                                        ..visitorCount = visitorCount;
                                    }
                                    updatePropertyVisitorCount(
                                      visitorCount,
                                    );
                                    SnackBarView.showSnackBar(
                                      context,
                                      _localizationsContext!.visitorAdded,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      isDismissible: true,
      backgroundColor: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      barrierColor: StaticFunctions.getColor(
        context,
        ColorEnum.bottomSheetBarrierColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  _deleteProperty(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogWidget(
          title: '',
          titleWidget: Container(
            child: Text.rich(
              TextSpan(
                text: _localizationsContext!.dialogDeletePropertyMsg1,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                  fontSize: Dimensions.dialogTextSize.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text:
                        '${_selectedProperty?.propertyId} | ${CommonPropertyDataProvider.propertyAreaWithPropertyType(_selectedProperty!)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: _localizationsContext!.dialogDeletePropertyMsg2,
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
          positiveButton: _localizationsContext!.btnDeleteProperty,
          negativeButton: _localizationsContext!.btnCancelProperty,
          onNegativeButtonClick: () {
            Navigator.pop(context);
          },
          onPositiveButtonClick: () async {
            final isDeleted = await deleteProperty();
            // close popup
            Navigator.pop(context);
            if (isDeleted) {
              // close property details screen
              Navigator.pop(context);
            } else {
              SnackBarView.showSnackBar(
                context,
                _localizationsContext!.failedToDeleteProperty,
              );
            }
          },
        );
      },
    );
  }

  closeMenu() {
    if (_isPropertyMenuOpened || _isPropertyVisibilityMenuOpened) {
      _backgroundOverlay.remove();
    }
    if (_isPropertyMenuOpened && _menuOverlay != null) {
      _menuOverlay!.remove();
      _isPropertyMenuOpened = false;
    }
    if (_isPropertyVisibilityMenuOpened && _menuOverlay != null) {
      _menuOverlay!.remove();
      _isPropertyVisibilityMenuOpened = false;
    }
  }

  bool isPopupMenuVisible() {
    return _isPropertyMenuOpened || _isPropertyVisibilityMenuOpened;
  }

  OverlayEntry _overlayEntryBuilder({
    required GlobalKey<State> buttonKey,
    required List<Widget> menuWidgets,
    bool isExpanded = true,
    required double menuWidth,
    required double marginEnd,
  }) {
    RenderBox renderBox =
        buttonKey.currentContext!.findRenderObject() as RenderBox;
    final buttonSize = renderBox.size;
    final buttonPosition = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy +
              buttonSize.height +
              Dimensions.popupMenuArrowTopSpacing.h +
              Dimensions.popupMenuArrowIconHeight.h,
          right: isExpanded
              ? Dimensions.screenHorizontalMargin.w
              : Dimensions.screenHorizontalMargin.w / 2,
          width: menuWidth,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: ShapeDecoration(
                shape: ArrowClipperShadow(
                  arrowHeight: Dimensions.popupMenuArrowIconHeight.h,
                  arrowWidth: Dimensions.popupMenuArrowIconWidth.w,
                  rightMargin: marginEnd,
                ),
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                shadows: [
                  BoxShadow(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.shadowColor,
                    ),
                    blurRadius:
                        Dimensions.propertyDetailPopupMenuShadowBlurRadius.r,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimensions.popupMenuShapeRadius.r,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuWidgets,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _updateCloseDealStatus({
    required CloseDealModel closedDealInfo,
  }) async {
    if (_selectedProperty != null) {
      if (_selectedProperty!.propertySoldStatusId ==
          SaveDefaultData.unSoldStatusId) {
        bool isNeedToAddNewClosedInquiry = false;
        // If no inquiry is linked -> we are going to create new closed inquiry
        // So adding that Inquiry's inquiry id
        if (closedDealInfo.linkedPropertyInquiryId == null ||
            closedDealInfo.linkedPropertyInquiryId!.trim().isEmpty) {
          closedDealInfo.linkedPropertyInquiryId =
              await PropertyInquiryStatusHelper.generateInquiryId(
            isarService: _isarService,
          );
          isNeedToAddNewClosedInquiry = true;
        }

        _selectedProperty!.propertySoldStatusId = SaveDefaultData.soldStatusId;
        _selectedProperty!.closedDealBuyerName = closedDealInfo.name;
        _selectedProperty!.closedDealBuyerPhoneNo = closedDealInfo.mobile;
        _selectedProperty!.closeDealId = closedDealInfo.dealType;
        _selectedProperty!.closedDealNotes = closedDealInfo.notes;
        _selectedProperty!.closedLinkedInquiryId =
            closedDealInfo.linkedPropertyInquiryId;
        _selectedProperty!.propertyStatusId = SaveDefaultData.inActiveStatusId;
        final info = await _commonPropertyDataProvider.getPropertyStatus(
          SaveDefaultData.inActiveStatusId,
        );
        if (info != null) {
          _selectedProperty!.propertyStatusValue = info.name;
        }
        _isSoldProperty = true;
        _isPropertyActive = false;
        await _isarService.saveProperty(_selectedProperty!);
        _createMenuItem();
        _checkForContactDetails();
        if (_localizationsContext != null) {
          _closedDealSection(_localizationsContext!);
        }
        notifyListeners();
        await _savePropertyStatusToSync(
          statusType: StatusTypeToSync.closedDeals,
          status: _isSoldProperty,
          shouldUpload: true,
          commonPropertyDataProvider: _commonPropertyDataProvider,
          closedDealInfo: closedDealInfo,
        );
        _closeLinkedInquiry(closedDealInfo, isNeedToAddNewClosedInquiry);
      }
    }
  }

  _closeLinkedInquiry(
    CloseDealModel closedDealInfo,
    bool isNeedToAddNewClosedInquiry,
  ) async {
    if (!isNeedToAddNewClosedInquiry) {
      final inquiryInfo = await _isarService.getInquiryByInquiryId(
        closedDealInfo.linkedPropertyInquiryId!,
      );
      if (inquiryInfo != null &&
          inquiryInfo.inquirySoldStatusId == SaveDefaultData.unSoldStatusId) {
        inquiryInfo.inquirySoldStatusId = SaveDefaultData.soldStatusId;
        inquiryInfo.closedDealSellerName = _selectedProperty!.sellerName;
        inquiryInfo.closedDealSellerPhoneNo = _selectedProperty!.sellerPhoneNo;
        inquiryInfo.closeDealId = closedDealInfo.dealType;
        inquiryInfo.closedDealNotes = closedDealInfo.notes;
        inquiryInfo.closedLinkedPropertyId = _selectedProperty!.propertyId;
        inquiryInfo.inquiryStatusId = SaveDefaultData.inActiveStatusId;
        final info = await _commonPropertyDataProvider.getPropertyStatus(
          SaveDefaultData.inActiveStatusId,
        );
        if (info != null) {
          inquiryInfo.inquiryStatusValue = info.name;
        }
        await _isarService.saveFilter(inquiryInfo);
        await PropertyInquiryStatusHelper.saveInquiryStatusToSync(
          isarService: _isarService,
          selectedInquiry: inquiryInfo,
          statusType: StatusTypeToSync.closedDeals,
          status: true,
          shouldUpload: true,
          commonPropertyDataProvider: _commonPropertyDataProvider,
          localizationsContext: _localizationsContext!,
          // here Property related information added for Inquiry close info
          closedDealInfo: CloseDealModel(
            name: _selectedProperty!.sellerName ?? '',
            mobile: _selectedProperty!.sellerPhoneNo ?? '',
            notes: closedDealInfo.notes,
            dealType: closedDealInfo.dealType,
            linkedPropertyInquiryId: _selectedProperty!.propertyId,
          ),
        );
      }
    } else {
      // create new inquiry with status closed
      await PropertyInquiryStatusHelper.createNewClosedInquiryFromProperty(
        isarService: _isarService,
        property: _selectedProperty!,
        closedDealInfo: closedDealInfo,
        localizationsContext: _localizationsContext!,
      );
      SyncHelper.syncInquiryInfoWithServer(
        _localizationsContext!,
        _commonPropertyDataProvider,
      );
    }
  }

  updateUnSoldStatus(
    CommonPropertyDataProvider? commonPropertyDataProvider,
  ) async {
    if (_selectedProperty != null) {
      _selectedProperty!.propertySoldStatusId = SaveDefaultData.unSoldStatusId;
      _selectedProperty!.closedDealBuyerName = null;
      _selectedProperty!.closedDealBuyerPhoneNo = null;
      _selectedProperty!.propertyStatusId = SaveDefaultData.activeStatusId;
      if (commonPropertyDataProvider != null) {
        final info = await commonPropertyDataProvider
            .getPropertyStatus(SaveDefaultData.activeStatusId);
        if (info != null) {
          _selectedProperty!.propertyStatusValue = info.name;
        }
      }
      _isSoldProperty = false;
      _isPropertyActive = true;
      await _isarService.saveProperty(_selectedProperty!);
      _createMenuItem();
      _checkForContactDetails();
      if (_localizationsContext != null) {
        _closedDealSection(_localizationsContext!);
      }
      notifyListeners();
      if (commonPropertyDataProvider != null) {
        await _savePropertyStatusToSync(
          statusType: StatusTypeToSync.closedDeals,
          status: _isSoldProperty,
          shouldUpload: true,
          commonPropertyDataProvider: commonPropertyDataProvider,
        );
      }
    }
  }

  String getPropertyMarkAsButtonText(
    bool isSold,
    int? propertyForId,
    AppLocalizations localizationsContext,
    CommonPropertyDataProvider? commonPropertyDataProvider,
  ) {
    return isSold
        ? localizationsContext.markAsSoldUnSold(
            commonPropertyDataProvider?.getPropertyMarkAsStatus(
                  SaveDefaultData.soldStatusId,
                  propertyForId,
                  localizationsContext,
                ) ??
                '',
          )
        : localizationsContext.markAsSoldUnSold(
            commonPropertyDataProvider?.getPropertyMarkAsStatus(
                  SaveDefaultData.unSoldStatusId,
                  propertyForId,
                  localizationsContext,
                ) ??
                '',
          );
  }

  _makeFavoriteUnFavorite() async {
    if (_selectedProperty != null &&
        _selectedProperty!.sharedByBrooon == false) {
      _selectedProperty!.isFavorite = !_selectedProperty!.isFavorite;
      await _isarService.saveProperty(_selectedProperty!);
      _createMenuItem();
    }
  }

  _createMenuItem() {
    _menuItem.clear();
    if (!isReadOnlyMode) {
      _menuItem.addAll(
        [
          if (CommonPropertyDataProvider.isPropertyEditAvailable(
              _selectedProperty))
            MenuItemModel(
              id: editMenuItem,
              title: _localizationsContext!.editPropertyDetail,
              icon: Strings.iconEdit,
            ),
          if (_selectedProperty?.sharedByBrooon == false)
            MenuItemModel(
              id: favoriteMenuItem,
              title: _selectedProperty!.isFavorite
                  ? _localizationsContext!.makeUnfavorite
                  : _localizationsContext!.makeFavorite,
              icon: Strings.iconDrawerFavorite,
            ),
          if (_selectedProperty?.sharedByBrooon == false &&
              _selectedProperty?.propertySoldStatusId ==
                  SaveDefaultData.soldStatusId)
            MenuItemModel(
              id: copyMenuItem,
              title: _localizationsContext!.copyPropertyDetail,
              icon: Strings.iconCopy,
            ),
          if (_selectedProperty?.propertySoldStatusId ==
              SaveDefaultData.unSoldStatusId)
            MenuItemModel(
              id: shareMenuItem,
              title: _localizationsContext!.sharePropertyDetail,
              icon: Strings.iconShareDetails,
            ),
          if (_selectedProperty?.sharedByBrooon == false &&
              _selectedProperty?.propertySoldStatusId ==
                  SaveDefaultData.unSoldStatusId)
            MenuItemModel(
              id: visitorMenuItem,
              title: _localizationsContext!.addVisitorPropertyDetail,
              icon: Strings.iconAddEye,
            ),
          if (_selectedProperty?.sharedByBrooon == true)
            MenuItemModel(
              id: reportMenuItem,
              title: _localizationsContext!.reportPublicProperty,
              icon: Strings.iconReport,
            ),
          if (_selectedProperty?.sharedByBrooon == true &&
              _selectedProperty?.brooonId != null &&
              _selectedProperty?.brooonCode != null)
            MenuItemModel(
              id: blockMenuItem,
              title: _localizationsContext!.blockBrooon,
              icon: Strings.iconBlock,
            ),
          // property should not be shared by brooon
          // it should be active & unsold
          if (_selectedProperty?.sharedByBrooon == false &&
              _selectedProperty?.propertyStatusId ==
                  SaveDefaultData.activeStatusId &&
              _selectedProperty?.propertySoldStatusId ==
                  SaveDefaultData.unSoldStatusId)
            MenuItemModel(
              id: closeDealMenuItem,
              title: _localizationsContext!.propertyDetailsCloseDealBtn,
              icon: Strings.iconMenuCloseDeal,
            ),
          if (_selectedProperty?.sharedByBrooon == false)
            MenuItemModel(
              id: deleteMenuItem,
              title: _localizationsContext!.deletePropertyDetail,
              icon: Strings.iconDelete,
            ),
        ],
      );
    }
  }

  Future<bool> deleteProperty() async {
    int? propertyId = _selectedProperty?.id;
    if (propertyId != null) {
      await _savePropertyStatusToSync(
        statusType: StatusTypeToSync.delete,
        status: true,
        shouldUpload: true,
      );
      await _deletePropertyPhotoDirectory(propertyId);
      await _isarService.deletePhotoMetaByProperty(propertyId);
      if (_selectedProperty?.propertyId != null) {
        await _isarService.deleteVisitors(_selectedProperty!.propertyId!);
      }
      return await _isarService.deleteProperty(propertyId);
    }
    return false;
  }

  _deletePropertyPhotoDirectory(int propertyId) async {
    final dirPath = await FileUtils.getPropertyPhotosDirectoryPath(
      propertyId,
    );
    final directory = await Directory(dirPath);
    final isDirExist = await directory.exists();
    if (isDirExist) {
      await directory.delete(recursive: true);
    }
  }

  _checkForContactDetails() {
    if (_selectedProperty?.sharedByBrooon ?? false) {
      _isContactDetailAvailable = _selectedProperty?.brooonPhone != null &&
          _selectedProperty!.brooonPhone!.trim().isNotEmpty;
    } else {
      _isContactDetailAvailable = !_isSoldProperty &&
          ((_selectedProperty?.sellerPhoneNo != null &&
                  _selectedProperty!.sellerPhoneNo!.trim().isNotEmpty) ||
              (_selectedProperty?.closedDealBuyerPhoneNo != null &&
                  _selectedProperty!.closedDealBuyerPhoneNo!
                      .trim()
                      .isNotEmpty));
    }
  }

  _checkForLocationDetails() {
    _isLocationDetailAvailable = _selectedProperty?.latitude != null &&
        _selectedProperty?.longitude != null;
  }

  openDialerToMakeACall() {
    String phoneNumber = '';
    if (_selectedProperty?.sharedByBrooon ?? false) {
      phoneNumber = _selectedProperty!.brooonPhone!.trim();
    } else {
      phoneNumber = _selectedProperty!.sellerPhoneNo!.trim();
      if (_selectedProperty!.propertySoldStatusId ==
          SaveDefaultData.soldStatusId) {
        phoneNumber = _selectedProperty!.closedDealBuyerPhoneNo!.trim();
      }
    }
    if (phoneNumber.trim().isNotEmpty) {
      StaticFunctions.openDialer(phoneNumber);
    }
  }

  openMap(BuildContext context) async {
    String mapUrl = '';
    final latitude = _selectedProperty!.latitude;
    final longitude = _selectedProperty!.longitude;
    if (Platform.isIOS) {
      mapUrl = 'https://maps.apple.com/?daddr=$latitude,$longitude';
    } else {
      mapUrl =
          'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
    }
    try {
      await launchUrl(
        Uri.parse(mapUrl),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      if (_localizationsContext != null) {
        SnackBarView.showSnackBar(
          context,
          _localizationsContext!.noMapAppFound,
        );
      }
    }
  }

  // If Property is uploaded to server then this method will be in affect
  _savePropertyStatusToSync({
    required StatusTypeToSync statusType,
    CommonPropertyDataProvider? commonPropertyDataProvider,
    required bool status,
    bool shouldUpload = false,
    CloseDealModel? closedDealInfo,
  }) async {
    await PropertyInquiryStatusHelper.savePropertyStatusToSync(
      isarService: _isarService,
      selectedProperty: _selectedProperty!,
      localizationsContext: _localizationsContext!,
      commonPropertyDataProvider: commonPropertyDataProvider,
      closedDealInfo: closedDealInfo,
      shouldUpload: shouldUpload,
      statusType: statusType,
      status: status,
    );
  }

  _watchOnPropertyChanges() async {
    if (_selectedProperty != null) {
      final onPropertyChanges = await _isarService.watchOnPropertyUpdate(
        _selectedProperty!.id,
      );
      _onPropertyChangesStream = onPropertyChanges.listen(
        (event) async {
          _selectedProperty = await _isarService.getPropertyById(
            _selectedProperty!.id,
          );
          if (_selectedProperty != null) {
            _createMenuItem();
          }
          notifyListeners();
        },
      );
    }
  }

  OverlayEntry _getDummyBackgroundOverlay() {
    //To add dummy widget behind menu when menu items are shown, for detecting out of menu touch events.
    return OverlayEntry(
      builder: (builder) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                closeMenu();
              },
              onTapDown: (v) {
                closeMenu();
              },
              onVerticalDragStart: (v) {
                closeMenu();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }

  updatePropertyVisitorCount(int count) {
    if (_selectedProperty != null) {
      _selectedProperty!..visitorCount = count;
    }
    notifyListeners();
  }

  openVisitorScreen(BuildContext context) {
    if (isReadOnlyMode) {
      return;
    }
    if (_selectedProperty != null) {
      Navigator.pushNamed(
        context,
        Routes.visitors,
        arguments: _selectedProperty,
      );
    }
  }

  String getPropertyFor(AppLocalizations? _localizationsContext) {
    String value = '';
    if (selectedProperty?.propertyForValues != null) {
      selectedProperty!.propertyForValues!.forEach(
        (element) {
          if (value.isNotEmpty) {
            value += ' / ';
          }
          value += element;
        },
      );
    }
    return _localizationsContext?.propertyForValue(value) ?? '';
  }

  _fillBuyerDetailsDialog(BuildContext buildContext) {
    showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (dialogContext) {
        return CloseProperty(
          buildContext: buildContext,
          property: _selectedProperty!,
          commonPropertyDataProvider: _commonPropertyDataProvider,
          localizationsContext: _localizationsContext,
          onCloseDeal: (model) async {
            _updateCloseDealStatus(
              closedDealInfo: model,
            );
          },
          callToCloseConfirmationDialog: () {
            Navigator.pop(buildContext);
          },
        );
      },
      isDismissible: true,
      backgroundColor: StaticFunctions.getColor(
        buildContext,
        ColorEnum.whiteColor,
      ),
      barrierColor: StaticFunctions.getColor(
        buildContext,
        ColorEnum.bottomSheetBarrierColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  onDispose() {
    _onPropertyChangesStream?.cancel();
  }
}
