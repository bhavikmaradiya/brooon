import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './widget/notification_widget.dart';
import '../../const/dimen_const.dart';
import '../../localdb/notification/db_notifications.dart';
import '../../utils/theme_config.dart';
import '../../views/notifications/notifications_provider.dart';
import '../../widgets/empty_view/empty_view.dart';
import '../../widgets/toolbar.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationsProvider(),
      builder: (_, __) => _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  NotificationsProvider? provider;
  late AppLocalizations localizationsContext;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    if (provider == null) {
      provider = Provider.of<NotificationsProvider>(context, listen: false);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        provider?.init();
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    provider?.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ToolBar(
                title: localizationsContext.titleNotifications,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.screenHorizontalMargin.w,
                    right: Dimensions.screenHorizontalMargin.w,
                  ),
                  child: Selector<NotificationsProvider, List<DbNotification>>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => state.notificationsList,
                    builder: (context, notificationList, child) {
                      if (notificationList.isEmpty) {
                        return EmptyView();
                      }
                      return ListView.builder(
                        itemCount: notificationList.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NotificationWidget(
                            notification: notificationList[index],
                            onTap: (int id) => provider?.onNotificationSelect(
                              context,
                              id,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
