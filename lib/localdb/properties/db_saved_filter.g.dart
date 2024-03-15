// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_saved_filter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbSavedFilterCollection on Isar {
  IsarCollection<DbSavedFilter> get dbSavedFilters => this.collection();
}

const DbSavedFilterSchema = CollectionSchema(
  name: r'DbSavedFilter',
  id: 3150785360775549532,
  properties: {
    r'addedAt': PropertySchema(
      id: 0,
      name: r'addedAt',
      type: IsarType.dateTime,
    ),
    r'additionalFurnish': PropertySchema(
      id: 1,
      name: r'additionalFurnish',
      type: IsarType.stringList,
    ),
    r'area': PropertySchema(
      id: 2,
      name: r'area',
      type: IsarType.string,
    ),
    r'associationCode': PropertySchema(
      id: 3,
      name: r'associationCode',
      type: IsarType.string,
    ),
    r'associationPhoto': PropertySchema(
      id: 4,
      name: r'associationPhoto',
      type: IsarType.string,
    ),
    r'bathroomCount': PropertySchema(
      id: 5,
      name: r'bathroomCount',
      type: IsarType.long,
    ),
    r'bhkIds': PropertySchema(
      id: 6,
      name: r'bhkIds',
      type: IsarType.longList,
    ),
    r'brooonCode': PropertySchema(
      id: 7,
      name: r'brooonCode',
      type: IsarType.string,
    ),
    r'brooonId': PropertySchema(
      id: 8,
      name: r'brooonId',
      type: IsarType.long,
    ),
    r'brooonName': PropertySchema(
      id: 9,
      name: r'brooonName',
      type: IsarType.string,
    ),
    r'brooonPhone': PropertySchema(
      id: 10,
      name: r'brooonPhone',
      type: IsarType.string,
    ),
    r'brooonPhoto': PropertySchema(
      id: 11,
      name: r'brooonPhoto',
      type: IsarType.string,
    ),
    r'buildingType': PropertySchema(
      id: 12,
      name: r'buildingType',
      type: IsarType.longList,
    ),
    r'buyerName': PropertySchema(
      id: 13,
      name: r'buyerName',
      type: IsarType.string,
    ),
    r'closeDealId': PropertySchema(
      id: 14,
      name: r'closeDealId',
      type: IsarType.long,
    ),
    r'closedDealNotes': PropertySchema(
      id: 15,
      name: r'closedDealNotes',
      type: IsarType.string,
    ),
    r'closedDealSellerName': PropertySchema(
      id: 16,
      name: r'closedDealSellerName',
      type: IsarType.string,
    ),
    r'closedDealSellerPhoneNo': PropertySchema(
      id: 17,
      name: r'closedDealSellerPhoneNo',
      type: IsarType.string,
    ),
    r'closedLinkedPropertyId': PropertySchema(
      id: 18,
      name: r'closedLinkedPropertyId',
      type: IsarType.string,
    ),
    r'connectedRoads': PropertySchema(
      id: 19,
      name: r'connectedRoads',
      type: IsarType.doubleList,
    ),
    r'constructionType': PropertySchema(
      id: 20,
      name: r'constructionType',
      type: IsarType.longList,
    ),
    r'depthSize': PropertySchema(
      id: 21,
      name: r'depthSize',
      type: IsarType.double,
    ),
    r'facingType': PropertySchema(
      id: 22,
      name: r'facingType',
      type: IsarType.longList,
    ),
    r'filterName': PropertySchema(
      id: 23,
      name: r'filterName',
      type: IsarType.string,
    ),
    r'filterSearchBy': PropertySchema(
      id: 24,
      name: r'filterSearchBy',
      type: IsarType.longList,
    ),
    r'floorCount': PropertySchema(
      id: 25,
      name: r'floorCount',
      type: IsarType.long,
    ),
    r'frontSize': PropertySchema(
      id: 26,
      name: r'frontSize',
      type: IsarType.double,
    ),
    r'furnishedType': PropertySchema(
      id: 27,
      name: r'furnishedType',
      type: IsarType.longList,
    ),
    r'includeClosedProperty': PropertySchema(
      id: 28,
      name: r'includeClosedProperty',
      type: IsarType.bool,
    ),
    r'includeInactiveProperty': PropertySchema(
      id: 29,
      name: r'includeInactiveProperty',
      type: IsarType.bool,
    ),
    r'inquiryId': PropertySchema(
      id: 30,
      name: r'inquiryId',
      type: IsarType.string,
    ),
    r'inquirySoldStatusId': PropertySchema(
      id: 31,
      name: r'inquirySoldStatusId',
      type: IsarType.long,
    ),
    r'inquiryStatusId': PropertySchema(
      id: 32,
      name: r'inquiryStatusId',
      type: IsarType.long,
    ),
    r'inquiryStatusValue': PropertySchema(
      id: 33,
      name: r'inquiryStatusValue',
      type: IsarType.string,
    ),
    r'isAllottedParkingAvailable': PropertySchema(
      id: 34,
      name: r'isAllottedParkingAvailable',
      type: IsarType.bool,
    ),
    r'isBalconyAvailable': PropertySchema(
      id: 35,
      name: r'isBalconyAvailable',
      type: IsarType.bool,
    ),
    r'isCornerPiece': PropertySchema(
      id: 36,
      name: r'isCornerPiece',
      type: IsarType.bool,
    ),
    r'isFavorite': PropertySchema(
      id: 37,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'isFromBuyer': PropertySchema(
      id: 38,
      name: r'isFromBuyer',
      type: IsarType.bool,
    ),
    r'isLiftAvailable': PropertySchema(
      id: 39,
      name: r'isLiftAvailable',
      type: IsarType.bool,
    ),
    r'isLightConnectionAvailable': PropertySchema(
      id: 40,
      name: r'isLightConnectionAvailable',
      type: IsarType.bool,
    ),
    r'isNegotiable': PropertySchema(
      id: 41,
      name: r'isNegotiable',
      type: IsarType.bool,
    ),
    r'isParkingAvailable': PropertySchema(
      id: 42,
      name: r'isParkingAvailable',
      type: IsarType.bool,
    ),
    r'isPublicInquiry': PropertySchema(
      id: 43,
      name: r'isPublicInquiry',
      type: IsarType.bool,
    ),
    r'isSyncedWithServer': PropertySchema(
      id: 44,
      name: r'isSyncedWithServer',
      type: IsarType.bool,
    ),
    r'isWashroomAvailable': PropertySchema(
      id: 45,
      name: r'isWashroomAvailable',
      type: IsarType.bool,
    ),
    r'isWellAvailable': PropertySchema(
      id: 46,
      name: r'isWellAvailable',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 47,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'leaseMaxPricePerSize': PropertySchema(
      id: 48,
      name: r'leaseMaxPricePerSize',
      type: IsarType.double,
    ),
    r'leaseMaxPriceUnit': PropertySchema(
      id: 49,
      name: r'leaseMaxPriceUnit',
      type: IsarType.long,
    ),
    r'leaseMinPricePerSize': PropertySchema(
      id: 50,
      name: r'leaseMinPricePerSize',
      type: IsarType.double,
    ),
    r'leaseMinPriceUnit': PropertySchema(
      id: 51,
      name: r'leaseMinPriceUnit',
      type: IsarType.long,
    ),
    r'leasePriceRangeMax': PropertySchema(
      id: 52,
      name: r'leasePriceRangeMax',
      type: IsarType.double,
    ),
    r'leasePriceRangeMin': PropertySchema(
      id: 53,
      name: r'leasePriceRangeMin',
      type: IsarType.double,
    ),
    r'location': PropertySchema(
      id: 54,
      name: r'location',
      type: IsarType.string,
    ),
    r'longitude': PropertySchema(
      id: 55,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'maxMeasure': PropertySchema(
      id: 56,
      name: r'maxMeasure',
      type: IsarType.double,
    ),
    r'measureUnit': PropertySchema(
      id: 57,
      name: r'measureUnit',
      type: IsarType.long,
    ),
    r'measureUnitValue': PropertySchema(
      id: 58,
      name: r'measureUnitValue',
      type: IsarType.string,
    ),
    r'minMeasure': PropertySchema(
      id: 59,
      name: r'minMeasure',
      type: IsarType.double,
    ),
    r'mobileNo': PropertySchema(
      id: 60,
      name: r'mobileNo',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 61,
      name: r'notes',
      type: IsarType.string,
    ),
    r'preferredCaste': PropertySchema(
      id: 62,
      name: r'preferredCaste',
      type: IsarType.stringList,
    ),
    r'propertyFor': PropertySchema(
      id: 63,
      name: r'propertyFor',
      type: IsarType.longList,
    ),
    r'propertyForValues': PropertySchema(
      id: 64,
      name: r'propertyForValues',
      type: IsarType.stringList,
    ),
    r'propertyType': PropertySchema(
      id: 65,
      name: r'propertyType',
      type: IsarType.longList,
    ),
    r'propertyTypeValues': PropertySchema(
      id: 66,
      name: r'propertyTypeValues',
      type: IsarType.stringList,
    ),
    r'rentMaxPricePerSize': PropertySchema(
      id: 67,
      name: r'rentMaxPricePerSize',
      type: IsarType.double,
    ),
    r'rentMaxPriceUnit': PropertySchema(
      id: 68,
      name: r'rentMaxPriceUnit',
      type: IsarType.long,
    ),
    r'rentMinPricePerSize': PropertySchema(
      id: 69,
      name: r'rentMinPricePerSize',
      type: IsarType.double,
    ),
    r'rentMinPriceUnit': PropertySchema(
      id: 70,
      name: r'rentMinPriceUnit',
      type: IsarType.long,
    ),
    r'rentPriceRangeMax': PropertySchema(
      id: 71,
      name: r'rentPriceRangeMax',
      type: IsarType.double,
    ),
    r'rentPriceRangeMin': PropertySchema(
      id: 72,
      name: r'rentPriceRangeMin',
      type: IsarType.double,
    ),
    r'roomCount': PropertySchema(
      id: 73,
      name: r'roomCount',
      type: IsarType.long,
    ),
    r'schemeType': PropertySchema(
      id: 74,
      name: r'schemeType',
      type: IsarType.longList,
    ),
    r'selectedAmenities': PropertySchema(
      id: 75,
      name: r'selectedAmenities',
      type: IsarType.stringList,
    ),
    r'sellMaxPricePerSize': PropertySchema(
      id: 76,
      name: r'sellMaxPricePerSize',
      type: IsarType.double,
    ),
    r'sellMaxPriceUnit': PropertySchema(
      id: 77,
      name: r'sellMaxPriceUnit',
      type: IsarType.long,
    ),
    r'sellMinPricePerSize': PropertySchema(
      id: 78,
      name: r'sellMinPricePerSize',
      type: IsarType.double,
    ),
    r'sellMinPriceUnit': PropertySchema(
      id: 79,
      name: r'sellMinPriceUnit',
      type: IsarType.long,
    ),
    r'sellPriceRangeMax': PropertySchema(
      id: 80,
      name: r'sellPriceRangeMax',
      type: IsarType.double,
    ),
    r'sellPriceRangeMin': PropertySchema(
      id: 81,
      name: r'sellPriceRangeMin',
      type: IsarType.double,
    ),
    r'sharedByBrooon': PropertySchema(
      id: 82,
      name: r'sharedByBrooon',
      type: IsarType.bool,
    ),
    r'stringQuery': PropertySchema(
      id: 83,
      name: r'stringQuery',
      type: IsarType.string,
    ),
    r'totalFloorCount': PropertySchema(
      id: 84,
      name: r'totalFloorCount',
      type: IsarType.long,
    ),
    r'unmatchProperties': PropertySchema(
      id: 85,
      name: r'unmatchProperties',
      type: IsarType.stringList,
    ),
    r'updatedAt': PropertySchema(
      id: 86,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 87,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _dbSavedFilterEstimateSize,
  serialize: _dbSavedFilterSerialize,
  deserialize: _dbSavedFilterDeserialize,
  deserializeProp: _dbSavedFilterDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbSavedFilterGetId,
  getLinks: _dbSavedFilterGetLinks,
  attach: _dbSavedFilterAttach,
  version: '3.0.5',
);

int _dbSavedFilterEstimateSize(
  DbSavedFilter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.additionalFurnish;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.area;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.associationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.associationPhoto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bhkIds;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.brooonCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.brooonName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.brooonPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.brooonPhoto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.buildingType;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.buyerName.length * 3;
  {
    final value = object.closedDealNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDealSellerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDealSellerPhoneNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedLinkedPropertyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.connectedRoads;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.constructionType;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.facingType;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.filterName.length * 3;
  {
    final value = object.filterSearchBy;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.furnishedType;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.inquiryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.inquiryStatusValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.measureUnitValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.mobileNo.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.preferredCaste;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.propertyFor;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.propertyForValues;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.propertyType;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.propertyTypeValues;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.schemeType;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.selectedAmenities;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.stringQuery;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unmatchProperties.length * 3;
  {
    for (var i = 0; i < object.unmatchProperties.length; i++) {
      final value = object.unmatchProperties[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _dbSavedFilterSerialize(
  DbSavedFilter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedAt);
  writer.writeStringList(offsets[1], object.additionalFurnish);
  writer.writeString(offsets[2], object.area);
  writer.writeString(offsets[3], object.associationCode);
  writer.writeString(offsets[4], object.associationPhoto);
  writer.writeLong(offsets[5], object.bathroomCount);
  writer.writeLongList(offsets[6], object.bhkIds);
  writer.writeString(offsets[7], object.brooonCode);
  writer.writeLong(offsets[8], object.brooonId);
  writer.writeString(offsets[9], object.brooonName);
  writer.writeString(offsets[10], object.brooonPhone);
  writer.writeString(offsets[11], object.brooonPhoto);
  writer.writeLongList(offsets[12], object.buildingType);
  writer.writeString(offsets[13], object.buyerName);
  writer.writeLong(offsets[14], object.closeDealId);
  writer.writeString(offsets[15], object.closedDealNotes);
  writer.writeString(offsets[16], object.closedDealSellerName);
  writer.writeString(offsets[17], object.closedDealSellerPhoneNo);
  writer.writeString(offsets[18], object.closedLinkedPropertyId);
  writer.writeDoubleList(offsets[19], object.connectedRoads);
  writer.writeLongList(offsets[20], object.constructionType);
  writer.writeDouble(offsets[21], object.depthSize);
  writer.writeLongList(offsets[22], object.facingType);
  writer.writeString(offsets[23], object.filterName);
  writer.writeLongList(offsets[24], object.filterSearchBy);
  writer.writeLong(offsets[25], object.floorCount);
  writer.writeDouble(offsets[26], object.frontSize);
  writer.writeLongList(offsets[27], object.furnishedType);
  writer.writeBool(offsets[28], object.includeClosedProperty);
  writer.writeBool(offsets[29], object.includeInactiveProperty);
  writer.writeString(offsets[30], object.inquiryId);
  writer.writeLong(offsets[31], object.inquirySoldStatusId);
  writer.writeLong(offsets[32], object.inquiryStatusId);
  writer.writeString(offsets[33], object.inquiryStatusValue);
  writer.writeBool(offsets[34], object.isAllottedParkingAvailable);
  writer.writeBool(offsets[35], object.isBalconyAvailable);
  writer.writeBool(offsets[36], object.isCornerPiece);
  writer.writeBool(offsets[37], object.isFavorite);
  writer.writeBool(offsets[38], object.isFromBuyer);
  writer.writeBool(offsets[39], object.isLiftAvailable);
  writer.writeBool(offsets[40], object.isLightConnectionAvailable);
  writer.writeBool(offsets[41], object.isNegotiable);
  writer.writeBool(offsets[42], object.isParkingAvailable);
  writer.writeBool(offsets[43], object.isPublicInquiry);
  writer.writeBool(offsets[44], object.isSyncedWithServer);
  writer.writeBool(offsets[45], object.isWashroomAvailable);
  writer.writeBool(offsets[46], object.isWellAvailable);
  writer.writeDouble(offsets[47], object.latitude);
  writer.writeDouble(offsets[48], object.leaseMaxPricePerSize);
  writer.writeLong(offsets[49], object.leaseMaxPriceUnit);
  writer.writeDouble(offsets[50], object.leaseMinPricePerSize);
  writer.writeLong(offsets[51], object.leaseMinPriceUnit);
  writer.writeDouble(offsets[52], object.leasePriceRangeMax);
  writer.writeDouble(offsets[53], object.leasePriceRangeMin);
  writer.writeString(offsets[54], object.location);
  writer.writeDouble(offsets[55], object.longitude);
  writer.writeDouble(offsets[56], object.maxMeasure);
  writer.writeLong(offsets[57], object.measureUnit);
  writer.writeString(offsets[58], object.measureUnitValue);
  writer.writeDouble(offsets[59], object.minMeasure);
  writer.writeString(offsets[60], object.mobileNo);
  writer.writeString(offsets[61], object.notes);
  writer.writeStringList(offsets[62], object.preferredCaste);
  writer.writeLongList(offsets[63], object.propertyFor);
  writer.writeStringList(offsets[64], object.propertyForValues);
  writer.writeLongList(offsets[65], object.propertyType);
  writer.writeStringList(offsets[66], object.propertyTypeValues);
  writer.writeDouble(offsets[67], object.rentMaxPricePerSize);
  writer.writeLong(offsets[68], object.rentMaxPriceUnit);
  writer.writeDouble(offsets[69], object.rentMinPricePerSize);
  writer.writeLong(offsets[70], object.rentMinPriceUnit);
  writer.writeDouble(offsets[71], object.rentPriceRangeMax);
  writer.writeDouble(offsets[72], object.rentPriceRangeMin);
  writer.writeLong(offsets[73], object.roomCount);
  writer.writeLongList(offsets[74], object.schemeType);
  writer.writeStringList(offsets[75], object.selectedAmenities);
  writer.writeDouble(offsets[76], object.sellMaxPricePerSize);
  writer.writeLong(offsets[77], object.sellMaxPriceUnit);
  writer.writeDouble(offsets[78], object.sellMinPricePerSize);
  writer.writeLong(offsets[79], object.sellMinPriceUnit);
  writer.writeDouble(offsets[80], object.sellPriceRangeMax);
  writer.writeDouble(offsets[81], object.sellPriceRangeMin);
  writer.writeBool(offsets[82], object.sharedByBrooon);
  writer.writeString(offsets[83], object.stringQuery);
  writer.writeLong(offsets[84], object.totalFloorCount);
  writer.writeStringList(offsets[85], object.unmatchProperties);
  writer.writeDateTime(offsets[86], object.updatedAt);
  writer.writeLong(offsets[87], object.userId);
}

DbSavedFilter _dbSavedFilterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbSavedFilter();
  object.addedAt = reader.readDateTime(offsets[0]);
  object.additionalFurnish = reader.readStringList(offsets[1]);
  object.area = reader.readStringOrNull(offsets[2]);
  object.associationCode = reader.readStringOrNull(offsets[3]);
  object.associationPhoto = reader.readStringOrNull(offsets[4]);
  object.bathroomCount = reader.readLongOrNull(offsets[5]);
  object.bhkIds = reader.readLongList(offsets[6]);
  object.brooonCode = reader.readStringOrNull(offsets[7]);
  object.brooonId = reader.readLongOrNull(offsets[8]);
  object.brooonName = reader.readStringOrNull(offsets[9]);
  object.brooonPhone = reader.readStringOrNull(offsets[10]);
  object.brooonPhoto = reader.readStringOrNull(offsets[11]);
  object.buildingType = reader.readLongList(offsets[12]);
  object.buyerName = reader.readString(offsets[13]);
  object.closeDealId = reader.readLongOrNull(offsets[14]);
  object.closedDealNotes = reader.readStringOrNull(offsets[15]);
  object.closedDealSellerName = reader.readStringOrNull(offsets[16]);
  object.closedDealSellerPhoneNo = reader.readStringOrNull(offsets[17]);
  object.closedLinkedPropertyId = reader.readStringOrNull(offsets[18]);
  object.connectedRoads = reader.readDoubleList(offsets[19]);
  object.constructionType = reader.readLongList(offsets[20]);
  object.depthSize = reader.readDoubleOrNull(offsets[21]);
  object.facingType = reader.readLongList(offsets[22]);
  object.filterName = reader.readString(offsets[23]);
  object.filterSearchBy = reader.readLongList(offsets[24]);
  object.floorCount = reader.readLongOrNull(offsets[25]);
  object.frontSize = reader.readDoubleOrNull(offsets[26]);
  object.furnishedType = reader.readLongList(offsets[27]);
  object.id = id;
  object.includeClosedProperty = reader.readBool(offsets[28]);
  object.includeInactiveProperty = reader.readBool(offsets[29]);
  object.inquiryId = reader.readStringOrNull(offsets[30]);
  object.inquirySoldStatusId = reader.readLongOrNull(offsets[31]);
  object.inquiryStatusId = reader.readLongOrNull(offsets[32]);
  object.inquiryStatusValue = reader.readStringOrNull(offsets[33]);
  object.isAllottedParkingAvailable = reader.readBoolOrNull(offsets[34]);
  object.isBalconyAvailable = reader.readBoolOrNull(offsets[35]);
  object.isCornerPiece = reader.readBoolOrNull(offsets[36]);
  object.isFavorite = reader.readBool(offsets[37]);
  object.isFromBuyer = reader.readBool(offsets[38]);
  object.isLiftAvailable = reader.readBoolOrNull(offsets[39]);
  object.isLightConnectionAvailable = reader.readBoolOrNull(offsets[40]);
  object.isNegotiable = reader.readBool(offsets[41]);
  object.isParkingAvailable = reader.readBoolOrNull(offsets[42]);
  object.isPublicInquiry = reader.readBool(offsets[43]);
  object.isSyncedWithServer = reader.readBool(offsets[44]);
  object.isWashroomAvailable = reader.readBoolOrNull(offsets[45]);
  object.isWellAvailable = reader.readBoolOrNull(offsets[46]);
  object.latitude = reader.readDoubleOrNull(offsets[47]);
  object.leaseMaxPricePerSize = reader.readDoubleOrNull(offsets[48]);
  object.leaseMaxPriceUnit = reader.readLong(offsets[49]);
  object.leaseMinPricePerSize = reader.readDoubleOrNull(offsets[50]);
  object.leaseMinPriceUnit = reader.readLong(offsets[51]);
  object.leasePriceRangeMax = reader.readDoubleOrNull(offsets[52]);
  object.leasePriceRangeMin = reader.readDoubleOrNull(offsets[53]);
  object.location = reader.readStringOrNull(offsets[54]);
  object.longitude = reader.readDoubleOrNull(offsets[55]);
  object.maxMeasure = reader.readDoubleOrNull(offsets[56]);
  object.measureUnit = reader.readLongOrNull(offsets[57]);
  object.measureUnitValue = reader.readStringOrNull(offsets[58]);
  object.minMeasure = reader.readDoubleOrNull(offsets[59]);
  object.mobileNo = reader.readString(offsets[60]);
  object.notes = reader.readStringOrNull(offsets[61]);
  object.preferredCaste = reader.readStringList(offsets[62]);
  object.propertyFor = reader.readLongList(offsets[63]);
  object.propertyForValues = reader.readStringList(offsets[64]);
  object.propertyType = reader.readLongList(offsets[65]);
  object.propertyTypeValues = reader.readStringList(offsets[66]);
  object.rentMaxPricePerSize = reader.readDoubleOrNull(offsets[67]);
  object.rentMaxPriceUnit = reader.readLong(offsets[68]);
  object.rentMinPricePerSize = reader.readDoubleOrNull(offsets[69]);
  object.rentMinPriceUnit = reader.readLong(offsets[70]);
  object.rentPriceRangeMax = reader.readDoubleOrNull(offsets[71]);
  object.rentPriceRangeMin = reader.readDoubleOrNull(offsets[72]);
  object.roomCount = reader.readLongOrNull(offsets[73]);
  object.schemeType = reader.readLongList(offsets[74]);
  object.selectedAmenities = reader.readStringList(offsets[75]);
  object.sellMaxPricePerSize = reader.readDoubleOrNull(offsets[76]);
  object.sellMaxPriceUnit = reader.readLong(offsets[77]);
  object.sellMinPricePerSize = reader.readDoubleOrNull(offsets[78]);
  object.sellMinPriceUnit = reader.readLong(offsets[79]);
  object.sellPriceRangeMax = reader.readDoubleOrNull(offsets[80]);
  object.sellPriceRangeMin = reader.readDoubleOrNull(offsets[81]);
  object.sharedByBrooon = reader.readBool(offsets[82]);
  object.stringQuery = reader.readStringOrNull(offsets[83]);
  object.totalFloorCount = reader.readLongOrNull(offsets[84]);
  object.unmatchProperties = reader.readStringList(offsets[85]) ?? [];
  object.updatedAt = reader.readDateTime(offsets[86]);
  object.userId = reader.readLongOrNull(offsets[87]);
  return object;
}

P _dbSavedFilterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongList(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongList(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleList(offset)) as P;
    case 20:
      return (reader.readLongList(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readLongList(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readLongList(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readDoubleOrNull(offset)) as P;
    case 27:
      return (reader.readLongList(offset)) as P;
    case 28:
      return (reader.readBool(offset)) as P;
    case 29:
      return (reader.readBool(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readLongOrNull(offset)) as P;
    case 32:
      return (reader.readLongOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readBoolOrNull(offset)) as P;
    case 35:
      return (reader.readBoolOrNull(offset)) as P;
    case 36:
      return (reader.readBoolOrNull(offset)) as P;
    case 37:
      return (reader.readBool(offset)) as P;
    case 38:
      return (reader.readBool(offset)) as P;
    case 39:
      return (reader.readBoolOrNull(offset)) as P;
    case 40:
      return (reader.readBoolOrNull(offset)) as P;
    case 41:
      return (reader.readBool(offset)) as P;
    case 42:
      return (reader.readBoolOrNull(offset)) as P;
    case 43:
      return (reader.readBool(offset)) as P;
    case 44:
      return (reader.readBool(offset)) as P;
    case 45:
      return (reader.readBoolOrNull(offset)) as P;
    case 46:
      return (reader.readBoolOrNull(offset)) as P;
    case 47:
      return (reader.readDoubleOrNull(offset)) as P;
    case 48:
      return (reader.readDoubleOrNull(offset)) as P;
    case 49:
      return (reader.readLong(offset)) as P;
    case 50:
      return (reader.readDoubleOrNull(offset)) as P;
    case 51:
      return (reader.readLong(offset)) as P;
    case 52:
      return (reader.readDoubleOrNull(offset)) as P;
    case 53:
      return (reader.readDoubleOrNull(offset)) as P;
    case 54:
      return (reader.readStringOrNull(offset)) as P;
    case 55:
      return (reader.readDoubleOrNull(offset)) as P;
    case 56:
      return (reader.readDoubleOrNull(offset)) as P;
    case 57:
      return (reader.readLongOrNull(offset)) as P;
    case 58:
      return (reader.readStringOrNull(offset)) as P;
    case 59:
      return (reader.readDoubleOrNull(offset)) as P;
    case 60:
      return (reader.readString(offset)) as P;
    case 61:
      return (reader.readStringOrNull(offset)) as P;
    case 62:
      return (reader.readStringList(offset)) as P;
    case 63:
      return (reader.readLongList(offset)) as P;
    case 64:
      return (reader.readStringList(offset)) as P;
    case 65:
      return (reader.readLongList(offset)) as P;
    case 66:
      return (reader.readStringList(offset)) as P;
    case 67:
      return (reader.readDoubleOrNull(offset)) as P;
    case 68:
      return (reader.readLong(offset)) as P;
    case 69:
      return (reader.readDoubleOrNull(offset)) as P;
    case 70:
      return (reader.readLong(offset)) as P;
    case 71:
      return (reader.readDoubleOrNull(offset)) as P;
    case 72:
      return (reader.readDoubleOrNull(offset)) as P;
    case 73:
      return (reader.readLongOrNull(offset)) as P;
    case 74:
      return (reader.readLongList(offset)) as P;
    case 75:
      return (reader.readStringList(offset)) as P;
    case 76:
      return (reader.readDoubleOrNull(offset)) as P;
    case 77:
      return (reader.readLong(offset)) as P;
    case 78:
      return (reader.readDoubleOrNull(offset)) as P;
    case 79:
      return (reader.readLong(offset)) as P;
    case 80:
      return (reader.readDoubleOrNull(offset)) as P;
    case 81:
      return (reader.readDoubleOrNull(offset)) as P;
    case 82:
      return (reader.readBool(offset)) as P;
    case 83:
      return (reader.readStringOrNull(offset)) as P;
    case 84:
      return (reader.readLongOrNull(offset)) as P;
    case 85:
      return (reader.readStringList(offset) ?? []) as P;
    case 86:
      return (reader.readDateTime(offset)) as P;
    case 87:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbSavedFilterGetId(DbSavedFilter object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbSavedFilterGetLinks(DbSavedFilter object) {
  return [];
}

void _dbSavedFilterAttach(
    IsarCollection<dynamic> col, Id id, DbSavedFilter object) {
  object.id = id;
}

extension DbSavedFilterQueryWhereSort
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QWhere> {
  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbSavedFilterQueryWhere
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QWhereClause> {
  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbSavedFilterQueryFilter
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QFilterCondition> {
  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      addedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      addedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      addedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      addedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'additionalFurnish',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'additionalFurnish',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalFurnish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'additionalFurnish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'additionalFurnish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'additionalFurnish',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'additionalFurnish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'additionalFurnish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'additionalFurnish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'additionalFurnish',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalFurnish',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'additionalFurnish',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnish',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnish',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnish',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnish',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnish',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      additionalFurnishLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnish',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition> areaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition> areaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'area',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition> areaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'area',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      areaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associationCode',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associationCode',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'associationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associationPhoto',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associationPhoto',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'associationPhoto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associationPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      associationPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associationPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bathroomCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bathroomCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bathroomCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bathroomCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bathroomCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bathroomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bathroomCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bathroomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bathroomCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bathroomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bathroomCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bathroomCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bhkIds',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bhkIds',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhkIds',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhkIds',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhkIds',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhkIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bhkIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bhkIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bhkIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bhkIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bhkIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      bhkIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bhkIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonCode',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonCode',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brooonCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brooonId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brooonId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brooonId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonName',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonName',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brooonName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonPhone',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonPhone',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brooonPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonPhoto',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonPhoto',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brooonPhoto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      brooonPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'buildingType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'buildingType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buildingType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buildingType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buildingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'buildingType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'buildingType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'buildingType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'buildingType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'buildingType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buildingTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'buildingType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buyerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'buyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'buyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'buyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'buyerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      buyerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'buyerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closeDealIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closeDealId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closeDealIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closeDealId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closeDealIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closeDealId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closeDealIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closeDealId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closeDealIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closeDealId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closeDealIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closeDealId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealNotes',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealNotes',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealSellerName',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealSellerName',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealSellerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealSellerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealSellerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealSellerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealSellerPhoneNo',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealSellerPhoneNo',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealSellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealSellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealSellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealSellerPhoneNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealSellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealSellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealSellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealSellerPhoneNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealSellerPhoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedDealSellerPhoneNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealSellerPhoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedLinkedPropertyId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedLinkedPropertyId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedLinkedPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedLinkedPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedLinkedPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedLinkedPropertyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedLinkedPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedLinkedPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedLinkedPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedLinkedPropertyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedLinkedPropertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      closedLinkedPropertyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedLinkedPropertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'connectedRoads',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'connectedRoads',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectedRoads',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'connectedRoads',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'connectedRoads',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'connectedRoads',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'connectedRoads',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'connectedRoads',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'connectedRoads',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'connectedRoads',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'connectedRoads',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      connectedRoadsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'connectedRoads',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'constructionType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'constructionType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'constructionType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'constructionType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'constructionType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'constructionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'constructionType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'constructionType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'constructionType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'constructionType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'constructionType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      constructionTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'constructionType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      depthSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'depthSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      depthSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'depthSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      depthSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depthSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      depthSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'depthSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      depthSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'depthSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      depthSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'depthSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'facingType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'facingType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facingType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'facingType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'facingType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'facingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'facingType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'facingType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'facingType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'facingType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'facingType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      facingTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'facingType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filterName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filterName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filterName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filterSearchBy',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filterSearchBy',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterSearchBy',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filterSearchBy',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filterSearchBy',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filterSearchBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterSearchBy',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterSearchBy',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterSearchBy',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterSearchBy',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterSearchBy',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      filterSearchByLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterSearchBy',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      floorCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'floorCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      floorCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'floorCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      floorCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      floorCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      floorCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      floorCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      frontSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      frontSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      frontSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      frontSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      frontSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      frontSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'furnishedType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'furnishedType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'furnishedType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'furnishedType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'furnishedType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'furnishedType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'furnishedType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'furnishedType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'furnishedType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'furnishedType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'furnishedType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      furnishedTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'furnishedType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      includeClosedPropertyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'includeClosedProperty',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      includeInactivePropertyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'includeInactiveProperty',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inquiryId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inquiryId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inquiryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inquiryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquirySoldStatusIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inquirySoldStatusId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquirySoldStatusIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inquirySoldStatusId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquirySoldStatusIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inquirySoldStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquirySoldStatusIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inquirySoldStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquirySoldStatusIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inquirySoldStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquirySoldStatusIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inquirySoldStatusId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inquiryStatusId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inquiryStatusId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inquiryStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inquiryStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inquiryStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inquiryStatusId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inquiryStatusValue',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inquiryStatusValue',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inquiryStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inquiryStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inquiryStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inquiryStatusValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inquiryStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inquiryStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inquiryStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inquiryStatusValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inquiryStatusValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      inquiryStatusValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inquiryStatusValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isAllottedParkingAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isAllottedParkingAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isAllottedParkingAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isAllottedParkingAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isAllottedParkingAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAllottedParkingAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isBalconyAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBalconyAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isBalconyAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBalconyAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isBalconyAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBalconyAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isCornerPieceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCornerPiece',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isCornerPieceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCornerPiece',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isCornerPieceEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCornerPiece',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isFromBuyerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFromBuyer',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isLiftAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLiftAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isLiftAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLiftAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isLiftAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLiftAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isLightConnectionAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLightConnectionAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isLightConnectionAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLightConnectionAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isLightConnectionAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLightConnectionAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isNegotiableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isNegotiable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isParkingAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isParkingAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isParkingAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isParkingAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isParkingAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isParkingAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isPublicInquiryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPublicInquiry',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isSyncedWithServerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSyncedWithServer',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isWashroomAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWashroomAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isWashroomAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWashroomAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isWashroomAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWashroomAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isWellAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWellAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isWellAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWellAvailable',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      isWellAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWellAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      latitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      latitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      latitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      latitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPricePerSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'leaseMaxPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPricePerSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'leaseMaxPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPricePerSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leaseMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPricePerSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leaseMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPricePerSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leaseMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPricePerSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leaseMaxPricePerSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leaseMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leaseMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leaseMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMaxPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leaseMaxPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPricePerSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'leaseMinPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPricePerSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'leaseMinPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPricePerSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leaseMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPricePerSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leaseMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPricePerSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leaseMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPricePerSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leaseMinPricePerSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leaseMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leaseMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leaseMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leaseMinPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leaseMinPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'leasePriceRangeMax',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'leasePriceRangeMax',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMaxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leasePriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMaxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leasePriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMaxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leasePriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMaxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leasePriceRangeMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'leasePriceRangeMin',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'leasePriceRangeMin',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leasePriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leasePriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leasePriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      leasePriceRangeMinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leasePriceRangeMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      longitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      longitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      longitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      longitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      maxMeasureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxMeasure',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      maxMeasureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxMeasure',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      maxMeasureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxMeasure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      maxMeasureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxMeasure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      maxMeasureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxMeasure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      maxMeasureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxMeasure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'measureUnit',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'measureUnit',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measureUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measureUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measureUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measureUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'measureUnitValue',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'measureUnitValue',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measureUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measureUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measureUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measureUnitValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'measureUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'measureUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'measureUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'measureUnitValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measureUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      measureUnitValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'measureUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      minMeasureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minMeasure',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      minMeasureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minMeasure',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      minMeasureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minMeasure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      minMeasureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minMeasure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      minMeasureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minMeasure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      minMeasureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minMeasure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobileNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mobileNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mobileNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mobileNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mobileNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mobileNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mobileNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mobileNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobileNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      mobileNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mobileNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preferredCaste',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preferredCaste',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredCaste',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredCaste',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredCaste',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredCaste',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredCaste',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredCaste',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredCaste',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredCaste',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredCaste',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredCaste',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCaste',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCaste',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCaste',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCaste',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCaste',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      preferredCasteLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCaste',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyFor',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyFor',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyFor',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyFor',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyFor',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyFor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyFor',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyFor',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyFor',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyFor',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyFor',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyFor',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyForValues',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyForValues',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyForValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyForValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyForValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyForValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyForValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyForValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyForValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyForValues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyForValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyForValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyForValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyTypeValues',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyTypeValues',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyTypeValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyTypeValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyTypeValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyTypeValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyTypeValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyTypeValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyTypeValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyTypeValues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyTypeValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyTypeValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyTypeValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyTypeValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyTypeValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyTypeValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyTypeValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      propertyTypeValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyTypeValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPricePerSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rentMaxPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPricePerSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rentMaxPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPricePerSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPricePerSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPricePerSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPricePerSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentMaxPricePerSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMaxPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentMaxPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPricePerSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rentMinPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPricePerSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rentMinPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPricePerSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPricePerSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPricePerSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPricePerSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentMinPricePerSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentMinPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentMinPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rentPriceRangeMax',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rentPriceRangeMax',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMaxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentPriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMaxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentPriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMaxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentPriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMaxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentPriceRangeMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rentPriceRangeMin',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rentPriceRangeMin',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentPriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentPriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentPriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      rentPriceRangeMinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentPriceRangeMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      roomCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      roomCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      roomCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      roomCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      roomCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      roomCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'schemeType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'schemeType',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schemeType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'schemeType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'schemeType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'schemeType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schemeType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schemeType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schemeType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schemeType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schemeType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      schemeTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schemeType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedAmenities',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedAmenities',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedAmenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedAmenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedAmenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedAmenities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectedAmenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectedAmenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectedAmenities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectedAmenities',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedAmenities',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectedAmenities',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedAmenities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedAmenities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedAmenities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedAmenities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedAmenities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      selectedAmenitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedAmenities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPricePerSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellMaxPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPricePerSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellMaxPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPricePerSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPricePerSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPricePerSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellMaxPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPricePerSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellMaxPricePerSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellMaxPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMaxPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellMaxPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPricePerSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellMinPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPricePerSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellMinPricePerSize',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPricePerSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPricePerSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPricePerSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellMinPricePerSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPricePerSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellMinPricePerSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellMinPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellMinPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellMinPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellPriceRangeMax',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellPriceRangeMax',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMaxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellPriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMaxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellPriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMaxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellPriceRangeMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMaxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellPriceRangeMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellPriceRangeMin',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellPriceRangeMin',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellPriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellPriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellPriceRangeMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sellPriceRangeMinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellPriceRangeMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      sharedByBrooonEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharedByBrooon',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringQuery',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringQuery',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringQuery',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stringQuery',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stringQuery',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stringQuery',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stringQuery',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stringQuery',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stringQuery',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stringQuery',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringQuery',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      stringQueryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stringQuery',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      totalFloorCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalFloorCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      totalFloorCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalFloorCount',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      totalFloorCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFloorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      totalFloorCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFloorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      totalFloorCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFloorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      totalFloorCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFloorCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unmatchProperties',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unmatchProperties',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unmatchProperties',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unmatchProperties',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unmatchProperties',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unmatchProperties',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unmatchProperties',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unmatchProperties',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unmatchProperties',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unmatchProperties',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchProperties',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchProperties',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchProperties',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchProperties',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchProperties',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      unmatchPropertiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchProperties',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterFilterCondition>
      userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbSavedFilterQueryObject
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QFilterCondition> {}

extension DbSavedFilterQueryLinks
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QFilterCondition> {}

extension DbSavedFilterQuerySortBy
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QSortBy> {
  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByAssociationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByAssociationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByAssociationPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByAssociationPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBathroomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathroomCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBathroomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathroomCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByBrooonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBrooonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBrooonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByBrooonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBrooonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByBrooonPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBrooonPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByBrooonPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBrooonPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByBuyerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByBuyerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByCloseDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedDealNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedDealNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedDealSellerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedDealSellerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedDealSellerPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerPhoneNo', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedDealSellerPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerPhoneNo', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedLinkedPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedPropertyId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByClosedLinkedPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedPropertyId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByDepthSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByDepthSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByFilterName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByFilterNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByFrontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByFrontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIncludeClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeClosedProperty', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIncludeClosedPropertyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeClosedProperty', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIncludeInactiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeInactiveProperty', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIncludeInactivePropertyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeInactiveProperty', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByInquirySoldStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquirySoldStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByInquirySoldStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquirySoldStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByInquiryStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByInquiryStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByInquiryStatusValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusValue', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByInquiryStatusValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusValue', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsAllottedParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParkingAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsAllottedParkingAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParkingAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsBalconyAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBalconyAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsBalconyAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBalconyAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsCornerPiece() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsCornerPieceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByIsFromBuyer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromBuyer', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsFromBuyerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromBuyer', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsLiftAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsLiftAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsLightConnectionAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLightConnectionAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsLightConnectionAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLightConnectionAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsNegotiable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNegotiable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsNegotiableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNegotiable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsParkingAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsPublicInquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicInquiry', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsPublicInquiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicInquiry', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsSyncedWithServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsSyncedWithServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsWashroomAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashroomAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsWashroomAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashroomAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsWellAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByIsWellAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMaxPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMaxPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMinPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeaseMinPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeasePriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMax', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeasePriceRangeMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMax', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeasePriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMin', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLeasePriceRangeMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMin', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByMaxMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxMeasure', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByMaxMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxMeasure', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByMeasureUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByMeasureUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByMeasureUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByMeasureUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByMinMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minMeasure', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByMinMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minMeasure', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByMobileNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByMobileNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMaxPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMaxPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMinPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentMinPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentPriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMax', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentPriceRangeMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMax', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentPriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMin', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRentPriceRangeMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMin', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByRoomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMaxPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMaxPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMinPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellMinPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellPriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMax', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellPriceRangeMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMax', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellPriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMin', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySellPriceRangeMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMin', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySharedByBrooon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortBySharedByBrooonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByStringQuery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringQuery', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByStringQueryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringQuery', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByTotalFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByTotalFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbSavedFilterQuerySortThenBy
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QSortThenBy> {
  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByAssociationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByAssociationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByAssociationPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByAssociationPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBathroomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathroomCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBathroomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathroomCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByBrooonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBrooonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBrooonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByBrooonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBrooonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByBrooonPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBrooonPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByBrooonPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBrooonPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByBuyerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByBuyerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyerName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByCloseDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedDealNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedDealNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedDealSellerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedDealSellerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedDealSellerPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerPhoneNo', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedDealSellerPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealSellerPhoneNo', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedLinkedPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedPropertyId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByClosedLinkedPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedPropertyId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByDepthSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByDepthSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByFilterName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterName', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByFilterNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterName', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByFrontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByFrontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIncludeClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeClosedProperty', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIncludeClosedPropertyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeClosedProperty', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIncludeInactiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeInactiveProperty', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIncludeInactivePropertyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'includeInactiveProperty', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByInquirySoldStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquirySoldStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByInquirySoldStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquirySoldStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByInquiryStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByInquiryStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByInquiryStatusValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusValue', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByInquiryStatusValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryStatusValue', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsAllottedParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParkingAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsAllottedParkingAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParkingAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsBalconyAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBalconyAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsBalconyAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBalconyAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsCornerPiece() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsCornerPieceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByIsFromBuyer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromBuyer', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsFromBuyerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromBuyer', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsLiftAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsLiftAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsLightConnectionAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLightConnectionAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsLightConnectionAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLightConnectionAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsNegotiable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNegotiable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsNegotiableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNegotiable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsParkingAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsPublicInquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicInquiry', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsPublicInquiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicInquiry', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsSyncedWithServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsSyncedWithServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsWashroomAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashroomAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsWashroomAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashroomAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsWellAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByIsWellAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMaxPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMaxPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMaxPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMinPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeaseMinPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaseMinPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeasePriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMax', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeasePriceRangeMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMax', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeasePriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMin', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLeasePriceRangeMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leasePriceRangeMin', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByMaxMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxMeasure', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByMaxMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxMeasure', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByMeasureUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByMeasureUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByMeasureUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByMeasureUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByMinMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minMeasure', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByMinMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minMeasure', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByMobileNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByMobileNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMaxPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMaxPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMaxPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMinPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentMinPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentMinPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentPriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMax', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentPriceRangeMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMax', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentPriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMin', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRentPriceRangeMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPriceRangeMin', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByRoomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMaxPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMaxPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMaxPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPricePerSize', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMinPricePerSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPricePerSize', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellMinPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellMinPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellPriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMax', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellPriceRangeMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMax', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellPriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMin', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySellPriceRangeMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceRangeMin', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySharedByBrooon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenBySharedByBrooonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByStringQuery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringQuery', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByStringQueryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringQuery', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByTotalFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByTotalFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbSavedFilterQueryWhereDistinct
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> {
  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedAt');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByAdditionalFurnish() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'additionalFurnish');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByArea(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'area', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByAssociationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByAssociationPhoto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associationPhoto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByBathroomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bathroomCount');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByBhkIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhkIds');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByBrooonCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonId');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByBrooonName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByBrooonPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByBrooonPhoto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonPhoto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByBuildingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildingType');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByBuyerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buyerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closeDealId');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByClosedDealNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByClosedDealSellerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealSellerName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByClosedDealSellerPhoneNo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealSellerPhoneNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByClosedLinkedPropertyId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedLinkedPropertyId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByConnectedRoads() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connectedRoads');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByConstructionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'constructionType');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByDepthSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depthSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByFacingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'facingType');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByFilterName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filterName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByFilterSearchBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filterSearchBy');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorCount');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByFrontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frontSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByFurnishedType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'furnishedType');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIncludeClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'includeClosedProperty');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIncludeInactiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'includeInactiveProperty');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByInquiryId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inquiryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByInquirySoldStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inquirySoldStatusId');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByInquiryStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inquiryStatusId');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByInquiryStatusValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inquiryStatusValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsAllottedParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAllottedParkingAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsBalconyAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBalconyAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsCornerPiece() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCornerPiece');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsFromBuyer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFromBuyer');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsLiftAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLiftAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsLightConnectionAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLightConnectionAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsNegotiable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNegotiable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isParkingAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsPublicInquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPublicInquiry');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsSyncedWithServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSyncedWithServer');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsWashroomAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWashroomAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByIsWellAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWellAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByLeaseMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leaseMaxPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByLeaseMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leaseMaxPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByLeaseMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leaseMinPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByLeaseMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leaseMinPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByLeasePriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leasePriceRangeMax');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByLeasePriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leasePriceRangeMin');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByMaxMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxMeasure');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByMeasureUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measureUnit');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByMeasureUnitValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measureUnitValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByMinMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minMeasure');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByMobileNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mobileNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByPreferredCaste() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredCaste');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByPropertyFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyFor');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByPropertyForValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyForValues');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByPropertyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyType');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByPropertyTypeValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyTypeValues');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByRentMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentMaxPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByRentMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentMaxPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByRentMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentMinPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByRentMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentMinPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByRentPriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentPriceRangeMax');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByRentPriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentPriceRangeMin');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomCount');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctBySchemeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'schemeType');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySelectedAmenities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedAmenities');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySellMaxPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellMaxPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySellMaxPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellMaxPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySellMinPricePerSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellMinPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySellMinPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellMinPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySellPriceRangeMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellPriceRangeMax');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySellPriceRangeMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellPriceRangeMin');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctBySharedByBrooon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sharedByBrooon');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByStringQuery(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stringQuery', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByTotalFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFloorCount');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct>
      distinctByUnmatchProperties() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unmatchProperties');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<DbSavedFilter, DbSavedFilter, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension DbSavedFilterQueryProperty
    on QueryBuilder<DbSavedFilter, DbSavedFilter, QQueryProperty> {
  QueryBuilder<DbSavedFilter, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbSavedFilter, DateTime, QQueryOperations> addedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedAt');
    });
  }

  QueryBuilder<DbSavedFilter, List<String>?, QQueryOperations>
      additionalFurnishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'additionalFurnish');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> areaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'area');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      associationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associationCode');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      associationPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associationPhoto');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations> bathroomCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bathroomCount');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations> bhkIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhkIds');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> brooonCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonCode');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations> brooonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonId');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> brooonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonName');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> brooonPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonPhone');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> brooonPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonPhoto');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      buildingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildingType');
    });
  }

  QueryBuilder<DbSavedFilter, String, QQueryOperations> buyerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buyerName');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations> closeDealIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closeDealId');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      closedDealNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealNotes');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      closedDealSellerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealSellerName');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      closedDealSellerPhoneNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealSellerPhoneNo');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      closedLinkedPropertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedLinkedPropertyId');
    });
  }

  QueryBuilder<DbSavedFilter, List<double>?, QQueryOperations>
      connectedRoadsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connectedRoads');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      constructionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'constructionType');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations> depthSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depthSize');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      facingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'facingType');
    });
  }

  QueryBuilder<DbSavedFilter, String, QQueryOperations> filterNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterName');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      filterSearchByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterSearchBy');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations> floorCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorCount');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations> frontSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frontSize');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      furnishedTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'furnishedType');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations>
      includeClosedPropertyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'includeClosedProperty');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations>
      includeInactivePropertyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'includeInactiveProperty');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> inquiryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inquiryId');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations>
      inquirySoldStatusIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inquirySoldStatusId');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations>
      inquiryStatusIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inquiryStatusId');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      inquiryStatusValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inquiryStatusValue');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations>
      isAllottedParkingAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAllottedParkingAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations>
      isBalconyAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBalconyAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations> isCornerPieceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCornerPiece');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations> isFromBuyerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFromBuyer');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations>
      isLiftAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLiftAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations>
      isLightConnectionAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLightConnectionAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations> isNegotiableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNegotiable');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations>
      isParkingAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isParkingAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations>
      isPublicInquiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPublicInquiry');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations>
      isSyncedWithServerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSyncedWithServer');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations>
      isWashroomAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWashroomAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, bool?, QQueryOperations>
      isWellAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWellAvailable');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      leaseMaxPricePerSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leaseMaxPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, int, QQueryOperations>
      leaseMaxPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leaseMaxPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      leaseMinPricePerSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leaseMinPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, int, QQueryOperations>
      leaseMinPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leaseMinPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      leasePriceRangeMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leasePriceRangeMax');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      leasePriceRangeMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leasePriceRangeMin');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations> maxMeasureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxMeasure');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations> measureUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measureUnit');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations>
      measureUnitValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measureUnitValue');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations> minMeasureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minMeasure');
    });
  }

  QueryBuilder<DbSavedFilter, String, QQueryOperations> mobileNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mobileNo');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<DbSavedFilter, List<String>?, QQueryOperations>
      preferredCasteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredCaste');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      propertyForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyFor');
    });
  }

  QueryBuilder<DbSavedFilter, List<String>?, QQueryOperations>
      propertyForValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyForValues');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      propertyTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyType');
    });
  }

  QueryBuilder<DbSavedFilter, List<String>?, QQueryOperations>
      propertyTypeValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyTypeValues');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      rentMaxPricePerSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentMaxPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, int, QQueryOperations>
      rentMaxPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentMaxPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      rentMinPricePerSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentMinPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, int, QQueryOperations>
      rentMinPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentMinPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      rentPriceRangeMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentPriceRangeMax');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      rentPriceRangeMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentPriceRangeMin');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations> roomCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomCount');
    });
  }

  QueryBuilder<DbSavedFilter, List<int>?, QQueryOperations>
      schemeTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schemeType');
    });
  }

  QueryBuilder<DbSavedFilter, List<String>?, QQueryOperations>
      selectedAmenitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedAmenities');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      sellMaxPricePerSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellMaxPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, int, QQueryOperations>
      sellMaxPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellMaxPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      sellMinPricePerSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellMinPricePerSize');
    });
  }

  QueryBuilder<DbSavedFilter, int, QQueryOperations>
      sellMinPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellMinPriceUnit');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      sellPriceRangeMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellPriceRangeMax');
    });
  }

  QueryBuilder<DbSavedFilter, double?, QQueryOperations>
      sellPriceRangeMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellPriceRangeMin');
    });
  }

  QueryBuilder<DbSavedFilter, bool, QQueryOperations> sharedByBrooonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sharedByBrooon');
    });
  }

  QueryBuilder<DbSavedFilter, String?, QQueryOperations> stringQueryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stringQuery');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations>
      totalFloorCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFloorCount');
    });
  }

  QueryBuilder<DbSavedFilter, List<String>, QQueryOperations>
      unmatchPropertiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unmatchProperties');
    });
  }

  QueryBuilder<DbSavedFilter, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<DbSavedFilter, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
