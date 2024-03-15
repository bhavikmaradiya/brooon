import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './light_divider.dart';
import '../const/dimen_const.dart';
import '../const/string_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class SuggestionItemWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showDivider;

  const SuggestionItemWidget({
    Key? key,
    required this.title,
    this.subtitle,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.screenHorizontalMargin.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.customerSuggestionsVerticalPadding.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: Strings.poppinsFonts,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                    fontSize: Dimensions.customerSuggestionsTextSize.sp,
                  ),
                ),
                if (subtitle != null && subtitle!.trim().isNotEmpty)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: Strings.poppinsFonts,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                      fontSize: Dimensions.customerSuggestionsTextSize.sp,
                    ),
                  ),
              ],
            ),
          ),
          if (showDivider) LightDivider()
        ],
      ),
    );
  }
}
