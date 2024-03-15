import 'package:isar/isar.dart';

part 'db_status_sync.g.dart';

@collection
class DbStatusSync {
  Id id = Isar.autoIncrement;
  late int userId;
  late String syncType;
  late String statusType;
  String? propertyId;
  String? inquiryId;
  int? closeDealId;
  String? status;
  bool? isPublic;
  String? closedDealBuyerSellerName;
  String? closedDealBuyerSellerMobile;
  String? closedDealBuyerSellerNotes;
  String? closedDealPropertyInquiryId;
}
