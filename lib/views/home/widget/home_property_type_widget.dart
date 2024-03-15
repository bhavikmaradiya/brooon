import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_property_type.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../home_provider.dart';

class PropertyTypeItem extends StatefulWidget {
  final AppLocalizations localizationsContext;
  final DbPropertyType propertyType;
  final Color? touchSplashColor;
  final Function(DbPropertyType) onSelect;
  final bool shouldShowChecked;
  final bool countForInquiry;
  final HomeProvider homeScreenProvider;

  PropertyTypeItem({
    required this.localizationsContext,
    required this.propertyType,
    required this.onSelect,
    this.countForInquiry = false,
    required this.homeScreenProvider,
    this.shouldShowChecked = true,
    this.touchSplashColor = null,
  }) : super();

  @override
  State<PropertyTypeItem> createState() => _PropertyTypeItemState();
}

class _PropertyTypeItemState extends State<PropertyTypeItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double totalWidthOfBox = constraint.constrainWidth();
        double totalHeightOfBox = constraint.constrainHeight();
        double iconSize = (totalHeightOfBox * 0.32).h;
        double spacingInBetweenTextIcon = (totalHeightOfBox * 0.1).h;
        double spacingInBetweenTextCount = (totalHeightOfBox * 0.03).h;
        double textHorizontalSpacing = (totalWidthOfBox * 0.02).w;
        double fontSize = (totalHeightOfBox * 0.15).sp;
        double boxRadius = Dimensions.borderRadius.r;
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColorOpacity3Percentage,
                  ),
                  borderRadius: BorderRadius.circular(boxRadius),
                  border: Border.all(
                    width: Dimensions.homeScreenPropertyTypeBoxBorderWidth.w,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.borderColorE0,
                    ),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: widget.touchSplashColor ??
                        StaticFunctions.getColor(
                          context,
                          ColorEnum.touchSplashColor,
                        ),
                    borderRadius: BorderRadius.circular(boxRadius),
                    onTap: () => widget.onSelect(widget.propertyType),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            widget.propertyType.assetPath,
                            color: StaticFunctions.getColor(
                              context,
                              (widget.countForInquiry
                                      ? widget.propertyType.lastInquiryCount !=
                                              null &&
                                          widget.propertyType
                                                  .lastInquiryCount! >
                                              0
                                      : widget.propertyType.lastPropertyCount !=
                                              null &&
                                          widget.propertyType
                                                  .lastPropertyCount! >
                                              0)
                                  ? ColorEnum.themeColor
                                  : ColorEnum.blackColor,
                            ),
                            width: iconSize,
                            height: iconSize,
                          ),
                          SizedBox(
                            height: spacingInBetweenTextIcon,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: textHorizontalSpacing,
                            ),
                            child: FutureBuilder<MapEntry<int, int>>(
                              future: widget.countForInquiry
                                  ? widget.homeScreenProvider
                                      .getInquiryCountWithPropertyByType(
                                          widget.propertyType.id)
                                  : widget.homeScreenProvider
                                      .getPropertyCountWithInquiryByType(
                                          widget.propertyType.id),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  WidgetsBinding.instance.addPostFrameCallback(
                                    (timeStamp) {
                                      if (mounted) {
                                        setState(() {
                                          if (!widget.countForInquiry) {
                                            widget.propertyType
                                                    .lastPropertyCount =
                                                snapshot.data?.key;
                                          } else {
                                            widget.propertyType
                                                    .lastInquiryCount =
                                                snapshot.data?.key;
                                          }
                                        });
                                      }
                                    },
                                  );
                                  return _propertyCountWidget(
                                    context,
                                    data: snapshot.data,
                                    fontSize: fontSize,
                                    spacingInBetweenTextCount:
                                        spacingInBetweenTextCount,
                                  );
                                } else {
                                  MapEntry<int, int> countFromCache = widget
                                          .countForInquiry
                                      ? widget.homeScreenProvider
                                          .getInquiryCountWithPropertyByTypeBeforeFuture(
                                              widget.propertyType.id)
                                      : widget.homeScreenProvider
                                          .getPropertyCountWithInquiryByTypeBeforeFuture(
                                              widget.propertyType.id);
                                  return _propertyCountWidget(
                                    context,
                                    data: countFromCache,
                                    fontSize: fontSize,
                                    spacingInBetweenTextCount:
                                        spacingInBetweenTextCount,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _propertyCountWidget(
    BuildContext context, {
    required MapEntry<int, int>? data,
    required double fontSize,
    required double spacingInBetweenTextCount,
  }) {
    final propertyTypeCountTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      color: StaticFunctions.getColor(
        context,
        ColorEnum.blackColor,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.propertyType.name,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: propertyTypeCountTextStyle.copyWith(
            fontSize: fontSize,
          ),
        ),
        SizedBox(
          height: spacingInBetweenTextCount,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${data?.key ?? 0}',
              textAlign: TextAlign.center,
              style: propertyTypeCountTextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (AppConfig.shouldShowMatchingWithDashboardCount)
              Text(
                ' / ',
                style: propertyTypeCountTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                ),
              ),
            if (AppConfig.shouldShowMatchingWithDashboardCount)
              Text(
                '${data?.value ?? 0}',
                textAlign: TextAlign.center,
                style: propertyTypeCountTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: StaticFunctions.getColor(
                    context,
                    (data?.value ?? 0) > 0
                        ? ColorEnum.greenMatchingColor
                        : ColorEnum.blackColor,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
