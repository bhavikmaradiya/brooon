import './buyer_seller_enum.dart';
import '../../../localdb/properties/db_property.dart';
import '../../../localdb/properties/db_saved_filter.dart';

class BuyerSellerInfo {
  int? propertyId;
  String? name;
  String? phone;
  List<DbSavedFilter>? inquiries;
  List<DbProperty>? properties;
  int propertyCount;
  int inquiryCount;
  BuyerSellerViewType showDataFor;
  BuyerSellerType buyerSellerType;

  BuyerSellerInfo({
    required this.propertyId,
    required this.name,
    required this.phone,
    this.showDataFor = BuyerSellerViewType.properties,
    required this.buyerSellerType,
    this.inquiries,
    this.properties,
    this.propertyCount = 0,
    this.inquiryCount = 0,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyerSellerInfo &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          phone == other.phone;

  @override
  int get hashCode => name.hashCode ^ phone.hashCode;
}
