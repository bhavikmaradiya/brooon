import 'package:isar/isar.dart';

part 'db_plan_history.g.dart';

@collection
class DbPlanHistory {
  Id id = Isar.autoIncrement;
  int? userId;
  late String planName;
  late String paymentMode;
  late String transactionId;
  late int startDate;
  late int endDate;
  late int purchasedOn;
  late String price;
  late String duration;
  @ignore
  bool isActive = false;
}
