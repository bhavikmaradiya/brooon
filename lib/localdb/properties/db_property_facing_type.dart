import 'package:isar/isar.dart';

part 'db_property_facing_type.g.dart';

@collection
class DbPropertyFacingType {
  late Id id;
  late String name;
  @ignore
  bool isSelected = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPropertyFacingType &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @ignore
  @override
  int get hashCode => id.hashCode;
}
