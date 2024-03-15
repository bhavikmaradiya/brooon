import 'package:isar/isar.dart';

part 'db_purchased_status.g.dart';

@collection
class DbPurchasedStatus {
  Id id = Isar.autoIncrement;
  int? userId;
  int? planId;
  String? planType;
  String? purchaseID;
  String? productID;
  String? transactionDate;
  String? purchaseStatus;
  String? errorMessage;
  String? verificationToken;
  String? source;
  String? price;
  bool? uploadedToServer;
  DateTime? createdAt;
  DateTime? updatedAt;
}