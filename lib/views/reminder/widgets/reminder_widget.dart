import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common_property_data_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../const/routes.dart';
import '../../../const/string_const.dart';
import '../../../localdb/isar_service.dart';
import '../../../localdb/properties/db_property.dart';
import '../../../localdb/reminder/db_reminder.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/image_loader.dart';
import '../../../widgets/light_divider.dart';

class ReminderWidget extends StatelessWidget {
  final DbReminder reminder;
  final Function() onEdit;
  final Function() onDelete;
  final IsarService _isarService = IsarService();

  ReminderWidget({
    Key? key,
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    String dateText = reminder.reminderForAllDay ||
            (reminder.tag != null && reminder.tag!.trim().isNotEmpty)
        ? localizationsContext.reminderForAllDay
        : DateFormat(AppConfig.reminderDisplayDateFormat)
            .format(reminder.selectedTime!);
    String timeText = DateFormat(AppConfig.reminderDisplayTimeFormat)
        .format(reminder.selectedTime!);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.reminderListBoxBetweenSpacing.h,
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.reminderListBoxBorderRadius.r,
        ),
        border: Border.all(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
          width: Dimensions.reminderListBoxBorderWidth.w,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(
            Dimensions.reminderListBoxBorderRadius.r,
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.reminderListBoxInnerVerticalPadding.h,
                    horizontal:
                        Dimensions.reminderListBoxInnerHorizontalPadding.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Strings.iconDrawerReminder,
                        height: Dimensions.reminderListBoxLeftIconSize.w,
                        width: Dimensions.reminderListBoxLeftIconSize.w,
                      ),
                      SizedBox(
                        width: Dimensions.reminderListBoxInnerContentSpacing.w,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                reminder.title!,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: Dimensions
                                      .reminderListBoxTitleTextSize.sp,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.blackColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions
                                    .reminderListBoxTimeTitleBetweenSpace.h,
                              ),
                              Text(
                                '$dateText | $timeText',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize:
                                      Dimensions.reminderListBoxTimeTextSize.sp,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.reminderListBoxInnerContentSpacing.w,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: Dimensions.reminderListBoxMenuIconSize.h,
                              width: Dimensions.reminderListBoxMenuIconSize.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.reminderListBoxMenuIconRadius.r,
                                ),
                              ),
                              child: InkWell(
                                onTap: onEdit,
                                borderRadius: BorderRadius.circular(
                                  Dimensions.reminderListBoxMenuIconRadius.r,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    Dimensions.reminderListBoxMenuIconPadding.w,
                                  ),
                                  child: SvgPicture.asset(
                                    Strings.iconEdit,
                                    height: Dimensions
                                        .reminderListBoxMenuIconSize.h,
                                    width: Dimensions
                                        .reminderListBoxMenuIconSize.h,
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
                                  .reminderListBoxMenuIconBetweenSpace.w,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.reminderListBoxMenuIconRadius.r,
                                ),
                              ),
                              height: Dimensions.reminderListBoxMenuIconSize.h,
                              width: Dimensions.reminderListBoxMenuIconSize.h,
                              child: InkWell(
                                onTap: onDelete,
                                borderRadius: BorderRadius.circular(
                                  Dimensions.reminderListBoxMenuIconRadius.r,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    Dimensions.reminderListBoxMenuIconPadding.w,
                                  ),
                                  child: SvgPicture.asset(
                                    Strings.iconDelete,
                                    height: Dimensions
                                        .reminderListBoxMenuIconSize.h,
                                    width: Dimensions
                                        .reminderListBoxMenuIconSize.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                if ((reminder.description != null &&
                        reminder.description!.trim().isNotEmpty) ||
                    reminder.selectedProperty != null)
                  LightDivider(),
                if ((reminder.description != null &&
                        reminder.description!.trim().isNotEmpty) ||
                    reminder.selectedProperty != null)
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical:
                          Dimensions.reminderListBoxInnerVerticalPadding.h,
                      horizontal:
                          Dimensions.reminderListBoxInnerHorizontalPadding.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (reminder.description != null &&
                            reminder.description!.trim().isNotEmpty)
                          Text(
                            reminder.description!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions
                                  .reminderListBoxDescriptionTextSize.sp,
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blackColor,
                              ),
                            ),
                          ),
                        if (reminder.selectedProperty != null)
                          FutureBuilder(
                            future: _getProperty(reminder.selectedProperty!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                DbProperty? property = snapshot.data;
                                return property != null
                                    ? _propertyDetailsWidget(
                                        context,
                                        property,
                                      )
                                    : SizedBox();
                              } else {
                                return _propertyDetailsShimmerWidget(
                                  context,
                                );
                              }
                            },
                          ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _propertyDetailsShimmerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.reminderListBoxDescAndPropertyBetweenSpacing.h,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.withOpacity(0.3),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Dimensions.reminderListBoxPropertyIconSize.w,
                  height: Dimensions.reminderListBoxPropertyIconSize.w,
                  decoration: BoxDecoration(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.gray90Color,
                    ).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                      Dimensions.reminderListBoxPropertyIconBorderRadius.r,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions
                      .reminderListBoxPropertyIconAndContentBetweenSpacing.w,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 20.h,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.gray90Color,
                          ).withOpacity(0.2),
                        ),
                        SizedBox(
                          height:
                              Dimensions.reminderListBoxTimeTitleBetweenSpace.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 20.h,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.gray90Color,
                          ).withOpacity(0.2),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _propertyDetailsWidget(
    BuildContext context,
    DbProperty property,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.reminderListBoxDescAndPropertyBetweenSpacing.h,
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.propertyDetail,
            arguments: property,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.reminderListBoxPropertyIconBorderRadius.r,
          ),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Dimensions.reminderListBoxPropertyIconSize.w,
                  height: Dimensions.reminderListBoxPropertyIconSize.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.reminderListBoxPropertyIconBorderRadius.r,
                    ),
                    border: Border.all(
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.grayAEColor,
                      ),
                      width:
                          Dimensions.reminderListBoxPropertyIconBorderWidth.w,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimensions.reminderListBoxPropertyIconBorderRadius.r,
                    ),
                    child: ImageLoader(
                      image: (property.photos != null &&
                              (property.photos ?? []).isNotEmpty)
                          ? property.photos!.first
                          : '',
                      propertyTypeId: property.propertyTypeId,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions
                      .reminderListBoxPropertyIconAndContentBetweenSpacing.w,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          property.propertyId!,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: Dimensions
                                .reminderListBoxPropertyTitleTextSize.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.gray90Color,
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              Dimensions.reminderListBoxTimeTitleBetweenSpace.h,
                        ),
                        Text(
                          CommonPropertyDataProvider
                              .propertyAreaWithPropertyType(property),
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: Dimensions
                                .reminderListBoxPropertySubtitleTextSize.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    Dimensions.reminderListBoxPropertyArrowIconPadding.w,
                  ),
                  child: SvgPicture.asset(
                    Strings.iconRightArrow,
                    width: Dimensions.reminderListBoxPropertyArrowIconSize.h,
                    height: Dimensions.reminderListBoxPropertyArrowIconSize.h,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<DbProperty?> _getProperty(int id) {
    return _isarService.getPropertyById(reminder.selectedProperty!);
  }
}
