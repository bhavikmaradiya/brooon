import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './blocked_broooners_provider.dart';
import './widget/blocked_broooner_item.dart';
import './widget/blocked_broooner_shimmer_item.dart';
import '../../const/dimen_const.dart';
import '../../localdb/properties/db_blocked_broooner.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../../widgets/toolbar.dart';

class BlockedBroooners extends StatelessWidget {
  const BlockedBroooners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlockedBrooonersProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late ScrollController _scrollController;
  AppLocalizations? _localizationsContext;
  BlockedBrooonersProvider? _blockedBrooonersProvider;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          _blockedBrooonersProvider?.loadMoreBlockedBroooners();
        }
      },
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_localizationsContext == null) {
      _localizationsContext = AppLocalizations.of(context)!;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_blockedBrooonersProvider == null) {
        _blockedBrooonersProvider = Provider.of<BlockedBrooonersProvider>(
          context,
          listen: false,
        );
        _blockedBrooonersProvider!.init();
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (_blockedBrooonersProvider != null) {
      _blockedBrooonersProvider!.onDispose();
    }
    super.dispose();
  }

  bool _isDisabledPullToRefreshLoadMore() {
    return _blockedBrooonersProvider?.disablePullToRefreshLoadMore ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              title: _localizationsContext!.blockedBrooonerTitle,
              enableSearch: true,
              onSearchChange: (value) {
                _blockedBrooonersProvider?.searchBy(value);
              },
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.screenHorizontalMargin.w,
                ),
                child: Selector<BlockedBrooonersProvider, ApiEnum>(
                  shouldRebuild: (prev, next) => true,
                  selector: (_, state) => state.apiEnum,
                  builder: (_, apiEnum, __) {
                    if (apiEnum == ApiEnum.inProgress) {
                      return ListView.builder(
                        itemCount: 10,
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemBuilder: (BuildContext context, int index) =>
                            BlockedBrooonerShimmerItem(),
                      );
                    } else {
                      return Selector<BlockedBrooonersProvider,
                          List<DbBlockedBroooner>>(
                        selector: (_, state) =>
                            state.filteredblockedBrooonerList,
                        shouldRebuild: (prev, next) => true,
                        builder: (context, list, child) {
                          if (list.isEmpty) {
                            return EmptyView(
                              onRetryClicked: () {
                                _blockedBrooonersProvider
                                    ?.getBlockedBrooonerList();
                              },
                            );
                          }
                          return ScrollConfiguration(
                            behavior: MaterialScrollBehavior().copyWith(
                              overscroll: false,
                            ),
                            child: RefreshIndicator(
                              onRefresh: () =>
                                  _isDisabledPullToRefreshLoadMore()
                                      ? Future.value()
                                      : _blockedBrooonersProvider
                                          ?.getBlockedBrooonerList(),
                              notificationPredicate:
                                  _isDisabledPullToRefreshLoadMore()
                                      ? (_) => false
                                      : (_) => true,
                              child: ListView.builder(
                                itemCount: list.length + 1,
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemBuilder: (context, index) {
                                  if (index < list.length) {
                                    return BlockedBrooonerItem(
                                      blockedBroooner: list[index],
                                      localizationsContext:
                                          _localizationsContext!,
                                      onTapUnblock: (selected) =>
                                          _blockedBrooonersProvider
                                              ?.unblockBroooner(
                                        context,
                                        localizationsContext:
                                            _localizationsContext!,
                                        broooner: selected,
                                      ),
                                    );
                                  } else {
                                    return Selector<BlockedBrooonersProvider,
                                        bool>(
                                      selector: (_, state) => state.hasMoreData,
                                      shouldRebuild: (prev, next) =>
                                          prev != next,
                                      builder: (context, hasMoreData, child) {
                                        if (hasMoreData) {
                                          if (_isDisabledPullToRefreshLoadMore()) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: Dimensions
                                                    .loadMoreLinearProgressVerticalPadding
                                                    .h,
                                              ),
                                              child: const SizedBox(),
                                            );
                                          }
                                        }
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: Dimensions
                                                .loadMoreLinearProgressVerticalPadding
                                                .h,
                                          ),
                                          child: Center(
                                            child: hasMoreData
                                                ? LinearProgressIndicator(
                                                    color: StaticFunctions
                                                        .getColor(
                                                      context,
                                                      ColorEnum.themeColor,
                                                    ),
                                                    backgroundColor:
                                                        StaticFunctions
                                                            .getColor(
                                                      context,
                                                      ColorEnum
                                                          .themeColorOpacity8Percentage,
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
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
