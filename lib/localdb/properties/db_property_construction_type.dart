
import 'package:isar/isar.dart';

part 'db_property_construction_type.g.dart';

@collection
class DbPropertyConstructionType {
  late Id id;
  late String name;
  @ignore
  bool isSelected = false;
}