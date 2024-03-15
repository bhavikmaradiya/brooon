import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../views/reminder/reminder_provider.dart';

class MyDateTime {
  ///get first date of week
  static DateTime getFirstDateOfWeek(DateTime date) {
    return date.weekday == 7
        ? date
        : date.add(
            Duration(
              days: -date.weekday,
            ),
          );
  }

  static List<DateTime> getDateTimeOfWeek(DateTime date) {
    var firstDay = getFirstDateOfWeek(date);
    var dateTime = <DateTime>[];
    for (var i = 0; i < 7; i++) {
      dateTime.add(
        firstDay.add(
          Duration(
            days: i,
          ),
        ),
      );
    }
    return dateTime;
  }
}

typedef void DateCallback(DateTime val);

class G2xSimpleWeekCalendar extends StatefulWidget {
  final ReminderProvider? reminderProvider;

  final DateTime currentDate;
  final DateCallback? dateCallback;

  G2xSimpleWeekCalendar(
    this.currentDate, {
    this.dateCallback,
    this.reminderProvider,
  });

  @override
  _G2xSimpleWeekCalendarState createState() => _G2xSimpleWeekCalendarState();
}

class _G2xSimpleWeekCalendarState extends State<G2xSimpleWeekCalendar>
    with TickerProviderStateMixin {
  DateTime? currentDate;
  var dateTimes = <DateTime>[];
  var strWeekDays = <String>[];
  late AppLocalizations localizationsContext;
  var selectedIndex = 0;

  _setSelectedDate(int index) {
    setState(() {
      selectedIndex = index;
      currentDate = MyDateTime.getFirstDateOfWeek(currentDate!)
          .add(Duration(days: index));
      if (widget.dateCallback != null) {
        widget.dateCallback!(currentDate!);
      }
    });
  }

  _alterWeek(int days) {
    setState(
      () {
        currentDate = currentDate!.add(
          Duration(days: days),
        );
        if (widget.dateCallback != null) widget.dateCallback!(currentDate!);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    currentDate = widget.currentDate;
    selectedIndex = currentDate!.weekday == 7 ? 0 : currentDate!.weekday;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizationsContext = AppLocalizations.of(context)!;
    this.strWeekDays = [
      localizationsContext.reminderDaySunday,
      localizationsContext.reminderDayMonday,
      localizationsContext.reminderDayTuesday,
      localizationsContext.reminderDayWednesday,
      localizationsContext.reminderDayThursday,
      localizationsContext.reminderDayFriday,
      localizationsContext.reminderDaySaturday,
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dateTimes = MyDateTime.getDateTimeOfWeek(currentDate!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: Dimensions.reminderDateArrowsSize.w,
                height: Dimensions.reminderDateArrowsSize.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.reminderDateArrowsRippleRadius.r,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _alterWeek(-7),
                    borderRadius: BorderRadius.circular(
                      Dimensions.reminderDateArrowsRippleRadius.r,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        Dimensions.reminderDateArrowsPadding.w,
                      ),
                      child: SvgPicture.asset(
                        Strings.iconDatePickerLeftArrow,
                        width: Dimensions.reminderDateArrowsSize.w,
                        height: Dimensions.reminderDateArrowsSize.w,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                DateFormat(AppConfig.reminderDisplayMonthYearFormat)
                    .format(currentDate!),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.reminderDateHeaderMonthTextSize.sp,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                ),
              ),
              Container(
                width: Dimensions.reminderDateArrowsSize.w,
                height: Dimensions.reminderDateArrowsSize.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.reminderDateArrowsRippleRadius.r,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _alterWeek(7),
                    borderRadius: BorderRadius.circular(
                      Dimensions.reminderDateArrowsRippleRadius.r,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        Dimensions.reminderDateArrowsPadding.w,
                      ),
                      child: SvgPicture.asset(
                        Strings.iconDatePickerRightArrow,
                        width: Dimensions.reminderDateArrowsSize.w,
                        height: Dimensions.reminderDateArrowsSize.w,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.reminderDateHeaderPickerBetweenSpace.h,
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: strWeekDays.length,
                    childAspectRatio: 2.5 / 4,
                    mainAxisSpacing: 5.w,
                    crossAxisSpacing: 5.w,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: strWeekDays.map(
                    (i) {
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          double width = constraints.maxWidth;
                          double height = constraints.maxHeight;
                          double monthTextSize = (width * 0.30).sp;
                          double dayTextSize = (width * 0.35).sp;
                          double betweenSpace = (height * 0.06).h;
                          double horizontalPadding = (height * 0.1).w;
                          return InkWell(
                            onTap: () =>
                                _setSelectedDate(strWeekDays.indexOf(i)),
                            borderRadius: BorderRadius.circular(
                              Dimensions.reminderDatePickerItemRadius.r,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(
                                horizontalPadding,
                              ),
                              decoration: BoxDecoration(
                                color: StaticFunctions.getColor(
                                  context,
                                  selectedIndex == strWeekDays.indexOf(i)
                                      ? ColorEnum.themeColor
                                      : ColorEnum.transparent,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.reminderDatePickerItemRadius.r,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    i,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: monthTextSize,
                                      overflow: TextOverflow.ellipsis,
                                      color: StaticFunctions.getColor(
                                        context,
                                        selectedIndex == strWeekDays.indexOf(i)
                                            ? ColorEnum.whiteColor
                                            : ColorEnum.gray90Color,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: betweenSpace,
                                  ),
                                  Text(
                                    dateTimes[strWeekDays.indexOf(i)]
                                        .day
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: dayTextSize,
                                      fontWeight: FontWeight.w600,
                                      color: StaticFunctions.getColor(
                                        context,
                                        selectedIndex == strWeekDays.indexOf(i)
                                            ? ColorEnum.whiteColor
                                            : ColorEnum.blackColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: betweenSpace,
                                  ),
                                  FutureBuilder(
                                    future: widget.reminderProvider
                                            ?.getNumberOfSavedReminderForDate(
                                                dateTimes[
                                                    strWeekDays.indexOf(i)]) ??
                                        Future.value(0),
                                    builder: (context, snapshot) {
                                      return Container(
                                        width: Dimensions
                                            .reminderDateItemIndicatorSize.w,
                                        height: Dimensions
                                            .reminderDateItemIndicatorSize.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: StaticFunctions.getColor(
                                            context,
                                            (snapshot.data != null &&
                                                    snapshot.data! > 0)
                                                ? ((selectedIndex ==
                                                        strWeekDays.indexOf(i))
                                                    ? ColorEnum.whiteColor
                                                    : ColorEnum.themeColor)
                                                : ColorEnum.transparent,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
