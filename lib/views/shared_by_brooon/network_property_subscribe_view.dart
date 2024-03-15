import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/button_widget.dart';

class NetworkPropertySubscribeView extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final Function() onSubScribe;

  const NetworkPropertySubscribeView({
    Key? key,
    required this.localizationsContext,
    required this.onSubScribe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.subscriptionPremiumCrownContainerSize.w,
                height: Dimensions.subscriptionPremiumCrownContainerSize.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.subscriptionPremiumCrownContainerRadius.r,
                  ),
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blueColorOpacity2Percentage,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Strings.iconPremiumCrown,
                    width: Dimensions.subscriptionPremiumCrownIconWidth.w,
                    height: Dimensions.subscriptionPremiumCrownIconHeight.w,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.propertyFromNetworkContentSpacing.h,
              ),
              Text(
                localizationsContext.goPremium,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColor,
                  ),
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.propertyFromNetworkPremiumTextSize.sp,
                ),
              ),
              SizedBox(
                height: Dimensions.propertyFromNetworkContentSpacing.h,
              ),
              Text(
                localizationsContext.premiumDesc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.propertyFromNetworkPremiumDescSize.sp,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: Dimensions.screenVerticalMarginBottom.h,
            bottom: Dimensions.screenVerticalMarginBottom.h,
          ),
          child: ButtonWidget(
            text: localizationsContext.subscribe,
            textColor: StaticFunctions.getColor(
              context,
              ColorEnum.whiteColor,
            ),
            bgColor: StaticFunctions.getColor(
              context,
              ColorEnum.themeColor,
            ),
            borderColor: StaticFunctions.getColor(
              context,
              ColorEnum.themeColor,
            ),
            fontWeight: FontWeight.w700,
            onClick: () {
              onSubScribe();
            },
          ),
        ),
      ],
    );
  }
}
