import 'package:isar/isar.dart';

part 'db_property_amenity.g.dart';

@collection
class DbPropertyAmenity {
  Id id = Isar.autoIncrement;
  int? userId;
  late String name;
  String? assetPath;
  @ignore
  bool isSelected = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPropertyAmenity &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @ignore
  @override
  int get hashCode => id.hashCode;
}
