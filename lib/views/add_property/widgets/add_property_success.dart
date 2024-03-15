import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/button_widget.dart';
import '../add_property_provider.dart';

class AddPropertySuccess extends StatelessWidget {
  late bool isEdit;

  AddPropertySuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationContext = AppLocalizations.of(context)!;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    isEdit = args['isEdit'] as bool;
    final savedProperty = args['property'] as DbProperty;
    final bgOpacityColor = StaticFunctions.getColor(
      context,
      ColorEnum.darkBgOpacityColor,
    );
    final addPropertyProvider = Provider.of<AddPropertyProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.successScreenCloud1MarginTop.h,
              right: -(Dimensions.screenHorizontalMargin.w),
              child: SvgPicture.asset(
                Strings.screenBgRightCloud,
                width: Dimensions.successScreenCloud1Width.w,
                height: Dimensions.successScreenCloud1Height.h,
                color: bgOpacityColor,
              ),
            ),
            Positioned(
              top: Dimensions.successScreenCloud2MarginTop.h,
              left: Dimensions.successScreenCloud2MarginLeft.w,
              child: SvgPicture.asset(
                Strings.splashBg1,
                width: Dimensions.successScreenCloud2Width.w,
                height: Dimensions.successScreenCloud2Height.h,
                color: bgOpacityColor,
              ),
            ),
            Positioned(
              top: Dimensions.successScreenCloud3MarginTop.h,
              right: -(Dimensions.screenHorizontalMargin.w),
              child: SvgPicture.asset(
                Strings.splashBg3,
                width: Dimensions.successScreenCloud3Width.w,
                height: Dimensions.successScreenCloud3Height.h,
                color: bgOpacityColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.successScreenBuildingMarginBottom.h,
                ),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.splashBuildingHeight.h,
                child: Image(
                  image: AssetImage(
                    Strings.splashBuilding,
                  ),
                  color: bgOpacityColor.withOpacity(0.3),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Dimensions.successScreenIconContainerSize.w,
                    height: Dimensions.successScreenIconContainerSize.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blueColorOpacity5Percentage,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: Dimensions.successScreenIconPadding25.w,
                      right: Dimensions.successScreenIconPadding25.w,
                      top: Dimensions.successScreenIconPadding25.w,
                      bottom: Dimensions.successScreenIconPadding27.w,
                    ),
                    child: SvgPicture.asset(
                      Strings.iconAddPropertySuccess,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blueColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.successScreenContentSpacing.h,
                  ),
                  Text(
                    isEdit
                        ? localizationContext.propertyUpdatedSuccessfully
                        : localizationContext.propertyAddedSuccessfully,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.successScreenMessageTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.successScreenMessageMarginBottom.h,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: Dimensions.successScreenButtonMarginBottom.h,
              left: Dimensions.screenHorizontalMargin.w,
              right: Dimensions.screenHorizontalMargin.w,
              child: Column(
                children: [
                  ButtonWidget(
                    text: localizationContext.viewProperty,
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
                      addPropertyProvider.goToPropertyDetailOnAddSuccess(
                        context,
                        savedProperty,
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.successScreenContentSpacing.h,
                  ),
                  ButtonWidget(
                    text: localizationContext.goToDashboard,
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
                      addPropertyProvider.goToDashboardOnAddSuccess(
                        context,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
