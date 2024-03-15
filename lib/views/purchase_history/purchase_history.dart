import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:tuple/tuple.dart';

import './purchase_history_provider.dart';
import './widget/plan_history_widget.dart';
import '../../const/dimen_const.dart';
import '../../localdb/subscription/db_plan_history.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../../widgets/toolbar.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PurchaseHistoryProvider(),
      builder: (_, __) => _PurchaseHistoryBody(),
    );
  }
}

class _PurchaseHistoryBody extends StatefulWidget {
  const _PurchaseHistoryBody({Key? key}) : super(key: key);

  @override
  State<_PurchaseHistoryBody> createState() => _PurchaseHistoryBodyState();
}

class _PurchaseHistoryBodyState extends State<_PurchaseHistoryBody> {
  PurchaseHistoryProvider? provider;
  late AppLocalizations localizationsContext;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    if (provider == null) {
      provider = Provider.of<PurchaseHistoryProvider>(context, listen: false);
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          provider?.init();
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ToolBar(
              title: localizationsContext.titlePurchaseHistory,
            ),
            Expanded(
              child: Selector<PurchaseHistoryProvider,
                  Tuple2<List<DbPlanHistory>, List<DbPlanHistory>>>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => Tuple2(
                  state.activeList,
                  state.expiredList,
                ),
                builder: (context, tuple, child) {
                  if (tuple.item1.isNotEmpty || tuple.item2.isNotEmpty) {
                    final List<DbPlanHistory> stickyHeaderItemList = [];
                    if (tuple.item1.isNotEmpty) {
                      stickyHeaderItemList.add(tuple.item1[0]);
                    }
                    if (tuple.item2.isNotEmpty) {
                      stickyHeaderItemList.add(tuple.item2[0]);
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: stickyHeaderItemList.length,
                      itemBuilder: (context, index) {
                        return StickyHeader(
                          header: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenHorizontalMargin.w,
                              vertical:
                                  Dimensions.purchaseHistoryHeaderTextPadding.h,
                            ),
                            color: StaticFunctions.getColor(
                              context,
                              stickyHeaderItemList[index].isActive
                                  ? ColorEnum.stickyHeaderBlueBgColor
                                  : ColorEnum.whiteColor,
                            ),
                            child: Text(
                              stickyHeaderItemList[index].isActive
                                  ? localizationsContext.currentPlan
                                  : localizationsContext.previousPlan,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blackColor,
                                ),
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    Dimensions.purchaseHistoryHeaderTextSize.sp,
                              ),
                            ),
                          ),
                          content: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: stickyHeaderItemList[index].isActive
                                ? tuple.item1.length
                                : tuple.item2.length,
                            itemBuilder: (context, historyIndex) {
                              DbPlanHistory planHistory;
                              if (stickyHeaderItemList[index].isActive) {
                                planHistory = tuple.item1[historyIndex];
                              } else {
                                planHistory = tuple.item2[historyIndex];
                              }
                              return PlanHistoryWidget(
                                plan: planHistory,
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                  return EmptyView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
