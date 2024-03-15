import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

import './common_property_data_provider.dart';
import './const/dimen_const.dart';
import './const/routes.dart';
import './const/string_const.dart';
import './firebase_options.dart';
import './utils/notification_helper.dart';
import './utils/scroll_behavior.dart';
import './utils/theme_config.dart';
import './views/authentication/auth_provider.dart';
import './views/choose_location/fetch_location_provider.dart';
import './views/settings/settings_provider.dart';
import './views/splash/splash.dart';
import './views/subscription/revenue_cat/revenue_cat_purchase_api.dart';
import './views/walk_through/walk_through_provider.dart';

late NotificationAppLaunchDetails notificationLaunch;
final FlutterLocalNotificationsPlugin notificationPlugin =
    FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RevenueCatPurchaseApi.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ref. https://firebase.google.com/docs/crashlytics/get-started?platform=flutter
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  tz.initializeTimeZones();
  notificationLaunch =
      (await notificationPlugin.getNotificationAppLaunchDetails())!;
  await NotificationHelper.initNotifications(notificationPlugin);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

// Ref. https://isar.dev/recipes/data_migration.html
// Migration for 2 cases
// 1. While updating application from play store
// 2. At time of backup - If we have backup with old version then
Future _performMigrationIfNeeded(Isar isar) async {
  final prefs = await SharedPreferences.getInstance();
  final currentVersion = prefs.getInt('version') ?? 2;
  switch (currentVersion) {
    case 1:
      await _migrateV1ToV2(isar);
      break;
    case 2:
      // If the version is not set (new installation) or already 2, we do not need to migrate
      return;
    default:
      throw Exception('Unknown version: $currentVersion');
  }

  // Update version
  await prefs.setInt('version', 2);
}

Future _migrateV1ToV2(Isar isar) async {
  // Data migration code goes here.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WalkThroughProvider>(
          create: (_) => WalkThroughProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<FetchLocationProvider>(
          create: (_) => FetchLocationProvider(),
        ),
        ChangeNotifierProvider<CommonPropertyDataProvider>(
          create: (_) => CommonPropertyDataProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          Dimensions.figmaScreenWidth,
          Dimensions.figmaScreenHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            scrollBehavior: MyScrollBehavior(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale(Strings.english, ''), // English, no country code
              Locale(Strings.gujarati, ''), // Gujarati, no country code
            ],
            theme: ThemeConfig.lightTheme,
            darkTheme: ThemeConfig.darkTheme,
            home: Splash(),
            routes: Routes.routeList,
            navigatorKey: navigatorKey,
          );
        },
      ),
    );
  }
}
