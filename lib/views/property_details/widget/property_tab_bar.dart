import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/dimen_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/custom_tab_indicator.dart';

class PropertyTabBar extends StatelessWidget {
  final AppLocalizations? localizationsContext;
  final TabController? tabController;

  const PropertyTabBar({
    Key? key,
    required this.localizationsContext,
    required this.tabController,
  }) : super(key: key);

  Widget _tabBarWidget(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: Dimensions.propertyDetailTabTextSize.sp,
    );
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.shadowColor,
            ),
            blurRadius: Dimensions.tabMenuShapeRadius.r,
          ),
        ],
      ),
      child: Material(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
        child: TabBar(
          controller: tabController,
          tabs: [
            Container(
              height: Dimensions.propertyDetailTabContainerSize.h,
              alignment: Alignment.center,
              child: Text(
                localizationsContext!.propertyDetailsTabPropertyDetail,
                style: textStyle,
              ),
            ),
            Container(
              height: Dimensions.propertyDetailTabContainerSize.h,
              alignment: Alignment.center,
              child: Text(
                localizationsContext!.propertyDetailsTabOwnerDetail,
                style: textStyle,
              ),
            ),
            Container(
              height: Dimensions.propertyDetailTabContainerSize.h,
              alignment: Alignment.center,
              child: Text(
                localizationsContext!.propertyDetailsTabPricing,
                style: textStyle,
              ),
            ),
          ],
          labelColor: StaticFunctions.getColor(
            context,
            ColorEnum.themeColor,
          ),
          unselectedLabelColor: StaticFunctions.getColor(
            context,
            ColorEnum.gray90Color,
          ),
          labelPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.propertyDetailTabLabelHorizontalPadding.w,
          ),
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: MD2Indicator(
            indicatorSize: MD2IndicatorSize.full,
            indicatorHeight: 3,
            indicatorColor: StaticFunctions.getColor(
              context,
              ColorEnum.themeColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _tabBarWidget(context);
  }
}
