import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_preferred_cast.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class CastItemWidget extends StatelessWidget {
  final DbPropertyPreferredCast castDetails;
  final Function()? onDelete;
  final Function()? onEdit;
  final bool? isLastIndex;

  const CastItemWidget({
    required this.castDetails,
    this.onEdit,
    this.onDelete,
    this.isLastIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.castScreenListItemVerticalPadding.h,
        horizontal: Dimensions.castScreenListItemHorizontalPadding.w,
      ),
      margin: EdgeInsets.only(
        top: Dimensions.castScreenListItemBetweenSpace.h,
        bottom: (isLastIndex == true)
            ? (Dimensions.castScreenListItemBetweenSpace * 3).h
            : 0,
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.castScreenListItemBorderRadius.r,
        ),
        border: Border.all(
          width: Dimensions.castScreenListItemBorderWidth.w,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              castDetails.name,
              style: TextStyle(
                fontSize: Dimensions.castScreenListItemFontSize.sp,
                fontWeight: FontWeight.w500,
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blackColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: Dimensions.castScreenListItemIconSize.h,
                    width: Dimensions.castScreenListItemIconSize.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.castScreenListItemIconRadius.r,
                      ),
                    ),
                    child: InkWell(
                      onTap: onEdit,
                      borderRadius: BorderRadius.circular(
                        Dimensions.castScreenListItemIconRadius.r,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          Dimensions.castScreenListItemIconPadding.w,
                        ),
                        child: SvgPicture.asset(
                          Strings.iconEdit,
                          height: Dimensions.castScreenListItemIconSize.h,
                          width: Dimensions.castScreenListItemIconSize.h,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blueColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.castScreenListItemIconBetweenSpace.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.castScreenListItemIconRadius.r,
                      ),
                    ),
                    height: Dimensions.castScreenListItemIconSize.h,
                    width: Dimensions.castScreenListItemIconSize.h,
                    child: InkWell(
                      onTap: onDelete,
                      borderRadius: BorderRadius.circular(
                        Dimensions.castScreenListItemIconRadius.r,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          Dimensions.castScreenListItemIconPadding.w,
                        ),
                        child: SvgPicture.asset(
                          Strings.iconDelete,
                          height: Dimensions.castScreenListItemIconSize.h,
                          width: Dimensions.castScreenListItemIconSize.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
