import 'package:isar/isar.dart';

part 'db_property_bhk_type.g.dart';

@collection
class DbPropertyBhkType {
  late Id id;
  late String name;
  @ignore
  bool isSelected = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPropertyBhkType &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @ignore
  @override
  int get hashCode => id.hashCode;
}
