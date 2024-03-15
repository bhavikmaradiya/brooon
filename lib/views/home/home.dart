import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './dashboard_inquiry_item.dart';
import './dashboard_property_item.dart';
import './home_drawer.dart';
import './home_provider.dart';
import './widget/home_property_type_widget.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_property_type.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../network/network_connectivity.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/expandable_page_view.dart';
import '../../widgets/indicator_widget.dart';
import '../../widgets/search_widget.dart';
import '../choose_location/fetch_location_provider.dart';
import '../settings/settings_provider.dart';
import '../shared_by_brooon/shimmer_view/brooon_item_shimmer.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with WidgetsBindingObserver {
  HomeProvider? _homeProvider;
  CommonPropertyDataProvider? _commonPropertyDataProvider;
  SettingsProvider? _settingsProvider;
  FetchLocationProvider? _fetchLocationProvider;

  late AppLocalizations localizationsContext;
  late GlobalKey<ScaffoldState> scaffoldKey;
  TextStyle? viewAllTextStyle, titleTextStyle;
  late ScrollController _nearByListScrollerController;
  late ScrollController _recentlyAddedListScrollerController;
  late ScrollController _brooonPropertyScrollerController;
  late ScrollController _brooonInquiryScrollerController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        NetworkConnectivity.instance.initialise();
      },
    );
    _nearByListScrollerController = ScrollController();
    _recentlyAddedListScrollerController = ScrollController();
    _brooonPropertyScrollerController = ScrollController();
    _brooonInquiryScrollerController = ScrollController();
    _nearByListScrollerController.addListener(
      () {
        if (_nearByListScrollerController.position.maxScrollExtent ==
            _nearByListScrollerController.offset) {
          _homeProvider?.loadNearByList(shouldReset: false);
        }
      },
    );
    _recentlyAddedListScrollerController.addListener(
      () {
        if (_recentlyAddedListScrollerController.position.maxScrollExtent ==
            _recentlyAddedListScrollerController.offset) {
          _homeProvider?.loadRecentlyAddedList(shouldReset: false);
        }
      },
    );
    _brooonPropertyScrollerController.addListener(
      () {
        if (_brooonPropertyScrollerController.position.maxScrollExtent ==
            _brooonPropertyScrollerController.offset) {
          _homeProvider?.loadMoreSharedByBrooonProperties();
        }
      },
    );
    _brooonInquiryScrollerController.addListener(
      () {
        if (_brooonInquiryScrollerController.position.maxScrollExtent ==
            _brooonInquiryScrollerController.offset) {
          _homeProvider?.loadMoreSharedByBrooonInquiries();
        }
      },
    );

    WidgetsBinding.instance.addObserver(this);
    scaffoldKey = GlobalKey();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;

    if (_commonPropertyDataProvider == null) {
      _commonPropertyDataProvider = Provider.of<CommonPropertyDataProvider>(
        context,
        listen: false,
      );
    }

    if (_homeProvider == null) {
      _homeProvider = Provider.of<HomeProvider>(context, listen: false);
      _homeProvider!.init(context, _commonPropertyDataProvider);
    }

    if (_settingsProvider == null) {
      _settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
      _settingsProvider!.initializeSettings(
        context,
        localizationsContext,
      );
    }

    if (viewAllTextStyle == null) {
      viewAllTextStyle = TextStyle(
        fontSize: Dimensions.homeScreenViewAllSubtitleTextSize.sp,
        fontWeight: FontWeight.w700,
        color: StaticFunctions.getColor(
          context,
          ColorEnum.themeColor,
        ),
      );
    }
    if (titleTextStyle == null) {
      titleTextStyle = TextStyle(
        fontSize: Dimensions.homeScreenSubtitleTextSize.sp,
        fontWeight: FontWeight.w600,
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
      );
    }
    _homeProvider?.checkForPrivacy(context);

    if (AppConfig.enableNearByRealTimeFeature) {
      if (_fetchLocationProvider == null) {
        _fetchLocationProvider = Provider.of<FetchLocationProvider>(
          context,
          listen: false,
        );
        _fetchLocationProvider!.init();
      }
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() async {
    _homeProvider?.onDispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      _homeProvider?.checkForAppUpdate();
      if (_homeProvider?.isLocationServiceDisabledOnPause ?? false) {
        _fetchLocationProvider?.init();
      }
      _homeProvider?.isLocationServiceDisabledOnPause = false;
    } else if (state == AppLifecycleState.paused) {
      _homeProvider?.isLocationServiceDisabledOnPause = true;
      await FetchLocationProvider.cancelLocationService();
    }
  }

  _openPropertyList(
    String heading,
    int count,
    ViewAllFromType type, {
    int? propertyTypeId = null,
    required ViewAllTabsVisibilityType viewAllFromToHandleTabs,
  }) {
    _homeProvider?.openPropertyListScreen(
      context,
      heading,
      count,
      type,
      propertyTypeId: propertyTypeId,
      viewAllFromToHandleTabs: viewAllFromToHandleTabs,
    );
  }

  _openInquiryList(
    String heading,
    int count,
    ViewAllFromType type, {
    int? propertyTypeId = null,
    required ViewAllTabsVisibilityType viewAllFromToHandleTabs,
  }) {
    _homeProvider?.openInquiryListScreen(
      context,
      heading,
      count,
      type,
      propertyTypeId: propertyTypeId,
      viewAllFromToHandleTabs: viewAllFromToHandleTabs,
    );
  }

  Widget _navigationWidget(
    BuildContext context,
    AppLocalizations localizationsContext,
  ) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.shadowColor,
            ),
            blurRadius: Dimensions.bottomSheetButtonRadius.r,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Dimensions.bottomSheetButtonRadius.r,
            ),
            topRight: Radius.circular(
              Dimensions.bottomSheetButtonRadius.r,
            ),
          ),
          color: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.screenHorizontalMargin.w,
          vertical: Dimensions.bottomSheetVerticalPadding.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: ButtonWidget(
                text: localizationsContext.titleAddProperty,
                textColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                bgColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                icon: Strings.iconDrawerProperties,
                iconWidth: Dimensions.homeScreenAddBuyerIconSize.w,
                iconHeight: Dimensions.homeScreenAddPropertyIconSize.h,
                iconColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                onClick: () {
                  _homeProvider?.openAddProperty();
                },
              ),
            ),
            SizedBox(
              width: Dimensions.homeScreenBottomNavigationButtonSpacing.w,
            ),
            Expanded(
              child: ButtonWidget(
                text: localizationsContext.addBuyer,
                textColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                bgColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                icon: Strings.iconDrawerInquiries,
                iconWidth: Dimensions.homeScreenAddBuyerIconSize.h,
                iconHeight: Dimensions.homeScreenAddBuyerIconSize.h,
                iconColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                onClick: () {
                  _homeProvider?.openAddBuyer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _notificationCountPadding() {
    return Dimensions.homeScreenTopPaddingForNotificationCount.h;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isItPhone = size.width < 700;
    return WillPopScope(
      onWillPop: () async {
        if (!(scaffoldKey.currentState?.isDrawerOpen ?? false)) {
          await FetchLocationProvider.cancelLocationService();
        }
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: ThemeConfig.appBar(
          context,
          statusBarColor: ColorEnum.whiteColor,
        ),
        key: scaffoldKey,
        drawer: Drawer(
          child: HomeDrawer(
            scaffoldKey: scaffoldKey,
            homeScreenProvider: _homeProvider!,
            localizationsContext: localizationsContext,
          ),
        ),
        bottomNavigationBar: _navigationWidget(
          context,
          localizationsContext,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: (Dimensions.screenHorizontalMargin / 2).w,
                  right: (Dimensions.screenHorizontalMargin / 2).w,
                  top: Dimensions.homeScreenToolbarVerticalMargin.h,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: _notificationCountPadding(),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                              Dimensions.homeScreenNavigationIconBorderRadius.r,
                            ),
                            onTap: () {
                              StaticFunctions.unFocusKeyboardIfAny(context);
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(
                                Dimensions
                                    .homeScreenNavigationIconInnerPadding.h,
                              ),
                              child: SvgPicture.asset(
                                Strings.iconHomeNavigation,
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blackColor,
                                ),
                                height: Dimensions.homeScreenDrawerIconHeight.h,
                                width: Dimensions.homeScreenDrawerIconWidth.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*
                      // location will be hide.
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _homeProvider?.openLocationScreen();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    localizationsContext.yourLocation,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.gray90Color,
                                      ),
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions
                                          .homeScreenNavigationTitleFontSize.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions
                                        .homeScreenNavigationArrowContentSpaceBetween
                                        .w,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: Dimensions
                                          .homeScreenLocationBottomArrowMarginTop
                                          .h,
                                    ),
                                    child: SvgPicture.asset(
                                      Strings.iconDownArrow,
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.gray90Color,
                                      ),
                                      width: Dimensions
                                          .homeScreenLocationBottomArrowWidth.w,
                                      height: Dimensions
                                          .homeScreenLocationBottomArrowHeight.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.screenHorizontalMargin.w,
                              ),
                              child: InkWell(
                                onTap: () {
                                  _homeProvider?.openLocationScreen();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      Strings.iconLocation,
                                      height:
                                          Dimensions.homeScreenPinIconHeight.h,
                                      width: Dimensions.homeScreenPinIconWidth.w,
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.blueColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions
                                          .homeScreenNavigationArrowContentSpaceBetween
                                          .w,
                                    ),
                                    Flexible(
                                      child: Selector<HomeProvider, DbUserInfo?>(
                                        shouldRebuild: (prev, next) => true,
                                        selector: (_, state) => state.userInfo,
                                        builder: (context, userInfo, child) {
                                          return Text(
                                            userInfo?.currentArea ??
                                                localizationsContext
                                                    .unknownLocation,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.blackColor,
                                              ),
                                              fontWeight: FontWeight.w600,
                                              fontSize: Dimensions
                                                  .homeScreenNavigationSubtitleFontSize
                                                  .sp,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),*/
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: _notificationCountPadding(),
                          ),
                          child: Center(
                            child: Text(
                              localizationsContext.drawerItemDashboard,
                              maxLines: 1,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blackColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                fontSize: Dimensions.toolbarTextSize.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: (Dimensions.screenHorizontalMargin / 2).w,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                              Dimensions.homeScreenNavigationIconBorderRadius.r,
                            ),
                            onTap: () {
                              _homeProvider?.openNotificationScreen();
                            },
                            child: Center(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: _notificationCountPadding(),
                                      right: Dimensions
                                          .homeScreenNotificationPaddingRight.w,
                                    ),
                                    child: SvgPicture.asset(
                                      Strings.iconHomeNavigationNotification,
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.blackColor,
                                      ),
                                      height: Dimensions
                                          .homeScreenNavigationIconSize.h,
                                      width: Dimensions
                                          .homeScreenNavigationIconSize.h,
                                    ),
                                  ),
                                  Selector<HomeProvider, int>(
                                    shouldRebuild: (prev, next) => true,
                                    selector: (_, state) =>
                                        state.totalNotificationCounts,
                                    builder: (_, count, __) {
                                      return count > 0
                                          ? Positioned(
                                              right: Dimensions
                                                  .homeScreenNotificationPositionedRight
                                                  .h,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      StaticFunctions.getColor(
                                                    context,
                                                    ColorEnum.whiteColor,
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(
                                                  Dimensions
                                                      .homeScreenNotificationCountWhiteCirclePadding
                                                      .h,
                                                ),
                                                child: Container(
                                                  height: Dimensions
                                                      .homeScreenNotificationCountThemeCircleSize
                                                      .h,
                                                  width: Dimensions
                                                      .homeScreenNotificationCountThemeCircleSize
                                                      .h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: StaticFunctions
                                                        .getColor(
                                                      context,
                                                      ColorEnum.themeColor,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: (Dimensions
                                                                .homeScreenNotificationCountWhiteCirclePadding)
                                                            .h,
                                                      ),
                                                      child: Text(
                                                        '$count',
                                                        style: TextStyle(
                                                          color: StaticFunctions
                                                              .getColor(
                                                            context,
                                                            ColorEnum
                                                                .whiteColor,
                                                          ),
                                                          fontSize: Dimensions
                                                              .homeScreenNotificationCountTextSize
                                                              .sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox();
                                    },
                                  )
                                ],
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
                height: (Dimensions.homeScreenNavigationBuildingIconHeight +
                        (Dimensions.searchFieldHeight / 2.3))
                    .h,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(
                        Strings.iconHomeScreenNavigationBuilding,
                        height:
                            Dimensions.homeScreenNavigationBuildingIconHeight.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: Dimensions.screenHorizontalMargin.w,
                      right: Dimensions.screenHorizontalMargin.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: SearchWidget(
                              searchHint: localizationsContext.homeSearchHint,
                              isSuffixIconRequired: false,
                              onSearch: (String searchBy) {
                                if (searchBy.trim().isNotEmpty) {
                                  StaticFunctions.unFocusKeyboardIfAny(context);
                                  _openPropertyList(
                                    searchBy,
                                    0,
                                    ViewAllFromType.searchList,
                                    viewAllFromToHandleTabs:
                                        ViewAllTabsVisibilityType
                                            .fromHomeSearchByTyping,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.homeScreenSearchFieldIconMargin.w,
                          ),
                          SizedBox(
                            height: Dimensions.fieldHeight.h,
                            child: Card(
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.whiteColor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.searchFieldBorderRadius.r,
                                ),
                                // if you need this
                                side: BorderSide(
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.borderColorE0,
                                  ),
                                  width: Dimensions.searchFieldBorderWidth.w,
                                ),
                              ),
                              margin: EdgeInsets.zero,
                              elevation: Dimensions.searchCardElevation,
                              child: InkWell(
                                onTap: () {
                                  _homeProvider?.openFilterScreen();
                                },
                                splashColor: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.touchSplashColor,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.searchFieldBorderRadius.r,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    Dimensions
                                        .homeScreenSearchFilterIconPadding.w,
                                  ),
                                  child: SvgPicture.asset(
                                    Strings.iconSettings,
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: Dimensions.homeScreenSearchPropertySpacing.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Selector<HomeProvider, int>(
                        selector: (_, state) => state.dashboardCountPagerIndex,
                        shouldRebuild: (prev, next) => prev != next,
                        builder: (_, selectedIndex, __) {
                          bool isPropertyIndexSelected = selectedIndex == 0;
                          return Container(
                            padding: EdgeInsets.only(
                              bottom:
                                  Dimensions.homeScreenSubtitleTextTopSpacing.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        Dimensions.screenHorizontalMargin.w,
                                  ),
                                  child: Selector<HomeProvider, int>(
                                    selector: (_, state) =>
                                        isPropertyIndexSelected
                                            ? state.totalPropertyCounts
                                            : state.totalInquiryCounts,
                                    builder: (context, count, child) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${isPropertyIndexSelected ? localizationsContext.homeProperties : localizationsContext.homeInquiries} (${count})',
                                              style: titleTextStyle,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (isPropertyIndexSelected) {
                                                _openPropertyList(
                                                  localizationsContext
                                                      .viewAllProperties,
                                                  _homeProvider!
                                                      .totalPropertyCounts,
                                                  ViewAllFromType.properties,
                                                  viewAllFromToHandleTabs:
                                                      ViewAllTabsVisibilityType
                                                          .fromHomeViewAllMyProperties,
                                                );
                                              } else {
                                                _openInquiryList(
                                                  localizationsContext
                                                      .viewAllInquiries,
                                                  _homeProvider!
                                                      .totalInquiryCounts,
                                                  ViewAllFromType.properties,
                                                  viewAllFromToHandleTabs:
                                                      ViewAllTabsVisibilityType
                                                          .fromHomeViewAllMyInquiries,
                                                );
                                              }
                                            },
                                            child: Text(
                                              localizationsContext.viewAll,
                                              style: viewAllTextStyle,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions
                                      .homeScreenSubtitleAndContentBetweenSpace
                                      .h,
                                ),
                                Selector<HomeProvider, List<DbPropertyType>>(
                                  selector: (_, state) =>
                                      state.propertyTypeList,
                                  shouldRebuild: (prev, next) => true,
                                  builder: (_, list, __) {
                                    return ExpandablePageView(
                                      itemCount: 2,
                                      onPageChanged: (index) => _homeProvider
                                          ?.onDashboardCountPagerIndexChange(
                                              index),
                                      itemBuilder: (BuildContext, int) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: Dimensions
                                                .screenHorizontalMargin.w,
                                          ),
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount: list.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: isItPhone
                                                  ? Dimensions
                                                      .homeScreenPropertyTypesCountPerLineInPhone
                                                  : Dimensions
                                                      .homeScreenPropertyTypesCountPerLineInWeb,
                                              crossAxisSpacing: Dimensions
                                                  .homeScreenPropertyTypesHorizontalSpacing
                                                  .h,
                                              mainAxisSpacing: Dimensions
                                                  .homeScreenPropertyTypesVerticalSpacing
                                                  .h,
                                              childAspectRatio: (Dimensions
                                                      .homeScreenPropertyTypeBoxAspectRatioWidth /
                                                  Dimensions
                                                      .homeScreenPropertyTypeBoxAspectRatioHeight),
                                            ),
                                            itemBuilder: (context, index) {
                                              return PropertyTypeItem(
                                                localizationsContext:
                                                    localizationsContext,
                                                propertyType: list[index],
                                                shouldShowChecked: false,
                                                homeScreenProvider:
                                                    _homeProvider!,
                                                countForInquiry:
                                                    !isPropertyIndexSelected,
                                                onSelect: (selectedModel) {
                                                  if (isPropertyIndexSelected) {
                                                    _openPropertyList(
                                                      selectedModel.name,
                                                      0,
                                                      ViewAllFromType
                                                          .properties,
                                                      propertyTypeId:
                                                          selectedModel.id,
                                                      viewAllFromToHandleTabs:
                                                          ViewAllTabsVisibilityType
                                                              .fromHomePropertiesType,
                                                    );
                                                  } else {
                                                    _openPropertyList(
                                                      selectedModel.name,
                                                      0,
                                                      ViewAllFromType
                                                          .properties,
                                                      propertyTypeId:
                                                          selectedModel.id,
                                                      viewAllFromToHandleTabs:
                                                          ViewAllTabsVisibilityType
                                                              .fromHomeInquiriesType,
                                                    );
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: Dimensions
                                      .homeScreenSubtitleAndContentBetweenSpace
                                      .h,
                                ),
                                IndicatorWidget(
                                  length: 2,
                                  selectedIndex: selectedIndex,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Selector<HomeProvider, List<dynamic>>(
                        selector: (_, state) => state.recentlyAddedList,
                        shouldRebuild: (prev, next) => true,
                        builder: (context, recentlyList, child) {
                          return recentlyList.isEmpty
                              ? SizedBox()
                              : Container(
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.blueColorOpacity5Percentage,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: Dimensions
                                        .homeScreenSubtitleTextTopSpacing.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: Dimensions
                                              .screenHorizontalMargin.w,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${localizationsContext.homeRecent}',
                                          style: titleTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions
                                            .homeScreenSubtitleAndContentBetweenSpace
                                            .h,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        controller:
                                            _recentlyAddedListScrollerController,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ...recentlyList.asMap().entries.map(
                                              (element) {
                                                if (element.value is DbProperty)
                                                  return DashBoardPropertyItem(
                                                    localizationsContext:
                                                        localizationsContext,
                                                    isItFirst: element.key == 0,
                                                    property: element.value,
                                                    commonPropertyDataProvider:
                                                        _commonPropertyDataProvider!,
                                                    onPropertySelected:
                                                        (selectedProperty) {
                                                      _homeProvider
                                                          ?.openPropertyDetailScreen(
                                                        selectedProperty,
                                                      );
                                                    },
                                                  );
                                                if (element.value
                                                    is DbSavedFilter)
                                                  return DashBoardInquiryItem(
                                                    localizationsContext:
                                                        localizationsContext,
                                                    isItFirst: element.key == 0,
                                                    inquiry: element.value,
                                                    commonPropertyDataProvider:
                                                        _commonPropertyDataProvider!,
                                                    onInquirySelected:
                                                        (selected) {
                                                      StaticFunctions
                                                          .unFocusKeyboardIfAny(
                                                              context);
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                        Routes.inquiryDetail,
                                                        arguments: selected,
                                                      );
                                                    },
                                                  );
                                                return SizedBox();
                                              },
                                            ).toList(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                      Selector<CommonPropertyDataProvider,
                          Tuple2<List<DbProperty>, ApiEnum>>(
                        selector: (_, state) => Tuple2(
                          state.sharedByBrooonersProperties,
                          state.propertyApiEnum,
                        ),
                        shouldRebuild: (prev, next) => true,
                        builder: (context, tuple, widget) {
                          if (tuple.item2 == ApiEnum.onFailure) {
                            return const SizedBox();
                          } else if (tuple.item1.isEmpty &&
                              tuple.item2 == ApiEnum.onSuccess) {
                            return const SizedBox();
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: Dimensions
                                    .homeScreenSubtitleTextTopSpacing.h,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Strings.iconSmallBrooonLogo,
                                      height: Dimensions
                                          .homeScreenSharedByBrooonHeight.h,
                                      width: Dimensions
                                          .homeScreenSharedByBrooonWidth.w,
                                    ),
                                    SizedBox(
                                      width: Dimensions
                                          .homeScreenSharedByBrooonIconTextPadding
                                          .w,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Selector<HomeProvider, int>(
                                            selector: (_, state) => state
                                                .sharedByBrooonPropertyCounts,
                                            builder: (context, count, child) {
                                              if (count > 0 &&
                                                  tuple.item2 ==
                                                      ApiEnum.onSuccess) {
                                                return Text(
                                                  '${localizationsContext.homeSharedByBrooonProperty} (${count})',
                                                  style: titleTextStyle,
                                                );
                                              }
                                              return Text(
                                                '${localizationsContext.homeSharedByBrooonProperty}',
                                                style: titleTextStyle,
                                              );
                                            },
                                          ),
                                          if (tuple.item2 == ApiEnum.onSuccess)
                                            GestureDetector(
                                              onTap: () {
                                                _openPropertyList(
                                                  localizationsContext
                                                      .viewAllProperties,
                                                  _homeProvider!
                                                      .sharedByBrooonPropertyCounts,
                                                  ViewAllFromType
                                                      .brooonProperties,
                                                  viewAllFromToHandleTabs:
                                                      ViewAllTabsVisibilityType
                                                          .fromHomeViewAllBrooonProperties,
                                                );
                                              },
                                              child: Text(
                                                localizationsContext
                                                    .homeViewAll,
                                                style: viewAllTextStyle,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Dimensions
                                    .homeScreenSubtitleAndContentBetweenSpace.h,
                              ),
                              if (tuple.item2 == ApiEnum.inProgress)
                                BrooonItemShimmer(
                                  listScrollDirection: Axis.horizontal,
                                  isImagePreviewVisible: false,
                                ),
                              if (tuple.item2 == ApiEnum.noInternet)
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    left: Dimensions.screenHorizontalMargin.w,
                                    right: Dimensions.screenHorizontalMargin.w,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        localizationsContext
                                            .sharedByBrooonPropertyNoInternet,
                                        style: TextStyle(
                                          fontSize: Dimensions
                                              .homeSharedByBrooonNoDataTextSize
                                              .sp,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.blackColor,
                                          ),
                                        ),
                                      ),
                                      /*SizedBox(
                                        height: Dimensions
                                            .homeSharedByBrooonNoDataTextRetrySpacing
                                            .h,
                                      ),*/
                                      TextButton(
                                        onPressed: () {
                                          _homeProvider
                                              ?.updateSharedByBrooonsPropertyList();
                                        },
                                        child: Text(
                                          localizationsContext.retry,
                                          style: TextStyle(
                                            fontSize: Dimensions
                                                .homeSharedByBrooonNoDataTextSize
                                                .sp,
                                            fontWeight: FontWeight.w600,
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.themeColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (tuple.item2 == ApiEnum.onSuccess)
                                ScrollConfiguration(
                                  behavior: MaterialScrollBehavior().copyWith(
                                    overscroll: false,
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    controller:
                                        _brooonPropertyScrollerController,
                                    child: Row(
                                      children: [
                                        ...tuple.item1
                                            .asMap()
                                            .entries
                                            .map(
                                              (element) =>
                                                  DashBoardPropertyItem(
                                                localizationsContext:
                                                    localizationsContext,
                                                isItFirst: element.key == 0,
                                                property: element.value,
                                                commonPropertyDataProvider:
                                                    _commonPropertyDataProvider!,
                                                sharedByBrooon: true,
                                                onPropertySelected:
                                                    (selectedProperty) {
                                                  selectedProperty
                                                          .customHeroTagKey =
                                                      Strings.brooonHeroTag;
                                                  _homeProvider
                                                      ?.openPropertyDetailScreen(
                                                    selectedProperty,
                                                  );
                                                },
                                                onLockItemClicked: () {
                                                  _homeProvider
                                                      ?.lockItemClicked();
                                                },
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: Dimensions
                                    .homeScreenSubtitleTextTopSpacing.h,
                              ),
                            ],
                          );
                        },
                      ),
                      Selector<CommonPropertyDataProvider,
                          Tuple2<List<DbSavedFilter>, ApiEnum>>(
                        selector: (_, state) => Tuple2(
                          state.sharedByBrooonersInquiries,
                          state.inquiryApiEnum,
                        ),
                        shouldRebuild: (prev, next) => true,
                        builder: (context, tuple, widget) {
                          if (tuple.item2 == ApiEnum.onFailure) {
                            return const SizedBox();
                          } else if (tuple.item1.isEmpty &&
                              tuple.item2 == ApiEnum.onSuccess) {
                            return const SizedBox();
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: Dimensions
                                    .homeScreenSubtitleTextTopSpacing.h,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Strings.iconSmallBrooonLogo,
                                      height: Dimensions
                                          .homeScreenSharedByBrooonHeight.h,
                                      width: Dimensions
                                          .homeScreenSharedByBrooonWidth.w,
                                    ),
                                    SizedBox(
                                      width: Dimensions
                                          .homeScreenSharedByBrooonIconTextPadding
                                          .w,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Selector<HomeProvider, int>(
                                            selector: (_, state) => state
                                                .sharedByBrooonInquiryCounts,
                                            builder: (context, count, child) {
                                              if (count > 0 &&
                                                  tuple.item2 ==
                                                      ApiEnum.onSuccess) {
                                                return Text(
                                                  '${localizationsContext.homeSharedByBrooonInquiry} (${count})',
                                                  style: titleTextStyle,
                                                );
                                              }
                                              return Text(
                                                '${localizationsContext.homeSharedByBrooonInquiry}',
                                                style: titleTextStyle,
                                              );
                                            },
                                          ),
                                          if (tuple.item2 == ApiEnum.onSuccess)
                                            GestureDetector(
                                              onTap: () {
                                                _openInquiryList(
                                                  localizationsContext
                                                      .viewAllInquiries,
                                                  _homeProvider!
                                                      .sharedByBrooonInquiryCounts,
                                                  ViewAllFromType
                                                      .brooonInquiries,
                                                  viewAllFromToHandleTabs:
                                                      ViewAllTabsVisibilityType
                                                          .fromHomeViewAllBrooonInquiries,
                                                );
                                              },
                                              child: Text(
                                                localizationsContext
                                                    .homeViewAll,
                                                style: viewAllTextStyle,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Dimensions
                                    .homeScreenSubtitleAndContentBetweenSpace.h,
                              ),
                              if (tuple.item2 == ApiEnum.inProgress)
                                BrooonItemShimmer(
                                  listScrollDirection: Axis.horizontal,
                                  isImagePreviewVisible: false,
                                ),
                              if (tuple.item2 == ApiEnum.noInternet)
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    left: Dimensions.screenHorizontalMargin.w,
                                    right: Dimensions.screenHorizontalMargin.w,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        localizationsContext
                                            .sharedByBrooonInquiryNoInternet,
                                        style: TextStyle(
                                          fontSize: Dimensions
                                              .homeSharedByBrooonNoDataTextSize
                                              .sp,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.blackColor,
                                          ),
                                        ),
                                      ),
                                      /*SizedBox(
                                        height: Dimensions
                                            .homeSharedByBrooonNoDataTextRetrySpacing
                                            .h,
                                      ),*/
                                      TextButton(
                                        onPressed: () {
                                          _homeProvider
                                              ?.updateSharedByBrooonsInquiryList();
                                        },
                                        child: Text(
                                          localizationsContext.retry,
                                          style: TextStyle(
                                            fontSize: Dimensions
                                                .homeSharedByBrooonNoDataTextSize
                                                .sp,
                                            fontWeight: FontWeight.w600,
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.themeColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (tuple.item2 == ApiEnum.onSuccess)
                                ScrollConfiguration(
                                  behavior: MaterialScrollBehavior().copyWith(
                                    overscroll: false,
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    controller:
                                        _brooonInquiryScrollerController,
                                    child: Row(
                                      children: [
                                        ...tuple.item1
                                            .asMap()
                                            .entries
                                            .map(
                                              (element) => DashBoardInquiryItem(
                                                localizationsContext:
                                                    localizationsContext,
                                                isItFirst: element.key == 0,
                                                inquiry: element.value,
                                                commonPropertyDataProvider:
                                                    _commonPropertyDataProvider!,
                                                sharedByBrooon: true,
                                                onInquirySelected: (selected) {
                                                  _homeProvider
                                                      ?.openInquiryDetailScreen(
                                                          selected);
                                                },
                                                onLockItemClicked: () {
                                                  _homeProvider
                                                      ?.lockItemClicked();
                                                },
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: Dimensions
                                    .homeScreenSubtitleTextTopSpacing.h,
                              ),
                            ],
                          );
                        },
                      ),
                      Selector<HomeProvider, List<dynamic>>(
                        selector: (_, state) => state.nearByDisplayItemList,
                        shouldRebuild: (prev, next) => true,
                        builder: (context, propertyList, child) {
                          return Container(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blueColorOpacity5Percentage,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  Dimensions.homeScreenSubtitleTextTopSpacing.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        Dimensions.screenHorizontalMargin.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Selector<HomeProvider,
                                            Tuple2<int, DbUserInfo?>>(
                                          selector: (_, state) => Tuple2(
                                            state.nearByPropertyCounts,
                                            state.userInfo,
                                          ),
                                          builder: (context, tuple, child) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${localizationsContext.homeNearBy} (${tuple.item1})',
                                                  style: titleTextStyle,
                                                ),
                                                Text(
                                                  ' ${localizationsContext.upTo((tuple.item2?.nearByDistance ?? AppConfig.defaultNearByDistance).toInt())}',
                                                  style: titleTextStyle != null
                                                      ? titleTextStyle!
                                                          .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )
                                                      : null,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      if (propertyList.isNotEmpty)
                                        GestureDetector(
                                          onTap: () {
                                            _openPropertyList(
                                              localizationsContext.homeNearBy,
                                              _homeProvider!
                                                  .nearByPropertyCounts,
                                              ViewAllFromType.nearBy,
                                              viewAllFromToHandleTabs:
                                                  ViewAllTabsVisibilityType
                                                      .fromHomeNearBy,
                                            );
                                          },
                                          child: Text(
                                            localizationsContext.homeViewAll,
                                            style: viewAllTextStyle,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if (propertyList.isEmpty)
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                      top: Dimensions
                                          .homeScreenSubtitleAndContentBetweenSpace
                                          .h,
                                      left: Dimensions.screenHorizontalMargin.w,
                                      right:
                                          Dimensions.screenHorizontalMargin.w,
                                    ),
                                    child: Text(
                                      localizationsContext.noNearByItems,
                                      style: TextStyle(
                                        fontSize: Dimensions
                                            .homeSharedByBrooonNoDataTextSize
                                            .sp,
                                        color: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.blackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (propertyList.isNotEmpty)
                                  SizedBox(
                                    height: Dimensions
                                        .homeScreenSubtitleAndContentBetweenSpace
                                        .h,
                                  ),
                                if (propertyList.isNotEmpty)
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    controller: _nearByListScrollerController,
                                    child: Row(
                                      children: [
                                        ...propertyList.asMap().entries.map(
                                          (element) {
                                            if (element.value is DbProperty) {
                                              return DashBoardPropertyItem(
                                                localizationsContext:
                                                    localizationsContext,
                                                isItFirst: element.key == 0,
                                                property: element.value,
                                                commonPropertyDataProvider:
                                                    _commonPropertyDataProvider!,
                                                isNearByProperty: true,
                                                onPropertySelected:
                                                    (selectedProperty) {
                                                  selectedProperty
                                                          .customHeroTagKey =
                                                      Strings.nearByHeroTag;
                                                  _homeProvider
                                                      ?.openPropertyDetailScreen(
                                                    selectedProperty,
                                                  );
                                                },
                                              );
                                            }
                                            if (element.value
                                                is DbSavedFilter) {
                                              return DashBoardInquiryItem(
                                                localizationsContext:
                                                    localizationsContext,
                                                isItFirst: element.key == 0,
                                                inquiry: element.value,
                                                commonPropertyDataProvider:
                                                    _commonPropertyDataProvider!,
                                                isNearByInquiry: true,
                                                onInquirySelected: (selected) {
                                                  StaticFunctions
                                                      .unFocusKeyboardIfAny(
                                                          context);
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    Routes.inquiryDetail,
                                                    arguments: selected,
                                                  );
                                                },
                                                onLockItemClicked: () {
                                                  _homeProvider
                                                      ?.lockItemClicked();
                                                },
                                              );
                                            }
                                            return SizedBox();
                                          },
                                        ).toList(),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
