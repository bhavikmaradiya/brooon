import 'package:isar/isar.dart';

part 'db_property_type.g.dart';

@collection
class DbPropertyType {
  late Id id;
  late String name;
  late String assetPath;
  @ignore
  bool isSelected = false;
  @ignore //used for caching related properties counts
  int? lastPropertyCount;
  @ignore //used for caching related inquiries counts
  int? lastInquiryCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPropertyType &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @ignore
  @override
  int get hashCode => id.hashCode;
}
