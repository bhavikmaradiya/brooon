import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './network_property_subscribe_view.dart';
import './property_from_network_item.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../view_all_property/model/view_all_screen_arg.dart';
import '../view_all_property/view_all_properties_provider.dart';

class PropertyFromNetwork extends StatefulWidget {
  final ViewAllFromType fromType;
  final List<DbProperty> propertyFromNetwork;
  final AppLocalizations localizationsContext;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final ViewAllPropertiesProvider? viewAllPropertiesProvider;

  const PropertyFromNetwork({
    Key? key,
    required this.localizationsContext,
    required this.fromType,
    required this.propertyFromNetwork,
    required this.commonPropertyDataProvider,
    required this.viewAllPropertiesProvider,
  }) : super(key: key);

  @override
  State<PropertyFromNetwork> createState() => _PropertyFromNetworkState();
}

class _PropertyFromNetworkState extends State<PropertyFromNetwork> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          if (!_isDisabledPullToRefreshLoadMore()) {
            widget.viewAllPropertiesProvider
                ?.loadMoreSharedByBrooonProperties();
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
    return widget.viewAllPropertiesProvider
            ?.disablePullToRefreshLoadMoreProperties ??
        false;
  }

  Widget _propertyFromNetwork() {
    return Selector<CommonPropertyDataProvider, bool>(
      selector: (_, state) => state.isUserSubscribed,
      shouldRebuild: (prev, next) => prev != next,
      builder: (context, isSubscribed, child) {
        if (isSubscribed) {
          return widget.propertyFromNetwork.isEmpty
              ? EmptyView(
                  onRetryClicked: () {
                    widget.viewAllPropertiesProvider
                        ?.fetchSharedByBrooonersProperty(
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
                            ?.fetchSharedByBrooonersProperty(
                            context,
                          ),
                    notificationPredicate: _isDisabledPullToRefreshLoadMore()
                        ? (_) => false
                        : (_) => true,
                    child: ListView.builder(
                      itemCount: widget.propertyFromNetwork.length + 1,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if (index < widget.propertyFromNetwork.length) {
                          return PropertyFromNetworkItem(
                            currentListIndex: index,
                            fromType: widget.fromType,
                            localizationsContext: widget.localizationsContext,
                            property: widget.propertyFromNetwork[index],
                            onSelect: (selectedProperty) {
                              widget.viewAllPropertiesProvider
                                  ?.openPropertyDetailScreen(
                                context,
                                selectedProperty,
                              );
                            },
                          );
                        } else {
                          return Selector<ViewAllPropertiesProvider, bool>(
                            selector: (_, state) => state.hasMorePropertyData,
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
                    ?.fetchSharedByBrooonersProperty(context);
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _propertyFromNetwork();
  }
}
