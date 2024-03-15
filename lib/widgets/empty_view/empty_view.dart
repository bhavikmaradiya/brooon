import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../button_widget.dart';

class EmptyView extends StatelessWidget {
  final String? message;
  final Function? onRetryClicked;

  const EmptyView({
    Key? key,
    this.onRetryClicked,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (onRetryClicked != null)
                SizedBox(
                  height: MediaQuery.of(context).padding.top +
                      Dimensions.noDataExtraSizeForRetryOption.h,
                ),
              Container(
                width: Dimensions.propertyNoDataContainerSize.w,
                height: Dimensions.propertyNoDataContainerSize.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.propertyNoDataContainerRadius.r,
                  ),
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blueColorOpacity2Percentage,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Strings.iconNoData,
                    width: Dimensions.propertyNoDataIconSize.w,
                    height: Dimensions.propertyNoDataIconSize.w,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.propertyNoDataContentSpacing.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.screenHorizontalMargin.w,
                ),
                child: Text(
                  message ?? localizationsContext.noDataFound,
                  style: TextStyle(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                    fontSize: Dimensions.screenNoDataTextSize.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (onRetryClicked == null)
                SizedBox(
                  height: MediaQuery.of(context).padding.top + kToolbarHeight,
                ),
            ],
          ),
        ),
        if (onRetryClicked != null)
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalMargin.w,
              vertical: Dimensions.screenVerticalMarginBottom.h,
            ),
            child: ButtonWidget(
              text: localizationsContext.retry,
              fontWeight: FontWeight.w700,
              onClick: () {
                onRetryClicked!();
              },
              bgColor: StaticFunctions.getColor(
                context,
                ColorEnum.themeColor,
              ),
              borderColor: StaticFunctions.getColor(
                context,
                ColorEnum.themeColor,
              ),
              textColor: StaticFunctions.getColor(
                context,
                ColorEnum.whiteColor,
              ),
            ),
          ),
      ],
    );
  }
}
