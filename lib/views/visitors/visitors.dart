import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './add_visitor_provider.dart';
import './visitors_provider.dart';
import './widget/visitors_item.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_property_visitors.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/phone_number_input_formatter.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../../widgets/snack_bar_view.dart';
import '../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../widgets/suggestion_field_item.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';
import '../common_widget/custom_floating_widget.dart';

class Visitors extends StatelessWidget {
  const Visitors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as DbProperty;
    return ChangeNotifierProvider(
      create: (_) => VisitorsProvider(),
      child: _VisitorsBody(
        property: arguments,
      ),
    );
  }
}

class _VisitorsBody extends StatefulWidget {
  final DbProperty property;

  const _VisitorsBody({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  State<_VisitorsBody> createState() => _VisitorsBodyState();
}

class _VisitorsBodyState extends State<_VisitorsBody> {
  AppLocalizations? _localizationsContext;
  VisitorsProvider? _visitorsProvider;

  @override
  void didChangeDependencies() {
    if (_localizationsContext == null) {
      _localizationsContext = AppLocalizations.of(context)!;
    }
    if (_visitorsProvider == null) {
      _visitorsProvider = Provider.of<VisitorsProvider>(context, listen: false);
      _visitorsProvider!.init(widget.property.propertyId!);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      floatingActionButton: (widget.property.sharedByBrooon == false &&
              widget.property.propertySoldStatusId ==
                  SaveDefaultData.unSoldStatusId)
          ? CustomFloatingWidget(
              onClick: () {
                StaticFunctions.unFocusKeyboardIfAny(context);
                _addVisitorDialog(context);
              },
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              title: _localizationsContext!.visitors,
              enableSearch: true,
              onSearchChange: (value) {
                _visitorsProvider?.searchBy(value);
              },
            ),
            Expanded(
              child: Selector<VisitorsProvider, List<DbPropertyVisitors>>(
                selector: (_, state) => state.propertyVisitors,
                shouldRebuild: (prev, next) => true,
                builder: (context, list, child) {
                  if (list.isEmpty) {
                    return EmptyView();
                  }
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return VisitorsItem(
                        localizationsContext: _localizationsContext,
                        visitor: list[index],
                        isLastIndex: index == list.length - 1,
                        onCallClick: () {
                          if (list[index].mobileNo != null) {
                            _visitorsProvider?.openDialerToMakeACall(
                              list[index].mobileNo!.toString().trim(),
                            );
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addVisitorDialog(context) {
    AddVisitorProvider? addVisitorProvider;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (dialogContext) {
        return ChangeNotifierProvider(
          create: (_) => AddVisitorProvider(),
          builder: (context, _) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (addVisitorProvider == null) {
                addVisitorProvider ??=
                    Provider.of<AddVisitorProvider>(context, listen: false);
                addVisitorProvider!.init();
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
                                onSuffixIconClick: () => addVisitorProvider
                                    ?.openContactsToPickPhone(),
                                onChanged: (value) {
                                  addVisitorProvider?.validateVisitorData();
                                },
                              ),
                              suggestionsCallback: (pattern) {
                                return addVisitorProvider!
                                    .getFilteredVisitors(pattern);
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
                                addVisitorProvider?.selectVisitorSuggestion(
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
                                      addVisitorProvider!.validateVisitorData(),
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
                                    await addVisitorProvider!
                                        .addVisitor(widget.property);
                                    await _visitorsProvider
                                        ?.notifyVisitorChange(
                                      widget.property.propertyId!,
                                    );
                                    SnackBarView.showSnackBar(
                                      context,
                                      _localizationsContext!.visitorAdded,
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
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
}
