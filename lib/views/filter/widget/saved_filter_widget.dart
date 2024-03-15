import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_saved_filter.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/light_divider.dart';
import '../filter_provider.dart';

class SavedFilterWidget extends StatelessWidget {
  final DbSavedFilter filter;
  final Function() onDelete;
  final Function(bool isEdit) onEdit;
  final bool isLast;

  SavedFilterWidget({
    Key? key,
    required this.filter,
    required this.onDelete,
    required this.onEdit,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () => onEdit(false),
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: Dimensions.savedFilterListItemVerticalMargin.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            filter.filterName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions
                                  .savedFilterListItemFilterTextSize.sp,
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blackColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions
                                .savedFilterListItemVerticalBetweenSpace.h,
                          ),
                          if (filter.buyerName.trim().isNotEmpty)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  filter.buyerName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: Dimensions
                                        .savedFilterListItemCustomerTextSize.sp,
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.blackColor,
                                    ),
                                  ),
                                ),
                                if (filter.mobileNo.trim().isNotEmpty)
                                  Text(
                                    " | ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: Dimensions
                                          .savedFilterListItemCustomerTextSize
                                          .sp,
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.blackColor,
                                      ),
                                    ),
                                  ),
                                if (filter.mobileNo.trim().isNotEmpty)
                                  Text(
                                    filter.mobileNo,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: Dimensions
                                          .savedFilterListItemMobileTextSize.sp,
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.blackColor,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          FutureBuilder<int>(
                            future: FilterProvider.getPropertiesCountOfFilter(
                              filter: filter,
                            ),
                            builder: (context, snapshot) {
                              filter.lastPropertyCount = snapshot.data;
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.data != null &&
                                  snapshot.data! >= 0) {
                                return _propertyCountWidget(
                                  context,
                                  localizationsContext: localizationsContext,
                                  count: snapshot.data!,
                                );
                              } else if (snapshot.connectionState !=
                                      ConnectionState.done &&
                                  (filter.lastPropertyCount == null ||
                                      filter.lastPropertyCount! >= 0)) {
                                return _propertyCountWidget(
                                  context,
                                  localizationsContext: localizationsContext,
                                  count: filter.lastPropertyCount,
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: Dimensions.savedFilterListItemIconSize.h,
                            width: Dimensions.savedFilterListItemIconSize.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.savedFilterListItemIconRadius.r,
                              ),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                Dimensions.savedFilterListItemIconRadius.r,
                              ),
                              onTap: () => onEdit(true),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  Dimensions.savedFilterListItemIconPadding.w,
                                ),
                                child: SvgPicture.asset(
                                  Strings.iconEdit,
                                  height:
                                      Dimensions.savedFilterListItemIconSize.h,
                                  width:
                                      Dimensions.savedFilterListItemIconSize.h,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.blueColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions
                                .savedFilterListItemIconBetweenSpace.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.savedFilterListItemIconRadius.r,
                              ),
                            ),
                            height: Dimensions.savedFilterListItemIconSize.h,
                            width: Dimensions.savedFilterListItemIconSize.h,
                            child: InkWell(
                              onTap: onDelete,
                              borderRadius: BorderRadius.circular(
                                Dimensions.savedFilterListItemIconRadius.r,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  Dimensions.savedFilterListItemIconPadding.w,
                                ),
                                child: SvgPicture.asset(
                                  Strings.iconDelete,
                                  height:
                                      Dimensions.savedFilterListItemIconSize.h,
                                  width:
                                      Dimensions.savedFilterListItemIconSize.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!isLast)
              LightDivider(
                color: ColorEnum.grayColor,
                thickness: Dimensions.savedFilterListItemDividerHeight.h,
              )
          ],
        ),
      ),
    );
  }

  _propertyCountWidget(
    BuildContext context, {
    required AppLocalizations localizationsContext,
    required int? count,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.savedFilterListItemVerticalBetweenSpace.h,
        ),
        Text(
          count != null ? localizationsContext.relatedProperties(count) : '',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.savedFilterListItemPropertyCountTextSize.sp,
            color: StaticFunctions.getColor(
              context,
              ColorEnum.blueColor,
            ),
          ),
        ),
      ],
    );
  }
}
