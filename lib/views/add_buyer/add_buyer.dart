import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './add_buyer_provider.dart';
import './model/add_buyer_args.dart';
import './widget/add_buyer_basic_details.dart';
import './widget/add_buyer_info_details.dart';
import './widget/add_buyer_other_details.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/toolbar.dart';

class AddBuyer extends StatelessWidget {
  const AddBuyer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buyerArgs =
        ModalRoute.of(context)!.settings.arguments as AddBuyerArgs?;
    return ChangeNotifierProvider(
      create: (_) => AddBuyerProvider(),
      builder: (_, __) => _AddBuyerBody(
        buyerArgs: buyerArgs,
      ),
    );
  }
}

class _AddBuyerBody extends StatefulWidget {
  final AddBuyerArgs? buyerArgs;

  const _AddBuyerBody({
    Key? key,
    required this.buyerArgs,
  }) : super(key: key);

  @override
  State<_AddBuyerBody> createState() => _AddBuyerBodyState();
}

class _AddBuyerBodyState extends State<_AddBuyerBody>
    with TickerProviderStateMixin {
  AppLocalizations? _localizationsContext;
  AddBuyerProvider? _addBuyerProvider;
  late AnimationController _buyerDetailAnimationController;
  late AnimationController _basicDetailAnimationController;
  late AnimationController _otherDetailAnimationController;
  final bool isBuyerDetailExpanded = true;
  final bool isBasicDetailExpanded = true;
  final bool isOtherDetailExpanded = true;

  @override
  void initState() {
    _buyerDetailAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 0.5,
    );
    if (isBuyerDetailExpanded) {
      _buyerDetailAnimationController.forward(from: 0.0);
    } else {
      _buyerDetailAnimationController.reverse(from: 0.5);
    }

    _basicDetailAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 0.5,
    );
    if (isBasicDetailExpanded) {
      _basicDetailAnimationController.forward(from: 0.0);
    } else {
      _basicDetailAnimationController.reverse(from: 0.5);
    }

    _otherDetailAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 0.5,
    );
    if (isOtherDetailExpanded) {
      _otherDetailAnimationController.forward(from: 0.0);
    } else {
      _otherDetailAnimationController.reverse(from: 0.5);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_localizationsContext == null) {
      _localizationsContext = AppLocalizations.of(context)!;
    }
    if (_addBuyerProvider == null) {
      _addBuyerProvider = Provider.of<AddBuyerProvider>(
        context,
        listen: false,
      );
      _addBuyerProvider!.init(
        _localizationsContext!,
        widget.buyerArgs,
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _buyerDetailAnimationController.dispose();
    _basicDetailAnimationController.dispose();
    _otherDetailAnimationController.dispose();
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
                  final shouldDiscard = !_addBuyerProvider!.checkIfAnyChanges();
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
              child: Selector<AddBuyerProvider, bool>(
                shouldRebuild: (prev, next) => prev != next,
                selector: (_, state) => state.isValidBuyerDetails,
                builder: (_, isValidBuyerDetails, __) {
                  return ButtonWidget(
                    text: _localizationsContext!.submit,
                    onClick: isValidBuyerDetails
                        ? () => _addBuyerProvider!.saveBuyerDetails(context)
                        : null,
                    borderColor: StaticFunctions.getColor(
                      context,
                      isValidBuyerDetails
                          ? ColorEnum.themeColor
                          : ColorEnum.borderColorE0,
                    ),
                    textColor: StaticFunctions.getColor(
                      context,
                      isValidBuyerDetails
                          ? ColorEnum.whiteColor
                          : ColorEnum.gray90Color,
                    ),
                    bgColor: StaticFunctions.getColor(
                      context,
                      isValidBuyerDetails
                          ? ColorEnum.themeColor
                          : ColorEnum.themeColorOpacity3Percentage,
                    ),
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
            initiallyExpanded: (index == 0)
                ? isBuyerDetailExpanded
                : (index == 1)
                    ? isBasicDetailExpanded
                    : (index == 2)
                        ? isOtherDetailExpanded
                        : false,
            tilePadding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalMargin.w,
              vertical: 0,
            ),
            title: Text(
              index == 0
                  ? _localizationsContext!.buyerInfo
                  : index == 1
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
                    ? _buyerDetailAnimationController
                    : index == 1
                        ? _basicDetailAnimationController
                        : _otherDetailAnimationController,
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
                  _buyerDetailAnimationController.reverse(from: 0.5);
                } else if (index == 1) {
                  _basicDetailAnimationController.reverse(from: 0.5);
                } else {
                  _otherDetailAnimationController.reverse(from: 0.5);
                }
              } else {
                if (index == 0) {
                  _buyerDetailAnimationController.forward(from: 0.0);
                } else if (index == 1) {
                  _basicDetailAnimationController.forward(from: 0.5);
                } else {
                  _otherDetailAnimationController.forward(from: 0.0);
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
                        child: BuyerDetails(
                          localizationsContext: _localizationsContext!,
                          addBuyerProvider: _addBuyerProvider!,
                        ),
                      )
                    : index == 1
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.expandableChildrenPadding.h,
                              horizontal: Dimensions.screenHorizontalMargin.w,
                            ),
                            child: AddBuyerBasicDetails(
                              localizationsContext: _localizationsContext!,
                              provider: _addBuyerProvider!,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              bottom: Dimensions.expandableChildrenPadding.h,
                              left: Dimensions.screenHorizontalMargin.w,
                              right: Dimensions.screenHorizontalMargin.w,
                            ),
                            child: AddBuyerOtherDetails(
                              localizationsContext: _localizationsContext!,
                              provider: _addBuyerProvider!,
                            ),
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
          final shouldDiscard = !_addBuyerProvider!.checkIfAnyChanges();
          if (!shouldDiscard) {
            _showDiscardDialog();
          }
          return Future.value(shouldDiscard);
        },
        child: SafeArea(
          child: Column(
            children: [
              ToolBar(
                title: widget.buyerArgs?.inquiryEnum == InquiryEnums.edit
                    ? _localizationsContext!.editBuyer
                    : _localizationsContext!.addBuyer,
                onBackPressed: () {
                  final shouldDiscard = !_addBuyerProvider!.checkIfAnyChanges();
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
