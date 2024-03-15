import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './model/other_misc_model.dart';
import './other_misc_items_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/toolbar.dart';

class OtherMiscItems extends StatelessWidget {
  const OtherMiscItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OtherMiscItemsProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  OtherMiscItemsProvider? provider;

  late AppLocalizations localizationsContext;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (provider == null) {
          provider = Provider.of<OtherMiscItemsProvider>(
            context,
            listen: false,
          );
          provider?.init(localizationsContext);
        }
      },
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              enableBackground: true,
              title: localizationsContext.drawerItemOther,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.screenHorizontalMargin.w,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Selector<OtherMiscItemsProvider, List<MiscItem>>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => state.drawerOtherList,
                    builder: (context, drawerOtherList, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: drawerOtherList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: (Dimensions
                                      .drawerOtherListItemBetweenSpace.h /
                                  2),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions
                                        .drawerOtherListItemBorderRadius.r,
                                  ),
                                  onTap: () => provider?.onDrawerItemSelected(
                                    context,
                                    drawerOtherList[index].title,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Dimensions
                                          .drawerOtherListItemVerticalPadding.h,
                                      horizontal: Dimensions
                                          .drawerOtherListItemHorizontalPadding
                                          .w,
                                    ),
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.blueColorOpacity2Percentage,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        Dimensions
                                            .drawerOtherListItemBorderRadius.r,
                                      ),
                                      border: Border.all(
                                        width: Dimensions
                                            .drawerOtherListItemBorderWidth.w,
                                        color: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.borderColorE0,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          drawerOtherList[index].icon,
                                          height: drawerOtherList[index].id ==
                                                  OtherMiscItemsProvider
                                                      .closeDealId
                                              ? Dimensions
                                                  .drawerOtherListItemCloseDealIconSize
                                                  .w
                                              : Dimensions
                                                  .drawerOtherListItemIconSize
                                                  .w,
                                          width: drawerOtherList[index].id ==
                                                  OtherMiscItemsProvider
                                                      .closeDealId
                                              ? Dimensions
                                                  .drawerOtherListItemCloseDealIconSize
                                                  .w
                                              : Dimensions
                                                  .drawerOtherListItemIconSize
                                                  .w,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.themeColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions
                                              .drawerOtherListItemBetweenSpacing
                                              .w,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            drawerOtherList[index].title,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: Dimensions
                                                  .drawerOtherListItemFontSize
                                                  .sp,
                                              fontWeight: FontWeight.w500,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.blackColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions
                                              .drawerOtherListItemBetweenSpacing
                                              .w,
                                        ),
                                        SvgPicture.asset(
                                          Strings.iconRightArrow,
                                          height: Dimensions
                                              .drawerOtherListItemArrowSize.h,
                                          width: Dimensions
                                              .drawerOtherListItemArrowSize.w,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.gray90Color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
