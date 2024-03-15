

import 'package:isar/isar.dart';

part 'db_property_for.g.dart';

@collection
class DbPropertyFor {
  late Id id;
  late String name;
  @ignore
  bool isSelected = false;
}