import 'package:isar/isar.dart';

part 'db_additional_furnish.g.dart';

@collection
class DbAdditionalFurnish {
  Id id = Isar.autoIncrement;
  late String name;
  @ignore
  bool isSelected = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbAdditionalFurnish &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @ignore
  @override
  int get hashCode => id.hashCode;
}
