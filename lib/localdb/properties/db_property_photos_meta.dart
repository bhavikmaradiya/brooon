import 'package:isar/isar.dart';

part 'db_property_photos_meta.g.dart';

@collection
class DbPropertyPhotoMeta {
  Id id = Isar.autoIncrement;
  int? userId;
  late int propertyId;
  late String imagePath;

  //We are using this flag for preventing watermark image from generating again and again, and resetting flag on image changes
  bool isWatermarkGenerated = false;
}
