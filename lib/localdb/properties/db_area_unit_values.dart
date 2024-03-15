import 'package:isar/isar.dart';
part 'db_area_unit_values.g.dart';

@collection
class DbAreaUnitValue {
  Id id = Isar.autoIncrement;
  late int fromId;
  late int toId;
  late double value;
}
