import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './view_pager.dart';
import './walk_through_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../localdb/isar_service.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/screen_bg.dart';

class WalkThrough extends StatelessWidget {
  final IsarService _isarService = IsarService();

  WalkThrough({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    TextStyle lightTextStyle = TextStyle(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.blackColor,
      ),
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.walkthroughDescTextSize.sp,
    );
    TextStyle darkTextStyle = TextStyle(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.themeColor,
      ),
      fontWeight: FontWeight.w600,
      fontSize: Dimensions.headerTextSize.sp,
    );
    final Map<String, TextStyle> firstScreenData = {
      localizationsContext.walkThroughOneItem1: darkTextStyle,
      localizationsContext.walkThroughOneItem2: lightTextStyle,
    };
    final Map<String, TextStyle> secondScreenData = {
      localizationsContext.walkThroughTwoItem1: darkTextStyle,
      localizationsContext.walkThroughTwoItem2: lightTextStyle,
    };
    final Map<String, TextStyle> thirdScreenData = {
      localizationsContext.walkThroughThreeItem1: darkTextStyle,
      localizationsContext.walkThroughThreeItem2: lightTextStyle,
    };

    return Scaffold(
      appBar: ThemeConfig.appBar(
        context,
        statusBarColor: ColorEnum.whiteColor,
      ),
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(
          children: [
            const ScreenBg(),
            ViewPager(
              firstScreenData: firstScreenData,
              secondScreenData: secondScreenData,
              thirdScreenData: thirdScreenData,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.skipNextButtonMarginBottom.h,
                ),
                child: Selector<WalkThroughProvider, int>(
                  shouldRebuild: (prev, next) => true,
                  selector: (_, state) => state.currentPage,
                  builder: (context, pageNo, child) {
                    bool isItLast =
                        pageNo == (AppConfig.walkThroughScreensLength - 1);
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: Dimensions.screenHorizontalMargin.w,
                        ),
                        if (!isItLast)
                          Expanded(
                            child: ButtonWidget(
                              text: localizationsContext.walkThroughSkip,
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
                              onClick: () async {
                                final appSettings =
                                    await _isarService.getAppSettings();
                                if (appSettings != null) {
                                  appSettings.isWalkthroughSeen = true;
                                  await _isarService.updateAppSettings(
                                    appSettings,
                                  );
                                }
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.authenticationRoute,
                                );
                              },
                            ),
                          ),
                        if (!isItLast)
                          SizedBox(
                            width: Dimensions.screenHorizontalMargin.w,
                          ),
                        Expanded(
                          child: ButtonWidget(
                            text: !isItLast
                                ? localizationsContext.walkThroughNext
                                : localizationsContext.walkThroughGetStarted,
                            textColor: StaticFunctions.getColor(
                              context,
                              ColorEnum.whiteColor,
                            ),
                            bgColor: StaticFunctions.getColor(
                              context,
                              ColorEnum.themeColor,
                            ),
                            onClick: () async {
                              var nextPageAvailable =
                                  Provider.of<WalkThroughProvider>(context,
                                          listen: false)
                                      .nextPageClick();
                              if (!nextPageAvailable) {
                                final appSettings =
                                    await _isarService.getAppSettings();
                                if (appSettings != null) {
                                  appSettings.isWalkthroughSeen = true;
                                  await _isarService.updateAppSettings(
                                    appSettings,
                                  );
                                }
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.authenticationRoute,
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.screenHorizontalMargin.w,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
