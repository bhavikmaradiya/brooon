import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../const/dimen_const.dart';
import '../../../localdb/notification/db_notifications.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/notification_helper.dart';
import '../../../utils/static_functions.dart';

class NotificationWidget extends StatelessWidget {
  final DbNotification notification;
  final Function(int id) onTap;
  AppLocalizations? localizationsContext;

  NotificationWidget({
    Key? key,
    required this.notification,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    localizationsContext ??= AppLocalizations.of(context)!;
    final currentDate = DateTime.now();
    final notificationDate = notification.dateTime;
    final isReminder = notification.type == NotificationType.reminder.name;
    final isToday = notificationDate.day == currentDate.day &&
        notificationDate.year == currentDate.year &&
        notificationDate.month == currentDate.month;
    final _dateString =
        '${DateFormat(isToday ? AppConfig.reminderDisplayTimeFormat : AppConfig.reminderDisplayDateTimeFormat).format(notificationDate)}';
    final reminderDateString = '${isReminder ? 'at $_dateString' : ''}';
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.notificationListItemBetweenSpacing.h,
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          !notification.isRead
              ? ColorEnum.themeColorOpacity3Percentage
              : ColorEnum.whiteColor,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.notificationListItemBorderRadius.r,
        ),
        border: Border.all(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
          width: Dimensions.notificationListItemBorderWidth.w,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            Dimensions.notificationListItemBorderRadius.r,
          ),
          onTap: () => onTap(notification.id),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.notificationListItemInnerPadding.w,
              vertical: Dimensions.notificationListItemInnerPadding.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  notification.icon,
                  height: Dimensions.notificationListIconSize.h,
                  width: Dimensions.notificationListIconSize.h,
                  color: StaticFunctions.getColor(
                    context,
                    notification.isRead
                        ? ColorEnum.grayAEColor
                        : ColorEnum.themeColor,
                  ),
                ),
                SizedBox(
                  width: Dimensions.notificationListIconContentBetweenSpace.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${notification.description} $reminderDateString',
                        style: TextStyle(
                          fontSize: Dimensions.notificationListTitleSize.sp,
                          fontWeight: FontWeight.w400,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            Dimensions.notificationListTitleDateBetweenSpace.h,
                      ),
                      Text(
                        '${isToday ? '${localizationsContext!.notificationDateToday}, $_dateString' : _dateString}',
                        style: TextStyle(
                          fontSize: Dimensions.notificationListDateTimeSize.sp,
                          fontWeight: FontWeight.w400,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.gray90Color,
                          ),
                        ),
                      )
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
}
