import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './brooon_association_item.dart';
import './brooon_profile_pic.dart';
import '../../const/dimen_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/property_helpers/property_actions.dart';
import '../../widgets/property_helpers/property_content.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class PropertyFromNetworkItem extends StatelessWidget {
  final ViewAllFromType fromType;
  final AppLocalizations localizationsContext;
  final DbProperty property;
  final Function(DbProperty) onSelect;
  final int currentListIndex;

  const PropertyFromNetworkItem({
    Key? key,
    required this.fromType,
    required this.localizationsContext,
    required this.property,
    required this.onSelect,
    required this.currentListIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyItemsPreviewContentsStyle = TextStyle(
      fontSize: Dimensions.propertyItemPropertyContentTextSize10Px.sp,
      fontWeight: FontWeight.w600,
      color: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
    );
    final isAssociateDetailsAvailable = (property.associationPhoto != null &&
            property.associationPhoto!.trim().isNotEmpty) ||
        (property.associationCode != null &&
            property.associationCode!.trim().isNotEmpty);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: (currentListIndex == 0 &&
                fromType == ViewAllFromType.brooonProperties)
            ? 0
            : Dimensions.viewAllPropertyItemVerticalMargins.h,
      ),
      padding: EdgeInsets.all(
        Dimensions.propertyItemBorderWidth.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: Dimensions.propertyItemBorderWidth.w,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.propertyItemBorderRadius.r,
        ),
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity3Percentage,
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
            Dimensions.propertyItemBorderRadius.r,
          ),
          onTap: () => onSelect(property),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.propertyItemBrooonInfoSpacing.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (AppConfig.enableBrooonItemsImagePreview)
                    Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.viewAllPropertyItemContentPaddings.w,
                      ),
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    Dimensions.viewAllPropertyItemImageSize.w,
                                height:
                                    Dimensions.viewAllPropertyItemImageSize.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Dimensions.propertyItemBorderRadius.r,
                                    ),
                                  ),
                                  border: Border.all(
                                    width: Dimensions.imageOutlineBorderWidth.w,
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.borderColorE0,
                                    ),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Dimensions.propertyItemBorderRadius.r,
                                    ),
                                  ), //
                                  child: ImageLoader(
                                    image: '',
                                    propertyTypeId: property.propertyTypeId,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: Dimensions
                                      .homePropertyItemImageShadowHeight.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.black.withOpacity(0),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        Dimensions.propertyItemBorderRadius.r,
                                      ),
                                      bottomRight: Radius.circular(
                                        Dimensions.propertyItemBorderRadius.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right:
                                    Dimensions.viewAllBrooonProfilePicMargin.w,
                                top: Dimensions.viewAllBrooonProfilePicMargin.w,
                                child: BrooonProfilePic(
                                  localizationsContext: localizationsContext,
                                  brooonName: property.brooonName,
                                  brooonProfilePic: StaticFunctions
                                          .profilePictureServerFullPath(
                                        property.brooonPhoto,
                                      ) ??
                                      '',
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Padding(
                              padding: EdgeInsets.all(
                                Dimensions.propertyItemPreviewContentsSpacing.h,
                              ),
                              child: Text(
                                localizationsContext.propertyAddedAt(
                                    '${StaticFunctions.changeDateFormat(
                                  property.addedAt,
                                  AppConfig.propertyAddedAtDateFormat,
                                )}'),
                                style:
                                    propertyItemsPreviewContentsStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: Dimensions
                                      .propertyItemPropertyContentTextSize9Px
                                      .sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: PropertyContent(
                      localizationsContext: localizationsContext,
                      sharedByBrooon: true,
                      property: property,
                      showBrooonNameInContent: true,
                    ),
                  ),
                ],
              ),
              if (isAssociateDetailsAvailable)
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
                    textSize:
                        Dimensions.viewAllPropertyItemAssociateTextSize.sp,
                    textIconBetweenSpace: Dimensions
                        .viewAllPropertyItemAssociateTextIconBetweenSpace.w,
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.propertyItemBrooonInfoSpacing.w,
                  right: Dimensions.propertyItemBrooonInfoSpacing.w,
                  top: Dimensions.propertyItemBrooonInfoSpacing.w,
                  bottom: Dimensions.propertyItemBrooonInfoSpacing.w,
                ),
                child: PropertyActions(
                  localizationsContext: localizationsContext,
                  property: property,
                  isFromHome: false,
                  actionBgColor: ColorEnum.whiteColor,
                  sharedByBrooonActions: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
