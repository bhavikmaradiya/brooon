import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './model/reminder_arguments.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/reminder/add_reminder_provider.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/checkbox_widget.dart';
import '../../widgets/dropdown/drop_down_as_field.dart';
import '../../widgets/dropdown/drop_down_list.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ReminderArgs?;
    return ChangeNotifierProvider(
      create: (_) => AddReminderProvider(),
      builder: (_, __) => _Body(arguments: args),
    );
  }
}

class _Body extends StatefulWidget {
  final ReminderArgs? arguments;

  const _Body({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  AddReminderProvider? provider;
  late AppLocalizations localizationsContext;
  bool _isEdit = false;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    if (provider == null) {
      provider = Provider.of<AddReminderProvider>(context, listen: false);
      _isEdit = widget.arguments?.reminder != null;
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          provider?.init(
            widget.arguments,
            localizationsContext,
          );
        },
      );
    }
    super.didChangeDependencies();
  }

  Widget _allDayWidget() {
    return Column(
      children: [
        Stack(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TextFieldWidget(
                label: localizationsContext.reminderStartEndDateLabel,
                keepLabelAlwaysOnTop: true,
                onValueChanged: (int? currentIndex, String value) => {},
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Selector<AddReminderProvider, TextEditingController>(
                      shouldRebuild: (prev, next) => prev != next,
                      selector: (_, state) => state.startDateFieldController,
                      builder: (context, controller, child) {
                        return InkWell(
                          onTap: () => provider!.selectDateAndTime(context),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: IgnorePointer(
                            ignoring: true,
                            child: TextFieldWidget(
                              hint: localizationsContext.reminderDateHint,
                              controller: controller,
                              keepLabelAlwaysOnTop: true,
                              inputAction: TextInputAction.done,
                              isOutlineBorderRequired: false,
                              suffixIconAssetPath: Strings.iconCalender,
                              onValueChanged:
                                  (int? currentIndex, String value) =>
                                      provider?.validateData(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: (Dimensions.fieldHeight * 0.15).h,
                    ),
                    child: VerticalDivider(
                      width: Dimensions.dividerWidth.w,
                      thickness: Dimensions.dividerWidth.w,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.dividerColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Selector<AddReminderProvider, TextEditingController>(
                      shouldRebuild: (prev, next) => prev != next,
                      selector: (_, state) => state.endDateFieldController,
                      builder: (context, controller, child) {
                        return InkWell(
                          onTap: () => provider!.selectDateAndTime(
                            context,
                            isForEndDate: true,
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: IgnorePointer(
                            ignoring: true,
                            child: TextFieldWidget(
                              hint: localizationsContext.reminderDateHint,
                              controller: controller,
                              keepLabelAlwaysOnTop: true,
                              inputAction: TextInputAction.done,
                              isOutlineBorderRequired: false,
                              suffixIconAssetPath: Strings.iconCalender,
                              onValueChanged:
                                  (int? currentIndex, String value) =>
                                      provider?.validateData(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.addReminderContentBetweenSpace.h,
        ),
        Selector<AddReminderProvider, TextEditingController>(
          shouldRebuild: (prev, next) => prev.text != next.text,
          selector: (_, state) => state.timeFieldController,
          builder: (context, controller, child) {
            return InkWell(
              onTap: () =>
                  provider!.selectDateAndTime(context, selectTime: true),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: IgnorePointer(
                ignoring: true,
                child: TextFieldWidget(
                  label: localizationsContext.reminderTimeLabel,
                  hint: localizationsContext.reminderTimeHint,
                  keepLabelAlwaysOnTop: true,
                  controller: controller,
                  inputAction: TextInputAction.done,
                  suffixIconAssetPath: Strings.iconClock,
                  onValueChanged: (int? currentIndex, String value) =>
                      provider?.validateData(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _singleDayWidget({
    required String label,
  }) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: true,
          child: TextFieldWidget(
            label: label,
            keepLabelAlwaysOnTop: true,
            onValueChanged: (int? currentIndex, String value) => {},
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Selector<AddReminderProvider, TextEditingController>(
                  shouldRebuild: (prev, next) => prev != next,
                  selector: (_, state) => state.startDateFieldController,
                  builder: (context, controller, child) {
                    return InkWell(
                      onTap: () => provider!.selectDateAndTime(context),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: IgnorePointer(
                        ignoring: true,
                        child: TextFieldWidget(
                          hint: localizationsContext.reminderDateHint,
                          controller: controller,
                          keepLabelAlwaysOnTop: true,
                          inputAction: TextInputAction.done,
                          isOutlineBorderRequired: false,
                          suffixIconAssetPath: Strings.iconCalender,
                          onValueChanged: (int? currentIndex, String value) =>
                              provider?.validateData(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: (Dimensions.fieldHeight * 0.15).h,
                ),
                child: VerticalDivider(
                  width: Dimensions.dividerWidth.w,
                  thickness: Dimensions.dividerWidth.w,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.dividerColor,
                  ),
                ),
              ),
              Expanded(
                child: Selector<AddReminderProvider, TextEditingController>(
                  shouldRebuild: (prev, next) => prev != next,
                  selector: (_, state) => state.timeFieldController,
                  builder: (context, controller, child) {
                    return InkWell(
                      onTap: () => provider!
                          .selectDateAndTime(context, selectTime: true),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: IgnorePointer(
                        ignoring: true,
                        child: TextFieldWidget(
                          hint: localizationsContext.reminderTimeHint,
                          controller: controller,
                          keepLabelAlwaysOnTop: true,
                          isOutlineBorderRequired: false,
                          suffixIconAssetPath: Strings.iconClock,
                          inputAction: TextInputAction.done,
                          onValueChanged: (int? currentIndex, String value) =>
                              provider?.validateData(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(
        context,
        statusBarColor: ColorEnum.whiteColor,
      ),
      bottomNavigationBar: Container(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalMargin.w,
                vertical: Dimensions.screenVerticalMarginBottom.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        right:
                            Dimensions.addReminderBottomButtonSpacingBetween.w,
                      ),
                      child: ButtonWidget(
                        text: localizationsContext.reminderCancel,
                        onClick: () => Navigator.pop(context),
                        borderWidth:
                            Dimensions.addReminderBottomButtonBorderWidth.w,
                        textColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                        borderColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                        bgColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColorOpacity3Percentage,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left:
                            Dimensions.addReminderBottomButtonSpacingBetween.w,
                      ),
                      child: Selector<AddReminderProvider, bool>(
                        shouldRebuild: (prev, next) => prev != next,
                        selector: (_, state) => state.isValid,
                        builder: (buildContext, isValid, child) => ButtonWidget(
                          text: localizationsContext.reminderSave,
                          onClick: () => provider?.saveReminder(
                            context,
                            localizationsContext,
                          ),
                          borderWidth:
                              Dimensions.addReminderBottomButtonBorderWidth.w,
                          textColor: StaticFunctions.getColor(
                            buildContext,
                            isValid
                                ? ColorEnum.whiteColor
                                : ColorEnum.gray90Color,
                          ),
                          borderColor: StaticFunctions.getColor(
                            buildContext,
                            isValid
                                ? ColorEnum.themeColor
                                : ColorEnum.borderColorE0,
                          ),
                          bgColor: StaticFunctions.getColor(
                            buildContext,
                            isValid
                                ? ColorEnum.themeColor
                                : ColorEnum.themeColorOpacity3Percentage,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ToolBar(
                title: _isEdit
                    ? localizationsContext.editReminder
                    : localizationsContext.addReminder,
                enableBackground: true,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.screenHorizontalMargin.w,
                              right: Dimensions.screenHorizontalMargin.w,
                              top: Dimensions.screenVerticalMarginBottom.h,
                              bottom: Dimensions.screenVerticalMarginBottom.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Selector<AddReminderProvider,
                                    TextEditingController>(
                                  shouldRebuild: (prev, next) => true,
                                  selector: (_, state) =>
                                      state.titleFieldController,
                                  builder: (context, controller, child) {
                                    return TextFieldWidget(
                                      label: localizationsContext
                                          .reminderTitleLabel,
                                      hint: localizationsContext
                                          .reminderTitleHint,
                                      controller: controller,
                                      keyBoardType:
                                          TextInputType.visiblePassword,
                                      keepLabelAlwaysOnTop: true,
                                      onValueChanged:
                                          (int? currentIndex, String value) =>
                                              provider!.validateData(),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: Dimensions
                                      .addReminderContentBetweenSpace.h,
                                ),
                                Selector<AddReminderProvider,
                                    TextEditingController>(
                                  shouldRebuild: (prev, next) => true,
                                  selector: (_, state) =>
                                      state.descriptionFieldController,
                                  builder: (context, controller, child) {
                                    return TextFieldWidget(
                                      label: localizationsContext
                                          .reminderDescriptionLabel,
                                      hint: localizationsContext
                                          .reminderDescriptionHint,
                                      controller: controller,
                                      maxLines: Dimensions
                                          .addReminderDescriptionFieldMaxLine,
                                      fieldHeight: Dimensions
                                          .addReminderDescriptionFieldHeight.h,
                                      keyBoardType: TextInputType.multiline,
                                      inputAction: Platform.isAndroid
                                          ? TextInputAction.newline
                                          : TextInputAction.done,
                                      keepLabelAlwaysOnTop: true,
                                      onValueChanged:
                                          (int? currentIndex, String value) =>
                                              provider!.validateData(),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: Dimensions
                                      .addReminderContentBetweenSpace.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Selector<AddReminderProvider, bool>(
                                      shouldRebuild: (prev, next) =>
                                          prev != next,
                                      selector: (_, state) =>
                                          state.enableReminderForAllDay,
                                      builder: (context, isEnabled, child) {
                                        return CustomCheckbox(
                                          value: isEnabled,
                                          uncheckedFillColor:
                                              StaticFunctions.getColor(
                                            context,
                                            ColorEnum.whiteColor,
                                          ),
                                          shouldShowBorder: true,
                                          borderColor: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.blueColor,
                                          ),
                                          checkedFillColor:
                                              StaticFunctions.getColor(
                                            context,
                                            ColorEnum.blueColor,
                                          ),
                                          borderWidth:
                                              Dimensions.checkboxBorderWidth.w,
                                          checkBoxSize: Dimensions
                                              .addReminderCheckBoxSize.w,
                                          onChanged: (value) => provider!
                                              .setReminderForAllDay(value),
                                          borderRadius:
                                              Dimensions.checkboxBorderRadius.r,
                                          innerPadding:
                                              Dimensions.checkboxInnerPadding.w,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width:
                                          Dimensions.checkboxAndTextSpacing.w,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () =>
                                            provider!.setReminderForAllDay(
                                          !provider!.enableReminderForAllDay,
                                        ),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Text(
                                          localizationsContext
                                              .reminderAllDaysLabel,
                                          style: TextStyle(
                                            fontSize:
                                                Dimensions.checkboxLabelSize.sp,
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.blackColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions
                                      .addReminderContentBetweenSpace.h,
                                ),
                                Selector<AddReminderProvider, bool>(
                                  shouldRebuild: (prev, next) => prev != next,
                                  selector: (_, state) =>
                                      state.enableReminderForAllDay,
                                  builder: (context, isEnabled, child) {
                                    return AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 0,
                                      ),
                                      switchInCurve: Curves.easeIn,
                                      switchOutCurve: Curves.easeOut,
                                      child: isEnabled
                                          ? _allDayWidget()
                                          : _singleDayWidget(
                                              label: localizationsContext
                                                  .reminderDateTimeLabel,
                                            ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: Dimensions
                                      .addReminderContentBetweenSpace.h,
                                ),
                                Container(
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Selector<AddReminderProvider,
                                            TextEditingController>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.propertyFieldController,
                                          builder:
                                              (context, controller, child) {
                                            final isPropertySelected = controller
                                                    .text
                                                    .trim()
                                                    .isEmpty ||
                                                controller.text.trim() ==
                                                    localizationsContext
                                                        .reminderPropertyHint;
                                            return DropDownAsField(
                                              label: localizationsContext
                                                  .reminderPropertyLabel,
                                              controller: controller,
                                              hint: localizationsContext
                                                  .reminderPropertyHint,
                                              field2ndSuffixPath: isPropertySelected
                                                  ? ''
                                                  : Strings
                                                      .iconReminderCloseProperty,
                                            );
                                          },
                                        ),
                                      ),
                                      Selector<AddReminderProvider,
                                          List<DbProperty>>(
                                        shouldRebuild: (prev, next) => true,
                                        selector: (_, state) =>
                                            state.propertyList,
                                        builder: (context, list, child) {
                                          DbProperty? propertyItem =
                                              list.isNotEmpty
                                                  ? list.firstWhereOrNull(
                                                      (element) =>
                                                          element.isSelected,
                                                    )
                                                  : null;
                                          int selected = propertyItem != null
                                              ? propertyItem.id
                                              : -1;
                                          final List<int> ids = [];
                                          final List<String> values = [];
                                          for (int i = 0;
                                              i < list.length;
                                              i++) {
                                            if (i == 0) {
                                              ids.add(AddReminderProvider
                                                  .reminderHintId);
                                              values.add(
                                                localizationsContext
                                                    .reminderPropertyHint,
                                              );
                                            }
                                            ids.add(list[i].id);
                                            values.add(
                                              '${list[i].propertyId} | ${CommonPropertyDataProvider.propertyAreaWithPropertyType(list[i])}',
                                            );
                                          }
                                          return DropDownList(
                                            ids: ids,
                                            values: values,
                                            selectedId: selected,
                                            onDropDownSelectionChanged: (
                                              id,
                                              value,
                                            ) {
                                              provider?.selectProperty(id);
                                            },
                                          );
                                        },
                                      ),
                                      Selector<AddReminderProvider,
                                          TextEditingController>(
                                        shouldRebuild: (prev, next) => true,
                                        selector: (_, state) =>
                                            state.propertyFieldController,
                                        builder: (context, controller, child) {
                                          final isPropertySelected =
                                              controller.text.trim().isEmpty ||
                                                  controller.text.trim() ==
                                                      localizationsContext
                                                          .reminderPropertyHint;
                                          if (!isPropertySelected)
                                            return Positioned(
                                              right: (Dimensions
                                                          .suffixIconToTextMargin *
                                                      (Dimensions
                                                              .suffixSecondIconMargin -
                                                          0.5))
                                                  .w,
                                              top: 0,
                                              bottom: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  provider?.selectProperty(
                                                      AddReminderProvider
                                                          .reminderHintId);
                                                },
                                                child: SizedBox(
                                                  width: Dimensions
                                                      .addReminderClearPropertyContainerSize
                                                      .w,
                                                  height: double.infinity,
                                                  child: const Text(''),
                                                ),
                                              ),
                                            );
                                          return const SizedBox();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
