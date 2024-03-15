import 'package:isar/isar.dart';

part 'db_property_preferred_cast.g.dart';

@collection
class DbPropertyPreferredCast {
  Id id = Isar.autoIncrement;
  int? userId;
  late String name;
  @ignore
  bool isSelected = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPropertyPreferredCast &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @ignore
  @override
  int get hashCode => name.hashCode;
}
