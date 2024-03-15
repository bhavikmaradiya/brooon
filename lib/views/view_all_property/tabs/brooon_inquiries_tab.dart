import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_property_data_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_saved_filter.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../shared_by_brooon/inquiry_from_network.dart';
import '../../shared_by_brooon/shimmer_view/brooon_item_shimmer.dart';
import '../model/view_all_screen_arg.dart';
import '../view_all_properties_provider.dart';

class BrooonInquiriesTab extends StatelessWidget {
  final ViewAllScreenArg arguments;
  final AppLocalizations? localizationsContext;
  final CommonPropertyDataProvider? commonPropertyDataProvider;
  final ViewAllPropertiesProvider? viewAllPropertiesProvider;

  const BrooonInquiriesTab({
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
      child: Selector<ViewAllPropertiesProvider, List<DbSavedFilter>>(
        selector: (_, state) => state.inquiryFromNetworkList,
        shouldRebuild: (prev, next) => true,
        builder: (context, sharedByBroooners, child) {
          return Selector<CommonPropertyDataProvider, ApiEnum>(
            selector: (_, state) => state.inquiryApiEnum,
            shouldRebuild: (prev, next) => true,
            builder: (context, apiEnum, widget) {
              if (apiEnum == ApiEnum.inProgress) {
                return SizedBox(
                  height: double.infinity,
                  child: BrooonItemShimmer(
                    listScrollDirection: Axis.vertical,
                    fromType: ViewAllFromType.brooonInquiries,
                    isImagePreviewVisible:
                        AppConfig.enableBrooonItemsImagePreview,
                    isActionVisible: true,
                  ),
                );
              } else {
                return InquiryFromNetwork(
                  localizationsContext: localizationsContext!,
                  fromType: arguments.showDataFor,
                  inquiryFromNetwork: sharedByBroooners,
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
