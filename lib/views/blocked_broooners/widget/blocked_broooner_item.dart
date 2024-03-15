import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_blocked_broooner.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/image_loader.dart';

class BlockedBrooonerItem extends StatelessWidget {
  final DbBlockedBroooner blockedBroooner;
  final AppLocalizations localizationsContext;
  final Function(DbBlockedBroooner) onTapUnblock;

  const BlockedBrooonerItem({
    Key? key,
    required this.blockedBroooner,
    required this.localizationsContext,
    required this.onTapUnblock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.blockedBrooonerItemBetweenSpacing.h / 2,
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.blockedBrooonerItemBorderRadius.sp,
        ),
        border: Border.all(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
          width: Dimensions.blockedBrooonerItemBorderWidth.w,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.blockedBrooonerItemHorizontalPadding.w,
        vertical: Dimensions.blockedBrooonerItemVerticalPadding.h,
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.blockedBrooonerItemProfileSize.w,
            height: Dimensions.blockedBrooonerItemProfileSize.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.borderColorE0,
                ),
                width: Dimensions.blockedBrooonerItemBorderWidth.w,
              ),
              color: StaticFunctions.getColor(
                context,
                ColorEnum.whiteColor,
              ),
            ),
            child: (blockedBroooner.brooonPhoto ?? '').trim().isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Dimensions.blockedBrooonerItemProfileSize.r,
                      ),
                    ), //
                    child: ImageLoader(
                      image: StaticFunctions.profilePictureServerFullPath(
                              blockedBroooner.brooonPhoto) ??
                          '',
                      isUserPlaceHolder: true,
                    ),
                  )
                : Center(
                    child: Text(
                      (blockedBroooner.brooonName ??
                              localizationsContext.appName)
                          .getInitials(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blueColor,
                        ),
                        fontSize:
                            Dimensions.blockedBrooonerItemInitialTextSpacing.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),
          SizedBox(
            width: Dimensions.blockedBrooonerItemProfileTextSpacing.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (blockedBroooner.brooonName != null &&
                          blockedBroooner.brooonName!.trim().isNotEmpty)
                      ? blockedBroooner.brooonName!
                      : localizationsContext.appName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.blockedBrooonerItemNameTextSize.sp,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                if (blockedBroooner.brooonPhone != null &&
                    blockedBroooner.brooonPhone!.isNotEmpty)
                  SizedBox(
                    height: Dimensions.blockedBrooonerItemNamePhoneSpacing.h,
                  ),
                if (blockedBroooner.brooonPhone != null &&
                    blockedBroooner.brooonPhone!.isNotEmpty)
                  Text(
                    blockedBroooner.brooonPhone!,
                    style: TextStyle(
                      fontSize: Dimensions.blockedBrooonerItemPhoneTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: StaticFunctions.getColor(
                context,
                ColorEnum.whiteColor,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.blockedBrooonerItemBorderRadius.sp,
              ),
              border: Border.all(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.borderColorE0,
                ),
                width: Dimensions.blockedBrooonerItemBorderWidth.w,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  Dimensions.blockedBrooonerItemBorderRadius.sp,
                ),
                onTap: () => onTapUnblock(blockedBroooner),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions
                        .blockedBrooonerItemUnblockTextVerticalPadding.h,
                    horizontal: Dimensions
                        .blockedBrooonerItemUnblockTextHorizontalPadding.w,
                  ),
                  child: Text(
                    localizationsContext.unblock,
                    style: TextStyle(
                      fontSize:
                          Dimensions.blockedBrooonerItemUnblockTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
