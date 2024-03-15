import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import './model/inquiry_details_section.dart';
import './model/property_for_type.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property_amenity.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/sync_helper.dart';
import '../../views/add_buyer/model/add_buyer_args.dart';
import '../../widgets/arrow_clipper.dart';
import '../../widgets/custom_menu/menu_item_model.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/snack_bar_view.dart';
import '../blocked_broooners/utils/block_utils.dart';
import '../close_deal/close_deal_model.dart';
import '../close_deal/close_inquiry.dart';
import '../property_details/model/property_visibility_option.dart';
import '../property_inquiry_status_helper/property_inquiry_status_helper.dart';
import '../report/report_public_property.dart';
import '../share/share_utils.dart';

class InquiryDetailsProvider extends ChangeNotifier {
  AppLocalizations? _localizationsContext;
  final _isarService = IsarService();
  DbSavedFilter? _selectedInquiry;
  Size toolBarSize = Size.zero;
  Size appBarSize = Size.zero;
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
  OverlayEntry? _menuOverlay;
  late OverlayEntry _backgroundOverlay;
  bool _isInquiryMenuOpened = false;
  bool _isInquiryVisibilityMenuOpened = false;
  final inquiryMenuButtonKey = GlobalKey<State>();
  final inquiryVisibilityButtonKey = GlobalKey<State>();
  StreamSubscription<void>? _onInquiryChangesStream;
  List<InquiryDetailsSection> inquiryDetailsSectionList = [];
  bool _isContactDetailAvailable = false;
  bool _isLocationDetailAvailable = false;
  List<PropertyForType> availablePropertyForTypes = [];
  List<PropertyVisibility> inquiryVisibilityList = [];
  late CommonPropertyDataProvider _commonPropertyDataProvider;
  bool isReadOnlyMode = false;

  DbSavedFilter? get selectedInquiry => _selectedInquiry;

  List<MenuItemModel> get getInquiryMenu => _menuItem;

  bool get isContactDetailAvailable => _isContactDetailAvailable;

  bool get isLocationDetailAvailable => _isLocationDetailAvailable;

  set setToolBarSize(Size size) {
    toolBarSize = size;
    notifyListeners();
  }

  set setAppBarSize(Size size) {
    appBarSize = size;
    notifyListeners();
  }

  init(
    DbSavedFilter? inquiry,
    CommonPropertyDataProvider commonPropertyDataProvider,
    AppLocalizations localizationsContext,
  ) async {
    isReadOnlyMode = inquiry?.isReadOnly ?? false;
    _commonPropertyDataProvider = commonPropertyDataProvider;
    if (inquiry != null && inquiry.sharedByBrooon == false) {
      _selectedInquiry = await _isarService.getSavedFilterById(inquiry.id);
    } else {
      // shared by broooner's properties are not being stored in local db so use direct
      _selectedInquiry = inquiry;
    }

    if (_selectedInquiry?.selectedAmenities != null &&
        _selectedInquiry!.selectedAmenities!.isNotEmpty) {
      propertyAmenityList = await _isarService
          .getAmenitiesBasedOnName(_selectedInquiry!.selectedAmenities!);
    }
    if (_selectedInquiry?.preferredCaste != null &&
        _selectedInquiry!.preferredCaste!.isNotEmpty) {
      preferredCastList = await _isarService.getPreferredCommunityBasedOnValues(
          _selectedInquiry!.preferredCaste!);
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
    _watchOnInquiryChanges();
    _availableInquiryForValues();
    notifyListeners();
  }

  _createVisibilityItems() {
    inquiryVisibilityList = [
      PropertyVisibility()
        ..id = SaveDefaultData.propertyVisibilityPrivateId
        ..icon = Strings.iconPropertyVisibilityPrivate
        ..title = _localizationsContext!.propertyVisibilityPrivateTitle
        ..subtitle = _localizationsContext!.propertyVisibilityPrivateSubtitle
        ..isSelected = !_selectedInquiry!.isPublicInquiry,
      PropertyVisibility()
        ..id = SaveDefaultData.propertyVisibilityPublicId
        ..icon = Strings.iconPropertyVisibilityPublic
        ..title = _localizationsContext!.propertyVisibilityPublicTitle
        ..subtitle = _localizationsContext!.propertyVisibilityPublicSubtitle
        ..isSelected = _selectedInquiry!.isPublicInquiry,
    ];
  }

  openInquiryVisibilityMenu(BuildContext context) async {
    closeMenu();
    if (isReadOnlyMode) {
      return;
    }
    final RenderBox? popupButtonObject =
        inquiryVisibilityButtonKey.currentContext?.findRenderObject()
            as RenderBox?;
    final List<MenuItemModel> menuItems = [];
    inquiryVisibilityList.forEachIndexed(
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
        _selectInquiryVisibility(context, selectedId);
      },
    );
    if (!_isInquiryVisibilityMenuOpened &&
        menuList.isNotEmpty &&
        popupButtonObject != null) {
      final RenderBox? overlay =
          Overlay.of(context)?.context.findRenderObject() as RenderBox?;
      if (overlay != null) {
        _menuOverlay = _overlayEntryBuilder(
          buttonKey: inquiryVisibilityButtonKey,
          menuWidgets: menuList,
          menuWidth: MediaQuery.of(context).size.width * 0.6,
          marginEnd: Dimensions.screenHorizontalMargin.w,
        );
        if (_menuOverlay != null) {
          Overlay.of(context)?.insert(_backgroundOverlay);
          Overlay.of(context)?.insert(_menuOverlay!);
          _isInquiryVisibilityMenuOpened = true;
        }
      }
    }
  }

  _availableInquiryForValues() {
    if (_selectedInquiry?.propertyFor != null) {
      final map = StaticFunctions.getInquiryFormattedPrice(
        localizationsContext: _localizationsContext!,
        inquiry: _selectedInquiry,
      );

      if (map.keys.contains(SaveDefaultData.propertyForSellId)) {
        availablePropertyForTypes.add(
          PropertyForType()
            ..icon = Strings.iconForBuy
            ..name = _localizationsContext!.forBuy
            ..priceRange = map[SaveDefaultData.propertyForSellId]!
            ..areaUnit = _selectedInquiry?.measureUnitValue
            ..minPricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedInquiry?.sellMinPricePerSize?.toString() ?? ''))
            ..maxPricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedInquiry?.sellMaxPricePerSize?.toString() ?? '')),
        );
      }
      if (map.keys.contains(SaveDefaultData.propertyForRentId)) {
        availablePropertyForTypes.add(
          PropertyForType()
            ..icon = Strings.iconForRent
            ..name = _localizationsContext!.forRent
            ..priceRange = map[SaveDefaultData.propertyForRentId]!
            ..areaUnit = _selectedInquiry?.measureUnitValue
            ..minPricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedInquiry?.rentMinPricePerSize?.toString() ?? ''))
            ..maxPricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedInquiry?.rentMaxPricePerSize?.toString() ?? '')),
        );
      }
      if (map.keys.contains(SaveDefaultData.propertyForLeaseId)) {
        availablePropertyForTypes.add(
          PropertyForType()
            ..icon = Strings.iconForLease
            ..name = _localizationsContext!.forLease
            ..priceRange = map[SaveDefaultData.propertyForLeaseId]!
            ..areaUnit = _selectedInquiry?.measureUnitValue
            ..minPricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedInquiry?.leaseMinPricePerSize?.toString() ?? ''))
            ..maxPricePerArea = StaticFunctions.formatPrice(
                StaticFunctions.removeTrailingZeros(
                    _selectedInquiry?.leaseMaxPricePerSize?.toString() ?? '')),
        );
      }
    }
  }

  openMap(BuildContext context) async {
    String mapUrl = '';
    final latitude = _selectedInquiry!.latitude;
    final longitude = _selectedInquiry!.longitude;
    if (latitude != null && longitude != null) {
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
  }

  _divideDataIntoSection(
    CommonPropertyDataProvider commonPropertyDataProvider,
    AppLocalizations localizationsContext,
  ) async {
    inquiryDetailsSectionList.clear();

    LinkedHashMap<String, String> ownerDetails = LinkedHashMap();
    if (_selectedInquiry!.buyerName.trim().isNotEmpty) {
      ownerDetails[localizationsContext.buyerName] =
          _selectedInquiry!.buyerName;
    }
    if (_selectedInquiry!.mobileNo.trim().isNotEmpty) {
      ownerDetails[localizationsContext.buyerMobile] =
          _selectedInquiry!.mobileNo;
    }

    if (ownerDetails.isNotEmpty) {
      InquiryDetailsSection ownerDetailsSection = InquiryDetailsSection()
        ..id = ownerDetailSectionId
        ..sectionTitle = localizationsContext.buyerInfo
        ..sectionData = ownerDetails;
      inquiryDetailsSectionList.add(ownerDetailsSection);
    }

    if(_selectedInquiry!.sharedByBrooon){
      LinkedHashMap<String, String> brooonDetails = LinkedHashMap();
      // Fake entry - will not show anywhere
      brooonDetails[''] = '';
        InquiryDetailsSection brooonDetailsSection = InquiryDetailsSection()
          ..id = brooonDetailSectionId
          ..sectionTitle = localizationsContext.propertyDetailTitleBrooonDetails
          ..sectionData = brooonDetails;
        inquiryDetailsSectionList.add(brooonDetailsSection);

    }

    LinkedHashMap<String, String> propertyFeatures = LinkedHashMap();
    if (_selectedInquiry?.buildingType != null &&
        _selectedInquiry!.buildingType!.isNotEmpty) {
      final buildingTypesObj = await _isarService
          .getBuildingTypeBasedOnIds(_selectedInquiry!.buildingType!);
      String buildingTypes = '';
      buildingTypesObj.forEachIndexed(
        (index, element) {
          buildingTypes += '${element.name}';
          if (index != buildingTypesObj.length - 1) {
            buildingTypes += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.buildingType] = buildingTypes;
    }
    if (_selectedInquiry?.constructionType != null &&
        _selectedInquiry!.constructionType!.isNotEmpty) {
      final constructionTypesObj = await _isarService
          .getConstructionTypeByIds(_selectedInquiry!.constructionType!);
      String constructionTypes = '';
      constructionTypesObj.forEachIndexed(
        (index, element) {
          constructionTypes += '${element.name}';
          if (index != constructionTypesObj.length - 1) {
            constructionTypes += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.construction] = constructionTypes;
    }
    if (_selectedInquiry?.schemeType != null &&
        _selectedInquiry!.schemeType!.isNotEmpty) {
      final schemeTypesObj =
          await _isarService.getSchemeTypeByIds(_selectedInquiry!.schemeType!);
      String schemeTypes = '';
      schemeTypesObj.forEachIndexed(
        (index, element) {
          schemeTypes += '${element.name}';
          if (index != schemeTypesObj.length - 1) {
            schemeTypes += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.scheme] = schemeTypes;
    }
    if (_selectedInquiry?.furnishedType != null &&
        _selectedInquiry!.furnishedType!.isNotEmpty) {
      final furnishedStatusObj = await _isarService
          .getFurnishedStatusByIds(_selectedInquiry!.furnishedType!);
      String furnishedStatusString = '';
      furnishedStatusObj.forEachIndexed(
        (index, element) {
          furnishedStatusString += '${element.name}';
          if (index != furnishedStatusObj.length - 1) {
            furnishedStatusString += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.furnishedStatus] =
          furnishedStatusString;
    }
    if (_selectedInquiry?.additionalFurnish != null &&
        _selectedInquiry!.additionalFurnish!.isNotEmpty) {
      String additionalFurnish = '';
      _selectedInquiry!.additionalFurnish!.forEachIndexed(
        (index, element) {
          additionalFurnish += '$element';
          if (index != _selectedInquiry!.additionalFurnish!.length - 1) {
            additionalFurnish += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.additionalFurnishing] =
          additionalFurnish;
    }
    if (_selectedInquiry?.bhkIds != null &&
        _selectedInquiry!.bhkIds!.isNotEmpty) {
      final bhkObj =
          await _isarService.getBhkTypesByIds(_selectedInquiry!.bhkIds!);
      String bhks = '';
      bhkObj.forEachIndexed(
        (index, element) {
          bhks += '${element.name}';
          if (index != bhkObj.length - 1) {
            bhks += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.bhk] = bhks;
    }
    if (_selectedInquiry?.bathroomCount != null &&
        _selectedInquiry!.bathroomCount! > 0) {
      propertyFeatures[localizationsContext.bathRooms] =
          _selectedInquiry!.bathroomCount!.toString();
    }
    if (_selectedInquiry?.roomCount != null &&
        _selectedInquiry!.roomCount! > 0) {
      propertyFeatures[localizationsContext.rooms] =
          _selectedInquiry!.roomCount!.toString();
    }
    if (_selectedInquiry?.floorCount != null &&
        _selectedInquiry!.floorCount! > 0) {
      propertyFeatures[localizationsContext.floors] =
          _selectedInquiry!.floorCount!.toString();
    }
    if (_selectedInquiry?.totalFloorCount != null &&
        _selectedInquiry!.totalFloorCount! > 0) {
      propertyFeatures[localizationsContext.totalFloors] =
          _selectedInquiry!.totalFloorCount!.toString();
    }
    if (_selectedInquiry?.isWashroomAvailable != null) {
      propertyFeatures[localizationsContext.washRoomAvailable] =
          _selectedInquiry!.isWashroomAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.isBalconyAvailable != null) {
      propertyFeatures[localizationsContext.balcony] =
          _selectedInquiry!.isBalconyAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.isCornerPiece != null) {
      propertyFeatures[localizationsContext.cornerPiece] =
          _selectedInquiry!.isCornerPiece!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.isAllottedParkingAvailable != null) {
      propertyFeatures[localizationsContext.allottedParking] =
          _selectedInquiry!.isAllottedParkingAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.isParkingAvailable != null) {
      propertyFeatures[localizationsContext.parkingAvailable] =
          _selectedInquiry!.isParkingAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.isLiftAvailable != null) {
      propertyFeatures[localizationsContext.liftAvailable] =
          _selectedInquiry!.isLiftAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.isLightConnectionAvailable != null) {
      propertyFeatures[localizationsContext.lightConnection] =
          _selectedInquiry!.isLightConnectionAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.isWellAvailable != null) {
      propertyFeatures[localizationsContext.wellAvailable] =
          _selectedInquiry!.isWellAvailable!
              ? localizationsContext.yes
              : localizationsContext.no;
    }
    if (_selectedInquiry?.connectedRoads != null &&
        _selectedInquiry!.connectedRoads!.isNotEmpty) {
      String connectedRoads = '';
      for (int i = 0; i < _selectedInquiry!.connectedRoads!.length; i++) {
        connectedRoads +=
            '${StaticFunctions.removeTrailingZeros(_selectedInquiry!.connectedRoads![i].toString())}';
        if (i != _selectedInquiry!.connectedRoads!.length - 1) {
          connectedRoads += ' / ';
        }
      }

      if (connectedRoads.trim().isNotEmpty) {
        propertyFeatures[
                '${localizationsContext.connectedRoad} (${localizationsContext.ft})'] =
            connectedRoads;
      }
    }
    if (_selectedInquiry?.facingType != null) {
      final facingObj =
          await _isarService.getFacingTypesByIds(_selectedInquiry!.facingType!);
      String facingTypes = '';
      facingObj.forEachIndexed(
        (index, element) {
          facingTypes += '${element.name}';
          if (index != facingObj.length - 1) {
            facingTypes += ', ';
          }
        },
      );
      propertyFeatures[localizationsContext.facingType] = facingTypes;
    }
    if (_selectedInquiry?.frontSize != null &&
        _selectedInquiry!.frontSize!.toString().trim().isNotEmpty) {
      propertyFeatures[localizationsContext.frontSize] =
          '${StaticFunctions.removeTrailingZeros(_selectedInquiry!.frontSize!.toString().trim())} ${localizationsContext.feet}';
    }
    if (_selectedInquiry?.depthSize != null &&
        _selectedInquiry!.depthSize!.toString().trim().isNotEmpty) {
      propertyFeatures[localizationsContext.depthSize] =
          '${StaticFunctions.removeTrailingZeros(_selectedInquiry!.depthSize!.toString().trim())} ${localizationsContext.feet}';
    }
    if (_selectedInquiry?.selectedAmenities != null &&
        _selectedInquiry!.selectedAmenities!.isNotEmpty) {
      String amenities = '';
      _selectedInquiry!.selectedAmenities!.forEachIndexed(
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
      InquiryDetailsSection propertyFeatureSection = InquiryDetailsSection()
        ..id = featureDetailSectionId
        ..sectionTitle = localizationsContext.inquiryDetailTitleInquiryFeatures
        ..sectionData = propertyFeatures;
      inquiryDetailsSectionList.add(propertyFeatureSection);
    }

    LinkedHashMap<String, String> otherDetails = LinkedHashMap();
    if (_selectedInquiry?.preferredCaste != null &&
        _selectedInquiry!.preferredCaste!.isNotEmpty) {
      String casts = '';
      _selectedInquiry!.preferredCaste!.forEachIndexed(
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

    if (_selectedInquiry?.notes != null &&
        _selectedInquiry!.notes!.trim().isNotEmpty) {
      otherDetails[localizationsContext.propertyNote] =
          _selectedInquiry!.notes!;
    }

    if (otherDetails.isNotEmpty) {
      InquiryDetailsSection otherDetailsSection = InquiryDetailsSection()
        ..id = otherDetailSectionId
        ..sectionTitle = localizationsContext.propertyDetailTitleOtherDetails
        ..sectionData = otherDetails;
      inquiryDetailsSectionList.add(otherDetailsSection);
    }
    _closedDealSection(localizationsContext);
    notifyListeners();
  }

  _closedDealSection(
    AppLocalizations localizationsContext,
  ) {
    if (_selectedInquiry?.inquirySoldStatusId == SaveDefaultData.soldStatusId) {
      LinkedHashMap<String, String> closingDetails = LinkedHashMap();
      // Fake entry - will not show anywhere
      closingDetails[''] = '';
      InquiryDetailsSection closingDetailSection = InquiryDetailsSection()
        ..id = closingDetailSectionId
        ..sectionTitle = localizationsContext.closingDetails
        ..sectionData = closingDetails;
      inquiryDetailsSectionList.add(closingDetailSection);
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

  openInquiryMenu(BuildContext context, bool isExpanded) async {
    closeMenu();
    final RenderBox? popupButtonObject =
        inquiryMenuButtonKey.currentContext?.findRenderObject() as RenderBox?;
    final List<Widget> menuList = _createMenuItems(
      context,
      menuItem: _menuItem,
      onItemSelected: (selectedId) {
        closeMenu();
        _onInquiryMenuItemSelected(context, selectedId);
      },
    );
    if (!_isInquiryMenuOpened &&
        menuList.isNotEmpty &&
        popupButtonObject != null) {
      final RenderBox? overlay =
          Overlay.of(context)?.context.findRenderObject() as RenderBox?;
      if (overlay != null) {
        _menuOverlay = _overlayEntryBuilder(
          buttonKey: inquiryMenuButtonKey,
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
          _isInquiryMenuOpened = true;
        }
      }
    }
  }

  _onInquiryMenuItemSelected(BuildContext context, int? selectedId) {
    if (selectedId != null) {
      if (selectedId == editMenuItem) {
        // edit functionality
        Navigator.pushNamed(
          context,
          Routes.addBuyer,
          arguments: AddBuyerArgs(
            inquiryEnum: InquiryEnums.edit,
            inquiryId: _selectedInquiry!.id,
          ),
        );
      } else if (selectedId == copyMenuItem) {
        // copy functionality
        Navigator.pushNamed(
          context,
          Routes.addBuyer,
          arguments: AddBuyerArgs(
            inquiryEnum: InquiryEnums.copy,
            inquiryId: _selectedInquiry!.id,
          ),
        );
      } else if (selectedId == shareMenuItem) {
        ShareUtils.showInquirySharePicker(
          context,
          _localizationsContext!,
          _selectedInquiry,
        );
      } else if (selectedId == reportMenuItem) {
        ReportPublicProperty.showReportPicker(
          buildContext: context,
          localizationsContext: _localizationsContext!,
          selectedInquiry: _selectedInquiry!,
        );
      } else if (selectedId == deleteMenuItem) {
        _deleteInquiry(context);
      } else if (selectedId == favoriteMenuItem) {
        _makeFavoriteUnFavorite();
      } else if (selectedId == blockMenuItem) {
        _blockBroker(context);
      } else if (selectedId == closeDealMenuItem) {
        _fillSellerDetailsDialog(context);
      }
    }
  }

  _selectInquiryVisibility(BuildContext context, int id) async {
    final selectedVisibility =
        inquiryVisibilityList.firstWhereOrNull((element) => element.isSelected);
    final visibilityToSelect =
        inquiryVisibilityList.firstWhereOrNull((element) => element.id == id);
    if (visibilityToSelect != null &&
        (selectedVisibility == null || id != selectedVisibility.id)) {
      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DialogWidget(
            title: _localizationsContext!
                .messageInquiryVisibilityChangeDialog(visibilityToSelect.title),
            icon: visibilityToSelect.icon,
            positiveButton: _localizationsContext!.yes,
            negativeButton: _localizationsContext!.cancel,
            onNegativeButtonClick: () {
              Navigator.pop(dialogContext);
            },
            onPositiveButtonClick: () async {
              Navigator.pop(dialogContext);
              inquiryVisibilityList
                  .forEach((element) => element.isSelected = false);
              visibilityToSelect.isSelected = true;
              _selectedInquiry!.isPublicInquiry = visibilityToSelect.id ==
                  SaveDefaultData.propertyVisibilityPublicId;
              await _isarService.saveFilter(_selectedInquiry!);
              notifyListeners();
              await _saveInquiryStatusToSync(
                statusType: StatusTypeToSync.privatePublic,
                status: _selectedInquiry!.isPublicInquiry,
                shouldUpload: true,
              );
            },
          );
        },
      );
    }
  }

  closeMenu() {
    if (_isInquiryMenuOpened || _isInquiryVisibilityMenuOpened) {
      _backgroundOverlay.remove();
    }
    if (_isInquiryMenuOpened && _menuOverlay != null) {
      _menuOverlay!.remove();
      _isInquiryMenuOpened = false;
    }
    if (_isInquiryVisibilityMenuOpened && _menuOverlay != null) {
      _menuOverlay!.remove();
      _isInquiryVisibilityMenuOpened = false;
    }
  }

  bool isPopupMenuVisible() {
    return _isInquiryMenuOpened || _isInquiryVisibilityMenuOpened;
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

  _deleteInquiry(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogWidget(
          title: '',
          titleWidget: Container(
            child: Text.rich(
              TextSpan(
                text: _localizationsContext!.dialogDeleteInquiryMsg1,
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
                        '${_selectedInquiry?.inquiryId} | ${_selectedInquiry!.propertyTypeValues!.first}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: _localizationsContext!.dialogDeleteInquiryMsg2,
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
            final isDeleted = await deleteInquiry();
            // close popup
            Navigator.pop(context);
            if (isDeleted) {
              // close inquiry details screen
              Navigator.pop(context);
            } else {
              SnackBarView.showSnackBar(
                context,
                _localizationsContext!.failedToDeleteInquiry,
              );
            }
          },
        );
      },
    );
  }

  Future<bool> deleteInquiry() async {
    int? inquiryId = _selectedInquiry?.id;
    if (inquiryId != null) {
      await _saveInquiryStatusToSync(
        statusType: StatusTypeToSync.delete,
        status: true,
        shouldUpload: true,
      );
      return await _isarService.deleteInquiry(inquiryId);
    }
    return false;
  }

  _makeFavoriteUnFavorite() async {
    if (_selectedInquiry != null &&
        _selectedInquiry!.sharedByBrooon == false) {
      _selectedInquiry!.isFavorite = !_selectedInquiry!.isFavorite;
      await _isarService.saveFilter(_selectedInquiry!);
      _createMenuItem();
    }
  }

  _createMenuItem() {
    _menuItem.clear();
    if (!isReadOnlyMode) {
      _menuItem.addAll(
        [
          if (_selectedInquiry!.sharedByBrooon == false &&
              _selectedInquiry!.inquirySoldStatusId ==
                  SaveDefaultData.unSoldStatusId)
            MenuItemModel(
              id: editMenuItem,
              title: _localizationsContext!.editPropertyDetail,
              icon: Strings.iconEdit,
            ),
          if (_selectedInquiry?.sharedByBrooon == false)
            MenuItemModel(
              id: favoriteMenuItem,
              title: _selectedInquiry!.isFavorite
                  ? _localizationsContext!.makeUnfavorite
                  : _localizationsContext!.makeFavorite,
              icon: Strings.iconDrawerFavorite,
            ),
          if (_selectedInquiry?.sharedByBrooon == false &&
              _selectedInquiry?.inquirySoldStatusId ==
                  SaveDefaultData.soldStatusId)
            MenuItemModel(
              id: copyMenuItem,
              title: _localizationsContext!.copyPropertyDetail,
              icon: Strings.iconCopy,
            ),
          if (_selectedInquiry?.inquirySoldStatusId ==
              SaveDefaultData.unSoldStatusId)
            MenuItemModel(
              id: shareMenuItem,
              title: _localizationsContext!.sharePropertyDetail,
              icon: Strings.iconShareDetails,
            ),
          if (_selectedInquiry?.sharedByBrooon == true)
            MenuItemModel(
              id: reportMenuItem,
              title: _localizationsContext!.reportPublicProperty,
              icon: Strings.iconReport,
            ),
          if (_selectedInquiry?.sharedByBrooon == true &&
              _selectedInquiry?.brooonId != null &&
              _selectedInquiry?.brooonCode != null)
            MenuItemModel(
              id: blockMenuItem,
              title: _localizationsContext!.blockBrooon,
              icon: Strings.iconBlock,
            ),
          // inquiry should not be shared by brooon
          // it should be active & unsold
          if (_selectedInquiry?.sharedByBrooon == false &&
              _selectedInquiry?.inquiryStatusId ==
                  SaveDefaultData.activeStatusId &&
              _selectedInquiry?.inquirySoldStatusId ==
                  SaveDefaultData.unSoldStatusId)
            MenuItemModel(
              id: closeDealMenuItem,
              title: _localizationsContext!.inquiryDetailsCloseDealBtn,
              icon: Strings.iconMenuCloseDeal,
            ),
          if (_selectedInquiry?.sharedByBrooon == false)
            MenuItemModel(
              id: deleteMenuItem,
              title: _localizationsContext!.deletePropertyDetail,
              icon: Strings.iconDelete,
            ),
        ],
      );
    }
  }

  _checkForContactDetails() {
    if (_selectedInquiry?.sharedByBrooon ?? false) {
      _isContactDetailAvailable = _selectedInquiry?.brooonPhone != null &&
          _selectedInquiry!.brooonPhone!.trim().isNotEmpty;
    } else {
      _isContactDetailAvailable = _selectedInquiry?.mobileNo != null &&
          _selectedInquiry!.mobileNo.trim().isNotEmpty;
    }
  }

  _checkForLocationDetails() {
    _isLocationDetailAvailable = _selectedInquiry?.latitude != null &&
        _selectedInquiry?.longitude != null;
  }

  updateInquiryStatus(
    CommonPropertyDataProvider? commonPropertyDataProvider,
    bool value,
  ) async {
    if (_selectedInquiry != null && commonPropertyDataProvider != null) {
      _selectedInquiry!.inquiryStatusId = value
          ? SaveDefaultData.activeStatusId
          : SaveDefaultData.inActiveStatusId;
      final info = await commonPropertyDataProvider
          .getPropertyStatus(_selectedInquiry!.inquiryStatusId!);
      if (info != null) {
        _selectedInquiry!.inquiryStatusValue = info.name;
      }
      await _isarService.saveFilter(_selectedInquiry!);
      notifyListeners();
      await _saveInquiryStatusToSync(
        statusType: StatusTypeToSync.activeInactive,
        status: value,
        shouldUpload: true,
      );
    }
  }

  _updateCloseInquiryStatus({
    required CloseDealModel closedDealInfo,
  }) async {
    if (_selectedInquiry != null) {
      if (_selectedInquiry!.inquirySoldStatusId ==
          SaveDefaultData.unSoldStatusId) {
        bool isNeedToAddNewClosedProperty = false;
        // If no property is linked -> we are going to create new closed property
        // So adding that property's property id
        if (closedDealInfo.linkedPropertyInquiryId == null ||
            closedDealInfo.linkedPropertyInquiryId!.trim().isEmpty) {
          closedDealInfo.linkedPropertyInquiryId =
              await PropertyInquiryStatusHelper.generatePropertyId(
            isarService: _isarService,
          );
          isNeedToAddNewClosedProperty = true;
        }
        _selectedInquiry!.inquirySoldStatusId = SaveDefaultData.soldStatusId;
        _selectedInquiry!.closedDealSellerName = closedDealInfo.name;
        _selectedInquiry!.closedDealSellerPhoneNo = closedDealInfo.mobile;
        _selectedInquiry!.closeDealId = closedDealInfo.dealType;
        _selectedInquiry!.closedDealNotes = closedDealInfo.notes;
        _selectedInquiry!.closedLinkedPropertyId =
            closedDealInfo.linkedPropertyInquiryId;
        _selectedInquiry!.inquiryStatusId = SaveDefaultData.inActiveStatusId;
        final info = await _commonPropertyDataProvider.getPropertyStatus(
          SaveDefaultData.inActiveStatusId,
        );
        if (info != null) {
          _selectedInquiry!.inquiryStatusValue = info.name;
        }
        await _isarService.saveFilter(_selectedInquiry!);
        _createMenuItem();
        _checkForContactDetails();
        if (_localizationsContext != null) {
          _closedDealSection(_localizationsContext!);
        }
        notifyListeners();
        await _saveInquiryStatusToSync(
          statusType: StatusTypeToSync.closedDeals,
          status: true,
          shouldUpload: true,
          commonPropertyDataProvider: _commonPropertyDataProvider,
          closedDealInfo: closedDealInfo,
        );
        _closeLinkedProperty(closedDealInfo, isNeedToAddNewClosedProperty);
      }
    }
  }

  _closeLinkedProperty(
    CloseDealModel closedDealInfo,
    bool isNeedToAddNewClosedProperty,
  ) async {
    if (!isNeedToAddNewClosedProperty) {
      final pInfo = await _isarService.getPropertyByPropertyId(
        closedDealInfo.linkedPropertyInquiryId!,
      );
      if (pInfo != null &&
          pInfo.propertySoldStatusId == SaveDefaultData.unSoldStatusId) {
        pInfo.propertySoldStatusId = SaveDefaultData.soldStatusId;
        pInfo.closedDealBuyerName = _selectedInquiry!.buyerName;
        pInfo.closedDealBuyerPhoneNo = _selectedInquiry!.mobileNo;
        pInfo.closeDealId = closedDealInfo.dealType;
        pInfo.closedDealNotes = closedDealInfo.notes;
        pInfo.closedLinkedInquiryId = _selectedInquiry!.inquiryId;
        pInfo.propertyStatusId = SaveDefaultData.inActiveStatusId;
        final info = await _commonPropertyDataProvider.getPropertyStatus(
          SaveDefaultData.inActiveStatusId,
        );
        if (info != null) {
          pInfo.propertyStatusValue = info.name;
        }
        await _isarService.saveProperty(pInfo);
        await PropertyInquiryStatusHelper.savePropertyStatusToSync(
          isarService: _isarService,
          selectedProperty: pInfo,
          statusType: StatusTypeToSync.closedDeals,
          status: true,
          shouldUpload: true,
          commonPropertyDataProvider: _commonPropertyDataProvider,
          localizationsContext: _localizationsContext!,
          // here Inquiry related information added for Property close info
          closedDealInfo: CloseDealModel(
            name: _selectedInquiry!.buyerName,
            mobile: _selectedInquiry!.mobileNo,
            notes: closedDealInfo.notes,
            dealType: closedDealInfo.dealType,
            linkedPropertyInquiryId: _selectedInquiry!.inquiryId,
          ),
        );
      }
    } else {
      // create new property with status closed
      await PropertyInquiryStatusHelper.createNewClosedPropertyFromInquiry(
        isarService: _isarService,
        inquiry: _selectedInquiry!,
        closedDealInfo: closedDealInfo,
      );
      SyncHelper.syncPropertyInfoWithServer(
        _localizationsContext!,
        _commonPropertyDataProvider,
      );
    }
  }

  openDialerToMakeACall() {
    String phoneNumber = '';
    if (_selectedInquiry?.sharedByBrooon ?? false) {
      phoneNumber = _selectedInquiry!.brooonPhone!.trim();
    } else {
      phoneNumber = _selectedInquiry!.mobileNo.trim();
      if (_selectedInquiry!.inquirySoldStatusId ==
          SaveDefaultData.soldStatusId) {
        phoneNumber = _selectedInquiry!.closedDealSellerPhoneNo?.trim() ?? '';
      }
    }
    if (phoneNumber.trim().isNotEmpty) {
      StaticFunctions.openDialer(phoneNumber);
    }
  }

  _watchOnInquiryChanges() async {
    if (_selectedInquiry != null) {
      final onInquiryChanges = await _isarService.watchOnFilterChanges(
        id: _selectedInquiry!.id,
      );
      _onInquiryChangesStream = onInquiryChanges.listen(
        (event) async {
          _selectedInquiry = await _isarService.getSavedFilterById(
            _selectedInquiry!.id,
          );
          if (_selectedInquiry != null) {
            _createMenuItem();
          }
          notifyListeners();
        },
      );
    }
  }

  _blockBroker(BuildContext context) async {
    if (_selectedInquiry?.brooonId != null &&
        _selectedInquiry?.brooonCode != null) {
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
                brooonId: _selectedInquiry!.brooonId!,
                brooonCode: _selectedInquiry!.brooonCode!,
                brooonName: _selectedInquiry!.brooonName,
                brooonPhone: _selectedInquiry!.brooonPhone,
                brooonPhoto: _selectedInquiry!.brooonPhoto,
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

  String getPropertyFor(AppLocalizations? _localizationsContext) {
    String value = '';
    if (selectedInquiry?.propertyForValues != null &&
        selectedInquiry!.propertyForValues!.isNotEmpty) {
      selectedInquiry!.propertyForValues!.forEach(
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

  // If Inquiry is uploaded to server then this method will be in affect
  _saveInquiryStatusToSync({
    required StatusTypeToSync statusType,
    CommonPropertyDataProvider? commonPropertyDataProvider,
    required bool status,
    bool shouldUpload = false,
    CloseDealModel? closedDealInfo,
  }) async {
    await PropertyInquiryStatusHelper.saveInquiryStatusToSync(
      isarService: _isarService,
      selectedInquiry: _selectedInquiry!,
      localizationsContext: _localizationsContext!,
      commonPropertyDataProvider: commonPropertyDataProvider,
      closedDealInfo: closedDealInfo,
      shouldUpload: shouldUpload,
      statusType: statusType,
      status: status,
    );
  }

  _fillSellerDetailsDialog(BuildContext buildContext) {
    showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (dialogContext) {
        return CloseInquiry(
          inquiry: _selectedInquiry!,
          commonPropertyDataProvider: _commonPropertyDataProvider,
          localizationsContext: _localizationsContext,
          onCloseDeal: (model) {
            _updateCloseInquiryStatus(
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
    _onInquiryChangesStream?.cancel();
  }
}
