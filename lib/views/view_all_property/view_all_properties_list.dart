import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './model/property_visual_type.dart';
import './model/view_all_screen_arg.dart';
import './model/view_all_tab.dart';
import './tabs/brooon_inquiries_tab.dart';
import './tabs/brooon_properties_tab.dart';
import './tabs/my_inquiries_tab.dart';
import './tabs/my_properties_tab.dart';
import './view_all_properties_provider.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/scroll_behavior.dart';
import '../../utils/static_functions.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../buyers_sellers/model/buyer_seller_enum.dart';

class ViewAllPropertiesByList extends StatefulWidget {
  final ViewAllScreenArg arguments;
  final AppLocalizations? localizationsContext;
  final CommonPropertyDataProvider? commonPropertyDataProvider;
  final ViewAllPropertiesProvider? viewAllPropertiesProvider;

  const ViewAllPropertiesByList({
    Key? key,
    required this.arguments,
    required this.localizationsContext,
    required this.commonPropertyDataProvider,
    required this.viewAllPropertiesProvider,
  }) : super(key: key);

  @override
  State<ViewAllPropertiesByList> createState() =>
      _ViewAllPropertiesByListState();
}

class _ViewAllPropertiesByListState extends State<ViewAllPropertiesByList>
    with AutomaticKeepAliveClientMixin {
  Widget _tabView({
    required BuildContext context,
    required int tabId,
    required String text,
    required bool isSelected,
    required int? count,
  }) {
    double itemWidth = (MediaQuery.of(context).size.width -
            (2 * Dimensions.screenHorizontalMargin.w) -
            ((ViewAllPropertiesProvider.maxViewAllTabSize - 1) *
                Dimensions.viewAllPropertyForItemSpacing.w)) /
        ViewAllPropertiesProvider.maxViewAllTabSize;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.viewAllPropertiesProvider?.updateSelectedTab(tabId);
        },
        borderRadius: BorderRadius.circular(
          Dimensions.viewAllPropertyForRadius.r,
        ),
        splashColor: StaticFunctions.getColor(
          context,
          ColorEnum.touchSplashColor,
        ),
        child: Container(
          width: itemWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.viewAllPropertyForRadius.r,
            ),
            border: Border.all(
              width: Dimensions.viewAllPropertyForBorderWidth.w,
              color: StaticFunctions.getColor(
                context,
                isSelected ? ColorEnum.themeColor : ColorEnum.borderColorE0,
              ),
            ),
            color: StaticFunctions.getColor(
              context,
              isSelected
                  ? ColorEnum.themeColor
                  : ColorEnum.themeColorOpacity3Percentage,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.viewAllPropertyForContentPadding.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tabId == ViewAllPropertiesProvider.brooonPropertyTabId ||
                  tabId == ViewAllPropertiesProvider.brooonInquiryTabId)
                SvgPicture.asset(
                  Strings.iconSmallBrooonLogo,
                  width: Dimensions.viewAllBrooonTabIconWidth.w,
                  height: Dimensions.viewAllBrooonTabIconHeight.h,
                  color: isSelected
                      ? StaticFunctions.getColor(
                          context,
                          ColorEnum.whiteColor,
                        )
                      : null,
                ),
              if (tabId == ViewAllPropertiesProvider.brooonPropertyTabId ||
                  tabId == ViewAllPropertiesProvider.brooonInquiryTabId)
                SizedBox(
                  width: Dimensions.viewAllTabsIconTextSpacing.w,
                ),
              Flexible(
                child: Text(
                  '$text (${count == null ? 0 : count})',
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Dimensions.viewAllTabsTextSize.sp,
                    fontWeight: FontWeight.w600,
                    color: StaticFunctions.getColor(
                      context,
                      isSelected ? ColorEnum.whiteColor : ColorEnum.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int? _getCounts({
    required int tabId,
    required Tuple6<int, int, int, int, int, List<ViewAllTab>> tuple,
  }) {
    return tabId == ViewAllPropertiesProvider.myPropertyTabId
        ? tuple.item2
        : tabId == ViewAllPropertiesProvider.brooonPropertyTabId
            ? (tuple.item3 > 0 ? tuple.item3 : null)
            : tabId == ViewAllPropertiesProvider.myInquiryTabId
                ? tuple.item4
                : tabId == ViewAllPropertiesProvider.brooonInquiryTabId
                    ? (tuple.item5 > 0 ? tuple.item5 : null)
                    : null;
  }

  Widget _menuWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.screenHorizontalMargin.w,
        right: Dimensions.screenHorizontalMargin.w,
        bottom: (Dimensions.screenHorizontalMargin / 2).h,
      ),
      child: Selector<ViewAllPropertiesProvider,
          Tuple6<int, int, int, int, int, List<ViewAllTab>>>(
        selector: (_, state) => Tuple6(
          state.selectedTabId,
          state.myPropertiesCount,
          state.propertiesFromNetworkCount,
          state.myInquiriesCount,
          state.inquiriesFromNetworkCount,
          state.viewAllTabs,
        ),
        builder: (context, tuple, child) {
          final tabs = tuple.item6;
          final selectedTabCount = _getCounts(
            tabId: tuple.item1,
            tuple: tuple,
          );
          final text = tabs
                  .firstWhereOrNull(
                    (element) => element.id == tuple.item1,
                  )
                  ?.tabLongName ??
              '';
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    tabs.length,
                    (index) {
                      if (widget.viewAllPropertiesProvider
                              ?.checkForTabVisibility(
                            tabId: tabs[index].id,
                          ) ??
                          false) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _tabView(
                              context: context,
                              tabId: tabs[index].id,
                              text: tabs[index].tabShortName,
                              isSelected: tuple.item1 == tabs[index].id,
                              count: _getCounts(
                                tabId: tabs[index].id,
                                tuple: tuple,
                              ),
                            ),
                            if (index < (tabs.length - 1))
                              SizedBox(
                                width:
                                    Dimensions.viewAllPropertyForItemSpacing.w,
                              ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                SizedBox(
                  height: Dimensions.viewAllPropertyItemVerticalMargins.h,
                ),
                Text(
                  '${'$text (${selectedTabCount == null ? 0 : selectedTabCount})'}',
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Dimensions.selectedTabLongTextSize.sp,
                    fontWeight: FontWeight.w600,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _listItemWidget() {
    return Selector<ViewAllPropertiesProvider, PageController>(
      shouldRebuild: (prev, next) => true,
      selector: (_, state) => state.tabPageController,
      builder: (context, switcherController, child) {
        return PageView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          scrollBehavior: HideGlowBehavior(),
          children: [
            if (widget.viewAllPropertiesProvider?.checkForTabVisibility(
                  tabId: ViewAllPropertiesProvider.myPropertyTabId,
                ) ??
                false)
              MyPropertiesTab(
                arguments: widget.arguments,
                localizationsContext: widget.localizationsContext,
                commonPropertyDataProvider: widget.commonPropertyDataProvider,
                viewAllPropertiesProvider: widget.viewAllPropertiesProvider,
              ),
            if (widget.viewAllPropertiesProvider?.checkForTabVisibility(
                  tabId: ViewAllPropertiesProvider.brooonPropertyTabId,
                ) ??
                false)
              BrooonPropertiesTab(
                arguments: widget.arguments,
                localizationsContext: widget.localizationsContext,
                commonPropertyDataProvider: widget.commonPropertyDataProvider,
                viewAllPropertiesProvider: widget.viewAllPropertiesProvider,
              ),
            if (widget.viewAllPropertiesProvider?.checkForTabVisibility(
                  tabId: ViewAllPropertiesProvider.myInquiryTabId,
                ) ??
                false)
              MyInquiriesTab(
                arguments: widget.arguments,
                localizationsContext: widget.localizationsContext,
                commonPropertyDataProvider: widget.commonPropertyDataProvider,
                viewAllPropertiesProvider: widget.viewAllPropertiesProvider,
              ),
            if (widget.viewAllPropertiesProvider?.checkForTabVisibility(
                  tabId: ViewAllPropertiesProvider.brooonInquiryTabId,
                ) ??
                false)
              BrooonInquiriesTab(
                arguments: widget.arguments,
                localizationsContext: widget.localizationsContext,
                commonPropertyDataProvider: widget.commonPropertyDataProvider,
                viewAllPropertiesProvider: widget.viewAllPropertiesProvider,
              ),
          ],
          controller: switcherController,
          onPageChanged: (pageNo) {
            widget.viewAllPropertiesProvider?.onTabPageChange(pageNo);
          },
        );
      },
    );
  }

  Widget _switchViewWidget() {
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.searchPropertyViewModeSwitcherVerticalMargin.w,
        left: Dimensions.screenHorizontalMargin.w,
        right: Dimensions.screenHorizontalMargin.w,
      ),
      child: Center(
        child: SizedBox(
          width: Dimensions.searchPropertyViewModeSwitcherWidth.w,
          child: ButtonWidget(
            text: widget.localizationsContext!.switchToMapView,
            textColor: StaticFunctions.getColor(
              context,
              ColorEnum.whiteColor,
            ),
            bgColor: StaticFunctions.getColor(
              context,
              ColorEnum.themeColor,
            ),
            icon: Strings.iconViewModeMap,
            iconWidth: Dimensions.searchPropertyViewModeMapSize.w,
            iconHeight: Dimensions.searchPropertyViewModeMapSize.w,
            iconColor: StaticFunctions.getColor(
              context,
              ColorEnum.whiteColor,
            ),
            onClick: () {
              StaticFunctions.unFocusKeyboardIfAny(context);
              widget.viewAllPropertiesProvider?.updatePropertyVisualType(
                PropertyVisualType.map,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _menuWidget(),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                _listItemWidget(),
                if (widget.arguments.showDataFor == ViewAllFromType.searchList)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Selector<ViewAllPropertiesProvider, int>(
                      selector: (_, state) => state.selectedTabId,
                      builder: (context, propertySelectedFor, child) {
                        if (propertySelectedFor !=
                                ViewAllPropertiesProvider.brooonPropertyTabId &&
                            propertySelectedFor !=
                                ViewAllPropertiesProvider.brooonInquiryTabId &&
                            propertySelectedFor !=
                                ViewAllPropertiesProvider.myInquiryTabId) {
                          return _switchViewWidget();
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
