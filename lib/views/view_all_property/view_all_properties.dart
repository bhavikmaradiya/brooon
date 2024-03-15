import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './model/view_all_screen_arg.dart';
import './view_all_properties_list.dart';
import './view_all_properties_map.dart';
import './view_all_properties_provider.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/phone_number_input_formatter.dart';
import '../../utils/scroll_behavior.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../widgets/suggestion_field_item.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';
import '../buyers_sellers/model/buyer_seller_info.dart';
import '../common_widget/custom_floating_widget.dart';
import '../filter/model/filter_screen_arg.dart';
import '../filter/save_filter_dialog_provider.dart';

class ViewAllProperties extends StatelessWidget {
  const ViewAllProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ViewAllScreenArg;
    return ChangeNotifierProvider(
      create: (_) => ViewAllPropertiesProvider(),
      child: _ViewAllPropertyBody(
        arguments: arguments,
      ),
    );
  }
}

class _ViewAllPropertyBody extends StatefulWidget {
  final ViewAllScreenArg arguments;

  const _ViewAllPropertyBody({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<_ViewAllPropertyBody> createState() => _ViewAllPropertyBodyState();
}

class _ViewAllPropertyBodyState extends State<_ViewAllPropertyBody> {
  AppLocalizations? localizationsContext;
  ViewAllPropertiesProvider? viewAllPropertiesProvider;
  CommonPropertyDataProvider? commonPropertyDataProvider;

  @override
  void didChangeDependencies() {
    if (localizationsContext == null) {
      localizationsContext = AppLocalizations.of(context)!;
    }
    if (commonPropertyDataProvider == null) {
      commonPropertyDataProvider = Provider.of<CommonPropertyDataProvider>(
        context,
        listen: false,
      );
    }
    if (viewAllPropertiesProvider == null) {
      viewAllPropertiesProvider = Provider.of<ViewAllPropertiesProvider>(
        context,
        listen: false,
      );
      viewAllPropertiesProvider!.createViewAllTabs(
        localizationsContext: localizationsContext!,
        viewAllTabVisibility: widget.arguments.viewAllFromToHandleTabs,
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          viewAllPropertiesProvider?.init(
            context: context,
            commonProvider: commonPropertyDataProvider,
            viewAllFromType: widget.arguments.showDataFor,
            myPropertiesCount: widget.arguments.showDataFor !=
                        ViewAllFromType.brooonProperties &&
                    widget.arguments.showDataFor !=
                        ViewAllFromType.brooonInquiries
                ? widget.arguments.count
                : 0,
            myInquiriesCount: widget.arguments.showDataFor !=
                        ViewAllFromType.brooonProperties &&
                    widget.arguments.showDataFor !=
                        ViewAllFromType.brooonInquiries
                ? widget.arguments.count
                : 0,
            propertiesFromNetworkCount:
                widget.arguments.showDataFor == ViewAllFromType.brooonProperties
                    ? widget.arguments.count
                    : 0,
            propertyTypeId: widget.arguments.propertyTypeId,
            buyerSellerInfo: widget.arguments.buyerSellerInfo,
            savedFilterObj: widget.arguments.filterObj,
            searchBy: widget.arguments.showDataFor == ViewAllFromType.searchList
                ? widget.arguments.heading
                : '',
            isFilterSearchPropertiesInquiries:
                widget.arguments.isFilterSearchByPropertiesInquiries ?? false,
            inquiryToMatch: widget.arguments.inquiryToMatch,
            propertyToMatch: widget.arguments.propertyToMatch,
            isNeedToCallApiForMatching:
                widget.arguments.isNeedToCallApiForMatchingBrooonItems,
          );
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    viewAllPropertiesProvider?.onDispose();
    super.dispose();
  }

  Widget _saveForFutureWidget() {
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
                text: localizationsContext!.saveAsBuyer,
                textColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                bgColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                iconWidth: Dimensions.homeScreenAddBuyerIconSize.h,
                iconHeight: Dimensions.homeScreenAddBuyerIconSize.h,
                iconColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                onClick: () {
                  _showSaveFilterDialog(
                    context,
                    filterToEdit: viewAllPropertiesProvider!.filterObj!,
                    isBuyer: true,
                  );
                },
              ),
            ),
            SizedBox(
              width: Dimensions.homeScreenBottomNavigationButtonSpacing.w,
            ),
            Expanded(
              child: ButtonWidget(
                text: localizationsContext!.saveAsFilter,
                textColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                bgColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                iconWidth: Dimensions.homeScreenAddBuyerIconSize.w,
                iconHeight: Dimensions.homeScreenAddPropertyIconSize.h,
                iconColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                onClick: () {
                  _showSaveFilterDialog(
                    context,
                    filterToEdit: viewAllPropertiesProvider!.filterObj!,
                    isBuyer: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    /*return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.shadowColor,
            ),
            blurRadius: Dimensions.saveFilterShadowRadius.r,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _showSaveFilterDialog(
              context,
              filterToEdit: viewAllPropertiesProvider!.filterObj!,
              isBuyer: false,
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.screenHorizontalMargin.w,
                right: Dimensions.screenHorizontalMargin.w,
                bottom: Dimensions.screenVerticalMarginBottom.h,
                top: Dimensions.screenHorizontalMargin.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      localizationsContext!.saveFilterForFuture,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.saveFilterForFutureTextSize.sp,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    Strings.iconRightArrow,
                    width: Dimensions.saveFilterForFutureIconSize.w,
                    height: Dimensions.saveFilterForFutureIconSize.w,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );*/
  }

  Widget _savedFilterWidget() {
    return Selector<ViewAllPropertiesProvider,
        Tuple2<DbSavedFilter?, TextEditingController>>(
      shouldRebuild: (prev, next) => true,
      selector: (_, state) => Tuple2(
        state.filterObj,
        state.searchFieldTextController,
      ),
      builder: (context, filterData, child) {
        String mobileNo = filterData.item1 != null &&
                filterData.item1!.mobileNo.trim().isNotEmpty
            ? '| ${filterData.item1!.mobileNo}'
            : '';
        return filterData.item1 != null && !filterData.item1!.isFromBuyer
            ? Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.shadowColor,
                      ),
                      blurRadius: Dimensions.saveFilterShadowRadius.r,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.whiteColor,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.filter,
                          arguments: FilterScreenArg(
                            fromRoute: Routes.viewAllProperties,
                            viewAllType: viewAllPropertiesProvider!.showDataFor,
                            propertyType: widget.arguments.propertyTypeId,
                            searchText: filterData.item2.text.trim().isNotEmpty
                                ? filterData.item2.text
                                : null,
                            showInactiveAndClosedProperty: true,
                            filterToApply: viewAllPropertiesProvider!.filterObj,
                            tabVisibilityType:
                                viewAllPropertiesProvider!.tabVisibilityType,
                          ),
                        ).then(
                          (filterData) {
                            if (filterData != null &&
                                filterData is DbSavedFilter) {
                              viewAllPropertiesProvider!.updateFilterData(
                                context,
                                filterData,
                              );
                            }
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: Dimensions.screenHorizontalMargin.w,
                          right: Dimensions.screenHorizontalMargin.w,
                          bottom: Dimensions.screenVerticalMarginBottom.h,
                          top: Dimensions.screenHorizontalMargin.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizationsContext!.savedFilter,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.gray90Color,
                                ),
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    Dimensions.savedFilterTitleTextSize.sp,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.savedFilterTextDetailSpacing.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (filterData.item1!.filterName
                                          .trim()
                                          .isNotEmpty)
                                        Text(
                                          filterData.item1!.filterName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.blackColor,
                                            ),
                                            fontWeight: FontWeight.w600,
                                            fontSize: Dimensions
                                                .savedFilterTextSize.sp,
                                          ),
                                        ),
                                      if (filterData.item1!.filterName
                                          .trim()
                                          .isNotEmpty)
                                        SizedBox(
                                          height: Dimensions
                                              .savedFilterDetailSpacing.h,
                                        ),
                                      if (filterData.item1!.buyerName
                                          .trim()
                                          .isNotEmpty)
                                        Text(
                                          '${filterData.item1!.buyerName} $mobileNo',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.blackColor,
                                            ),
                                            fontWeight: FontWeight.w400,
                                            fontSize: Dimensions
                                                .savedFilterSubTextSize.sp,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Dimensions.savedFilterIconSize.h,
                                  width: Dimensions.savedFilterIconSize.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.savedFilterIconRadius.r,
                                    ),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () => _showSaveFilterDialog(
                                        context,
                                        filterToEdit: filterData.item1!,
                                        isBuyer: filterData.item1!.isFromBuyer,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.savedFilterIconRadius.r,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Dimensions.savedFilterIconPadding.w,
                                        ),
                                        child: SvgPicture.asset(
                                          Strings.iconEdit,
                                          height:
                                              Dimensions.savedFilterIconSize.h,
                                          width:
                                              Dimensions.savedFilterIconSize.h,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.blueColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.savedFilterIconMargin.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.savedFilterIconRadius.r,
                                    ),
                                  ),
                                  height: Dimensions.savedFilterIconSize.h,
                                  width: Dimensions.savedFilterIconSize.h,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder:
                                              (BuildContext dialogContext) {
                                            return DialogWidget(
                                              title: '',
                                              titleWidget: Container(
                                                child: Text.rich(
                                                  TextSpan(
                                                    text: localizationsContext!
                                                        .dialogDeleteFilterMsg1,
                                                    style: TextStyle(
                                                      color: StaticFunctions
                                                          .getColor(
                                                        dialogContext,
                                                        ColorEnum.blackColor,
                                                      ),
                                                      fontSize: Dimensions
                                                          .dialogTextSize.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            viewAllPropertiesProvider!
                                                                .filterObj
                                                                ?.filterName,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: localizationsContext!
                                                            .dialogDeleteFilterMsg2,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              icon: Strings.iconDelete,
                                              positiveButton:
                                                  localizationsContext!
                                                      .btnDeleteFilter,
                                              negativeButton:
                                                  localizationsContext!
                                                      .btnCancelFilter,
                                              onNegativeButtonClick: () {
                                                Navigator.pop(dialogContext);
                                              },
                                              onPositiveButtonClick: () {
                                                Navigator.pop(dialogContext);
                                                viewAllPropertiesProvider!
                                                    .deleteFilter();
                                              },
                                            );
                                          },
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.savedFilterIconRadius.r,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Dimensions.savedFilterIconPadding.w,
                                        ),
                                        child: SvgPicture.asset(
                                          Strings.iconDelete,
                                          height:
                                              Dimensions.savedFilterIconSize.h,
                                          width:
                                              Dimensions.savedFilterIconSize.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox();
      },
    );
  }

  _showSaveFilterDialog(
    BuildContext context, {
    required DbSavedFilter filterToEdit,
    bool isBuyer = false,
  }) {
    SaveFilterDialogProvider? provider;
    bool isEdit = viewAllPropertiesProvider!.doesFilterExists;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext dialogContext) {
        return ChangeNotifierProvider(
          create: (_) => SaveFilterDialogProvider(),
          builder: (context, _) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (provider == null) {
                provider ??= Provider.of<SaveFilterDialogProvider>(context,
                    listen: false);
                filterToEdit.isFromBuyer = isBuyer;
                provider!.init(context, filterToEdit, isEdit: isEdit);
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
                            !isBuyer
                                ? (isEdit
                                    ? localizationsContext!.editFilterTitle
                                    : localizationsContext!.saveFilterTitle)
                                : localizationsContext!.addBuyer,
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
                        SizedBox(
                          height: Dimensions.saveFilterFieldsBetweenSpacing.h,
                        ),
                        if (!isBuyer)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Selector<SaveFilterDialogProvider,
                                  TextEditingController>(
                                shouldRebuild: (prev, next) =>
                                    prev.text != next.text,
                                selector: (_, state) =>
                                    state.filterNameFieldController,
                                builder: (context, controller, child) {
                                  return TextFieldWidget(
                                    label: localizationsContext!.filterName,
                                    hint: localizationsContext!.filterNameHint,
                                    fontWeight: FontWeight.w400,
                                    controller: controller,
                                    autoFocus: true,
                                    keyBoardType: TextInputType.visiblePassword,
                                    keepLabelAlwaysOnTop: true,
                                    onValueChanged:
                                        (int? currentIndex, String value) =>
                                            provider?.validateData(),
                                  );
                                },
                              ),
                              Selector<SaveFilterDialogProvider, bool>(
                                shouldRebuild: (prev, next) => prev != next,
                                selector: (_, state) => state.isNameTaken,
                                builder: (_, isNameAlreadyTaken, __) {
                                  return AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 400),
                                    child: isNameAlreadyTaken
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                localizationsContext!
                                                    .filterNameAlreadyTaken,
                                                style: TextStyle(
                                                  color:
                                                      StaticFunctions.getColor(
                                                    context,
                                                    ColorEnum.errorColor,
                                                  ),
                                                  fontSize: Dimensions
                                                      .filterFieldErrorTextSize
                                                      .sp,
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                  );
                                },
                              ),
                            ],
                          ),
                        if (isBuyer)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Selector<SaveFilterDialogProvider,
                                  TextEditingController>(
                                shouldRebuild: (prev, next) =>
                                    prev.text != next.text,
                                selector: (_, state) =>
                                    state.customerNameFieldController,
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
                                      label:
                                          localizationsContext!.filterBuyerName,
                                      suffixIconPath: Strings.iconPhoneBook,
                                      onSuffixIconClick: () =>
                                          provider?.openContactsToPickPhone(),
                                      onChanged: (value) =>
                                          provider?.validateData(),
                                    ),
                                    suggestionsCallback: (pattern) {
                                      return provider!
                                          .getFilteredBuyers(pattern);
                                    },
                                    loadingBuilder: (context) => SizedBox(),
                                    noItemsFoundBuilder: (context) =>
                                        SizedBox(),
                                    itemBuilder: (context,
                                        BuyerSellerInfo suggestion,
                                        bool showDivider) {
                                      return SuggestionItemWidget(
                                        title: suggestion.name!,
                                        subtitle: suggestion.phone,
                                        showDivider: showDivider,
                                      );
                                    },
                                    onSuggestionSelected:
                                        (BuyerSellerInfo suggestion) {
                                      provider?.selectBuyerSuggestion(
                                        context,
                                        suggestion,
                                      );
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                height:
                                    Dimensions.saveFilterFieldsBetweenSpacing.h,
                              ),
                              Selector<SaveFilterDialogProvider,
                                  TextEditingController>(
                                shouldRebuild: (prev, next) =>
                                    prev.text != next.text,
                                selector: (_, state) =>
                                    state.mobileNoFieldController,
                                builder: (context, controller, child) {
                                  return TextFieldWidget(
                                    label: localizationsContext!.mobileNo,
                                    fontWeight: FontWeight.w400,
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
                                            provider?.validateData(),
                                  );
                                },
                              ),
                            ],
                          ),
                        SizedBox(
                          height: Dimensions.saveFilterFieldsBetweenSpacing.h,
                        ),
                        Selector<SaveFilterDialogProvider, bool>(
                          shouldRebuild: (prev, next) => prev != next,
                          selector: (_, state) => state.isValid,
                          builder: (context, isValid, child) {
                            return ButtonWidget(
                              text: isEdit
                                  ? localizationsContext!.editFilterBtnTitle
                                  : localizationsContext!.saveFilterBtnTitle,
                              borderRadius: Dimensions.saveFilterButtonRadius.r,
                              onClick: () =>
                                  provider?.saveFilter(dialogContext),
                              textColor: StaticFunctions.getColor(
                                context,
                                isValid
                                    ? ColorEnum.whiteColor
                                    : ColorEnum.gray90Color,
                              ),
                              borderColor: StaticFunctions.getColor(
                                context,
                                isValid
                                    ? ColorEnum.themeColor
                                    : ColorEnum.borderColorE0,
                              ),
                              bgColor: StaticFunctions.getColor(
                                context,
                                isValid
                                    ? ColorEnum.themeColor
                                    : ColorEnum.themeColorOpacity3Percentage,
                              ),
                            );
                          },
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

  Widget _propertyListWidget() {
    return ViewAllPropertiesByList(
      arguments: widget.arguments,
      localizationsContext: localizationsContext,
      commonPropertyDataProvider: commonPropertyDataProvider,
      viewAllPropertiesProvider: viewAllPropertiesProvider,
    );
  }

  Widget _addPropertyWidget() {
    return Selector<ViewAllPropertiesProvider, int>(
      selector: (_, state) => state.selectedTabId,
      shouldRebuild: (_, __) => true,
      builder: (context, tabId, child) {
        if (widget.arguments.showDataFor == ViewAllFromType.properties ||
            widget.arguments.showDataFor == ViewAllFromType.searchList ||
            widget.arguments.showDataFor == ViewAllFromType.filter) {
          if (tabId == ViewAllPropertiesProvider.myPropertyTabId) {
            return CustomFloatingWidget(
              onClick: () {
                StaticFunctions.unFocusKeyboardIfAny(context);
                viewAllPropertiesProvider?.openAddPropertyScreen(context);
              },
            );
          } else if (tabId == ViewAllPropertiesProvider.myInquiryTabId) {
            return CustomFloatingWidget(
              onClick: () {
                StaticFunctions.unFocusKeyboardIfAny(context);
                viewAllPropertiesProvider?.openAddInquiryScreen(context);
              },
            );
          }
        }
        return const SizedBox();
      },
    );
  }

  bool _onBackPressed() {
    //refresh home screen brooon data if any changes from view all screen list because we are using same array list for both screen api calls. (currently we are refreshing data only if filter is applied in view all screen)
    final isAnyFilterApplied = viewAllPropertiesProvider?.filterObj != null &&
        viewAllPropertiesProvider?.dataTypesToRefreshOnBackPress != null &&
        viewAllPropertiesProvider!.dataTypesToRefreshOnBackPress.isNotEmpty;

    if (isAnyFilterApplied) {
      Navigator.pop(
        context,
        viewAllPropertiesProvider!.dataTypesToRefreshOnBackPress,
      );
    }
    return !isAnyFilterApplied;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      resizeToAvoidBottomInset: false,
      floatingActionButton: _addPropertyWidget(),
      bottomNavigationBar:
          Selector<ViewAllPropertiesProvider, Tuple2<DbSavedFilter?, bool>>(
        shouldRebuild: (prev, next) => true,
        selector: (_, state) => Tuple2(
          state.filterObj,
          state.doesFilterExists,
        ),
        builder: (context, filterData, child) {
          return filterData.item1 == null
              ? SizedBox()
              : !filterData.item2
                  ? _saveForFutureWidget()
                  : _savedFilterWidget();
        },
      ),
      body: WillPopScope(
        onWillPop: () => Future.value(_onBackPressed()),
        child: SafeArea(
          child: Column(
            children: [
              Selector<ViewAllPropertiesProvider,
                  Tuple4<int, int, DbSavedFilter?, TextEditingController>>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => Tuple4(
                  state.myPropertiesCount,
                  state.propertiesFromNetworkCount,
                  state.filterObj,
                  state.searchFieldTextController,
                ),
                builder: (context, tuple, child) {
                  return ToolBar(
                    title: viewAllPropertiesProvider?.filterObj != null
                        ? localizationsContext!.filterResultFound
                        : widget.arguments.showDataFor == ViewAllFromType.filter
                            ? localizationsContext!.filterResultFound
                            : widget.arguments.showDataFor ==
                                    ViewAllFromType.searchList
                                ? ''
                                : '${widget.arguments.heading}',
                    enableSearch:
                        widget.arguments.showDataFor != ViewAllFromType.filter,
                    autoFocusAndHideSearch: widget.arguments.showDataFor ==
                        ViewAllFromType.searchList,
                    onToggleSwitchChanged: widget.arguments.showDataFor ==
                            ViewAllFromType.searchList
                        ? (visualType) {
                            StaticFunctions.unFocusKeyboardIfAny(context);
                            viewAllPropertiesProvider?.updatePropertyVisualType(
                              visualType,
                            );
                          }
                        : null,
                    defaultSearchText: widget.arguments.showDataFor ==
                            ViewAllFromType.searchList
                        ? widget.arguments.heading
                        : '',
                    isFilterVisible: viewAllPropertiesProvider?.isFilterAllowed(
                          widget.arguments.showDataFor,
                        ) ??
                        false,
                    isFilterApplied:
                        viewAllPropertiesProvider?.filterObj != null,
                    onFilterClick: () async {
                      Navigator.pushNamed(
                        context,
                        Routes.filter,
                        arguments: FilterScreenArg(
                          fromRoute: Routes.viewAllProperties,
                          viewAllType: viewAllPropertiesProvider!.showDataFor,
                          propertyType: widget.arguments.propertyTypeId,
                          searchText: tuple.item4.text.trim().isNotEmpty
                              ? tuple.item4.text
                              : null,
                          showInactiveAndClosedProperty: true,
                          filterToApply: viewAllPropertiesProvider!.filterObj,
                          tabVisibilityType:
                              viewAllPropertiesProvider!.tabVisibilityType,
                        ),
                      ).then(
                        (filterData) {
                          if (filterData != null &&
                              filterData is DbSavedFilter) {
                            viewAllPropertiesProvider!.updateFilterData(
                              context,
                              filterData,
                            );
                          }
                        },
                      );
                    },
                    onBackPressed: () {
                      //refresh home screen brooon data if any changes from view all screen list because we are using same array list for both screen api calls. (currently we are refreshing data only if filter is applied in view all screen)
                      final shouldPopWithoutRefresh = _onBackPressed();
                      if (shouldPopWithoutRefresh) {
                        Navigator.pop(context);
                      }
                    },
                    searchFieldController: tuple.item4,
                    onSearchChange: (value) {
                      // if (tuple.item3?.stringQuery?.compareTo(value) != 0) {
                      viewAllPropertiesProvider?.searchByProperties(value);
                      viewAllPropertiesProvider?.searchByInquires(value);
                      // }
                    },
                  );
                },
              ),
              if (widget.arguments.showDataFor == ViewAllFromType.searchList)
                Expanded(
                  child: Selector<ViewAllPropertiesProvider, PageController>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => state.viewModeSwitcherController,
                    builder: (context, switcherController, child) {
                      return PageView(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollBehavior: HideGlowBehavior(),
                        children: [
                          _propertyListWidget(),
                          ViewAllPropertiesByMap(
                            arguments: widget.arguments,
                            localizationsContext: localizationsContext,
                            commonPropertyDataProvider:
                                commonPropertyDataProvider,
                          ),
                        ],
                        controller: switcherController,
                      );
                    },
                  ),
                ),
              if (widget.arguments.showDataFor != ViewAllFromType.searchList)
                Expanded(
                  child: _propertyListWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
