
import 'package:isar/isar.dart';

part 'db_property_scheme_type.g.dart';

@collection
class DbPropertySchemeType {
  late Id id;
  late String name;
  @ignore
  bool isSelected = false;
}