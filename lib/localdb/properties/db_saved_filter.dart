import 'package:isar/isar.dart';

import '../save_default_data.dart';

part 'db_saved_filter.g.dart';

@collection
class DbSavedFilter {
  Id id = Isar.autoIncrement;
  String? inquiryId;
  bool isFromBuyer = false;
  int? userId;
  String? stringQuery;
  String filterName = '';
  String buyerName = '';
  String mobileNo = '';
  String? notes;
  List<int>? filterSearchBy;
  List<int>? propertyFor;
  List<String>? propertyForValues;
  List<int>? propertyType;
  List<String>? propertyTypeValues;
  int? inquiryStatusId;
  String? inquiryStatusValue;
  int? measureUnit;
  String? measureUnitValue;
  int sellMaxPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  int sellMinPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  int rentMaxPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  int rentMinPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  int leaseMaxPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  int leaseMinPriceUnit = SaveDefaultData.filterPriceUnitThousand;
  double? minMeasure;
  double? maxMeasure;
  double? frontSize;
  double? depthSize;
  double? sellPriceRangeMin;
  double? sellPriceRangeMax;
  double? rentPriceRangeMin;
  double? rentPriceRangeMax;
  double? leasePriceRangeMin;
  double? leasePriceRangeMax;
  double? sellMinPricePerSize;
  double? sellMaxPricePerSize;
  double? rentMinPricePerSize;
  double? rentMaxPricePerSize;
  double? leaseMinPricePerSize;
  double? leaseMaxPricePerSize;
  List<int>? constructionType;
  List<int>? schemeType;
  List<int>? furnishedType;
  List<String>? additionalFurnish;
  List<int>? facingType;
  List<double>? connectedRoads;
  List<int>? bhkIds;
  List<int>? buildingType;
  List<String>? selectedAmenities;
  List<String>? preferredCaste;
  bool? isWashroomAvailable;
  bool? isBalconyAvailable;
  bool? isCornerPiece;
  bool? isLightConnectionAvailable;
  bool? isWellAvailable;
  bool? isParkingAvailable;
  bool? isLiftAvailable;
  bool? isAllottedParkingAvailable;
  bool includeInactiveProperty = false;
  bool includeClosedProperty = false;
  bool isNegotiable = false;
  bool isPublicInquiry = false;
  int? bathroomCount;
  int? roomCount;
  int? floorCount;
  int? totalFloorCount;
  late DateTime addedAt;
  late DateTime updatedAt;

  String? location; // added manually
  String? area; // chosen from map / google autocomplete search
  double? latitude; // chosen from map / google autocomplete search
  double? longitude; // chosen from map / google autocomplete search

  @ignore //used for caching related properties counts
  int? lastPropertyCount;

  // BELOW ONE IS INDICATES -> CLOSED WITH SOLD (1) / RENTED (2) / LEASED (3) :- check: CloseDealDialogProvider
  int? closeDealId;

  // BELOW ONE INDICATES CLOSED OR NOT CLOSED
  int? inquirySoldStatusId;
  bool isSyncedWithServer = false;

  List<String> unmatchProperties = List.empty(growable: true);
  bool isFavorite = false;

  String? closedDealSellerName;
  String? closedDealSellerPhoneNo;
  String? closedDealNotes;
  String? closedLinkedPropertyId;

  bool sharedByBrooon = false;
  int? brooonId;
  String? brooonCode;
  String? brooonName;
  String? brooonPhoto;
  String? brooonPhone;

  @ignore
  double? distance = 0;

  @ignore
  bool isReadOnly = false;

  @ignore //used for caching related properties counts
  int? lastMatchingPropertyCount;

  @ignore
  int? associationId;
  @ignore
  String? associationCode;
  @ignore
  String? associationPhoto;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbSavedFilter &&
          runtimeType == other.runtimeType &&
          ((inquiryId != null && inquiryId == other.inquiryId) ||
              (inquiryId == null && id == other.id));

  @ignore
  @override
  int get hashCode => inquiryId.hashCode;
}
