import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';

class WalkThroughItems extends StatelessWidget {
  final Map<String, TextStyle> itemData;

  const WalkThroughItems({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keys = itemData.keys;
    final values = itemData.values;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.screenHorizontalMargin.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: Dimensions.appLogoHeight.h,
            margin: EdgeInsets.only(
              top: Dimensions.logoMarginTop.h,
            ),
            child: SvgPicture.asset(
              Strings.appLogo,
              width: Dimensions.appLogoWidth.w,
            ),
          ),
          SizedBox(
            height: Dimensions.marginBetweenLogoText.h,
          ),
          Column(
            children: [
              Text(
                keys.elementAt(0),
                textAlign: TextAlign.center,
                style: values.elementAt(0),
              ),
              Text(
                keys.elementAt(1),
                textAlign: TextAlign.center,
                style: values.elementAt(1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
