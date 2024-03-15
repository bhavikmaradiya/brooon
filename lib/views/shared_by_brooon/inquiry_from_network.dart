import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './inquiry_from_network_item.dart';
import './network_property_subscribe_view.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../view_all_property/model/view_all_screen_arg.dart';
import '../view_all_property/view_all_properties_provider.dart';

class InquiryFromNetwork extends StatefulWidget {
  final ViewAllFromType fromType;
  final List<DbSavedFilter> inquiryFromNetwork;
  final AppLocalizations localizationsContext;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final ViewAllPropertiesProvider? viewAllPropertiesProvider;

  const InquiryFromNetwork({
    Key? key,
    required this.localizationsContext,
    required this.fromType,
    required this.inquiryFromNetwork,
    required this.commonPropertyDataProvider,
    required this.viewAllPropertiesProvider,
  }) : super(key: key);

  @override
  State<InquiryFromNetwork> createState() => _InquiryFromNetworkState();
}

class _InquiryFromNetworkState extends State<InquiryFromNetwork> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          if (!_isDisabledPullToRefreshLoadMore()) {
            widget.viewAllPropertiesProvider?.loadMoreSharedByBrooonInquiries();
          }
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isDisabledPullToRefreshLoadMore() {
    return widget
            .viewAllPropertiesProvider?.disablePullToRefreshLoadMoreInquiries ??
        false;
  }

  Widget _inquiryFromNetwork() {
    return Selector<CommonPropertyDataProvider, bool>(
      selector: (_, state) => state.isUserSubscribed,
      shouldRebuild: (prev, next) => prev != next,
      builder: (context, isSubscribed, child) {
        if (isSubscribed) {
          return widget.inquiryFromNetwork.isEmpty
              ? EmptyView(
                  onRetryClicked: () {
                    widget.viewAllPropertiesProvider
                        ?.fetchSharedByBrooonersInquiry(
                      context,
                      isRetryClicked: true,
                    );
                  },
                )
              : ScrollConfiguration(
                  behavior: MaterialScrollBehavior().copyWith(
                    overscroll: false,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () => _isDisabledPullToRefreshLoadMore()
                        ? Future.value()
                        : widget.viewAllPropertiesProvider
                            ?.fetchSharedByBrooonersInquiry(context),
                    notificationPredicate: _isDisabledPullToRefreshLoadMore()
                        ? (_) => false
                        : (_) => true,
                    child: ListView.builder(
                      itemCount: widget.inquiryFromNetwork.length + 1,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if (index < widget.inquiryFromNetwork.length) {
                          return InquiryFromNetworkItem(
                            currentListIndex: index,
                            fromType: widget.fromType,
                            localizationsContext: widget.localizationsContext,
                            inquiry: widget.inquiryFromNetwork[index],
                            onSelect: (selected) {
                              widget.viewAllPropertiesProvider
                                  ?.openInquiryDetailScreen(
                                context,
                                selected,
                              );
                            },
                          );
                        } else {
                          return Selector<ViewAllPropertiesProvider, bool>(
                            selector: (_, state) => state.hasMoreInquiryData,
                            shouldRebuild: (prev, next) => prev != next,
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
                                      .loadMoreLinearProgressVerticalPadding.h,
                                ),
                                child: Center(
                                  child: hasMoreData
                                      ? LinearProgressIndicator(
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.themeColor,
                                          ),
                                          backgroundColor:
                                              StaticFunctions.getColor(
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
        } else {
          if (AppConfig.enabledSubscriptionFeature) {
            return NetworkPropertySubscribeView(
              localizationsContext: widget.localizationsContext,
              onSubScribe: () {
                widget.viewAllPropertiesProvider?.openSubscriptionScreen(
                  context,
                );
              },
            );
          } else {
            return EmptyView(
              onRetryClicked: () {
                widget.viewAllPropertiesProvider
                    ?.fetchSharedByBrooonersInquiry(context);
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _inquiryFromNetwork();
  }
}
