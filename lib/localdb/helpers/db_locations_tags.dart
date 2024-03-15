import 'package:isar/isar.dart';

part 'db_locations_tags.g.dart';

@collection
class DbLocationTags {
  Id id = Isar.autoIncrement;
  String? tag;
  double? latitude;
  double? longitude;
}