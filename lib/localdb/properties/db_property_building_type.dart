import 'package:isar/isar.dart';

part 'db_property_building_type.g.dart';

@collection
class DbPropertyBuildingType {
  late Id id;
  late String name;
  bool isForAgricultureOnly = false;
  @ignore
  bool isSelected = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPropertyBuildingType &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @ignore
  @override
  int get hashCode => id.hashCode;
}
