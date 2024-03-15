import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_amenity.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class AmenityItemWidget extends StatelessWidget {
  final DbPropertyAmenity amenity;
  final Function()? onDelete;
  final Function()? onEdit;
  final bool? isLastIndex;

  const AmenityItemWidget({
    required this.amenity,
    this.onEdit,
    this.onDelete,
    this.isLastIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.amenityScreenListItemVerticalPadding.h,
        horizontal: Dimensions.amenityScreenListItemHorizontalPadding.w,
      ),
      margin: EdgeInsets.only(
        top: Dimensions.amenityScreenListItemBetweenSpace.h,
        bottom: (isLastIndex == true)
            ? (Dimensions.amenityScreenListItemBetweenSpace * 3).h
            : 0,
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.amenityScreenListItemBorderRadius.r,
        ),
        border: Border.all(
          width: Dimensions.amenityScreenListItemBorderWidth.w,
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
              amenity.name,
              style: TextStyle(
                fontSize: Dimensions.amenityScreenListItemFontSize.sp,
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
                    height: Dimensions.amenityScreenListItemIconSize.h,
                    width: Dimensions.amenityScreenListItemIconSize.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.amenityScreenListItemIconRadius.r,
                      ),
                    ),
                    child: InkWell(
                      onTap: onEdit,
                      borderRadius: BorderRadius.circular(
                        Dimensions.amenityScreenListItemIconRadius.r,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          Dimensions.amenityScreenListItemIconPadding.w,
                        ),
                        child: SvgPicture.asset(
                          Strings.iconEdit,
                          height: Dimensions.amenityScreenListItemIconSize.h,
                          width: Dimensions.amenityScreenListItemIconSize.h,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blueColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.amenityScreenListItemIconBetweenSpace.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.amenityScreenListItemIconRadius.r,
                      ),
                    ),
                    height: Dimensions.amenityScreenListItemIconSize.h,
                    width: Dimensions.amenityScreenListItemIconSize.h,
                    child: InkWell(
                      onTap: onDelete,
                      borderRadius: BorderRadius.circular(
                        Dimensions.amenityScreenListItemIconRadius.r,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          Dimensions.amenityScreenListItemIconPadding.w,
                        ),
                        child: SvgPicture.asset(
                          Strings.iconDelete,
                          height: Dimensions.amenityScreenListItemIconSize.h,
                          width: Dimensions.amenityScreenListItemIconSize.h,
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
