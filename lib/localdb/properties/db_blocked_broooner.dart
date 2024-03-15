import 'package:isar/isar.dart';

part 'db_blocked_broooner.g.dart';

@collection
class DbBlockedBroooner {
  Id id = Isar.autoIncrement;
  late int userId;
  late int brooonId;
  late String brooonCode;
  String? brooonName;
  String? brooonPhoto;
  String? brooonPhone;
  late DateTime createdAt;
  late DateTime updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbBlockedBroooner &&
          runtimeType == other.runtimeType &&
          brooonId == other.brooonId &&
          brooonCode == other.brooonCode;

  @ignore
  @override
  int get hashCode => brooonId.hashCode ^ brooonCode.hashCode;
}
