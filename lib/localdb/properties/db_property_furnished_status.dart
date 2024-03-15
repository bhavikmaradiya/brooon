
import 'package:isar/isar.dart';

part 'db_property_furnished_status.g.dart';

@collection
class DbPropertyFurnishedStatus {
  late Id id;
  late String name;
  @ignore
  bool isSelected = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPropertyFurnishedStatus &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @ignore
  @override
  int get hashCode => id.hashCode;
}