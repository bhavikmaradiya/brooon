import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../model/location_content.dart';

class LocationDetailContent extends StatelessWidget {
  final LocationContent locationContent;
  final bool textSpanRequired;

  const LocationDetailContent({
    Key? key,
    required this.locationContent,
    this.textSpanRequired = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.gray90Color,
      ),
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.currentLocationAddressTextSize.sp,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Strings.iconLocation,
              height: Dimensions.currentLocationMapIconHeight.h,
              width: Dimensions.currentLocationMapIconWidth.w,
              color: StaticFunctions.getColor(
                context,
                ColorEnum.blueColor,
              ),
            ),
            SizedBox(
              width: Dimensions.currentLocationMapIconAreaTextSpacing.w,
            ),
            Expanded(
              child: Text(
                locationContent.landMark,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.currentLocationLandmarkTextSize.sp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.currentLocationLandmarkAreaTextSpacing.h,
        ),
        if (textSpanRequired)
          LayoutBuilder(
            builder: (context, constraints) {
              final span = TextSpan(
                style: textStyle,
              );
              final textPainter = TextPainter(
                text: span,
                textDirection: TextDirection.ltr,
                maxLines: 3,
              );
              textPainter.layout(
                maxWidth: constraints.maxWidth,
                minWidth: 0,
              );
              return SizedBox(
                height: textPainter.preferredLineHeight * 3.5,
                child: Text(
                  locationContent.address,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: span.style,
                ),
              );
            },
          ),
        if (!textSpanRequired)
          SizedBox(
            child: Text(
              locationContent.address,
              textAlign: TextAlign.start,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ),
      ],
    );
  }
}
