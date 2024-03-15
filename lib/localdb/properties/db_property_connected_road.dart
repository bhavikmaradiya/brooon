
import 'package:isar/isar.dart';

part 'db_property_connected_road.g.dart';

@collection
class DbPropertyConnectedRoad {
  late Id id;
  late String name;
  @ignore
  bool isSelected = false;
}