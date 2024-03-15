import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './add_property_provider.dart';
import './model/add_property_args.dart';
import './widgets/add_property_basic_details.dart';
import './widgets/other_details_widget.dart';
import './widgets/owner_details_widget.dart';
import './widgets/property_features_widget.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/file_utils.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/toolbar.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyArgs =
        ModalRoute.of(context)!.settings.arguments as AddPropertyArgs?;
    return ChangeNotifierProvider(
      create: (_) => AddPropertyProvider(),
      builder: (_, __) => _AddPropertyBody(
        propertyArgs: propertyArgs,
      ),
    );
  }
}

class _AddPropertyBody extends StatefulWidget {
  final AddPropertyArgs? propertyArgs;

  const _AddPropertyBody({
    Key? key,
    required this.propertyArgs,
  }) : super(key: key);

  @override
  State<_AddPropertyBody> createState() => _AddPropertyBodyState();
}

class _AddPropertyBodyState extends State<_AddPropertyBody>
    with TickerProviderStateMixin {
  AppLocalizations? _localizationsContext;
  AddPropertyProvider? _addPropertyProvider;
  CommonPropertyDataProvider? _commonPropertyDataProvider;
  late AnimationController _ownerDetailAnimationController;
  late AnimationController _basicDetailAnimationController;
  late AnimationController _otherDetailsAnimationController;
  final bool isOwnerDetailsExpanded = true;
  final bool isBasicDetailsExpanded = true;
  bool isOtherDetailsExpanded = false;

  @override
  void initState() {
    if (widget.propertyArgs != null) {
      isOtherDetailsExpanded = true;
    }
    _ownerDetailAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 0.5,
    );
    if (isOwnerDetailsExpanded) {
      _ownerDetailAnimationController.forward(from: 0.0);
    } else {
      _ownerDetailAnimationController.reverse(from: 0.5);
    }
    _basicDetailAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 0.5,
    );
    if (isBasicDetailsExpanded) {
      _basicDetailAnimationController.forward(from: 0.0);
    } else {
      _basicDetailAnimationController.reverse(from: 0.5);
    }
    _otherDetailsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 0.5,
    );
    if (isOtherDetailsExpanded) {
      _otherDetailsAnimationController.forward(from: 0.0);
    } else {
      _otherDetailsAnimationController.reverse(from: 0.5);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_localizationsContext == null) {
      _localizationsContext = AppLocalizations.of(context)!;
    }
    if (_addPropertyProvider == null) {
      _addPropertyProvider =
          Provider.of<AddPropertyProvider>(context, listen: false);
      _addPropertyProvider!.init(
        context,
        widget.propertyArgs,
      );
    }
    if (_commonPropertyDataProvider == null) {
      _commonPropertyDataProvider =
          Provider.of<CommonPropertyDataProvider>(context, listen: false);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    FileUtils.clearCacheImages();
    _basicDetailAnimationController.dispose();
    _ownerDetailAnimationController.dispose();
    _otherDetailsAnimationController.dispose();
    super.dispose();
  }

  _showDiscardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogWidget(
          title: _localizationsContext!.sureToDiscard,
          icon: Strings.iconDiscard,
          positiveButton: _localizationsContext!.yesSure,
          negativeButton: _localizationsContext!.no,
          onNegativeButtonClick: () {
            Navigator.pop(context);
          },
          onPositiveButtonClick: () async {
            // To close dialog
            Navigator.pop(context);
            // To close screen
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Widget _navigationWidget(BuildContext context) {
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
                text: _localizationsContext!.cancel,
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
                onClick: () {
                  final shouldDiscard =
                      !_addPropertyProvider!.checkIfAnyChanges();
                  if (shouldDiscard) {
                    Navigator.pop(context);
                    return;
                  }
                  _showDiscardDialog();
                },
              ),
            ),
            SizedBox(
              width: Dimensions.homeScreenBottomNavigationButtonSpacing.w,
            ),
            Expanded(
              child: Selector<AddPropertyProvider, bool>(
                selector: (_, state) => state.isAddedInfoCorrect,
                shouldRebuild: (prev, next) => prev != next,
                builder: (context, isInfoCorrect, child) {
                  return ButtonWidget(
                    text: _localizationsContext!.submit,
                    textColor: StaticFunctions.getColor(
                      context,
                      isInfoCorrect
                          ? ColorEnum.whiteColor
                          : ColorEnum.gray90Color,
                    ),
                    bgColor: StaticFunctions.getColor(
                      context,
                      isInfoCorrect
                          ? ColorEnum.themeColor
                          : ColorEnum.themeColorOpacity3Percentage,
                    ),
                    borderColor: StaticFunctions.getColor(
                      context,
                      isInfoCorrect
                          ? ColorEnum.themeColor
                          : ColorEnum.borderColorE0,
                    ),
                    onClick: isInfoCorrect
                        ? () async {
                            int id =
                                await _addPropertyProvider!.savePropertyDetails(
                              _commonPropertyDataProvider!,
                            );
                            if (id != (-1)) {
                              final savedProperty =
                                  await _addPropertyProvider!.getSavedProperty(
                                id,
                              );
                              if (savedProperty != null) {
                                FileUtils.clearCacheImages();
                                _addPropertyProvider?.showSuccessScreen(
                                  context,
                                  savedProperty,
                                );
                              }
                            }
                          }
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(int index) {
    final themeWithoutDivider = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    );
    return ColoredBox(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.stickyHeaderBlueBgColor,
      ),
      child: Theme(
        data: themeWithoutDivider,
        child: ListTileTheme(
          dense: true,
          child: ExpansionTile(
            initiallyExpanded: index == 0
                ? isOwnerDetailsExpanded
                : (index == 1)
                    ? isBasicDetailsExpanded
                    : (index == 2)
                        ? isOtherDetailsExpanded
                        : false,
            tilePadding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalMargin.w,
              vertical: 0,
            ),
            title: Text(
              (index == 0)
                  ? _localizationsContext!.ownerDetails
                  : (index == 1)
                      ? _localizationsContext!.basicDetails
                      : _localizationsContext!.otherDetails,
              style: TextStyle(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blueColor,
                ),
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.expandableHeaderTextSize.sp,
              ),
            ),
            trailing: RotationTransition(
              turns: Tween(
                begin: 0.0,
                end: 1.0,
              ).animate(
                index == 0
                    ? _ownerDetailAnimationController
                    : (index == 1)
                        ? _basicDetailAnimationController
                        : _otherDetailsAnimationController,
              ),
              child: SvgPicture.asset(
                Strings.iconExpansionBottomArrow,
                width: Dimensions.expandableTrailingIconWidth.w,
                height: Dimensions.expandableTrailingIconHeight.h,
              ),
            ),
            onExpansionChanged: (isExpanded) {
              if (!isExpanded) {
                if (index == 0) {
                  _ownerDetailAnimationController.reverse(from: 0.5);
                } else if (index == 1) {
                  _basicDetailAnimationController.reverse(from: 0.5);
                } else {
                  _otherDetailsAnimationController.reverse(from: 0.5);
                }
              } else {
                if (index == 0) {
                  _ownerDetailAnimationController.forward(from: 0.0);
                } else if (index == 1) {
                  _basicDetailAnimationController.forward(from: 0.0);
                } else {
                  _otherDetailsAnimationController.forward(from: 0.0);
                }
              }
            },
            children: [
              ColoredBox(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                child: index == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimensions.expandableChildrenPadding.h,
                          horizontal: Dimensions.screenHorizontalMargin.w,
                        ),
                        child: PropertyOwnerDetails(
                          provider: _addPropertyProvider!,
                          localizationsContext: _localizationsContext!,
                        ),
                      )
                    : index == 1
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.expandableChildrenPadding.h,
                              horizontal: Dimensions.screenHorizontalMargin.w,
                            ),
                            child: AddPropertyBasicDetails(
                              localizationsContext: _localizationsContext!,
                              addPropertyProvider: _addPropertyProvider!,
                            ),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: Dimensions.screenHorizontalMargin.w,
                                  right: Dimensions.screenHorizontalMargin.w,
                                  bottom:
                                      Dimensions.expandableChildrenPadding.h,
                                ),
                                child: PropertyFeaturesDetails(
                                  provider: _addPropertyProvider!,
                                  localizationsContext: _localizationsContext!,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: Dimensions
                                      .addBuyerBasicDetailWithoutHeaderPadding
                                      .h,
                                  left: Dimensions.screenHorizontalMargin.w,
                                  right: Dimensions.screenHorizontalMargin.w,
                                ),
                                child: PropertyOtherDetails(
                                  provider: _addPropertyProvider!,
                                  localizationsContext: _localizationsContext!,
                                ),
                              ),
                            ],
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      bottomNavigationBar: _navigationWidget(context),
      body: WillPopScope(
        onWillPop: () {
          final shouldDiscard = !_addPropertyProvider!.checkIfAnyChanges();
          if (!shouldDiscard) {
            _showDiscardDialog();
          }
          return Future.value(shouldDiscard);
        },
        child: SafeArea(
          child: Column(
            children: [
              ToolBar(
                title: (widget.propertyArgs != null &&
                        widget.propertyArgs!.addPropertyEnums ==
                            AddPropertyEnums.edit)
                    ? _localizationsContext!.editProperty
                    : _localizationsContext!.drawerItemAddProperty,
                onBackPressed: () {
                  final shouldDiscard =
                      !_addPropertyProvider!.checkIfAnyChanges();
                  if (shouldDiscard) {
                    Navigator.pop(context);
                    return;
                  }
                  _showDiscardDialog();
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildList(0),
                      _buildList(1),
                      _buildList(2),
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
