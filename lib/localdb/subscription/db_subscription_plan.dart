import 'package:isar/isar.dart';

part 'db_subscription_plan.g.dart';

@collection
class DbSubscriptionPlan {
  Id id = Isar.autoIncrement;
  String? planId;
  String? type;
  String? title;
  List<String>? description;
  String? duration;
  String? price;
  @ignore
  bool isSelected = false;
  @ignore
  bool isExpired = false;
}
