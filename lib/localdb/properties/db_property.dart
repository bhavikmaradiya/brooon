import 'package:isar/isar.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../save_default_data.dart';

part 'db_property.g.dart';

@collection
class DbProperty {
  Id id = Isar.autoIncrement;
  String? propertyId;
  int? userId;
  late String propertyName;
  late int propertyTypeId;
  late String propertyTypeValue;
  late int propertyStatusId;
  late String propertyStatusValue;

  // BELOW ONE INDICATES CLOSED OR NOT CLOSED
  late int propertySoldStatusId;
  late DateTime addedAt;
  late DateTime updatedAt;
  int? propertyFurnishedStatusId;
  double? latitude; // chosen from map
  double? longitude; // chosen from map
  String? area; // chosen from map
  String? addressLandMark; // added manually
  int? roomCount;
  int? bathRoomCount;
  int? floorCount;
  int? totalFloorCount;
  List<String>? amenitiesValues;
  List<String>? preferredCommunityValues;
  String? sellerName;
  String? sellerPhoneNo;
  String? sellerEmail;
  int? brokerChain;
  int? priceUnitId;
  String? priceUnitValue;
  double? propertyAreaSize;
  int? propertyAreaUnitId;
  String? propertyAreaUnitValue;
  double? propertySellPricePerArea;
  double? propertyRentPricePerArea;
  double? propertyLeasePricePerArea;
  int? propertyPricePerAreaUnitId;
  String? propertyPricePerAreaUnitValue;

  // same name is used under restore db - isar import statement
  // so if we change name of key here then change at isar_service.dart -> importDb()
  List<String>? photos;
  bool sharedByBrooon = false;
  int? brooonId;
  String? brooonCode;
  String? brooonName;
  String? brooonPhoto;
  String? brooonPhone;
  int? visitorCount;

  int? buildingTypeId;
  int? facingId;
  bool? isCornerPiece;
  List<double>? connectedRoads;
  bool? lightConnection;
  bool? isWellAvailable;
  int? schemeTypeId;
  int? bhkId;
  double? frontSize;
  double? depthSize;
  int? frontSizeUnitId;
  int? depthSizeUnitId;
  String? frontSizeUnitValue;
  String? depthSizeUnitValue;
  int? constructionTypeId;
  bool? isParkingAvailable;
  bool? isLiftAvailable;
  bool? isAllottedParking;
  bool? isWashRoomAvailable;

  String? closedDealBuyerName;
  String? closedDealBuyerPhoneNo;
  String? closedDealNotes;
  String? closedLinkedInquiryId;

  List<String>? tags;
  bool exchangeAllowed = false;
  bool negotiationAllowed = false;
  String? comments;
  bool isPublicProperty = false;
  bool isSyncedWithServer = false;
  bool isEdit = false;

  List<String> unmatchInquiries = List.empty(growable: true);
  bool isFavorite = false;

  List<int>? propertyForIds;
  List<String>? propertyForValues;
  double? minSellPrice;
  int minSellPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  double? maxSellPrice;
  int maxSellPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  double? minRentPrice;
  int minRentPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  double? maxRentPrice;
  int maxRentPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  double? minLeasePrice;
  int minLeasePriceUnit = SaveDefaultData.filterPriceUnitThousand;
  double? maxLeasePrice;
  int maxLeasePriceUnit = SaveDefaultData.filterPriceUnitThousand;
  List<String>? additionalFurnishing;
  bool? balcony;

  // BELOW ONE IS INDICATES -> CLOSED WITH SOLD (1) / RENTED (2) / LEASED (3) :- check: CloseDealDialogProvider
  int? closeDealId;

  // start: below will be shared to server - publicly visible
  double? publicLatitude; // chosen from map / google autocomplete search
  double? publicLongitude; // chosen from map / google autocomplete search
  String? publicArea;  // chosen from map / google autocomplete search
  String? publicAddressLandMark; // added manually
  // end

  @ignore
  bool isSelected = false;
  @ignore
  Symbol? marker;

  // currently hero tag key used for home to detail screen effect
  @ignore
  String? customHeroTagKey = '';
  @ignore
  double? distance = 0;

  @ignore
  bool isReadOnly = false;

  @ignore //used for caching related inquiries counts
  int? lastMatchingInquiryCount;

  @ignore
  int? associationId;
  @ignore
  String? associationCode;
  @ignore
  String? associationPhoto;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbProperty &&
          runtimeType == other.runtimeType &&
          propertyId == other.propertyId;

  @ignore
  @override
  int get hashCode => propertyId.hashCode;
}
