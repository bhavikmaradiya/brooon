import '../../../localdb/properties/db_property.dart';
import '../../../localdb/properties/db_saved_filter.dart';
import '../../buyers_sellers/model/buyer_seller_info.dart';

enum ViewAllTabsVisibilityType {
  fromHomeSearchByTyping,
  fromPropertiesInquiriesBothFilter,
  fromPropertiesFilter,
  fromInquiriesFilter,
  fromHomeViewAllMyProperties,
  fromHomeViewAllMyInquiries,
  fromHomePropertiesType,
  fromHomeInquiriesType,
  fromHomeViewAllBrooonProperties,
  fromHomeViewAllBrooonInquiries,
  fromHomeNearBy,
  fromBuyersInquiries,
  fromBuyersMatchingProperties,
  fromSellersProperties,
  fromSellersMatchingInquiries,
  fromClosedDeals,
  fromPropertiesNotification,
  fromInquiriesNotification,
  fromAddInquiries, // Here need to show matching properties, so only my properties tab will be visible
  fromAddProperties,
  fromDrawerProperties,
  fromDrawerInquiries,
  fromDrawerInActives,
  fromAddPropertyInquiryWithFilter, // Here after adding property / inquiry need to show screen according filter applied
  fromUnMatch,
  fromFavorite,
  fromMatchingInquiries,
  fromMatchingProperties,
}

enum ViewAllFromType {
  properties,
  brooonProperties,
  brooonInquiries,
  nearBy,
  recentlyAdded,
  filter,
  searchList,
  buyers,
  sellers,
  closedDeals,
  inActives,
  unMatches,
  matches,
  favorite,
}

class ViewAllScreenArg {
  String heading;
  int count;
  ViewAllFromType showDataFor;
  int? propertyTypeId;
  DbSavedFilter? filterObj;
  DbProperty? propertyToMatch;
  DbSavedFilter? inquiryToMatch;
  BuyerSellerInfo? buyerSellerInfo;
  bool? isFilterSearchByPropertiesInquiries;
  ViewAllTabsVisibilityType? viewAllFromToHandleTabs;
  bool isNeedToCallApiForMatchingBrooonItems;

  ViewAllScreenArg({
    required this.heading,
    required this.count,
    required this.showDataFor,
    required this.viewAllFromToHandleTabs,
    this.propertyTypeId,
    this.buyerSellerInfo,
    this.filterObj,
    this.inquiryToMatch,
    this.propertyToMatch,
    this.isFilterSearchByPropertiesInquiries,
    this.isNeedToCallApiForMatchingBrooonItems = false,
  });
}
