
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './items.dart';
import '../../const/dimen_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../views/walk_through/walk_through_provider.dart';
import '../../widgets/indicator/smooth_page_indicator.dart';
import '../../widgets/indicator/expanding_dots_effect.dart';

class ViewPager extends StatelessWidget {
  final Map<String, TextStyle> firstScreenData;
  final Map<String, TextStyle> secondScreenData;
  final Map<String, TextStyle> thirdScreenData;

  const ViewPager({
    Key? key,
    required this.firstScreenData,
    required this.secondScreenData,
    required this.thirdScreenData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalkThroughProvider>(context, listen: false);
    return Stack(
      children: [
        PageView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return WalkThroughItems(itemData: firstScreenData);
            } else if (index == 1) {
              return WalkThroughItems(itemData: secondScreenData);
            } else {
              return WalkThroughItems(itemData: thirdScreenData);
            }
          },
          itemCount: AppConfig.walkThroughScreensLength,
          controller: provider.controller,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) => {provider.setCurrentPage = index},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: Dimensions.indicatorMarginBottom.h),
            child: Selector<WalkThroughProvider, int>(
              selector: (_, state) => state.currentPage,
              builder: (context, state, child) => SmoothPageIndicator(
                controller: provider.controller, // PageController
                count: AppConfig.walkThroughScreensLength,
                effect: ExpandingDotsEffect(
                  activeDotColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.blueColor,
                  ),
                  dotColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.borderColorE0,
                  ),
                  dotWidth: Dimensions.indicatorSize.w,
                  dotHeight: Dimensions.indicatorSize.w,
                  spacing: Dimensions.indicatorMargins.w,
                  expansionFactor: 8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
