import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:tuple/tuple.dart';

import './model/property_details_section.dart';
import './model/property_for_type.dart';
import './model/property_visibility_option.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/scroll_behavior.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/property_details/property_details_provider.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_menu/menu_item_model.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/measure_size_widget.dart';
import '../../widgets/photo_gallery/photo_gallery_arg.dart';
import '../../widgets/switch.dart';
import '../shared_by_brooon/brooon_association_item.dart';

// Ref. tab bar and tab bar view -> https://stackoverflow.com/a/57383014/5370550
// https://blog.logrocket.com/nestedscrollview-enhanced-scrolling-flutter/
class PropertyDetails extends StatelessWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedProperty =
        ModalRoute.of(context)!.settings.arguments as DbProperty?;
    return ChangeNotifierProvider(
      create: (_) => PropertyDetailsProvider(),
      child: _PropertyDetailsBody(
        selectedProperty: selectedProperty,
      ),
    );
  }
}

class _PropertyDetailsBody extends StatefulWidget {
  final DbProperty? selectedProperty;

  const _PropertyDetailsBody({
    Key? key,
    required this.selectedProperty,
  }) : super(key: key);

  @override
  State<_PropertyDetailsBody> createState() =>
      _PropertyDetailsBodyState(selectedProperty);
}

class _PropertyDetailsBodyState extends State<_PropertyDetailsBody>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollController;

  AppLocalizations? _localizationsContext;
  PropertyDetailsProvider? _propertyDetailProvider;
  CommonPropertyDataProvider? _commonPropertyDataProvider;
  DbProperty? _selectedProperty;

  _PropertyDetailsBodyState(this._selectedProperty);

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController?.addListener(
      () {
        _propertyDetailProvider?.closeMenu();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _tabController?.dispose();
    _propertyDetailProvider?.onDispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_localizationsContext == null) {
      _localizationsContext = AppLocalizations.of(context)!;
    }
    if (_commonPropertyDataProvider == null) {
      _commonPropertyDataProvider = Provider.of<CommonPropertyDataProvider>(
        context,
        listen: false,
      );
    }
    if (_propertyDetailProvider == null) {
      _propertyDetailProvider = Provider.of<PropertyDetailsProvider>(
        context,
        listen: false,
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          _propertyDetailProvider?.init(
            _selectedProperty,
            _commonPropertyDataProvider!,
            _localizationsContext!,
          );
        },
      );
    }
    super.didChangeDependencies();
  }

  Widget _sectionDetailItemRow({
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: Dimensions.propertyDetailSectionItemTextSize.sp,
              color: StaticFunctions.getColor(
                context,
                ColorEnum.gray90Color,
              ),
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.propertyDetailSectionItemAndValueBetweenSpacing.w,
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: TextStyle(
              fontSize: Dimensions.propertyDetailSectionItemTextSize.sp,
              fontWeight: FontWeight.w500,
              color: StaticFunctions.getColor(
                context,
                ColorEnum.blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _propertyDetailProvider?.closeMenu();
      },
      onTapDown: (v) {
        _propertyDetailProvider?.closeMenu();
      },
      child: WillPopScope(
        onWillPop: () {
          if (_propertyDetailProvider?.isPopupMenuVisible() ?? false) {
            _propertyDetailProvider?.closeMenu();
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            child: Selector<PropertyDetailsProvider, Size>(
              shouldRebuild: (prev, next) => true,
              selector: (_, state) => state.appBarSize,
              builder: (context, appBarSize, child) {
                bool isExpanded = appBarSize.height.round() >
                    (Dimensions.propertyDetailAppBarExtendedHeight.h / 2);
                return ThemeConfig.appBar(
                  context,
                  statusBarColor: ColorEnum.transparent,
                  brightness: !isExpanded ? Brightness.dark : Brightness.light,
                );
              },
            ),
            preferredSize: Size(0, 0),
          ),
          body: Selector<PropertyDetailsProvider, DbProperty?>(
            shouldRebuild: (prev, next) => true,
            selector: (_, state) => state.selectedProperty,
            builder: (_, property, __) {
              if (property != null) {
                property
                  ..distance = _selectedProperty?.distance
                  ..customHeroTagKey = _selectedProperty?.customHeroTagKey
                  ..marker = _selectedProperty?.marker
                  ..isSelected = _selectedProperty?.isSelected ?? false;
                _selectedProperty = property;
              }
              return ScrollConfiguration(
                behavior: MaterialScrollBehavior().copyWith(overscroll: false),
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [];
                  },
                  body: Builder(
                    builder: (contextNestedOne) {
                      return ScrollConfiguration(
                        behavior: MaterialScrollBehavior()
                            .copyWith(overscroll: false),
                        child: NestedScrollView(
                          controller: _scrollController,
                          headerSliverBuilder:
                              (contextNestedTwo, innerBoxIsScrolled) {
                            return [
                              SliverLayoutBuilder(
                                builder: (BuildContext context, constraints) {
                                  final isExpanded = constraints.scrollOffset
                                          .round() <
                                      (Dimensions
                                              .propertyDetailAppBarExtendedHeight
                                              .h /
                                          1.17);
                                  // https://github.com/flutter/flutter/issues/27906#issuecomment-499043685
                                  return SliverOverlapAbsorber(
                                    handle: NestedScrollView
                                        .sliverOverlapAbsorberHandleFor(
                                      contextNestedOne,
                                    ),
                                    sliver: SliverSafeArea(
                                      top: false,
                                      sliver: SliverAppBar(
                                        backgroundColor:
                                            StaticFunctions.getColor(
                                          context,
                                          ColorEnum.toolbarDefaultColor,
                                        ),
                                        automaticallyImplyLeading: false,
                                        expandedHeight: Dimensions
                                            .propertyDetailAppBarExtendedHeight
                                            .h,
                                        floating: false,
                                        pinned: true,
                                        titleSpacing: 0,
                                        elevation: 0,
                                        title: Container(
                                          height: Dimensions
                                              .propertyDetailToolBarHeight.h,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: isExpanded
                                                          ? Dimensions
                                                              .screenHorizontalMargin
                                                              .w
                                                          : (Dimensions
                                                                      .screenHorizontalMargin /
                                                                  2)
                                                              .w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimensions
                                                            .propertyDetailAppBarMenuIconContainerRadius
                                                            .r,
                                                      ),
                                                      color: isExpanded
                                                          ? StaticFunctions
                                                              .getColor(
                                                              context,
                                                              ColorEnum
                                                                  .transparentBlackColor,
                                                            )
                                                          : Colors.transparent,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _propertyDetailProvider
                                                            ?.closeMenu();
                                                        Navigator.pop(context);
                                                      },
                                                      splashColor:
                                                          StaticFunctions
                                                              .getColor(
                                                        context,
                                                        ColorEnum.blackColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimensions
                                                            .propertyDetailAppBarMenuIconContainerRadius
                                                            .r,
                                                      ),
                                                      child: Container(
                                                        width: Dimensions
                                                            .toolbarBackArrowSize
                                                            .w,
                                                        height: Dimensions
                                                            .toolbarBackArrowSize
                                                            .w,
                                                        padding: EdgeInsets.all(
                                                          Dimensions
                                                              .toolbarBackArrowPadding
                                                              .w,
                                                        ),
                                                        child: SvgPicture.asset(
                                                          Strings.iconLeftArrow,
                                                          color: StaticFunctions
                                                              .getColor(
                                                            context,
                                                            isExpanded
                                                                ? ColorEnum
                                                                    .whiteColor
                                                                : ColorEnum
                                                                    .blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions
                                                        .toolbarTextIconBetweenSpace
                                                        .w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      !isExpanded
                                                          ? (_selectedProperty
                                                                      ?.sharedByBrooon ??
                                                                  false)
                                                              ? '${_selectedProperty?.propertyTypeValue}'
                                                              : '${_selectedProperty?.propertyId} | ${_selectedProperty?.propertyTypeValue}'
                                                          : '',
                                                      style: TextStyle(
                                                        color: StaticFunctions
                                                            .getColor(
                                                          context,
                                                          ColorEnum.blackColor,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: Dimensions
                                                            .propertyDetailNameTextSize
                                                            .sp,
                                                      ),
                                                    ),
                                                  ),
                                                  if (_selectedProperty!
                                                      .isFavorite)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        right: isExpanded
                                                            ? Dimensions
                                                                .livePropertyPropertyDetailMargin15
                                                                .w
                                                            : (Dimensions
                                                                    .livePropertyPropertyDetailMargin2
                                                                    .w +
                                                                Dimensions
                                                                    .toolbarBackArrowPadding
                                                                    .w),
                                                      ),
                                                      child: SvgPicture.asset(
                                                        Strings
                                                            .iconDrawerFavorite,
                                                        height: Dimensions
                                                            .favoriteIconSize.h,
                                                        width: Dimensions
                                                            .favoriteIconSize.h,
                                                      ),
                                                    ),
                                                  if (StaticFunctions
                                                      .needToShowLivePropertyIndication(
                                                    _selectedProperty,
                                                  ))
                                                    Container(
                                                      height: double.infinity,
                                                      margin: EdgeInsets.only(
                                                        right: isExpanded
                                                            ? Dimensions
                                                                .livePropertyPropertyDetailMargin15
                                                                .w
                                                            : Dimensions
                                                                .livePropertyPropertyDetailMargin2
                                                                .w,
                                                      ),
                                                      child: Center(
                                                        child: Lottie.asset(
                                                          Strings
                                                              .livePropertyAnimation,
                                                          width: Dimensions
                                                              .livePropertyAnimationSize
                                                              .w,
                                                          height: Dimensions
                                                              .livePropertyAnimationSize
                                                              .w,
                                                        ),
                                                      ),
                                                    ),
                                                  /*if (_selectedProperty
                                                          ?.sharedByBrooon ==
                                                      false)
                                                    Selector<PropertyDetailsProvider,
                                                        bool>(
                                                      selector: (_, state) =>
                                                          state.isPropertySold,
                                                      builder:
                                                          (context, isSold, child) {
                                                        return isSold
                                                            ? const SizedBox()
                                                            : Container(
                                                                margin:
                                                                    EdgeInsets.only(
                                                                  right: isExpanded
                                                                      ? (Dimensions
                                                                              .screenHorizontalMargin
                                                                              .w /
                                                                          2)
                                                                      : 0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    Dimensions
                                                                        .propertyDetailAppBarMenuIconContainerRadius
                                                                        .r,
                                                                  ),
                                                                  color: isExpanded
                                                                      ? StaticFunctions
                                                                          .getColor(
                                                                          context,
                                                                          ColorEnum
                                                                              .transparentBlackColor,
                                                                        )
                                                                      : Colors
                                                                          .transparent,
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    _addVisitorDialog();
                                                                  },
                                                                  splashColor:
                                                                      StaticFunctions
                                                                          .getColor(
                                                                    context,
                                                                    ColorEnum
                                                                        .blackColor,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    Dimensions
                                                                        .propertyDetailAppBarMenuIconContainerRadius
                                                                        .r,
                                                                  ),
                                                                  child: Container(
                                                                    width: Dimensions
                                                                        .toolbarBackArrowSize
                                                                        .w,
                                                                    height: Dimensions
                                                                        .toolbarBackArrowSize
                                                                        .w,
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                      Dimensions
                                                                          .toolbarBackArrowPadding
                                                                          .w,
                                                                    ),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      Strings
                                                                          .iconAddEye,
                                                                      color:
                                                                          StaticFunctions
                                                                              .getColor(
                                                                        context,
                                                                        isExpanded
                                                                            ? ColorEnum
                                                                                .whiteColor
                                                                            : ColorEnum
                                                                                .blackColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                      },
                                                    ),*/
                                                  /*Selector<PropertyDetailsProvider,
                                                      bool>(
                                                    selector: (_, state) =>
                                                        state.isPropertySold,
                                                    builder: (_, isSold, __) {
                                                      return isSold
                                                          ? SizedBox()
                                                          : Container(
                                                              margin: EdgeInsets.only(
                                                                right: isExpanded
                                                                    ? (_selectedProperty
                                                                                ?.sharedByBrooon !=
                                                                            true
                                                                        ? (Dimensions
                                                                                .screenHorizontalMargin
                                                                                .w /
                                                                            2)
                                                                        : Dimensions
                                                                            .screenHorizontalMargin
                                                                            .w)
                                                                    : (_selectedProperty
                                                                                ?.sharedByBrooon !=
                                                                            true
                                                                        ? 0
                                                                        : (Dimensions
                                                                                .screenHorizontalMargin
                                                                                .w /
                                                                            1.7)),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  Dimensions
                                                                      .propertyDetailAppBarMenuIconContainerRadius
                                                                      .r,
                                                                ),
                                                                color: isExpanded
                                                                    ? StaticFunctions
                                                                        .getColor(
                                                                        context,
                                                                        ColorEnum
                                                                            .transparentBlackColor,
                                                                      )
                                                                    : Colors
                                                                        .transparent,
                                                              ),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child: InkWell(
                                                                  splashColor:
                                                                      StaticFunctions
                                                                          .getColor(
                                                                    context,
                                                                    ColorEnum
                                                                        .blackColor,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    Dimensions
                                                                        .propertyDetailAppBarMenuIconContainerRadius
                                                                        .r,
                                                                  ),
                                                                  onTap: () {
                                                                    ShareUtils
                                                                        .showSharePicker(
                                                                      context,
                                                                      _localizationsContext!,
                                                                      _selectedProperty,
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    width: Dimensions
                                                                        .toolbarBackArrowSize
                                                                        .w,
                                                                    height: Dimensions
                                                                        .toolbarBackArrowSize
                                                                        .w,
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                      Dimensions
                                                                          .toolbarBackArrowPadding
                                                                          .w,
                                                                    ),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      Strings
                                                                          .iconShareDetails,
                                                                      color:
                                                                          StaticFunctions
                                                                              .getColor(
                                                                        context,
                                                                        isExpanded
                                                                            ? ColorEnum
                                                                                .whiteColor
                                                                            : ColorEnum
                                                                                .blackColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                    },
                                                  ),*/
                                                  /*if (!(_selectedProperty
                                                          ?.sharedByBrooon ??
                                                      false))*/
                                                  Selector<
                                                      PropertyDetailsProvider,
                                                      Tuple2<
                                                          List<MenuItemModel>,
                                                          GlobalKey<State>>>(
                                                    selector: (_, state) =>
                                                        Tuple2(
                                                      state.getPropertyMenu,
                                                      state
                                                          .propertyMenuButtonKey,
                                                    ),
                                                    shouldRebuild:
                                                        (prev, next) => true,
                                                    builder: (context, menuData,
                                                        child) {
                                                      return menuData.item1
                                                                  .length >
                                                              0
                                                          ? Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                right: isExpanded
                                                                    ? (Dimensions
                                                                        .screenHorizontalMargin
                                                                        .w)
                                                                    : (Dimensions
                                                                            .screenHorizontalMargin
                                                                            .w /
                                                                        3.5),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  Dimensions
                                                                      .propertyDetailAppBarMenuIconContainerRadius
                                                                      .r,
                                                                ),
                                                                color:
                                                                    isExpanded
                                                                        ? StaticFunctions
                                                                            .getColor(
                                                                            context,
                                                                            ColorEnum.transparentBlackColor,
                                                                          )
                                                                        : Colors
                                                                            .transparent,
                                                              ),
                                                              child: InkWell(
                                                                onTap: () => _propertyDetailProvider!
                                                                    .openPropertyMenu(
                                                                        context,
                                                                        isExpanded),
                                                                splashColor:
                                                                    StaticFunctions
                                                                        .getColor(
                                                                  context,
                                                                  ColorEnum
                                                                      .blackColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  Dimensions
                                                                      .propertyDetailAppBarMenuIconContainerRadius
                                                                      .r,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  key: menuData
                                                                      .item2,
                                                                  width: Dimensions
                                                                      .toolbarBackArrowSize
                                                                      .w,
                                                                  height: Dimensions
                                                                      .toolbarBackArrowSize
                                                                      .w,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                    Dimensions
                                                                        .toolbarBackArrowPadding
                                                                        .w,
                                                                  ),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    Strings
                                                                        .iconMore,
                                                                    color: StaticFunctions
                                                                        .getColor(
                                                                      context,
                                                                      isExpanded
                                                                          ? ColorEnum
                                                                              .whiteColor
                                                                          : ColorEnum
                                                                              .blackColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : SizedBox();
                                                    },
                                                  ),
                                                ],
                                              ),
                                              if (isExpanded &&
                                                  _selectedProperty?.photos !=
                                                      null &&
                                                  (_selectedProperty?.photos
                                                              ?.length ??
                                                          0) >
                                                      0)
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions
                                                          .propertyDetailAppBarMenuIconContainerRadius
                                                          .r,
                                                    ),
                                                    color: isExpanded
                                                        ? StaticFunctions
                                                            .getColor(
                                                            context,
                                                            ColorEnum
                                                                .transparentBlackColor,
                                                          )
                                                        : Colors.transparent,
                                                  ),
                                                  padding: EdgeInsets.all(
                                                    Dimensions
                                                        .toolbarBackArrowPadding
                                                        .w,
                                                  ),
                                                  child: Text(
                                                    '1 / ${_selectedProperty?.photos?.length ?? 0}',
                                                    style: TextStyle(
                                                      color: StaticFunctions
                                                          .getColor(
                                                        context,
                                                        ColorEnum.whiteColor,
                                                      ),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: Dimensions
                                                          .propertyDetailPhotosTextSize
                                                          .sp,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        flexibleSpace: MeasureSize(
                                          onChange: (Size size) {
                                            _propertyDetailProvider
                                                ?.setAppBarSize = size;
                                          },
                                          child: FlexibleSpaceBar(
                                            titlePadding: EdgeInsets.zero,
                                            background: Container(
                                              child: Stack(
                                                children: [
                                                  Positioned.fill(
                                                    child: InkWell(
                                                      onTap: _selectedProperty
                                                                      ?.photos !=
                                                                  null &&
                                                              (_selectedProperty
                                                                          ?.photos
                                                                          ?.length ??
                                                                      0) >
                                                                  0
                                                          ? () {
                                                              Navigator
                                                                  .pushNamed(
                                                                context,
                                                                Routes
                                                                    .photoGallery,
                                                                arguments:
                                                                    PhotoGalleryArg(
                                                                  imagePaths:
                                                                      _propertyDetailProvider!
                                                                          .retrievePhotosFiles(),
                                                                  index: 0,
                                                                ),
                                                              );
                                                            }
                                                          : null,
                                                      child: ImageLoader(
                                                        image: (_selectedProperty
                                                                        ?.photos ==
                                                                    null ||
                                                                _selectedProperty!
                                                                        .photos!
                                                                        .length ==
                                                                    0)
                                                            ? ''
                                                            : _selectedProperty!
                                                                .photos![0],
                                                        heroTag: (_selectedProperty
                                                                        ?.customHeroTagKey !=
                                                                    null &&
                                                                _selectedProperty!
                                                                    .customHeroTagKey!
                                                                    .trim()
                                                                    .isNotEmpty)
                                                            ? '${_selectedProperty!.customHeroTagKey!.trim()}${_selectedProperty?.id}'
                                                            : '${_selectedProperty?.id}',
                                                        propertyTypeId:
                                                            _selectedProperty
                                                                ?.propertyTypeId,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    right: 0,
                                                    child: Container(
                                                      height: Dimensions
                                                          .propertyDetailImageShadowHeight
                                                          .h,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Colors.black
                                                                .withOpacity(
                                                                    0.6),
                                                            Colors.black
                                                                .withOpacity(0),
                                                          ],
                                                          begin: Alignment
                                                              .bottomCenter,
                                                          end: Alignment
                                                              .topCenter,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: Dimensions
                                                            .screenHorizontalMargin
                                                            .w,
                                                        vertical: Dimensions
                                                            .propertyDetailPropertyAddedAtVerticalPadding
                                                            .h,
                                                      ),
                                                      child: Text(
                                                        _localizationsContext!
                                                            .propertyAddedAt(
                                                                '${StaticFunctions.changeDateFormat(
                                                          _selectedProperty!
                                                              .addedAt,
                                                          AppConfig
                                                              .propertyAddedAtDateFormat,
                                                        )}'),
                                                        style: TextStyle(
                                                          color: StaticFunctions
                                                              .getColor(
                                                            context,
                                                            ColorEnum
                                                                .whiteColor,
                                                          ),
                                                          fontSize: Dimensions
                                                              .propertyDetailPropertyAddedAtTextSize
                                                              .sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SliverToBoxAdapter(
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: Selector<PropertyDetailsProvider,
                                      Tuple2<Size, Size>>(
                                    shouldRebuild: (prev, next) => true,
                                    selector: (_, state) => Tuple2(
                                      state.toolBarSize,
                                      state.appBarSize,
                                    ),
                                    builder: (context, sizeTuple, child) {
                                      bool isExpanded = sizeTuple.item2.height
                                              .round() >
                                          (Dimensions
                                                  .propertyDetailAppBarExtendedHeight
                                                  .h /
                                              2.5);
                                      return AnimatedContainer(
                                        margin: EdgeInsets.only(
                                          top: !isExpanded
                                              ? sizeTuple.item1.height
                                              : 0,
                                        ),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: SafeArea(
                                          top: !isExpanded,
                                          bottom: false,
                                          child: ScrollConfiguration(
                                            behavior: HideGlowBehavior(),
                                            child: SingleChildScrollView(
                                              physics: ClampingScrollPhysics(),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: Dimensions
                                                          .propertyDetailPropertyForAndVisibilityVerticalMargin
                                                          .h,
                                                      horizontal: Dimensions
                                                          .screenHorizontalMargin
                                                          .w,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            _propertyDetailProvider
                                                                    ?.getPropertyFor(
                                                                  _localizationsContext,
                                                                ) ??
                                                                '',
                                                            style: TextStyle(
                                                              fontSize: Dimensions
                                                                  .propertyDetailPropertyForTextSize
                                                                  .sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        Selector<
                                                            PropertyDetailsProvider,
                                                            Tuple4<
                                                                GlobalKey<
                                                                    State>,
                                                                List<
                                                                    PropertyVisibility>,
                                                                bool,
                                                                bool>>(
                                                          shouldRebuild:
                                                              (prev, next) =>
                                                                  true,
                                                          selector:
                                                              (_, state) =>
                                                                  Tuple4(
                                                            state
                                                                .propertyVisibilityButtonKey,
                                                            state
                                                                .propertyVisibilityList,
                                                            state
                                                                .isPropertySold,
                                                            state
                                                                .isPropertyActive,
                                                          ),
                                                          builder:
                                                              (_, data, __) {
                                                            if (data.item2
                                                                .isNotEmpty) {
                                                              final selectedVisibility =
                                                                  data.item2
                                                                      .firstWhere(
                                                                (element) => element
                                                                    .isSelected,
                                                              );
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: StaticFunctions
                                                                      .getColor(
                                                                    context,
                                                                    ColorEnum
                                                                        .themeColorOpacity5Percentage,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    Dimensions
                                                                        .propertyDetailVisibilityBoxBorderRadius
                                                                        .r,
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: StaticFunctions
                                                                        .getColor(
                                                                      context,
                                                                      ColorEnum
                                                                          .borderColorE0,
                                                                    ),
                                                                    width: Dimensions
                                                                        .propertyDetailVisibilityBoxBorderWidth
                                                                        .w,
                                                                  ),
                                                                ),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      InkWell(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      Dimensions
                                                                          .propertyDetailVisibilityBoxBorderRadius
                                                                          .r,
                                                                    ),
                                                                    onTap: !data.item3 &&
                                                                            data
                                                                                .item4 &&
                                                                            !_selectedProperty!
                                                                                .sharedByBrooon
                                                                        ? () =>
                                                                            _propertyDetailProvider?.openPropertyVisibilityMenu(
                                                                              context,
                                                                            )
                                                                        : null,
                                                                    child:
                                                                        Container(
                                                                      key: data
                                                                          .item1,
                                                                      padding:
                                                                          EdgeInsets
                                                                              .symmetric(
                                                                        vertical: Dimensions
                                                                            .propertyDetailVisibilityBoxInnerVerticalPadding
                                                                            .h,
                                                                        horizontal: Dimensions
                                                                            .propertyDetailVisibilityBoxInnerHorizontalPadding
                                                                            .w,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          SvgPicture
                                                                              .asset(
                                                                            selectedVisibility.icon,
                                                                            height:
                                                                                Dimensions.propertyDetailVisibilityIconSize.h,
                                                                            width:
                                                                                Dimensions.propertyDetailVisibilityIconSize.h,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                Dimensions.propertyDetailVisibilityTextAndIconBetweenSpacing.w,
                                                                          ),
                                                                          Text(
                                                                            selectedVisibility.title,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: Dimensions.propertyDetailSelectedVisibilityTextSize.sp,
                                                                              color: StaticFunctions.getColor(
                                                                                context,
                                                                                ColorEnum.blackColor,
                                                                              ),
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                Dimensions.propertyDetailVisibilityTextAndArrowBetweenSpacing.w,
                                                                          ),
                                                                          SvgPicture
                                                                              .asset(
                                                                            Strings.iconDownArrow,
                                                                            color:
                                                                                StaticFunctions.getColor(
                                                                              context,
                                                                              ColorEnum.gray90Color,
                                                                            ),
                                                                            height:
                                                                                Dimensions.propertyDetailVisibilityArrowSize.h,
                                                                            width:
                                                                                Dimensions.propertyDetailVisibilityArrowSize.h,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            return SizedBox();
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  LightDivider(),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: Dimensions
                                                          .screenHorizontalMargin
                                                          .w,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: Dimensions
                                                                .propertyDetailBasicDetailsVerticalMargin
                                                                .h,
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (!(_selectedProperty
                                                                          ?.sharedByBrooon ??
                                                                      false))
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        StaticFunctions
                                                                            .propertyItemIdWithName(
                                                                          _selectedProperty!,
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize: Dimensions
                                                                              .propertyDetailPropertyIdTextSize
                                                                              .sp,
                                                                          color:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            ColorEnum.gray90Color,
                                                                          ),
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Selector<
                                                                      PropertyDetailsProvider,
                                                                      Tuple2<
                                                                          bool,
                                                                          bool>>(
                                                                    selector: (_,
                                                                            state) =>
                                                                        Tuple2(
                                                                      state
                                                                          .isPropertyActive,
                                                                      state
                                                                          .isPropertySold,
                                                                    ),
                                                                    builder: (context,
                                                                        tuple,
                                                                        child) {
                                                                      if (tuple
                                                                              .item2 ||
                                                                          (_selectedProperty?.sharedByBrooon ??
                                                                              false)) {
                                                                        return const SizedBox();
                                                                      }
                                                                      return CustomSwitch(
                                                                        width: Dimensions
                                                                            .settingListItemSwitchWidth
                                                                            .w,
                                                                        height: Dimensions
                                                                            .settingListItemSwitchHeight
                                                                            .h,
                                                                        borderRadius: Dimensions
                                                                            .settingListItemSwitchRadius
                                                                            .r,
                                                                        inactiveColor:
                                                                            StaticFunctions.getColor(
                                                                          context,
                                                                          ColorEnum
                                                                              .grayColor,
                                                                        ),
                                                                        activeColor:
                                                                            StaticFunctions.getColor(
                                                                          context,
                                                                          ColorEnum
                                                                              .greenColor,
                                                                        ),
                                                                        toggleSize: Dimensions
                                                                            .settingListItemSwitchThumbRadius
                                                                            .r,
                                                                        value: tuple
                                                                            .item1,
                                                                        disabled:
                                                                            _propertyDetailProvider?.isReadOnlyMode ??
                                                                                false,
                                                                        onToggle:
                                                                            (value) {
                                                                          _propertyDetailProvider
                                                                              ?.updatePropertyStatus(
                                                                            _commonPropertyDataProvider,
                                                                            value,
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: Dimensions
                                                                    .propertyDetailNameAndLocationDetailsBetweenSpacing
                                                                    .h,
                                                              ),
                                                              Text(
                                                                CommonPropertyDataProvider
                                                                    .propertyAreaWithPropertyType(
                                                                  _selectedProperty!,
                                                                ),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      Dimensions
                                                                          .propertyDetailTypeAndAreaTextSize
                                                                          .sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: StaticFunctions
                                                                      .getColor(
                                                                    context,
                                                                    ColorEnum
                                                                        .blackColor,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: Dimensions
                                                                    .propertyDetailNameAndLocationDetailsBetweenSpacing
                                                                    .h,
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      top: Dimensions
                                                                          .propertyDetailLocationIconVerticalPadding
                                                                          .h,
                                                                    ),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      Strings
                                                                          .iconLocation,
                                                                      height: Dimensions
                                                                          .propertyDetailLocationIconSize
                                                                          .h,
                                                                      width: Dimensions
                                                                          .propertyDetailLocationIconSize
                                                                          .h,
                                                                      color: StaticFunctions
                                                                          .getColor(
                                                                        context,
                                                                        StaticFunctions.isPropertyLocationAvailable(_selectedProperty)
                                                                            ? ColorEnum.themeColor
                                                                            : ColorEnum.gray90Color,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: Dimensions
                                                                        .propertyDetailLocationIconAndAddressBetweenSpacing
                                                                        .w,
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      (_selectedProperty?.sharedByBrooon ??
                                                                              false)
                                                                          ? (_selectedProperty?.publicAddressLandMark != null && _selectedProperty!.publicAddressLandMark!.isNotEmpty)
                                                                              ? _selectedProperty!.publicAddressLandMark!
                                                                              : _localizationsContext!.unknownLocation
                                                                          : (_selectedProperty?.addressLandMark != null && _selectedProperty!.addressLandMark!.isNotEmpty)
                                                                              ? _selectedProperty!.addressLandMark!
                                                                              : _localizationsContext!.unknownLocation,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize: Dimensions
                                                                            .propertyDetailAddressTextSize
                                                                            .sp,
                                                                        color: StaticFunctions
                                                                            .getColor(
                                                                          context,
                                                                          StaticFunctions.isPropertyLocationAvailable(_selectedProperty)
                                                                              ? ColorEnum.blackColor
                                                                              : ColorEnum.gray90Color,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        LightDivider(),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: Dimensions
                                                                .propertyDetailBasicDetailsVerticalMargin
                                                                .h,
                                                          ),
                                                          child: Selector<
                                                              PropertyDetailsProvider,
                                                              List<
                                                                  PropertyForType>>(
                                                            shouldRebuild:
                                                                (prev, next) =>
                                                                    true,
                                                            selector: (_,
                                                                    state) =>
                                                                state
                                                                    .availablePropertyForTypes,
                                                            builder: (_,
                                                                forTypeList,
                                                                __) {
                                                              return Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List
                                                                    .generate(
                                                                  forTypeList
                                                                      .length,
                                                                  (index) =>
                                                                      Container(
                                                                    margin:
                                                                        EdgeInsets
                                                                            .only(
                                                                      top: (index !=
                                                                              0)
                                                                          ? Dimensions
                                                                              .propertyDetailForTypesVerticalBetweenSpacing
                                                                              .h
                                                                          : 0,
                                                                    ),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          forTypeList[index]
                                                                              .icon,
                                                                          height: Dimensions
                                                                              .propertyDetailForTypesIconSize
                                                                              .h,
                                                                          width: Dimensions
                                                                              .propertyDetailForTypesIconSize
                                                                              .h,
                                                                        ),
                                                                        SizedBox(
                                                                          width: Dimensions
                                                                              .propertyDetailForTypesIconAndContentBetweenSpacing
                                                                              .w,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                forTypeList[index].name,
                                                                                style: TextStyle(
                                                                                  fontSize: Dimensions.propertyDetailForTypesTextSize.sp,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  color: StaticFunctions.getColor(
                                                                                    context,
                                                                                    ColorEnum.gray90Color,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    StaticFunctions.isPriceAvailable(forTypeList[index].priceRange) ? forTypeList[index].priceRange : _localizationsContext!.unknownPrice,
                                                                                    style: TextStyle(
                                                                                      fontSize: Dimensions.propertyDetailForTypesPriceTextSize.sp,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      color: StaticFunctions.getColor(
                                                                                        context,
                                                                                        StaticFunctions.isPriceAvailable(forTypeList[index].priceRange) ? ColorEnum.blackColor : ColorEnum.gray90Color,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if (forTypeList[index].pricePerArea != null && forTypeList[index].pricePerArea!.trim().isNotEmpty && forTypeList[index].areaUnit != null && forTypeList[index].areaUnit!.trim().isNotEmpty)
                                                                                    Text(
                                                                                      '(${forTypeList[index].pricePerArea!} /${forTypeList[index].areaUnit!})',
                                                                                      style: TextStyle(
                                                                                        fontSize: Dimensions.propertyDetailForTypesPricePerSizeTextSize.sp,
                                                                                        color: StaticFunctions.getColor(
                                                                                          context,
                                                                                          ColorEnum.blackColor,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        if (_selectedProperty!
                                                            .negotiationAllowed)
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: Dimensions
                                                                      .propertyDetailBasicDetailsVerticalMargin
                                                                      .h /
                                                                  2,
                                                            ),
                                                            child: Text(
                                                              '*${_localizationsContext!.allowNegotiation}',
                                                              style: TextStyle(
                                                                fontSize: Dimensions
                                                                    .propertyDetailNegotiableTextSize
                                                                    .sp,
                                                                color:
                                                                    StaticFunctions
                                                                        .getColor(
                                                                  context,
                                                                  ColorEnum
                                                                      .blackColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        LightDivider(),
                                                        if (_selectedProperty
                                                                ?.sharedByBrooon ==
                                                            false)
                                                          InkWell(
                                                            splashColor:
                                                                StaticFunctions
                                                                    .getColor(
                                                              context,
                                                              ColorEnum
                                                                  .touchSplashColor,
                                                            ),
                                                            onTap: () {
                                                              _propertyDetailProvider
                                                                  ?.openVisitorScreen(
                                                                context,
                                                              );
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical: Dimensions
                                                                    .propertyDetailBasicDetailsVerticalMargin
                                                                    .h,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text
                                                                        .rich(
                                                                      TextSpan(
                                                                        text:
                                                                            '${_selectedProperty?.visitorCount ?? 0}',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize: Dimensions
                                                                              .propertyDetailVisitCountTextSize
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            ColorEnum.blueColor,
                                                                          ),
                                                                        ),
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                _localizationsContext!.visitorTitle,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              color: StaticFunctions.getColor(
                                                                                context,
                                                                                ColorEnum.blackColor,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SvgPicture
                                                                      .asset(
                                                                    Strings
                                                                        .iconRightArrow,
                                                                    color: StaticFunctions
                                                                        .getColor(
                                                                      context,
                                                                      ColorEnum
                                                                          .gray90Color,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        if (_selectedProperty
                                                                ?.sharedByBrooon ==
                                                            false)
                                                          LightDivider(),
                                                        Selector<
                                                            PropertyDetailsProvider,
                                                            Tuple2<bool, bool>>(
                                                          selector:
                                                              (_, state) =>
                                                                  Tuple2(
                                                            state
                                                                .isContactDetailAvailable,
                                                            state
                                                                .isLocationDetailAvailable,
                                                          ),
                                                          builder:
                                                              (_, tuple, __) {
                                                            return Column(
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    vertical:
                                                                        Dimensions
                                                                            .propertyDetailBasicDetailsVerticalMargin
                                                                            .h,
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            ButtonWidget(
                                                                          text:
                                                                              _localizationsContext!.propertyDetailCallNow,
                                                                          onClick: tuple.item1
                                                                              ? () {
                                                                                  _propertyDetailProvider?.openDialerToMakeACall();
                                                                                }
                                                                              : null,
                                                                          icon:
                                                                              Strings.iconCall,
                                                                          borderRadius: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnRadius
                                                                              .r,
                                                                          textSize: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnTextSize
                                                                              .sp,
                                                                          borderColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            ColorEnum.borderColorE0,
                                                                          ),
                                                                          iconHeight: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnIconSize
                                                                              .h,
                                                                          iconWidth: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnIconSize
                                                                              .h,
                                                                          borderWidth: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnBorderWidth
                                                                              .w,
                                                                          textColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            tuple.item1
                                                                                ? ColorEnum.blackColor
                                                                                : ColorEnum.gray99Color,
                                                                          ),
                                                                          iconColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            tuple.item1
                                                                                ? ColorEnum.themeColor
                                                                                : ColorEnum.gray99Color,
                                                                          ),
                                                                          bgColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            ColorEnum.themeColorOpacity3Percentage,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: Dimensions
                                                                            .propertyDetailCallAndDirectionBtnBetweenSpacing
                                                                            .w,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            ButtonWidget(
                                                                          text:
                                                                              _localizationsContext!.propertyDetailDirection,
                                                                          onClick: tuple.item2
                                                                              ? () {
                                                                                  _propertyDetailProvider?.openMap(
                                                                                    context,
                                                                                  );
                                                                                }
                                                                              : null,
                                                                          icon:
                                                                              Strings.iconSearchMap,
                                                                          borderRadius: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnRadius
                                                                              .r,
                                                                          textSize: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnTextSize
                                                                              .sp,
                                                                          iconHeight: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnIconSize
                                                                              .h,
                                                                          iconWidth: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnIconSize
                                                                              .h,
                                                                          borderWidth: Dimensions
                                                                              .propertyDetailCallAndDirectionBtnBorderWidth
                                                                              .w,
                                                                          borderColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            ColorEnum.borderColorE0,
                                                                          ),
                                                                          textColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            tuple.item2
                                                                                ? ColorEnum.blackColor
                                                                                : ColorEnum.gray99Color,
                                                                          ),
                                                                          iconColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            tuple.item2
                                                                                ? ColorEnum.themeColor
                                                                                : ColorEnum.gray99Color,
                                                                          ),
                                                                          bgColor:
                                                                              StaticFunctions.getColor(
                                                                            context,
                                                                            ColorEnum.themeColorOpacity3Percentage,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ];
                          },
                          body: Selector<PropertyDetailsProvider,
                              List<PropertyDetailsSection>>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) =>
                                state.propertyDetailsSectionList,
                            builder: (_, sectionList, __) {
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: sectionList.length,
                                itemBuilder: (context, sectionIndex) {
                                  final currentSection =
                                      sectionList[sectionIndex];
                                  return StickyHeader(
                                    header: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions
                                            .propertyDetailSectionVerticalPadding
                                            .h,
                                        horizontal:
                                            Dimensions.screenHorizontalMargin.w,
                                      ),
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.stickyHeaderBlueBgColor,
                                      ),
                                      child: Text(
                                        currentSection.sectionTitle,
                                        style: TextStyle(
                                          fontSize: Dimensions
                                              .propertyDetailSectionTitleTextSize
                                              .sp,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.blueColor,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    content: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          currentSection.sectionData.length,
                                      itemBuilder: (context, sectionItemIndex) {
                                        if (currentSection.id ==
                                            _propertyDetailProvider
                                                ?.closingDetailSectionId) {
                                          final isNoteFieldAvailable =
                                              _selectedProperty
                                                          ?.closedDealNotes !=
                                                      null &&
                                                  _selectedProperty!
                                                      .closedDealNotes!
                                                      .trim()
                                                      .isNotEmpty;
                                          final mobileNo = _selectedProperty
                                              ?.closedDealBuyerPhoneNo;
                                          return Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: Dimensions
                                                  .screenHorizontalMargin.w,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: Dimensions
                                                  .propertyDetailBasicDetailsVerticalMargin
                                                  .h,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _localizationsContext!
                                                      .propertyDetailTitleBuyerDetails,
                                                  style: TextStyle(
                                                    fontSize: Dimensions
                                                        .propertyDetailBuyerTitleTextSize
                                                        .sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: StaticFunctions
                                                        .getColor(
                                                      context,
                                                      ColorEnum.blueColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Dimensions
                                                      .propertyDetailBuyerTitleAndContentBetweenSpacing
                                                      .h,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            _selectedProperty
                                                                    ?.closedDealBuyerName ??
                                                                _localizationsContext!
                                                                    .unknownText,
                                                            style: TextStyle(
                                                              fontSize: Dimensions
                                                                  .propertyDetailBuyerContentTextSize
                                                                  .sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  StaticFunctions
                                                                      .getColor(
                                                                context,
                                                                ColorEnum
                                                                    .blackColor,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Dimensions
                                                                .propertyDetailBuyerNameAndNumberBetweenSpacing
                                                                .h,
                                                          ),
                                                          Text(
                                                            mobileNo != null &&
                                                                    mobileNo
                                                                        .trim()
                                                                        .isNotEmpty
                                                                ? mobileNo
                                                                    .trim()
                                                                : _localizationsContext!
                                                                    .unknownMobileNo,
                                                            style: TextStyle(
                                                              fontSize: Dimensions
                                                                  .propertyDetailBuyerContentTextSize
                                                                  .sp,
                                                              color:
                                                                  StaticFunctions
                                                                      .getColor(
                                                                context,
                                                                (mobileNo !=
                                                                            null &&
                                                                        mobileNo
                                                                            .trim()
                                                                            .isNotEmpty)
                                                                    ? ColorEnum
                                                                        .blackColor
                                                                    : ColorEnum
                                                                        .gray90Color,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      StaticFunctions
                                                          .getPropertySoldUnsoldIcon(
                                                        _selectedProperty,
                                                      ),
                                                      width: Dimensions
                                                          .propertyDetailSoldIconSize
                                                          .w,
                                                      height: Dimensions
                                                          .propertyDetailSoldIconSize
                                                          .w,
                                                    ),
                                                  ],
                                                ),
                                                if (isNoteFieldAvailable)
                                                  SizedBox(
                                                    height: Dimensions
                                                        .propertyDetailBasicDetailsVerticalMargin
                                                        .h,
                                                  ),
                                                if (isNoteFieldAvailable)
                                                  LightDivider(),
                                                if (isNoteFieldAvailable)
                                                  SizedBox(
                                                    height: Dimensions
                                                        .propertyDetailBasicDetailsVerticalMargin
                                                        .h,
                                                  ),
                                                if (isNoteFieldAvailable)
                                                  _sectionDetailItemRow(
                                                    title: _localizationsContext!
                                                        .closeDealDialogNotes,
                                                    value: _selectedProperty!
                                                        .closedDealNotes!
                                                        .trim(),
                                                  ),
                                              ],
                                            ),
                                          );
                                        } else if (_selectedProperty!
                                                .sharedByBrooon &&
                                            currentSection.id ==
                                                _propertyDetailProvider
                                                    ?.brooonDetailSectionId) {
                                          final isAssociateDetailsAvailable =
                                              (_selectedProperty!
                                                              .associationPhoto !=
                                                          null &&
                                                      _selectedProperty!
                                                          .associationPhoto!
                                                          .trim()
                                                          .isNotEmpty) ||
                                                  (_selectedProperty!
                                                              .associationCode !=
                                                          null &&
                                                      _selectedProperty!
                                                          .associationCode!
                                                          .trim()
                                                          .isNotEmpty);
                                          final mobileNo =
                                              _selectedProperty?.brooonPhone;
                                          final name =
                                              _selectedProperty?.brooonName;
                                          return Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: Dimensions
                                                  .screenHorizontalMargin.w,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: Dimensions
                                                  .propertyDetailBasicDetailsVerticalMargin
                                                  .h,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _sectionDetailItemRow(
                                                  title: _localizationsContext!
                                                      .brooonName,
                                                  value: name ??
                                                      _localizationsContext!
                                                          .unknownText,
                                                ),
                                                SizedBox(
                                                  height: Dimensions
                                                      .propertyDetailBasicDetailsVerticalMargin
                                                      .h,
                                                ),
                                                _sectionDetailItemRow(
                                                  title: _localizationsContext!
                                                      .brooonMobile,
                                                  value: mobileNo != null &&
                                                          mobileNo
                                                              .trim()
                                                              .isNotEmpty
                                                      ? mobileNo.trim()
                                                      : _localizationsContext!
                                                          .unknownMobileNo,
                                                ),
                                                if (isAssociateDetailsAvailable)
                                                  SizedBox(
                                                    height: Dimensions
                                                        .propertyDetailBasicDetailsVerticalMargin
                                                        .h,
                                                  ),
                                                if (isAssociateDetailsAvailable)
                                                  LightDivider(),
                                                if (isAssociateDetailsAvailable)
                                                  SizedBox(
                                                    height: Dimensions
                                                        .propertyDetailBasicDetailsVerticalMargin
                                                        .h,
                                                  ),
                                                if (isAssociateDetailsAvailable)
                                                  BrooonAssociationItem(
                                                    brooonAssociationPic:
                                                        _selectedProperty!
                                                            .associationPhoto,
                                                    brooonAssociationName:
                                                        _selectedProperty!
                                                            .associationCode,
                                                  ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          final currentItem = currentSection
                                              .sectionData.entries
                                              .elementAt(sectionItemIndex);
                                          return Container(
                                            padding: EdgeInsets.only(
                                              left: Dimensions
                                                  .screenHorizontalMargin.w,
                                              right: Dimensions
                                                  .screenHorizontalMargin.w,
                                              top: sectionItemIndex == 0
                                                  ? Dimensions
                                                      .propertyDetailSectionItemVerticalPadding
                                                      .h
                                                  : (Dimensions
                                                          .propertyDetailSectionItemVerticalPadding
                                                          .h /
                                                      2),
                                              bottom: sectionItemIndex ==
                                                      currentSection.sectionData
                                                              .length -
                                                          1
                                                  ? Dimensions
                                                      .propertyDetailSectionItemVerticalPadding
                                                      .h
                                                  : (Dimensions
                                                          .propertyDetailSectionItemVerticalPadding
                                                          .h /
                                                      2),
                                            ),
                                            child: _sectionDetailItemRow(
                                              title: currentItem.key,
                                              value: currentItem.value,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
