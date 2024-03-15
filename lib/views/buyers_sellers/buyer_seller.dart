import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import './buyer_seller_provider.dart';
import './model/buyer_seller_enum.dart';
import './model/buyer_seller_info.dart';
import './widget/buyer_seller_item.dart';
import '../../common_property_data_provider.dart';
import '../../const/routes.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../../widgets/toolbar.dart';
import '../common_widget/custom_floating_widget.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class BuyerSeller extends StatelessWidget {
  const BuyerSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as BuyerSellerType;
    return ChangeNotifierProvider(
      create: (_) => BuyerSellerProvider(),
      child: _BuyerSellerBody(
        buyerSellerType: arguments,
      ),
    );
  }
}

class _BuyerSellerBody extends StatefulWidget {
  final BuyerSellerType buyerSellerType;

  const _BuyerSellerBody({
    Key? key,
    required this.buyerSellerType,
  }) : super(key: key);

  @override
  State<_BuyerSellerBody> createState() => _BuyerSellerBodyState();
}

class _BuyerSellerBodyState extends State<_BuyerSellerBody> {
  AppLocalizations? _localizationsContext;
  BuyerSellerProvider? _buyersSellersProvider;

  @override
  void didChangeDependencies() {
    if (_localizationsContext == null) {
      _localizationsContext = AppLocalizations.of(context)!;
    }
    if (_buyersSellersProvider == null) {
      _buyersSellersProvider = Provider.of<BuyerSellerProvider>(
        context,
        listen: false,
      );
      _buyersSellersProvider!.init(
        _localizationsContext!,
        widget.buyerSellerType,
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (_buyersSellersProvider?.propertyChangeStream != null) {
      _buyersSellersProvider?.propertyChangeStream?.cancel();
    }
    if (_buyersSellersProvider?.inquiryChangeStream != null) {
      _buyersSellersProvider?.inquiryChangeStream?.cancel();
    }
    if (_buyersSellersProvider != null) {
      _buyersSellersProvider!.onDispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      floatingActionButton: CustomFloatingWidget(
        onClick: () {
          StaticFunctions.unFocusKeyboardIfAny(context);
          if (widget.buyerSellerType == BuyerSellerType.sellers) {
            Navigator.pushNamed(
              context,
              Routes.addProperty,
            );
          } else if (widget.buyerSellerType == BuyerSellerType.buyers) {
            Navigator.pushNamed(
              context,
              Routes.addBuyer,
            );
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              title: widget.buyerSellerType == BuyerSellerType.buyers
                  ? _localizationsContext!.drawerItemBuyers
                  : widget.buyerSellerType == BuyerSellerType.sellers
                      ? _localizationsContext!.drawerItemSellers
                      : _localizationsContext!.unknownText,
              enableSearch: true,
              onSearchChange: (value) {
                _buyersSellersProvider?.searchBy(value);
              },
            ),
            Expanded(
              child: Selector<BuyerSellerProvider, List<BuyerSellerInfo>>(
                selector: (_, state) => state.filteredBuyerSellerInfoList,
                shouldRebuild: (prev, next) => true,
                builder: (context, list, child) {
                  if (list.isEmpty) {
                    return EmptyView();
                  }
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return BuyerSellerItem(
                        buyerSellerInfo: list[index],
                        localizationsContext: _localizationsContext,
                        isLastIndex: index == list.length - 1,
                        buyerSellerType: widget.buyerSellerType,
                        onItemClick: (viewType) async {
                          final buyerSellerInfo = list[index];
                          buyerSellerInfo.showDataFor = viewType;
                          StaticFunctions.unFocusKeyboardIfAny(context);
                          final provider =
                              Provider.of<CommonPropertyDataProvider>(
                            context,
                            listen: false,
                          );
                          if (widget.buyerSellerType ==
                              BuyerSellerType.buyers) {
                            List<DbProperty>? properties = [];
                            if (list[index].properties != null) {
                              properties = list[index]
                                  .properties!
                                  .where(
                                    (element) => element.sharedByBrooon,
                                  )
                                  .toList();
                            }
                            provider.setBrooonMatchingProperties(
                              properties,
                            );
                          } else if (widget.buyerSellerType ==
                              BuyerSellerType.sellers) {
                            List<DbSavedFilter>? inquiries = [];
                            if (list[index].inquiries != null) {
                              inquiries = list[index]
                                  .inquiries!
                                  .where(
                                    (element) => element.sharedByBrooon,
                                  )
                                  .toList();
                            }
                            provider.setBrooonMatchingInquiries(
                              inquiries,
                            );
                          }

                          Navigator.pushNamed(
                            context,
                            Routes.viewAllProperties,
                            arguments: ViewAllScreenArg(
                              heading: _buyersSellersProvider
                                      ?.getPropertiesInquiriesHeading(
                                    localizationsContext:
                                        _localizationsContext!,
                                    name: list[index].name ??
                                        _localizationsContext!.unknownText,
                                    type: widget.buyerSellerType,
                                    viewType: viewType,
                                  ) ??
                                  _localizationsContext!.unknownText,
                              count: 0,
                              showDataFor: widget.buyerSellerType ==
                                      BuyerSellerType.buyers
                                  ? ViewAllFromType.buyers
                                  : ViewAllFromType.sellers,
                              buyerSellerInfo: buyerSellerInfo,
                              viewAllFromToHandleTabs: _buyersSellersProvider
                                  ?.getPropertiesInquiriesVisibilityType(
                                type: widget.buyerSellerType,
                                viewType: viewType,
                              ),
                            ),
                          );
                        },
                        onCallClick: () {
                          if (list[index].phone != null) {
                            _buyersSellersProvider?.openDialerToMakeACall(
                              list[index].phone!.toString().trim(),
                            );
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
