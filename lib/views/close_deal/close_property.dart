import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './close_deal_dialog_provider.dart';
import './close_deal_model.dart';
import './model/matching_model.dart';
import './widget/matching_item.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/phone_number_input_formatter.dart';
import '../../utils/static_functions.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../widgets/suggestion_field_item.dart';
import '../../widgets/text_field_widget.dart';
import '../add_property/model/options.dart';
import '../buyers_sellers/model/buyer_seller_info.dart';
import '../common_widget/checkbox_radio_item.dart';

class CloseProperty extends StatelessWidget {
  final BuildContext buildContext;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final AppLocalizations? localizationsContext;
  final Function(CloseDealModel)? onCloseDeal;
  final Function callToCloseConfirmationDialog;
  final DbProperty property;

  const CloseProperty({
    Key? key,
    required this.buildContext,
    required this.property,
    required this.commonPropertyDataProvider,
    required this.localizationsContext,
    required this.onCloseDeal,
    required this.callToCloseConfirmationDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CloseDealDialogProvider(),
      builder: (context, _) {
        return ClosePropertyBody(
          buildContext: buildContext,
          property: property,
          commonPropertyDataProvider: commonPropertyDataProvider,
          localizationsContext: localizationsContext,
          onCloseDeal: onCloseDeal,
          callToCloseConfirmationDialog: callToCloseConfirmationDialog,
        );
      },
    );
  }
}

class ClosePropertyBody extends StatefulWidget {
  final BuildContext buildContext;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final AppLocalizations? localizationsContext;
  final Function(CloseDealModel)? onCloseDeal;
  final Function callToCloseConfirmationDialog;
  final DbProperty property;

  const ClosePropertyBody({
    Key? key,
    required this.buildContext,
    required this.property,
    required this.commonPropertyDataProvider,
    required this.localizationsContext,
    required this.onCloseDeal,
    required this.callToCloseConfirmationDialog,
  }) : super(key: key);

  @override
  State<ClosePropertyBody> createState() => _ClosePropertyBodyState();
}

class _ClosePropertyBodyState extends State<ClosePropertyBody> {
  CloseDealDialogProvider? _closeDealProvider;

  @override
  void didChangeDependencies() {
    if (_closeDealProvider == null) {
      _closeDealProvider ??= Provider.of<CloseDealDialogProvider>(
        context,
        listen: false,
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          if (mounted) {
            _closeDealProvider!.init(
              context,
              property: widget.property,
            );
          }
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _closeDealProvider?.mounted = false;
    super.dispose();
  }

  _soldUnSoldConfirmationDialog({
    required BuildContext buildContext,
    required int dealType,
    required String buyerName,
    required String buyerNo,
    required String notes,
  }) async {
    await showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (dialogContext) {
        String dealName = '';
        String icon = '';
        if (dealType == SaveDefaultData.propertyForSellId) {
          dealName = widget.localizationsContext!.sold;
          icon = Strings.iconSold;
        } else if (dealType == SaveDefaultData.propertyForRentId) {
          dealName = widget.localizationsContext!.rented;
          icon = Strings.iconRented;
        } else if (dealType == SaveDefaultData.propertyForLeaseId) {
          dealName = widget.localizationsContext!.leased;
          icon = Strings.iconLeased;
        }
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
                        widget
                            .localizationsContext!.dealConfirmationDialogTitle,
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
                  vertical:
                      Dimensions.dealConfirmationDialogContentVerticalMargin.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon,
                      width: Dimensions.dealConfirmationDialogIconSize.h,
                      height: Dimensions.dealConfirmationDialogIconSize.h,
                    ),
                    SizedBox(
                      height: Dimensions
                          .dealConfirmationDialogIconAndMessageBetweenSpacing.h,
                    ),
                    Text(
                      widget.localizationsContext!
                          .dealConfirmationDialogMessage(dealName),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            Dimensions.dealConfirmationDialogMessageTextSize.sp,
                        color: StaticFunctions.getColor(
                          dialogContext,
                          ColorEnum.blackColor,
                        ),
                      ),
                    )
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
                        text: widget
                            .localizationsContext!.dealConfirmationDialogBtnNo,
                        textColor: StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.themeColor,
                        ),
                        bgColor: StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.themeColorOpacity3Percentage,
                        ),
                        borderColor: StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.borderColorE0,
                        ),
                        fontWeight: FontWeight.w700,
                        onClick: () {
                          widget.callToCloseConfirmationDialog();
                        },
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.addPropertyButtonSpacing.w,
                    ),
                    Expanded(
                      child: ButtonWidget(
                        text: widget
                            .localizationsContext!.dealConfirmationDialogBtnYes,
                        textColor: StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.whiteColor,
                        ),
                        bgColor: StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.themeColor,
                        ),
                        fontWeight: FontWeight.w700,
                        onClick: () async {
                          widget.callToCloseConfirmationDialog();
                          if (buyerName.isNotEmpty) {
                            if (widget.onCloseDeal != null) {
                              widget.onCloseDeal!(
                                CloseDealModel(
                                  name: buyerName,
                                  mobile: buyerNo,
                                  dealType: dealType,
                                  notes: notes,
                                  linkedPropertyInquiryId:
                                      _closeDealProvider?.filterMatchingList
                                          .firstWhereOrNull(
                                            (element) => element.isSelected,
                                          )
                                          ?.propertyInquiryId,
                                ),
                              );
                            }
                          }
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

  @override
  Widget build(BuildContext dialogContext) {
    return Padding(
      padding: MediaQuery.of(dialogContext).viewInsets,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                      widget.localizationsContext!.closeDealDialogTitle,
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
                  Selector<CloseDealDialogProvider, Tuple2<List<Options>, int>>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => Tuple2(
                      state.closeDealOptions,
                      state.selectedDealOption,
                    ),
                    builder: (_, data, __) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.item1.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              Dimensions.closeDealDialogDealForCountPerLine,
                          crossAxisSpacing:
                              Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                          mainAxisSpacing:
                              Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                          childAspectRatio:
                              (Dimensions.checkBoxRadioBoxAspectRatioWidth /
                                  Dimensions.propertyForAspectRatioHeight),
                        ),
                        itemBuilder: (context, index) {
                          final currentItem = data.item1[index];
                          return CheckboxRadioItem(
                            id: currentItem.id,
                            name: currentItem.name,
                            isSingleSelection: true,
                            selectedId: data.item2,
                            isSelected: currentItem.id == data.item2,
                            onSelect: (selectedId) =>
                                _closeDealProvider?.selectDealOption(
                              selectedId,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.closeDealDialogContentBetweenSpacing.h,
                  ),
                  Selector<CloseDealDialogProvider, TextEditingController>(
                    selector: (_, state) => state.nameFieldController,
                    builder: (context, controller, child) {
                      return TextFieldWithDropdown(
                        getImmediateSuggestions: false,
                        hideOnEmpty: true,
                        hideKeyboardOnDrag: false,
                        hideSuggestionsOnKeyboardHide: false,
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.borderRadius.r,
                          ),
                        ),
                        textFieldConfiguration: SuggestionFieldConfiguration(
                          controller: controller,
                          label: widget
                              .localizationsContext!.closeDealDialogBuyerName,
                          suffixIconPath: Strings.iconPhoneBook,
                          onSuffixIconClick: () =>
                              _closeDealProvider?.openContactsToPickPhone(),
                          onChanged: (value) {
                            _closeDealProvider?.validateCustomerData();
                            _closeDealProvider?.checkForMatching();
                          },
                          placeholder: widget
                              .localizationsContext!.closeDealDialogNameHint,
                        ),
                        suggestionsCallback: (pattern) {
                          return _closeDealProvider!.getFilteredBuyers(pattern);
                        },
                        loadingBuilder: (context) => SizedBox(),
                        noItemsFoundBuilder: (context) => SizedBox(),
                        itemBuilder: (
                          context,
                          BuyerSellerInfo suggestion,
                          bool showDivider,
                        ) {
                          return SuggestionItemWidget(
                            title: suggestion.name!,
                            subtitle: suggestion.phone,
                            showDivider: showDivider,
                          );
                        },
                        onSuggestionSelected: (
                          BuyerSellerInfo suggestion,
                        ) {
                          _closeDealProvider?.selectBuyerSuggestion(
                            context,
                            suggestion,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.closeDealDialogContentBetweenSpacing.h,
                  ),
                  Selector<CloseDealDialogProvider, TextEditingController>(
                    selector: (_, state) => state.phoneFieldController,
                    builder: (context, controller, child) {
                      return TextFieldWidget(
                        label: widget
                            .localizationsContext!.closeDealDialogBuyerMobile,
                        hint: widget
                            .localizationsContext!.closeDealDialogPhoneHint,
                        controller: controller,
                        maxLength: AppConfig.mobileNoFieldLength,
                        keyBoardType: TextInputType.phone,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          PhoneNumberTextInputFormatter(),
                        ],
                        keepLabelAlwaysOnTop: true,
                        onValueChanged: (int? currentIndex, String value) {
                          _closeDealProvider?.validateCustomerData();
                          _closeDealProvider?.checkForMatching();
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.closeDealDialogContentBetweenSpacing.h,
                  ),
                  Selector<CloseDealDialogProvider, TextEditingController>(
                    selector: (_, state) => state.noteFieldController,
                    builder: (context, controller, child) {
                      return TextFieldWidget(
                        label:
                            widget.localizationsContext!.closeDealDialogNotes,
                        hint: widget
                            .localizationsContext!.closeDealDialogNotesHint,
                        controller: controller,
                        keyBoardType: TextInputType.text,
                        keepLabelAlwaysOnTop: true,
                        onValueChanged: (int? currentIndex, String value) =>
                            _closeDealProvider?.validateCustomerData(),
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.closeDealDialogContentBetweenSpacing.h,
                  ),
                  Selector<CloseDealDialogProvider, List<MatchingModel>>(
                    selector: (_, state) => state.filterMatchingList,
                    shouldRebuild: (_, __) => true,
                    builder: (context, list, child) {
                      if (list.isEmpty) {
                        return const SizedBox();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.localizationsContext!.selectInquiry,
                            style: TextStyle(
                              fontSize: Dimensions
                                  .closeDealDialogDealForTitleTextSize.sp,
                              fontWeight: FontWeight.w500,
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blueColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions
                                .closeDealDialogTitleSubtitleBetweenSpacing.h,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (ctx, index) {
                              final data = list[index];
                              final text =
                                  _closeDealProvider?.retrieveMatchingItemText(
                                        data,
                                      ) ??
                                      '';
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: (index == (list.length - 1))
                                      ? 0
                                      : Dimensions
                                          .closeDealMatchingItemSpacing.h,
                                ),
                                child: MatchingItem(
                                  localizationsContext:
                                      widget.localizationsContext,
                                  id: data.id,
                                  text: text,
                                  isSelected: data.isSelected,
                                  onSelect: () {
                                    _closeDealProvider?.updateMatchingItem(
                                      data.id,
                                    );
                                  },
                                  onDetailTextClicked: () {
                                    _closeDealProvider
                                        ?.onMatchingItemDetailClicked(
                                      data.propertyInquiryId,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: Dimensions
                                .closeDealDialogContentBetweenSpacing.h,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.screenHorizontalMargin.w,
                  right: Dimensions.screenHorizontalMargin.w,
                  bottom: Dimensions.screenVerticalMarginBottom.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        text: widget
                            .localizationsContext!.closeDealDialogBtnCancel,
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
                          Navigator.pop(dialogContext);
                        },
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.addPropertyButtonSpacing.w,
                    ),
                    Expanded(
                      child: Selector<CloseDealDialogProvider, bool>(
                        selector: (_, state) => state.validBuyerDetails,
                        builder: (context, isValid, child) {
                          return ButtonWidget(
                            text: widget
                                .localizationsContext!.closeDealDialogBtnSubmit,
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
                                Navigator.pop(dialogContext);
                                final buyerName = _closeDealProvider!
                                    .nameFieldController.text
                                    .trim()
                                    .toLowerCase()
                                    .toTitleCase();
                                if (buyerName.isNotEmpty) {
                                  _soldUnSoldConfirmationDialog(
                                    buildContext: widget.buildContext,
                                    dealType:
                                        _closeDealProvider!.selectedDealOption,
                                    buyerName: buyerName,
                                    buyerNo: _closeDealProvider!
                                        .phoneFieldController.text
                                        .trim(),
                                    notes: _closeDealProvider!
                                        .noteFieldController.text
                                        .trim(),
                                  );
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
