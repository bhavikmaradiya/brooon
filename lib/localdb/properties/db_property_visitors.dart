import 'package:isar/isar.dart';

part 'db_property_visitors.g.dart';

@collection
class DbPropertyVisitors {
  Id id = Isar.autoIncrement;
  String? propertyId;
  int? userId;
  String? name;
  String? mobileNo;
  DateTime? addedAt;
}
