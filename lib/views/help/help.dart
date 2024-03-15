import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/help/help_provider.dart';
import '../../views/help/widget/help_item_widget.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/toolbar.dart';

class Help extends StatelessWidget {
  Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return ChangeNotifierProvider(
      create: (_) => HelpProvider(),
      builder: (context, child) {
        HelpProvider provider =
            Provider.of<HelpProvider>(context, listen: false);
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            provider.initializeOptions(context);
          },
        );
        return Scaffold(
          appBar: ThemeConfig.appBar(context),
          body: SafeArea(
            child: Column(
              children: [
                ToolBar(
                  enableBackground: true,
                  title: localizationsContext.help,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.screenHorizontalMargin.w,
                      right: Dimensions.screenHorizontalMargin.w,
                      bottom: Dimensions.screenVerticalMarginBottom.h,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Selector<HelpProvider, List<String>>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) => state.helpOptionsList,
                            builder: (context, optionsList, child) {
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: optionsList.length,
                                itemBuilder: (context, index) {
                                  // ToDo: terms and condition is hide for now.
                                  if (optionsList[index] ==
                                      localizationsContext
                                          .helpOptionTermsCondition) {
                                    return const SizedBox();
                                  }
                                  return HelpItemWidget(
                                    currentOption: optionsList[index],
                                    onClick: (selectedOption) =>
                                        provider.onClick(
                                      context,
                                      optionsList[index],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        LightDivider(),
                        SizedBox(
                          height: Dimensions.helpOptionsBottomTitleMarginTop.h,
                        ),
                        Text(
                          localizationsContext.helpFollowUs,
                          style: TextStyle(
                            fontSize:
                                Dimensions.helpOptionsBottomTitleFontSize.sp,
                            fontWeight: FontWeight.w400,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: Dimensions
                                .helpOptionsBottomIconsOuterVerticalMargin.h,
                          ),
                          child: Selector<HelpProvider, List<String>>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) => state.bottomOptionIconList,
                            builder: (context, options, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    List.generate(options.length, (index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: Dimensions
                                          .helpOptionsBottomIconBetweenSpacing
                                          .w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.blueColorOpacity2Percentage,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        Dimensions
                                            .helpOptionsBottomIconBorderRadius
                                            .r,
                                      ),
                                      border: Border.all(
                                        color: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.borderColorE0,
                                        ),
                                        width: Dimensions
                                            .helpOptionsBottomIconBorderWidth.w,
                                      ),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () => provider.onClick(
                                            context, options[index]),
                                        borderRadius: BorderRadius.circular(
                                          Dimensions
                                              .helpOptionsBottomIconBorderRadius
                                              .r,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            Dimensions
                                                .helpOptionsBottomIconsInnerPadding
                                                .r,
                                          ),
                                          child: SvgPicture.asset(
                                            options[index],
                                            width: Dimensions
                                                .helpOptionsBottomIconSize.w,
                                            height: Dimensions
                                                .helpOptionsBottomIconSize.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
