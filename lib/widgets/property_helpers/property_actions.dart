import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import './property_action_utils.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../views/add_property/model/add_property_args.dart';
import '../../views/share/share_utils.dart';
import '../../views/view_all_property/model/extra_options_enum.dart';

class PropertyActions extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbProperty property;
  final bool isFromHome;
  final ColorEnum actionBgColor;
  final Function()? onMatchingClicked;
  final bool sharedByBrooonActions;

  const PropertyActions({
    Key? key,
    required this.localizationsContext,
    required this.property,
    this.isFromHome = false,
    this.onMatchingClicked,
    this.actionBgColor = ColorEnum.whiteColor,
    this.sharedByBrooonActions = false,
  }) : super(key: key);

  Widget _content(
    BuildContext context, {
    required ExtraOptions enumExtraOption,
    required String assetPath,
    required String text,
    bool isEnable = true,
    Function()? onClick,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.propertyItemCallShareViewRadius.r,
        ),
        border: Border.all(
          width: Dimensions.propertyItemBorderWidth.w,
          color: StaticFunctions.getColor(
            context,
            enumExtraOption == ExtraOptions.matchingCount &&
                    int.tryParse(text) != null &&
                    int.tryParse(text)! > AppConfig.minMatchCount
                ? ColorEnum.greenMatchingColor
                : ColorEnum.borderColorE0,
          ),
        ),
        color: enumExtraOption == ExtraOptions.matchingCount &&
                int.tryParse(text) != null &&
                int.tryParse(text)! > AppConfig.minMatchCount
            ? StaticFunctions.getColor(
                context,
                ColorEnum.greenColor,
              ).withOpacity(0.03)
            : StaticFunctions.getColor(
                context,
                actionBgColor,
              ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(
            Dimensions.propertyItemCallShareViewRadius.r,
          ),
          splashColor: StaticFunctions.getColor(
            context,
            ColorEnum.touchSplashColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.propertyItemCallShareViewContentPadding.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  assetPath,
                  height: Dimensions.propertyItemCallShareViewIconSize.w,
                  width: Dimensions.propertyItemCallShareViewIconSize.w,
                  color: StaticFunctions.getColor(
                    context,
                    isEnable
                        ? (enumExtraOption == ExtraOptions.matchingCount
                            ? ColorEnum.greenMatchingColor
                            : ColorEnum.themeColor)
                        : ColorEnum.gray99Color,
                  ),
                ),
                if (enumExtraOption == ExtraOptions.matchingCount)
                  SizedBox(
                    width:
                        Dimensions.propertyItemCallShareViewIconTextSpacing.w,
                  ),
                if (enumExtraOption == ExtraOptions.matchingCount)
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: isFromHome
                          ? Dimensions.homePropertyItemCallShareViewTextSize.sp
                          : Dimensions.propertyItemCallShareViewTextSize.sp,
                      fontWeight: FontWeight.w600,
                      color: StaticFunctions.getColor(
                        context,
                        isEnable
                            ? (enumExtraOption == ExtraOptions.matchingCount
                                ? ColorEnum.greenMatchingColor
                                : ColorEnum.blackColor)
                            : ColorEnum.gray99Color,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isCallEnabled = false;
    bool isVisitorEnabled = (property.visitorCount ?? 0) > 0;
    if (sharedByBrooonActions) {
      isCallEnabled = PropertyActionUtils.brooonContactInfoAvailable(property);
    } else {
      if (!PropertyActionUtils.isPropertyClosed(property)) {
        isCallEnabled = PropertyActionUtils.contactInfoAvailable(
          property,
        );
      }
    }
    bool isShareEnabled = !PropertyActionUtils.isPropertyClosed(property);
    bool isEditEnabled = CommonPropertyDataProvider.isPropertyEditAvailable(
      property,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!sharedByBrooonActions)
          Expanded(
            child: FutureBuilder<List<DbSavedFilter>>(
              future:
                  CommonPropertyDataProvider.getMatchingInquiriesFromProperty(
                      propertyInfo: property),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  property.lastMatchingInquiryCount =
                      snapshot.data?.length ?? 0;
                }
                return _content(
                  context,
                  enumExtraOption: ExtraOptions.matchingCount,
                  assetPath: Strings.iconMatch,
                  isEnable: (snapshot.data?.length ??
                          (property.lastMatchingInquiryCount ?? 0)) >
                      0,
                  text:
                      '${(snapshot.data?.length ?? (property.lastMatchingInquiryCount ?? 0))}',
                  onClick: () {
                    if ((snapshot.data?.length ??
                                (property.lastMatchingInquiryCount ?? 0)) >
                            0 &&
                        onMatchingClicked != null) {
                      onMatchingClicked!();
                    }
                    if ((snapshot.data?.length ??
                            (property.lastMatchingInquiryCount ?? 0)) >
                        0) {
                      PropertyActionUtils.openMatches(context, property);
                    }
                  },
                );
              },
            ),
          ),
        if (!sharedByBrooonActions)
          SizedBox(
            width: Dimensions.propertyItemCallShareViewItemSpacing.w,
          ),
        Expanded(
          child: _content(
            context,
            enumExtraOption: ExtraOptions.call,
            assetPath: Strings.iconCall,
            text: localizationsContext.call,
            isEnable: isCallEnabled,
            onClick: () {
              if (isCallEnabled) {
                if (sharedByBrooonActions) {
                  PropertyActionUtils.openDialerToMakeACallToBrooon(property);
                } else {
                  PropertyActionUtils.openDialerToMakeACall(property);
                }
              }
            },
          ),
        ),
        SizedBox(
          width: Dimensions.propertyItemCallShareViewItemSpacing.w,
        ),
        Expanded(
          child: _content(
            context,
            enumExtraOption: ExtraOptions.share,
            assetPath: Strings.iconShare,
            text: localizationsContext.share,
            isEnable: isShareEnabled,
            onClick: () {
              if (isShareEnabled) {
                ShareUtils.showPropertySharePicker(
                  context,
                  localizationsContext,
                  property,
                );
              }
            },
          ),
        ),
        if (!sharedByBrooonActions)
          SizedBox(
            width: Dimensions.propertyItemCallShareViewItemSpacing.w,
          ),
        if (!sharedByBrooonActions)
          Expanded(
            child: _content(
              context,
              enumExtraOption: ExtraOptions.edit,
              assetPath: Strings.iconActionEdit,
              text: localizationsContext.edit,
              isEnable: isEditEnabled,
              onClick: () {
                if (isEditEnabled) {
                  Navigator.pushNamed(
                    context,
                    Routes.addProperty,
                    arguments: AddPropertyArgs(
                      addPropertyEnums: AddPropertyEnums.edit,
                      propertyId: property.id,
                    ),
                  );
                }
              },
            ),
          ),
      ],
    );
  }
}
