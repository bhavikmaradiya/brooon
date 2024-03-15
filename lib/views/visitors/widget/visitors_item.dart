import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_visitors.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class VisitorsItem extends StatelessWidget {
  final DbPropertyVisitors visitor;
  final bool isLastIndex;
  final Function? onCallClick;
  final AppLocalizations? localizationsContext;

  const VisitorsItem({
    Key? key,
    required this.localizationsContext,
    required this.visitor,
    required this.isLastIndex,
    required this.onCallClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.screenHorizontalMargin.w,
        right: Dimensions.screenHorizontalMargin.w,
        top: Dimensions.visitorsListItemSpacing.h,
        bottom: isLastIndex ? Dimensions.visitorsListItemSpacing.h : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.visitorsListItemRadius.r,
        ),
        border: Border.all(
          width: Dimensions.visitorsListItemBorderWidth.w,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
        ),
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.visitorsListItemPadding.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (visitor.name == null ||
                        visitor.name!.trim().isEmpty)
                        ? localizationsContext!.unknownText
                        : visitor.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimensions.visitorsListItemNameTextSize.sp,
                      fontWeight: FontWeight.w600,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.visitorsListItemContentSpacing.h,
                  ),
                  Text(
                    (visitor.mobileNo == null ||
                            visitor.mobileNo!.trim().isEmpty)
                        ? localizationsContext!.noPhoneFound
                        : visitor.mobileNo!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimensions.visitorsListItemPhoneTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.visitorsListItemContentSpacing.h,
                  ),
                  Text(
                    localizationsContext!
                        .propertyAddedAt('${StaticFunctions.changeDateFormat(
                      visitor.addedAt!,
                      AppConfig.propertyVisitorAddedAtDateFormat,
                    )}'),
                    style: TextStyle(
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                      fontSize: Dimensions.visitorsListItemAddedAtTextSize.sp,
                    ),
                  ),
                ],
              ),
            ),
            if (visitor.mobileNo != null && visitor.mobileNo!.trim().isNotEmpty)
              Container(
                width: Dimensions.visitorsListItemCallContainerSize.w,
                height: Dimensions.visitorsListItemCallContainerSize.w,
                padding: EdgeInsets.all(
                  Dimensions.visitorsListItemBorderWidth.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.visitorsListItemRadius.r,
                  ),
                  border: Border.all(
                    width: Dimensions.visitorsListItemBorderWidth.w,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.borderColorE0,
                    ),
                  ),
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.touchSplashColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      Dimensions.visitorsListItemRadius.r,
                    ),
                    onTap: () {
                      if (onCallClick != null) {
                        onCallClick!();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(
                        (Dimensions.visitorsListItemCallContainerSize / 4).w,
                      ),
                      child: SvgPicture.asset(
                        Strings.iconCall,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
