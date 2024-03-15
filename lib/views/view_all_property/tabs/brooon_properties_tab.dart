import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_property_data_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_property.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../shared_by_brooon/property_from_network.dart';
import '../../shared_by_brooon/shimmer_view/brooon_item_shimmer.dart';
import '../model/view_all_screen_arg.dart';
import '../view_all_properties_provider.dart';

class BrooonPropertiesTab extends StatelessWidget {
  final ViewAllScreenArg arguments;
  final AppLocalizations? localizationsContext;
  final CommonPropertyDataProvider? commonPropertyDataProvider;
  final ViewAllPropertiesProvider? viewAllPropertiesProvider;

  const BrooonPropertiesTab({
    Key? key,
    required this.arguments,
    required this.localizationsContext,
    required this.commonPropertyDataProvider,
    required this.viewAllPropertiesProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.screenHorizontalMargin.w,
      ),
      child: Selector<ViewAllPropertiesProvider, List<DbProperty>>(
        selector: (_, state) => state.propertyFromNetworkList,
        shouldRebuild: (prev, next) => true,
        builder: (context, sharedByBroooners, child) {
          return Selector<CommonPropertyDataProvider, ApiEnum>(
            selector: (_, state) => state.propertyApiEnum,
            shouldRebuild: (prev, next) => true,
            builder: (context, apiEnum, child) {
              if (apiEnum == ApiEnum.inProgress) {
                return SizedBox(
                  height: double.infinity,
                  child: BrooonItemShimmer(
                    listScrollDirection: Axis.vertical,
                    fromType: arguments.showDataFor,
                    isImagePreviewVisible:
                        AppConfig.enableBrooonItemsImagePreview,
                    isActionVisible: true,
                  ),
                );
              } else {
                return PropertyFromNetwork(
                  localizationsContext: localizationsContext!,
                  fromType: arguments.showDataFor,
                  propertyFromNetwork: sharedByBroooners,
                  commonPropertyDataProvider: commonPropertyDataProvider!,
                  viewAllPropertiesProvider: viewAllPropertiesProvider,
                );
              }
            },
          );
        },
      ),
    );
  }
}
