import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './model/reminder_arguments.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/reminder/db_reminder.dart';
import '../../utils/date_utils.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/reminder/reminder_provider.dart';
import '../../views/reminder/widgets/reminder_widget.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../../widgets/horizontal_date_picker/horizontal_date_picker.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/toolbar.dart';

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DateTime?;
    return ChangeNotifierProvider(
      create: (_) => ReminderProvider(),
      builder: (_, __) => _Body(
        argsDate: args,
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final DateTime? argsDate;

  const _Body({
    Key? key,
    this.argsDate,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  ReminderProvider? provider;
  late AppLocalizations localizationsContext;
  late Size size;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    size = MediaQuery.of(context).size;
    if (provider == null) {
      provider = Provider.of<ReminderProvider>(context, listen: false);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        provider!.init(
          context,
          selectedDate: widget.argsDate,
        );
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(
        context,
        statusBarColor: ColorEnum.whiteColor,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ToolBar(
                title: localizationsContext.reminder,
                enableBackground: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.screenHorizontalMargin.w,
                          right: Dimensions.screenHorizontalMargin.w,
                          top: Dimensions.screenVerticalMarginBottom.h,
                          bottom: Dimensions.screenVerticalMarginBottom.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Selector<ReminderProvider, DateTime?>(
                              selector: (_, state) => state.selectedDate,
                              shouldRebuild: (prev, next) => true,
                              builder: (context, dateTime, child) {
                                return G2xSimpleWeekCalendar(
                                  widget.argsDate ?? dateTime ?? DateTime.now(),
                                  reminderProvider: provider,
                                  dateCallback: (date) =>
                                      provider!.selectDate(date),
                                );
                              },
                            ),
                            SizedBox(
                              height: Dimensions
                                  .reminderDatePickerAndDividerBetweenSpace.h,
                            ),
                            LightDivider(),
                            SizedBox(
                              height: Dimensions
                                  .reminderSearchFieldVerticalMargin.h,
                            ),
                            Selector<ReminderProvider, DateTime?>(
                              selector: (_, state) => state.selectedDate,
                              shouldRebuild: (prev, next) => true,
                              builder: (context, dateTime, child) {
                                final today = DateTime.now().applyTimeOfDay(
                                    timeOfDay: TimeOfDay(hour: 0, minute: 0));
                                final isValidDate = dateTime != null &&
                                    today.compareTo(dateTime) != 1;
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: SearchWidget(
                                        searchHint: localizationsContext
                                            .searchReminderHint,
                                        onSearch: (value) {
                                          provider?.searchBy(value);
                                        },
                                        onTyping: (value) {
                                          provider?.searchBy(value);
                                        },
                                      ),
                                    ),
                                    if (isValidDate)
                                      SizedBox(
                                        width: Dimensions
                                            .reminderSearchAndAddBtnBetweenSpace
                                            .w,
                                      ),
                                    if (isValidDate)
                                      Container(
                                        decoration: BoxDecoration(
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.themeColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            Dimensions
                                                .reminderAddBtnBorderRadius.r,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () => provider!.onUpdate(
                                            context,
                                            ReminderArgs(
                                              provider?.selectedDate,
                                              null,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            Dimensions
                                                .reminderAddBtnBorderRadius.r,
                                          ),
                                          child: Container(
                                            height: Dimensions.fieldHeight.h,
                                            width: Dimensions.fieldHeight.h,
                                            padding: EdgeInsets.all(
                                              Dimensions
                                                  .reminderAddBtnPadding.h,
                                            ),
                                            child: SvgPicture.asset(
                                              Strings.iconHomeFab,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: Dimensions
                                    .reminderListHeaderVerticalPadding.h,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Selector<ReminderProvider, String>(
                                shouldRebuild: (prev, next) => prev != next,
                                selector: (_, state) => state.selectedDateLabel,
                                builder: (context, label, child) => Text(
                                  label,
                                  style: TextStyle(
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.blueColor,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimensions
                                        .reminderListHeaderTextSize.sp,
                                  ),
                                ),
                              ),
                            ),
                            Selector<ReminderProvider, List<DbReminder>>(
                              shouldRebuild: (prev, next) => true,
                              selector: (_, state) => state.reminderList,
                              builder: (context, reminderList, child) {
                                if (reminderList.isEmpty) {
                                  return SizedBox(
                                    height:
                                        (MediaQuery.of(context).size.height / 2)
                                            .h,
                                    child: EmptyView(
                                      message: localizationsContext
                                          .noReminderEventFound,
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: reminderList.length,
                                  itemBuilder: (context, index) {
                                    DbReminder currentItem =
                                        reminderList[index];
                                    return ReminderWidget(
                                      reminder: currentItem,
                                      onEdit: () => provider!.onUpdate(
                                        context,
                                        ReminderArgs(
                                          null,
                                          currentItem,
                                        ),
                                      ),
                                      onDelete: () => provider!.onDelete(
                                        context,
                                        currentItem,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    provider?.onDispose();
    super.dispose();
  }
}
