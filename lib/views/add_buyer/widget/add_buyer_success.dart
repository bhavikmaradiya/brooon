import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/routes.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_saved_filter.dart';
import '../../../utils/enums.dart';
import '../../../utils/full_screen_progress.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/button_widget.dart';
import '../../buyers_sellers/model/buyer_seller_enum.dart';
import '../../buyers_sellers/model/buyer_seller_info.dart';
import '../../filter/filter_provider.dart';
import '../../view_all_property/model/view_all_screen_arg.dart';

class AddBuyerSuccess extends StatefulWidget {
  const AddBuyerSuccess({Key? key}) : super(key: key);

  @override
  State<AddBuyerSuccess> createState() => _AddBuyerSuccessState();
}

class _AddBuyerSuccessState extends State<AddBuyerSuccess> {
  int _matchingPropertiesCount = 0;
  late DbSavedFilter savedInquiry;
  late bool isEdit;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    isEdit = args['isEdit'] as bool;
    savedInquiry = args['inquiry'] as DbSavedFilter;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        if (mounted) {
          FullScreenProgress.showFullScreenProgress(context, true);
          _matchingPropertiesCount =
              await FilterProvider.getPropertiesCountOfFilter(
            type: ViewAllFromType.buyers,
            filter: savedInquiry,
            excludeUnmatched: true,
          );
          if (mounted) {
            FullScreenProgress.showFullScreenProgress(context, false);
            setState(() {});
          }
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    FullScreenProgress.showFullScreenProgress(context, false);
    super.dispose();
  }

  _popScreenUntilHome() {
    Navigator.popUntil(
      context,
      (route) {
        return route.settings.name == Routes.home;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizationContext = AppLocalizations.of(context)!;
    final bgOpacityColor = StaticFunctions.getColor(
      context,
      ColorEnum.darkBgOpacityColor,
    );
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.successScreenCloud1MarginTop.h,
              right: -(Dimensions.screenHorizontalMargin.w),
              child: SvgPicture.asset(
                Strings.screenBgRightCloud,
                width: Dimensions.successScreenCloud1Width.w,
                height: Dimensions.successScreenCloud1Height.h,
                color: bgOpacityColor,
              ),
            ),
            Positioned(
              top: Dimensions.successScreenCloud2MarginTop.h,
              left: Dimensions.successScreenCloud2MarginLeft.w,
              child: SvgPicture.asset(
                Strings.splashBg1,
                width: Dimensions.successScreenCloud2Width.w,
                height: Dimensions.successScreenCloud2Height.h,
                color: bgOpacityColor,
              ),
            ),
            Positioned(
              top: Dimensions.successScreenCloud3MarginTop.h,
              right: -(Dimensions.screenHorizontalMargin.w),
              child: SvgPicture.asset(
                Strings.splashBg3,
                width: Dimensions.successScreenCloud3Width.w,
                height: Dimensions.successScreenCloud3Height.h,
                color: bgOpacityColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.successScreenBuildingMarginBottom.h,
                ),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.splashBuildingHeight.h,
                child: Image(
                  image: AssetImage(
                    Strings.splashBuilding,
                  ),
                  color: bgOpacityColor.withOpacity(0.3),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Dimensions.successScreenIconContainerSize.w,
                    height: Dimensions.successScreenIconContainerSize.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blueColorOpacity5Percentage,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: Dimensions.successScreenIconPadding25.w,
                      right: Dimensions.successScreenIconPadding25.w,
                      top: Dimensions.successScreenIconPadding25.w,
                      bottom: Dimensions.successScreenIconPadding27.w,
                    ),
                    child: SvgPicture.asset(
                      Strings.iconDrawerInquiries,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blueColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.successScreenContentSpacing.h,
                  ),
                  Text(
                    isEdit
                        ? localizationContext.buyerUpdatedSuccess
                        : localizationContext.buyerAddedSuccess,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.successScreenMessageTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  /*Text(
                    localizationContext
                        .propertiesFound(_matchingPropertiesCount),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Dimensions.successScreenSubTitleTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColor,
                      ),
                    ),
                  ),*/
                  SizedBox(
                    height: Dimensions.successScreenMessageMarginBottom.h,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: Dimensions.successScreenButtonMarginBottom.h,
              left: Dimensions.screenHorizontalMargin.w,
              right: Dimensions.screenHorizontalMargin.w,
              child: Column(
                children: [
                  if (_matchingPropertiesCount > 0)
                    ButtonWidget(
                      text: localizationContext.propertiesFound(
                        _matchingPropertiesCount,
                      ),
                      textColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColor,
                      ),
                      bgColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColorOpacity3Percentage,
                      ),
                      borderColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.borderColorE0,
                      ),
                      fontWeight: FontWeight.w700,
                      onClick: () {
                        _popScreenUntilHome();
                        Navigator.pushNamed(
                          context,
                          Routes.viewAllProperties,
                          arguments: ViewAllScreenArg(
                            heading: localizationContext
                                .viewAllBuyerMatchingProperties(
                              savedInquiry.buyerName,
                            ),
                            count: 0,
                            showDataFor: ViewAllFromType.buyers,
                            buyerSellerInfo: BuyerSellerInfo(
                              propertyId: null,
                              name: savedInquiry.buyerName,
                              phone: savedInquiry.mobileNo,
                              buyerSellerType: BuyerSellerType.buyers,
                              showDataFor: BuyerSellerViewType.properties,
                              inquiries: [savedInquiry],
                            ),
                            viewAllFromToHandleTabs: ViewAllTabsVisibilityType
                                .fromBuyersMatchingProperties,
                            isNeedToCallApiForMatchingBrooonItems: true,
                          ),
                        );
                      },
                    ),
                  SizedBox(
                    height: Dimensions.successScreenContentSpacing.h,
                  ),
                  ButtonWidget(
                    text: localizationContext.goToDashboard,
                    textColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.whiteColor,
                    ),
                    bgColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColor,
                    ),
                    borderColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColor,
                    ),
                    fontWeight: FontWeight.w700,
                    onClick: () {
                      _popScreenUntilHome();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
