import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/string_const.dart';
import '../../const/dimen_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../views/shared_by_brooon/brooon_association_item.dart';
import '../../views/shared_by_brooon/brooon_profile_pic.dart';
import '../light_divider.dart';

class PropertyBrooonInfo extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbProperty property;

  const PropertyBrooonInfo({
    Key? key,
    required this.localizationsContext,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAssociateDetailsAvailable = (property.associationPhoto != null &&
            property.associationPhoto!.trim().isNotEmpty) ||
        (property.associationCode != null &&
            property.associationCode!.trim().isNotEmpty);
    return Column(
      children: [
        SizedBox(
          height: Dimensions.propertyItemBrooonInfoSpacing.h,
        ),
        LightDivider(),
        SizedBox(
          height: Dimensions.propertyItemBrooonInfoSpacing.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.homePropertyItemPadding.w,
          ),
          child: Row(
            children: [
              BrooonProfilePic(
                localizationsContext: localizationsContext,
                brooonName: property.brooonName,
                brooonProfilePic: StaticFunctions.profilePictureServerFullPath(
                      property.brooonPhoto,
                    ) ??
                    '',
              ),
              SizedBox(
                width: Dimensions.propertyItemBrooonProfileTextSpacing.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (property.brooonName != null &&
                              property.brooonName!.isNotEmpty)
                          ? property.brooonName!
                          : localizationsContext.appName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.propertyItemBrooonNameTextSize.sp,
                        color: StaticFunctions.getColor(
                          context,
                          property.propertyStatusId ==
                                  SaveDefaultData.activeStatusId
                              ? ColorEnum.blackColor
                              : ColorEnum.gray90Color,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    if (property.brooonPhone != null &&
                        property.brooonPhone!.isNotEmpty)
                      SizedBox(
                        height: Dimensions.propertyItemBrooonNamePhoneSpacing.h,
                      ),
                    if (property.brooonPhone != null &&
                        property.brooonPhone!.isNotEmpty)
                      Text(
                        property.brooonPhone!,
                        style: TextStyle(
                          fontSize:
                              Dimensions.propertyItemBrooonPhoneTextSize.sp,
                          color: StaticFunctions.getColor(
                            context,
                            property.propertyStatusId ==
                                    SaveDefaultData.activeStatusId
                                ? ColorEnum.blackColor
                                : ColorEnum.gray90Color,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                  ],
                ),
              ),
              if (property.brooonPhone != null &&
                  property.brooonPhone!.isNotEmpty)
                Container(
                  width: Dimensions.propertyItemBrooonPhoneSize.w,
                  height: Dimensions.propertyItemBrooonPhoneSize.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.propertyItemBrooonPhoneContainerRadius.r,
                    ),
                    border: Border.all(
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.borderColorE0,
                      ),
                      width: Dimensions.propertyItemBorderWidth.w,
                    ),
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.whiteColor,
                    ),
                  ),
                  padding: EdgeInsets.all(
                    Dimensions.propertyItemBorderWidth.w,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.touchSplashColor,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimensions.customerOwnerListItemRadius.r,
                      ),
                      onTap: () {
                        StaticFunctions.openDialer(property.brooonPhone!);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(
                          (Dimensions.propertyItemBrooonPhoneSize / 4).w,
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
        SizedBox(
          height: Dimensions.propertyItemBrooonInfoSpacing.h,
        ),
        if (isAssociateDetailsAvailable)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.propertyItemBrooonInfoSpacing.w,
            ),
            child: BrooonAssociationItem(
              brooonAssociationPic: property.associationPhoto,
              brooonAssociationName: property.associationCode,
              iconSize: Dimensions.viewAllPropertyItemAssociateIconSize.h,
              textSize: Dimensions.viewAllPropertyItemAssociateTextSize.sp,
              textIconBetweenSpace:
                  Dimensions.viewAllPropertyItemAssociateTextIconBetweenSpace.w,
            ),
          ),
        if (!isAssociateDetailsAvailable)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.propertyItemBrooonInfoSpacing.w,
            ),
            child: SizedBox(
              height: Dimensions.viewAllPropertyItemAssociateIconSize.h,
            ),
          ),
        SizedBox(
          height: Dimensions.propertyItemBrooonInfoBottomSpacing.h,
        ),
      ],
    );
  }
}
