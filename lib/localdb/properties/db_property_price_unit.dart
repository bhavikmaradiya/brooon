import 'package:isar/isar.dart';

part 'db_property_price_unit.g.dart';

@collection
class DbPropertyPriceUnit {
  late Id id;
  late String unit;
  bool isDefaultUnit = false;
}
