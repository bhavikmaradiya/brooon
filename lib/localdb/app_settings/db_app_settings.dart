import 'package:isar/isar.dart';

part 'db_app_settings.g.dart';

@collection
class DbAppSettings {
  Id id = 1;
  bool isAutoStartPermissionAsked = false;
  bool isWalkthroughSeen = false;
  bool isSharingOptionDialogShown = false;
}
