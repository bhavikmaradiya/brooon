// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_property.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbPropertyCollection on Isar {
  IsarCollection<DbProperty> get dbPropertys => this.collection();
}

const DbPropertySchema = CollectionSchema(
  name: r'DbProperty',
  id: -621217303133481747,
  properties: {
    r'addedAt': PropertySchema(
      id: 0,
      name: r'addedAt',
      type: IsarType.dateTime,
    ),
    r'additionalFurnishing': PropertySchema(
      id: 1,
      name: r'additionalFurnishing',
      type: IsarType.stringList,
    ),
    r'addressLandMark': PropertySchema(
      id: 2,
      name: r'addressLandMark',
      type: IsarType.string,
    ),
    r'amenitiesValues': PropertySchema(
      id: 3,
      name: r'amenitiesValues',
      type: IsarType.stringList,
    ),
    r'area': PropertySchema(
      id: 4,
      name: r'area',
      type: IsarType.string,
    ),
    r'associationCode': PropertySchema(
      id: 5,
      name: r'associationCode',
      type: IsarType.string,
    ),
    r'associationPhoto': PropertySchema(
      id: 6,
      name: r'associationPhoto',
      type: IsarType.string,
    ),
    r'balcony': PropertySchema(
      id: 7,
      name: r'balcony',
      type: IsarType.bool,
    ),
    r'bathRoomCount': PropertySchema(
      id: 8,
      name: r'bathRoomCount',
      type: IsarType.long,
    ),
    r'bhkId': PropertySchema(
      id: 9,
      name: r'bhkId',
      type: IsarType.long,
    ),
    r'brokerChain': PropertySchema(
      id: 10,
      name: r'brokerChain',
      type: IsarType.long,
    ),
    r'brooonCode': PropertySchema(
      id: 11,
      name: r'brooonCode',
      type: IsarType.string,
    ),
    r'brooonId': PropertySchema(
      id: 12,
      name: r'brooonId',
      type: IsarType.long,
    ),
    r'brooonName': PropertySchema(
      id: 13,
      name: r'brooonName',
      type: IsarType.string,
    ),
    r'brooonPhone': PropertySchema(
      id: 14,
      name: r'brooonPhone',
      type: IsarType.string,
    ),
    r'brooonPhoto': PropertySchema(
      id: 15,
      name: r'brooonPhoto',
      type: IsarType.string,
    ),
    r'buildingTypeId': PropertySchema(
      id: 16,
      name: r'buildingTypeId',
      type: IsarType.long,
    ),
    r'closeDealId': PropertySchema(
      id: 17,
      name: r'closeDealId',
      type: IsarType.long,
    ),
    r'closedDealBuyerName': PropertySchema(
      id: 18,
      name: r'closedDealBuyerName',
      type: IsarType.string,
    ),
    r'closedDealBuyerPhoneNo': PropertySchema(
      id: 19,
      name: r'closedDealBuyerPhoneNo',
      type: IsarType.string,
    ),
    r'closedDealNotes': PropertySchema(
      id: 20,
      name: r'closedDealNotes',
      type: IsarType.string,
    ),
    r'closedLinkedInquiryId': PropertySchema(
      id: 21,
      name: r'closedLinkedInquiryId',
      type: IsarType.string,
    ),
    r'comments': PropertySchema(
      id: 22,
      name: r'comments',
      type: IsarType.string,
    ),
    r'connectedRoads': PropertySchema(
      id: 23,
      name: r'connectedRoads',
      type: IsarType.doubleList,
    ),
    r'constructionTypeId': PropertySchema(
      id: 24,
      name: r'constructionTypeId',
      type: IsarType.long,
    ),
    r'depthSize': PropertySchema(
      id: 25,
      name: r'depthSize',
      type: IsarType.double,
    ),
    r'depthSizeUnitId': PropertySchema(
      id: 26,
      name: r'depthSizeUnitId',
      type: IsarType.long,
    ),
    r'depthSizeUnitValue': PropertySchema(
      id: 27,
      name: r'depthSizeUnitValue',
      type: IsarType.string,
    ),
    r'exchangeAllowed': PropertySchema(
      id: 28,
      name: r'exchangeAllowed',
      type: IsarType.bool,
    ),
    r'facingId': PropertySchema(
      id: 29,
      name: r'facingId',
      type: IsarType.long,
    ),
    r'floorCount': PropertySchema(
      id: 30,
      name: r'floorCount',
      type: IsarType.long,
    ),
    r'frontSize': PropertySchema(
      id: 31,
      name: r'frontSize',
      type: IsarType.double,
    ),
    r'frontSizeUnitId': PropertySchema(
      id: 32,
      name: r'frontSizeUnitId',
      type: IsarType.long,
    ),
    r'frontSizeUnitValue': PropertySchema(
      id: 33,
      name: r'frontSizeUnitValue',
      type: IsarType.string,
    ),
    r'isAllottedParking': PropertySchema(
      id: 34,
      name: r'isAllottedParking',
      type: IsarType.bool,
    ),
    r'isCornerPiece': PropertySchema(
      id: 35,
      name: r'isCornerPiece',
      type: IsarType.bool,
    ),
    r'isEdit': PropertySchema(
      id: 36,
      name: r'isEdit',
      type: IsarType.bool,
    ),
    r'isFavorite': PropertySchema(
      id: 37,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'isLiftAvailable': PropertySchema(
      id: 38,
      name: r'isLiftAvailable',
      type: IsarType.bool,
    ),
    r'isParkingAvailable': PropertySchema(
      id: 39,
      name: r'isParkingAvailable',
      type: IsarType.bool,
    ),
    r'isPublicProperty': PropertySchema(
      id: 40,
      name: r'isPublicProperty',
      type: IsarType.bool,
    ),
    r'isSyncedWithServer': PropertySchema(
      id: 41,
      name: r'isSyncedWithServer',
      type: IsarType.bool,
    ),
    r'isWashRoomAvailable': PropertySchema(
      id: 42,
      name: r'isWashRoomAvailable',
      type: IsarType.bool,
    ),
    r'isWellAvailable': PropertySchema(
      id: 43,
      name: r'isWellAvailable',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 44,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'lightConnection': PropertySchema(
      id: 45,
      name: r'lightConnection',
      type: IsarType.bool,
    ),
    r'longitude': PropertySchema(
      id: 46,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'maxLeasePrice': PropertySchema(
      id: 47,
      name: r'maxLeasePrice',
      type: IsarType.double,
    ),
    r'maxLeasePriceUnit': PropertySchema(
      id: 48,
      name: r'maxLeasePriceUnit',
      type: IsarType.long,
    ),
    r'maxRentPrice': PropertySchema(
      id: 49,
      name: r'maxRentPrice',
      type: IsarType.double,
    ),
    r'maxRentPriceUnit': PropertySchema(
      id: 50,
      name: r'maxRentPriceUnit',
      type: IsarType.long,
    ),
    r'maxSellPrice': PropertySchema(
      id: 51,
      name: r'maxSellPrice',
      type: IsarType.double,
    ),
    r'maxSellPriceUnit': PropertySchema(
      id: 52,
      name: r'maxSellPriceUnit',
      type: IsarType.long,
    ),
    r'minLeasePrice': PropertySchema(
      id: 53,
      name: r'minLeasePrice',
      type: IsarType.double,
    ),
    r'minLeasePriceUnit': PropertySchema(
      id: 54,
      name: r'minLeasePriceUnit',
      type: IsarType.long,
    ),
    r'minRentPrice': PropertySchema(
      id: 55,
      name: r'minRentPrice',
      type: IsarType.double,
    ),
    r'minRentPriceUnit': PropertySchema(
      id: 56,
      name: r'minRentPriceUnit',
      type: IsarType.long,
    ),
    r'minSellPrice': PropertySchema(
      id: 57,
      name: r'minSellPrice',
      type: IsarType.double,
    ),
    r'minSellPriceUnit': PropertySchema(
      id: 58,
      name: r'minSellPriceUnit',
      type: IsarType.long,
    ),
    r'negotiationAllowed': PropertySchema(
      id: 59,
      name: r'negotiationAllowed',
      type: IsarType.bool,
    ),
    r'photos': PropertySchema(
      id: 60,
      name: r'photos',
      type: IsarType.stringList,
    ),
    r'preferredCommunityValues': PropertySchema(
      id: 61,
      name: r'preferredCommunityValues',
      type: IsarType.stringList,
    ),
    r'priceUnitId': PropertySchema(
      id: 62,
      name: r'priceUnitId',
      type: IsarType.long,
    ),
    r'priceUnitValue': PropertySchema(
      id: 63,
      name: r'priceUnitValue',
      type: IsarType.string,
    ),
    r'propertyAreaSize': PropertySchema(
      id: 64,
      name: r'propertyAreaSize',
      type: IsarType.double,
    ),
    r'propertyAreaUnitId': PropertySchema(
      id: 65,
      name: r'propertyAreaUnitId',
      type: IsarType.long,
    ),
    r'propertyAreaUnitValue': PropertySchema(
      id: 66,
      name: r'propertyAreaUnitValue',
      type: IsarType.string,
    ),
    r'propertyForIds': PropertySchema(
      id: 67,
      name: r'propertyForIds',
      type: IsarType.longList,
    ),
    r'propertyForValues': PropertySchema(
      id: 68,
      name: r'propertyForValues',
      type: IsarType.stringList,
    ),
    r'propertyFurnishedStatusId': PropertySchema(
      id: 69,
      name: r'propertyFurnishedStatusId',
      type: IsarType.long,
    ),
    r'propertyId': PropertySchema(
      id: 70,
      name: r'propertyId',
      type: IsarType.string,
    ),
    r'propertyLeasePricePerArea': PropertySchema(
      id: 71,
      name: r'propertyLeasePricePerArea',
      type: IsarType.double,
    ),
    r'propertyName': PropertySchema(
      id: 72,
      name: r'propertyName',
      type: IsarType.string,
    ),
    r'propertyPricePerAreaUnitId': PropertySchema(
      id: 73,
      name: r'propertyPricePerAreaUnitId',
      type: IsarType.long,
    ),
    r'propertyPricePerAreaUnitValue': PropertySchema(
      id: 74,
      name: r'propertyPricePerAreaUnitValue',
      type: IsarType.string,
    ),
    r'propertyRentPricePerArea': PropertySchema(
      id: 75,
      name: r'propertyRentPricePerArea',
      type: IsarType.double,
    ),
    r'propertySellPricePerArea': PropertySchema(
      id: 76,
      name: r'propertySellPricePerArea',
      type: IsarType.double,
    ),
    r'propertySoldStatusId': PropertySchema(
      id: 77,
      name: r'propertySoldStatusId',
      type: IsarType.long,
    ),
    r'propertyStatusId': PropertySchema(
      id: 78,
      name: r'propertyStatusId',
      type: IsarType.long,
    ),
    r'propertyStatusValue': PropertySchema(
      id: 79,
      name: r'propertyStatusValue',
      type: IsarType.string,
    ),
    r'propertyTypeId': PropertySchema(
      id: 80,
      name: r'propertyTypeId',
      type: IsarType.long,
    ),
    r'propertyTypeValue': PropertySchema(
      id: 81,
      name: r'propertyTypeValue',
      type: IsarType.string,
    ),
    r'publicAddressLandMark': PropertySchema(
      id: 82,
      name: r'publicAddressLandMark',
      type: IsarType.string,
    ),
    r'publicArea': PropertySchema(
      id: 83,
      name: r'publicArea',
      type: IsarType.string,
    ),
    r'publicLatitude': PropertySchema(
      id: 84,
      name: r'publicLatitude',
      type: IsarType.double,
    ),
    r'publicLongitude': PropertySchema(
      id: 85,
      name: r'publicLongitude',
      type: IsarType.double,
    ),
    r'roomCount': PropertySchema(
      id: 86,
      name: r'roomCount',
      type: IsarType.long,
    ),
    r'schemeTypeId': PropertySchema(
      id: 87,
      name: r'schemeTypeId',
      type: IsarType.long,
    ),
    r'sellerEmail': PropertySchema(
      id: 88,
      name: r'sellerEmail',
      type: IsarType.string,
    ),
    r'sellerName': PropertySchema(
      id: 89,
      name: r'sellerName',
      type: IsarType.string,
    ),
    r'sellerPhoneNo': PropertySchema(
      id: 90,
      name: r'sellerPhoneNo',
      type: IsarType.string,
    ),
    r'sharedByBrooon': PropertySchema(
      id: 91,
      name: r'sharedByBrooon',
      type: IsarType.bool,
    ),
    r'tags': PropertySchema(
      id: 92,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'totalFloorCount': PropertySchema(
      id: 93,
      name: r'totalFloorCount',
      type: IsarType.long,
    ),
    r'unmatchInquiries': PropertySchema(
      id: 94,
      name: r'unmatchInquiries',
      type: IsarType.stringList,
    ),
    r'updatedAt': PropertySchema(
      id: 95,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 96,
      name: r'userId',
      type: IsarType.long,
    ),
    r'visitorCount': PropertySchema(
      id: 97,
      name: r'visitorCount',
      type: IsarType.long,
    )
  },
  estimateSize: _dbPropertyEstimateSize,
  serialize: _dbPropertySerialize,
  deserialize: _dbPropertyDeserialize,
  deserializeProp: _dbPropertyDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbPropertyGetId,
  getLinks: _dbPropertyGetLinks,
  attach: _dbPropertyAttach,
  version: '3.0.5',
);

int _dbPropertyEstimateSize(
  DbProperty object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.additionalFurnishing;
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
    final value = object.addressLandMark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.amenitiesValues;
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
    final value = object.closedDealBuyerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDealBuyerPhoneNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDealNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedLinkedInquiryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.comments;
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
    final value = object.depthSizeUnitValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontSizeUnitValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.photos;
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
    final list = object.preferredCommunityValues;
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
    final value = object.priceUnitValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.propertyAreaUnitValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.propertyForIds;
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
    final value = object.propertyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.propertyName.length * 3;
  {
    final value = object.propertyPricePerAreaUnitValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.propertyStatusValue.length * 3;
  bytesCount += 3 + object.propertyTypeValue.length * 3;
  {
    final value = object.publicAddressLandMark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.publicArea;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sellerEmail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sellerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sellerPhoneNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tags;
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
  bytesCount += 3 + object.unmatchInquiries.length * 3;
  {
    for (var i = 0; i < object.unmatchInquiries.length; i++) {
      final value = object.unmatchInquiries[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _dbPropertySerialize(
  DbProperty object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedAt);
  writer.writeStringList(offsets[1], object.additionalFurnishing);
  writer.writeString(offsets[2], object.addressLandMark);
  writer.writeStringList(offsets[3], object.amenitiesValues);
  writer.writeString(offsets[4], object.area);
  writer.writeString(offsets[5], object.associationCode);
  writer.writeString(offsets[6], object.associationPhoto);
  writer.writeBool(offsets[7], object.balcony);
  writer.writeLong(offsets[8], object.bathRoomCount);
  writer.writeLong(offsets[9], object.bhkId);
  writer.writeLong(offsets[10], object.brokerChain);
  writer.writeString(offsets[11], object.brooonCode);
  writer.writeLong(offsets[12], object.brooonId);
  writer.writeString(offsets[13], object.brooonName);
  writer.writeString(offsets[14], object.brooonPhone);
  writer.writeString(offsets[15], object.brooonPhoto);
  writer.writeLong(offsets[16], object.buildingTypeId);
  writer.writeLong(offsets[17], object.closeDealId);
  writer.writeString(offsets[18], object.closedDealBuyerName);
  writer.writeString(offsets[19], object.closedDealBuyerPhoneNo);
  writer.writeString(offsets[20], object.closedDealNotes);
  writer.writeString(offsets[21], object.closedLinkedInquiryId);
  writer.writeString(offsets[22], object.comments);
  writer.writeDoubleList(offsets[23], object.connectedRoads);
  writer.writeLong(offsets[24], object.constructionTypeId);
  writer.writeDouble(offsets[25], object.depthSize);
  writer.writeLong(offsets[26], object.depthSizeUnitId);
  writer.writeString(offsets[27], object.depthSizeUnitValue);
  writer.writeBool(offsets[28], object.exchangeAllowed);
  writer.writeLong(offsets[29], object.facingId);
  writer.writeLong(offsets[30], object.floorCount);
  writer.writeDouble(offsets[31], object.frontSize);
  writer.writeLong(offsets[32], object.frontSizeUnitId);
  writer.writeString(offsets[33], object.frontSizeUnitValue);
  writer.writeBool(offsets[34], object.isAllottedParking);
  writer.writeBool(offsets[35], object.isCornerPiece);
  writer.writeBool(offsets[36], object.isEdit);
  writer.writeBool(offsets[37], object.isFavorite);
  writer.writeBool(offsets[38], object.isLiftAvailable);
  writer.writeBool(offsets[39], object.isParkingAvailable);
  writer.writeBool(offsets[40], object.isPublicProperty);
  writer.writeBool(offsets[41], object.isSyncedWithServer);
  writer.writeBool(offsets[42], object.isWashRoomAvailable);
  writer.writeBool(offsets[43], object.isWellAvailable);
  writer.writeDouble(offsets[44], object.latitude);
  writer.writeBool(offsets[45], object.lightConnection);
  writer.writeDouble(offsets[46], object.longitude);
  writer.writeDouble(offsets[47], object.maxLeasePrice);
  writer.writeLong(offsets[48], object.maxLeasePriceUnit);
  writer.writeDouble(offsets[49], object.maxRentPrice);
  writer.writeLong(offsets[50], object.maxRentPriceUnit);
  writer.writeDouble(offsets[51], object.maxSellPrice);
  writer.writeLong(offsets[52], object.maxSellPriceUnit);
  writer.writeDouble(offsets[53], object.minLeasePrice);
  writer.writeLong(offsets[54], object.minLeasePriceUnit);
  writer.writeDouble(offsets[55], object.minRentPrice);
  writer.writeLong(offsets[56], object.minRentPriceUnit);
  writer.writeDouble(offsets[57], object.minSellPrice);
  writer.writeLong(offsets[58], object.minSellPriceUnit);
  writer.writeBool(offsets[59], object.negotiationAllowed);
  writer.writeStringList(offsets[60], object.photos);
  writer.writeStringList(offsets[61], object.preferredCommunityValues);
  writer.writeLong(offsets[62], object.priceUnitId);
  writer.writeString(offsets[63], object.priceUnitValue);
  writer.writeDouble(offsets[64], object.propertyAreaSize);
  writer.writeLong(offsets[65], object.propertyAreaUnitId);
  writer.writeString(offsets[66], object.propertyAreaUnitValue);
  writer.writeLongList(offsets[67], object.propertyForIds);
  writer.writeStringList(offsets[68], object.propertyForValues);
  writer.writeLong(offsets[69], object.propertyFurnishedStatusId);
  writer.writeString(offsets[70], object.propertyId);
  writer.writeDouble(offsets[71], object.propertyLeasePricePerArea);
  writer.writeString(offsets[72], object.propertyName);
  writer.writeLong(offsets[73], object.propertyPricePerAreaUnitId);
  writer.writeString(offsets[74], object.propertyPricePerAreaUnitValue);
  writer.writeDouble(offsets[75], object.propertyRentPricePerArea);
  writer.writeDouble(offsets[76], object.propertySellPricePerArea);
  writer.writeLong(offsets[77], object.propertySoldStatusId);
  writer.writeLong(offsets[78], object.propertyStatusId);
  writer.writeString(offsets[79], object.propertyStatusValue);
  writer.writeLong(offsets[80], object.propertyTypeId);
  writer.writeString(offsets[81], object.propertyTypeValue);
  writer.writeString(offsets[82], object.publicAddressLandMark);
  writer.writeString(offsets[83], object.publicArea);
  writer.writeDouble(offsets[84], object.publicLatitude);
  writer.writeDouble(offsets[85], object.publicLongitude);
  writer.writeLong(offsets[86], object.roomCount);
  writer.writeLong(offsets[87], object.schemeTypeId);
  writer.writeString(offsets[88], object.sellerEmail);
  writer.writeString(offsets[89], object.sellerName);
  writer.writeString(offsets[90], object.sellerPhoneNo);
  writer.writeBool(offsets[91], object.sharedByBrooon);
  writer.writeStringList(offsets[92], object.tags);
  writer.writeLong(offsets[93], object.totalFloorCount);
  writer.writeStringList(offsets[94], object.unmatchInquiries);
  writer.writeDateTime(offsets[95], object.updatedAt);
  writer.writeLong(offsets[96], object.userId);
  writer.writeLong(offsets[97], object.visitorCount);
}

DbProperty _dbPropertyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbProperty();
  object.addedAt = reader.readDateTime(offsets[0]);
  object.additionalFurnishing = reader.readStringList(offsets[1]);
  object.addressLandMark = reader.readStringOrNull(offsets[2]);
  object.amenitiesValues = reader.readStringList(offsets[3]);
  object.area = reader.readStringOrNull(offsets[4]);
  object.associationCode = reader.readStringOrNull(offsets[5]);
  object.associationPhoto = reader.readStringOrNull(offsets[6]);
  object.balcony = reader.readBoolOrNull(offsets[7]);
  object.bathRoomCount = reader.readLongOrNull(offsets[8]);
  object.bhkId = reader.readLongOrNull(offsets[9]);
  object.brokerChain = reader.readLongOrNull(offsets[10]);
  object.brooonCode = reader.readStringOrNull(offsets[11]);
  object.brooonId = reader.readLongOrNull(offsets[12]);
  object.brooonName = reader.readStringOrNull(offsets[13]);
  object.brooonPhone = reader.readStringOrNull(offsets[14]);
  object.brooonPhoto = reader.readStringOrNull(offsets[15]);
  object.buildingTypeId = reader.readLongOrNull(offsets[16]);
  object.closeDealId = reader.readLongOrNull(offsets[17]);
  object.closedDealBuyerName = reader.readStringOrNull(offsets[18]);
  object.closedDealBuyerPhoneNo = reader.readStringOrNull(offsets[19]);
  object.closedDealNotes = reader.readStringOrNull(offsets[20]);
  object.closedLinkedInquiryId = reader.readStringOrNull(offsets[21]);
  object.comments = reader.readStringOrNull(offsets[22]);
  object.connectedRoads = reader.readDoubleList(offsets[23]);
  object.constructionTypeId = reader.readLongOrNull(offsets[24]);
  object.depthSize = reader.readDoubleOrNull(offsets[25]);
  object.depthSizeUnitId = reader.readLongOrNull(offsets[26]);
  object.depthSizeUnitValue = reader.readStringOrNull(offsets[27]);
  object.exchangeAllowed = reader.readBool(offsets[28]);
  object.facingId = reader.readLongOrNull(offsets[29]);
  object.floorCount = reader.readLongOrNull(offsets[30]);
  object.frontSize = reader.readDoubleOrNull(offsets[31]);
  object.frontSizeUnitId = reader.readLongOrNull(offsets[32]);
  object.frontSizeUnitValue = reader.readStringOrNull(offsets[33]);
  object.id = id;
  object.isAllottedParking = reader.readBoolOrNull(offsets[34]);
  object.isCornerPiece = reader.readBoolOrNull(offsets[35]);
  object.isEdit = reader.readBool(offsets[36]);
  object.isFavorite = reader.readBool(offsets[37]);
  object.isLiftAvailable = reader.readBoolOrNull(offsets[38]);
  object.isParkingAvailable = reader.readBoolOrNull(offsets[39]);
  object.isPublicProperty = reader.readBool(offsets[40]);
  object.isSyncedWithServer = reader.readBool(offsets[41]);
  object.isWashRoomAvailable = reader.readBoolOrNull(offsets[42]);
  object.isWellAvailable = reader.readBoolOrNull(offsets[43]);
  object.latitude = reader.readDoubleOrNull(offsets[44]);
  object.lightConnection = reader.readBoolOrNull(offsets[45]);
  object.longitude = reader.readDoubleOrNull(offsets[46]);
  object.maxLeasePrice = reader.readDoubleOrNull(offsets[47]);
  object.maxLeasePriceUnit = reader.readLong(offsets[48]);
  object.maxRentPrice = reader.readDoubleOrNull(offsets[49]);
  object.maxRentPriceUnit = reader.readLong(offsets[50]);
  object.maxSellPrice = reader.readDoubleOrNull(offsets[51]);
  object.maxSellPriceUnit = reader.readLong(offsets[52]);
  object.minLeasePrice = reader.readDoubleOrNull(offsets[53]);
  object.minLeasePriceUnit = reader.readLong(offsets[54]);
  object.minRentPrice = reader.readDoubleOrNull(offsets[55]);
  object.minRentPriceUnit = reader.readLong(offsets[56]);
  object.minSellPrice = reader.readDoubleOrNull(offsets[57]);
  object.minSellPriceUnit = reader.readLong(offsets[58]);
  object.negotiationAllowed = reader.readBool(offsets[59]);
  object.photos = reader.readStringList(offsets[60]);
  object.preferredCommunityValues = reader.readStringList(offsets[61]);
  object.priceUnitId = reader.readLongOrNull(offsets[62]);
  object.priceUnitValue = reader.readStringOrNull(offsets[63]);
  object.propertyAreaSize = reader.readDoubleOrNull(offsets[64]);
  object.propertyAreaUnitId = reader.readLongOrNull(offsets[65]);
  object.propertyAreaUnitValue = reader.readStringOrNull(offsets[66]);
  object.propertyForIds = reader.readLongList(offsets[67]);
  object.propertyForValues = reader.readStringList(offsets[68]);
  object.propertyFurnishedStatusId = reader.readLongOrNull(offsets[69]);
  object.propertyId = reader.readStringOrNull(offsets[70]);
  object.propertyLeasePricePerArea = reader.readDoubleOrNull(offsets[71]);
  object.propertyName = reader.readString(offsets[72]);
  object.propertyPricePerAreaUnitId = reader.readLongOrNull(offsets[73]);
  object.propertyPricePerAreaUnitValue = reader.readStringOrNull(offsets[74]);
  object.propertyRentPricePerArea = reader.readDoubleOrNull(offsets[75]);
  object.propertySellPricePerArea = reader.readDoubleOrNull(offsets[76]);
  object.propertySoldStatusId = reader.readLong(offsets[77]);
  object.propertyStatusId = reader.readLong(offsets[78]);
  object.propertyStatusValue = reader.readString(offsets[79]);
  object.propertyTypeId = reader.readLong(offsets[80]);
  object.propertyTypeValue = reader.readString(offsets[81]);
  object.publicAddressLandMark = reader.readStringOrNull(offsets[82]);
  object.publicArea = reader.readStringOrNull(offsets[83]);
  object.publicLatitude = reader.readDoubleOrNull(offsets[84]);
  object.publicLongitude = reader.readDoubleOrNull(offsets[85]);
  object.roomCount = reader.readLongOrNull(offsets[86]);
  object.schemeTypeId = reader.readLongOrNull(offsets[87]);
  object.sellerEmail = reader.readStringOrNull(offsets[88]);
  object.sellerName = reader.readStringOrNull(offsets[89]);
  object.sellerPhoneNo = reader.readStringOrNull(offsets[90]);
  object.sharedByBrooon = reader.readBool(offsets[91]);
  object.tags = reader.readStringList(offsets[92]);
  object.totalFloorCount = reader.readLongOrNull(offsets[93]);
  object.unmatchInquiries = reader.readStringList(offsets[94]) ?? [];
  object.updatedAt = reader.readDateTime(offsets[95]);
  object.userId = reader.readLongOrNull(offsets[96]);
  object.visitorCount = reader.readLongOrNull(offsets[97]);
  return object;
}

P _dbPropertyDeserializeProp<P>(
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
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleList(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readDoubleOrNull(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readBool(offset)) as P;
    case 29:
      return (reader.readLongOrNull(offset)) as P;
    case 30:
      return (reader.readLongOrNull(offset)) as P;
    case 31:
      return (reader.readDoubleOrNull(offset)) as P;
    case 32:
      return (reader.readLongOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readBoolOrNull(offset)) as P;
    case 35:
      return (reader.readBoolOrNull(offset)) as P;
    case 36:
      return (reader.readBool(offset)) as P;
    case 37:
      return (reader.readBool(offset)) as P;
    case 38:
      return (reader.readBoolOrNull(offset)) as P;
    case 39:
      return (reader.readBoolOrNull(offset)) as P;
    case 40:
      return (reader.readBool(offset)) as P;
    case 41:
      return (reader.readBool(offset)) as P;
    case 42:
      return (reader.readBoolOrNull(offset)) as P;
    case 43:
      return (reader.readBoolOrNull(offset)) as P;
    case 44:
      return (reader.readDoubleOrNull(offset)) as P;
    case 45:
      return (reader.readBoolOrNull(offset)) as P;
    case 46:
      return (reader.readDoubleOrNull(offset)) as P;
    case 47:
      return (reader.readDoubleOrNull(offset)) as P;
    case 48:
      return (reader.readLong(offset)) as P;
    case 49:
      return (reader.readDoubleOrNull(offset)) as P;
    case 50:
      return (reader.readLong(offset)) as P;
    case 51:
      return (reader.readDoubleOrNull(offset)) as P;
    case 52:
      return (reader.readLong(offset)) as P;
    case 53:
      return (reader.readDoubleOrNull(offset)) as P;
    case 54:
      return (reader.readLong(offset)) as P;
    case 55:
      return (reader.readDoubleOrNull(offset)) as P;
    case 56:
      return (reader.readLong(offset)) as P;
    case 57:
      return (reader.readDoubleOrNull(offset)) as P;
    case 58:
      return (reader.readLong(offset)) as P;
    case 59:
      return (reader.readBool(offset)) as P;
    case 60:
      return (reader.readStringList(offset)) as P;
    case 61:
      return (reader.readStringList(offset)) as P;
    case 62:
      return (reader.readLongOrNull(offset)) as P;
    case 63:
      return (reader.readStringOrNull(offset)) as P;
    case 64:
      return (reader.readDoubleOrNull(offset)) as P;
    case 65:
      return (reader.readLongOrNull(offset)) as P;
    case 66:
      return (reader.readStringOrNull(offset)) as P;
    case 67:
      return (reader.readLongList(offset)) as P;
    case 68:
      return (reader.readStringList(offset)) as P;
    case 69:
      return (reader.readLongOrNull(offset)) as P;
    case 70:
      return (reader.readStringOrNull(offset)) as P;
    case 71:
      return (reader.readDoubleOrNull(offset)) as P;
    case 72:
      return (reader.readString(offset)) as P;
    case 73:
      return (reader.readLongOrNull(offset)) as P;
    case 74:
      return (reader.readStringOrNull(offset)) as P;
    case 75:
      return (reader.readDoubleOrNull(offset)) as P;
    case 76:
      return (reader.readDoubleOrNull(offset)) as P;
    case 77:
      return (reader.readLong(offset)) as P;
    case 78:
      return (reader.readLong(offset)) as P;
    case 79:
      return (reader.readString(offset)) as P;
    case 80:
      return (reader.readLong(offset)) as P;
    case 81:
      return (reader.readString(offset)) as P;
    case 82:
      return (reader.readStringOrNull(offset)) as P;
    case 83:
      return (reader.readStringOrNull(offset)) as P;
    case 84:
      return (reader.readDoubleOrNull(offset)) as P;
    case 85:
      return (reader.readDoubleOrNull(offset)) as P;
    case 86:
      return (reader.readLongOrNull(offset)) as P;
    case 87:
      return (reader.readLongOrNull(offset)) as P;
    case 88:
      return (reader.readStringOrNull(offset)) as P;
    case 89:
      return (reader.readStringOrNull(offset)) as P;
    case 90:
      return (reader.readStringOrNull(offset)) as P;
    case 91:
      return (reader.readBool(offset)) as P;
    case 92:
      return (reader.readStringList(offset)) as P;
    case 93:
      return (reader.readLongOrNull(offset)) as P;
    case 94:
      return (reader.readStringList(offset) ?? []) as P;
    case 95:
      return (reader.readDateTime(offset)) as P;
    case 96:
      return (reader.readLongOrNull(offset)) as P;
    case 97:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbPropertyGetId(DbProperty object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbPropertyGetLinks(DbProperty object) {
  return [];
}

void _dbPropertyAttach(IsarCollection<dynamic> col, Id id, DbProperty object) {
  object.id = id;
}

extension DbPropertyQueryWhereSort
    on QueryBuilder<DbProperty, DbProperty, QWhere> {
  QueryBuilder<DbProperty, DbProperty, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbPropertyQueryWhere
    on QueryBuilder<DbProperty, DbProperty, QWhereClause> {
  QueryBuilder<DbProperty, DbProperty, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DbProperty, DbProperty, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterWhereClause> idBetween(
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

extension DbPropertyQueryFilter
    on QueryBuilder<DbProperty, DbProperty, QFilterCondition> {
  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> addedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> addedAtLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> addedAtBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'additionalFurnishing',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'additionalFurnishing',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalFurnishing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'additionalFurnishing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'additionalFurnishing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'additionalFurnishing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'additionalFurnishing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'additionalFurnishing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'additionalFurnishing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'additionalFurnishing',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalFurnishing',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'additionalFurnishing',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnishing',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnishing',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnishing',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnishing',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnishing',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      additionalFurnishingLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additionalFurnishing',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addressLandMark',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addressLandMark',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addressLandMark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'addressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'addressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'addressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'addressLandMark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressLandMark',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      addressLandMarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'addressLandMark',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amenitiesValues',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amenitiesValues',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amenitiesValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amenitiesValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amenitiesValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amenitiesValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'amenitiesValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'amenitiesValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amenitiesValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amenitiesValues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amenitiesValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amenitiesValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenitiesValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenitiesValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenitiesValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenitiesValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenitiesValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      amenitiesValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenitiesValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaEqualTo(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaGreaterThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaStartsWith(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaEndsWith(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaMatches(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> areaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associationCode',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associationCode',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associationPhoto',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associationPhoto',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationPhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationPhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associationPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      associationPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associationPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> balconyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balcony',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      balconyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balcony',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> balconyEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balcony',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      bathRoomCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bathRoomCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      bathRoomCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bathRoomCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      bathRoomCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bathRoomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      bathRoomCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bathRoomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      bathRoomCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bathRoomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      bathRoomCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bathRoomCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> bhkIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bhkId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> bhkIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bhkId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> bhkIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhkId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> bhkIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhkId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> bhkIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhkId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> bhkIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhkId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brokerChainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brokerChain',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brokerChainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brokerChain',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brokerChainEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brokerChain',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brokerChainGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brokerChain',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brokerChainLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brokerChain',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brokerChainBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brokerChain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonCode',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonCode',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonCodeEqualTo(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonCodeBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonIdLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonIdBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonName',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonName',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonNameEqualTo(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonNameBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> brooonNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonPhone',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonPhone',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonPhoto',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonPhoto',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      brooonPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      buildingTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'buildingTypeId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      buildingTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'buildingTypeId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      buildingTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      buildingTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buildingTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      buildingTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buildingTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      buildingTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buildingTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closeDealIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closeDealId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closeDealIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closeDealId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closeDealIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closeDealId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealBuyerName',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealBuyerName',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealBuyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealBuyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealBuyerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealBuyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealBuyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealBuyerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealBuyerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealBuyerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealBuyerPhoneNo',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealBuyerPhoneNo',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealBuyerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealBuyerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealBuyerPhoneNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealBuyerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealBuyerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealBuyerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealBuyerPhoneNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerPhoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealBuyerPhoneNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealBuyerPhoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealNotes',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealNotes',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedDealNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedLinkedInquiryId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedLinkedInquiryId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedLinkedInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedLinkedInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedLinkedInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedLinkedInquiryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedLinkedInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedLinkedInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedLinkedInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedLinkedInquiryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedLinkedInquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      closedLinkedInquiryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedLinkedInquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> commentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      commentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> commentsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      commentsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> commentsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> commentsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      commentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> commentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> commentsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> commentsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      commentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      commentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      connectedRoadsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'connectedRoads',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      connectedRoadsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'connectedRoads',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      constructionTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'constructionTypeId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      constructionTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'constructionTypeId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      constructionTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'constructionTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      constructionTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'constructionTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      constructionTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'constructionTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      constructionTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'constructionTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'depthSize',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'depthSize',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> depthSizeEqualTo(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> depthSizeLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> depthSizeBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'depthSizeUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'depthSizeUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depthSizeUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'depthSizeUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'depthSizeUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'depthSizeUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'depthSizeUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'depthSizeUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depthSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'depthSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'depthSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'depthSizeUnitValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'depthSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'depthSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'depthSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'depthSizeUnitValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depthSizeUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      depthSizeUnitValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'depthSizeUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      exchangeAllowedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exchangeAllowed',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> facingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'facingId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      facingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'facingId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> facingIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      facingIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'facingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> facingIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'facingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> facingIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'facingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      floorCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'floorCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      floorCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'floorCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> floorCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> floorCountBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontSize',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontSize',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> frontSizeEqualTo(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> frontSizeLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> frontSizeBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontSizeUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontSizeUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontSizeUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontSizeUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontSizeUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontSizeUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontSizeUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontSizeUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontSizeUnitValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontSizeUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontSizeUnitValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontSizeUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      frontSizeUnitValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontSizeUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isAllottedParkingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isAllottedParking',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isAllottedParkingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isAllottedParking',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isAllottedParkingEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAllottedParking',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isCornerPieceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCornerPiece',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isCornerPieceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCornerPiece',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isCornerPieceEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCornerPiece',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> isEditEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isLiftAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLiftAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isLiftAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLiftAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isLiftAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLiftAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isParkingAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isParkingAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isParkingAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isParkingAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isParkingAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isParkingAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isPublicPropertyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPublicProperty',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isSyncedWithServerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSyncedWithServer',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isWashRoomAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWashRoomAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isWashRoomAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWashRoomAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isWashRoomAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWashRoomAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isWellAvailableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWellAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isWellAvailableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWellAvailable',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      isWellAvailableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWellAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> latitudeLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      lightConnectionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lightConnection',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      lightConnectionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lightConnection',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      lightConnectionEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lightConnection',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> longitudeEqualTo(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> longitudeLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> longitudeBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxLeasePrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxLeasePrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLeasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxLeasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxLeasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxLeasePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLeasePriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxLeasePriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxLeasePriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxLeasePriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxLeasePriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxRentPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxRentPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRentPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRentPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRentPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRentPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxRentPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRentPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxSellPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxSellPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxSellPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxSellPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxSellPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxSellPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      maxSellPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxSellPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minLeasePrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minLeasePrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLeasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minLeasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minLeasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minLeasePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLeasePriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minLeasePriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minLeasePriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minLeasePriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minLeasePriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minRentPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minRentPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minRentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minRentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minRentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minRentPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minRentPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minRentPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minRentPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minRentPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minRentPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minSellPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minSellPrice',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minSellPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minSellPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceUnitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minSellPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceUnitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minSellPriceUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      minSellPriceUnitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minSellPriceUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      negotiationAllowedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'negotiationAllowed',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> photosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photos',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photos',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> photosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      photosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preferredCommunityValues',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preferredCommunityValues',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredCommunityValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredCommunityValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredCommunityValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredCommunityValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredCommunityValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredCommunityValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredCommunityValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredCommunityValues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredCommunityValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredCommunityValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCommunityValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCommunityValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCommunityValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCommunityValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCommunityValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      preferredCommunityValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredCommunityValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priceUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priceUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priceUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priceUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceUnitValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceUnitValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      priceUnitValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyAreaSize',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyAreaSize',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyAreaSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyAreaSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyAreaSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyAreaSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyAreaUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyAreaUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyAreaUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyAreaUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyAreaUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyAreaUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyAreaUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyAreaUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyAreaUnitValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyAreaUnitValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyAreaUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyAreaUnitValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyAreaUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyForIds',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyForIds',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyForIds',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyForIds',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyForIds',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyForIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propertyForIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyForValues',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyForValues',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyForValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyForValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyForValues',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyFurnishedStatusIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyFurnishedStatusId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyFurnishedStatusIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyFurnishedStatusId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyFurnishedStatusIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyFurnishedStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyFurnishedStatusIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyFurnishedStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyFurnishedStatusIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyFurnishedStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyFurnishedStatusIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyFurnishedStatusId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> propertyIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> propertyIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> propertyIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyLeasePricePerAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyLeasePricePerArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyLeasePricePerAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyLeasePricePerArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyLeasePricePerAreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyLeasePricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyLeasePricePerAreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyLeasePricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyLeasePricePerAreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyLeasePricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyLeasePricePerAreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyLeasePricePerArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyPricePerAreaUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyPricePerAreaUnitId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyPricePerAreaUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyPricePerAreaUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyPricePerAreaUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyPricePerAreaUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyPricePerAreaUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyPricePerAreaUnitValue',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyPricePerAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyPricePerAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyPricePerAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyPricePerAreaUnitValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyPricePerAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyPricePerAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyPricePerAreaUnitValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyPricePerAreaUnitValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyPricePerAreaUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyPricePerAreaUnitValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyPricePerAreaUnitValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyRentPricePerAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyRentPricePerArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyRentPricePerAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyRentPricePerArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyRentPricePerAreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyRentPricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyRentPricePerAreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyRentPricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyRentPricePerAreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyRentPricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyRentPricePerAreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyRentPricePerArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySellPricePerAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertySellPricePerArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySellPricePerAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertySellPricePerArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySellPricePerAreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertySellPricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySellPricePerAreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertySellPricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySellPricePerAreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertySellPricePerArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySellPricePerAreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertySellPricePerArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySoldStatusIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertySoldStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySoldStatusIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertySoldStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySoldStatusIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertySoldStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertySoldStatusIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertySoldStatusId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyStatusId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyStatusId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyStatusValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyStatusValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyStatusValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyStatusValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyStatusValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyStatusValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyTypeValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyTypeValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyTypeValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      propertyTypeValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyTypeValue',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publicAddressLandMark',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publicAddressLandMark',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicAddressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publicAddressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publicAddressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publicAddressLandMark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publicAddressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publicAddressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publicAddressLandMark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publicAddressLandMark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicAddressLandMark',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAddressLandMarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publicAddressLandMark',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publicArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publicArea',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> publicAreaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publicArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publicArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> publicAreaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publicArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publicArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publicArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publicArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> publicAreaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publicArea',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicArea',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicAreaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publicArea',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLatitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publicLatitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLatitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publicLatitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLatitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLatitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publicLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLatitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publicLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLatitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publicLatitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLongitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publicLongitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLongitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publicLongitude',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLongitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLongitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publicLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLongitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publicLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      publicLongitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publicLongitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      roomCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      roomCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> roomCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> roomCountLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> roomCountBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      schemeTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'schemeTypeId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      schemeTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'schemeTypeId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      schemeTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schemeTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      schemeTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'schemeTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      schemeTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'schemeTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      schemeTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'schemeTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellerEmail',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellerEmail',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellerEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sellerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sellerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sellerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sellerEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sellerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellerName',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellerName',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> sellerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> sellerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> sellerNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sellerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sellerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellerPhoneNo',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellerPhoneNo',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellerPhoneNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sellerPhoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sellerPhoneNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerPhoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sellerPhoneNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sellerPhoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      sharedByBrooonEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharedByBrooon',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      totalFloorCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalFloorCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      totalFloorCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalFloorCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      totalFloorCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFloorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unmatchInquiries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unmatchInquiries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unmatchInquiries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unmatchInquiries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unmatchInquiries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unmatchInquiries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unmatchInquiries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unmatchInquiries',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unmatchInquiries',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unmatchInquiries',
        value: '',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchInquiries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchInquiries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchInquiries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchInquiries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchInquiries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      unmatchInquiriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unmatchInquiries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> userIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      visitorCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visitorCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      visitorCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visitorCount',
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      visitorCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visitorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      visitorCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visitorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      visitorCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visitorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterFilterCondition>
      visitorCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visitorCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbPropertyQueryObject
    on QueryBuilder<DbProperty, DbProperty, QFilterCondition> {}

extension DbPropertyQueryLinks
    on QueryBuilder<DbProperty, DbProperty, QFilterCondition> {}

extension DbPropertyQuerySortBy
    on QueryBuilder<DbProperty, DbProperty, QSortBy> {
  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByAddressLandMark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLandMark', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByAddressLandMarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLandMark', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByAssociationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByAssociationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByAssociationPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByAssociationPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBalcony() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balcony', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBalconyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balcony', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBathRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathRoomCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBathRoomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathRoomCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBhkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhkId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBhkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhkId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrokerChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerChain', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrokerChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerChain', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBrooonPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByBuildingTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByBuildingTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByCloseDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByClosedDealBuyerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByClosedDealBuyerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByClosedDealBuyerPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerPhoneNo', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByClosedDealBuyerPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerPhoneNo', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByClosedDealNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByClosedDealNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByClosedLinkedInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedInquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByClosedLinkedInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedInquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByConstructionTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByConstructionTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByDepthSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByDepthSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByDepthSizeUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByDepthSizeUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByDepthSizeUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByDepthSizeUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByExchangeAllowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeAllowed', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByExchangeAllowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeAllowed', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByFacingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facingId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByFacingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facingId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByFrontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByFrontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByFrontSizeUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByFrontSizeUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByFrontSizeUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByFrontSizeUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsAllottedParking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParking', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsAllottedParkingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParking', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsCornerPiece() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsCornerPieceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsLiftAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsLiftAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsParkingAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsPublicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicProperty', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsPublicPropertyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicProperty', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsSyncedWithServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsSyncedWithServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsWashRoomAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashRoomAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsWashRoomAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashRoomAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByIsWellAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByIsWellAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByLightConnection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightConnection', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByLightConnectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightConnection', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxLeasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxLeasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxLeasePriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByMaxLeasePriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxRentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxRentPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByMaxRentPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxSellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxSellPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMaxSellPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByMaxSellPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinLeasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinLeasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinLeasePriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByMinLeasePriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinRentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinRentPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByMinRentPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinSellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinSellPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByMinSellPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByMinSellPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByNegotiationAllowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negotiationAllowed', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByNegotiationAllowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negotiationAllowed', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPriceUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPriceUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPriceUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPriceUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyAreaSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaSize', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyAreaSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaSize', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyAreaUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyAreaUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyAreaUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyAreaUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyFurnishedStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyFurnishedStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyFurnishedStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyFurnishedStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyLeasePricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyLeasePricePerArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyLeasePricePerAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyLeasePricePerArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyPricePerAreaUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyPricePerAreaUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyPricePerAreaUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyPricePerAreaUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyRentPricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyRentPricePerArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyRentPricePerAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyRentPricePerArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertySellPricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySellPricePerArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertySellPricePerAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySellPricePerArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertySoldStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySoldStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertySoldStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySoldStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyStatusValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyStatusValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPropertyTypeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPropertyTypeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPublicAddressLandMark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicAddressLandMark', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPublicAddressLandMarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicAddressLandMark', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPublicArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPublicAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPublicLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLatitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPublicLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLatitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByPublicLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLongitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByPublicLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLongitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByRoomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySchemeTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemeTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySchemeTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemeTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySellerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerEmail', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySellerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerEmail', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySellerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySellerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySellerPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerPhoneNo', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySellerPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerPhoneNo', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortBySharedByBrooon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortBySharedByBrooonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByTotalFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      sortByTotalFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByVisitorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitorCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> sortByVisitorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitorCount', Sort.desc);
    });
  }
}

extension DbPropertyQuerySortThenBy
    on QueryBuilder<DbProperty, DbProperty, QSortThenBy> {
  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByAddressLandMark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLandMark', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByAddressLandMarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLandMark', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByAssociationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByAssociationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByAssociationPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByAssociationPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBalcony() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balcony', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBalconyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balcony', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBathRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathRoomCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBathRoomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bathRoomCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBhkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhkId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBhkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhkId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrokerChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerChain', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrokerChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerChain', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBrooonPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByBuildingTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByBuildingTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByCloseDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByClosedDealBuyerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByClosedDealBuyerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByClosedDealBuyerPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerPhoneNo', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByClosedDealBuyerPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerPhoneNo', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByClosedDealNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByClosedDealNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealNotes', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByClosedLinkedInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedInquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByClosedLinkedInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedLinkedInquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByConstructionTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByConstructionTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByDepthSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByDepthSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSize', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByDepthSizeUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByDepthSizeUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByDepthSizeUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByDepthSizeUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depthSizeUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByExchangeAllowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeAllowed', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByExchangeAllowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeAllowed', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByFacingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facingId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByFacingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facingId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByFrontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByFrontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSize', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByFrontSizeUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByFrontSizeUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByFrontSizeUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByFrontSizeUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontSizeUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsAllottedParking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParking', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsAllottedParkingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllottedParking', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsCornerPiece() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsCornerPieceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCornerPiece', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsLiftAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsLiftAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiftAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsParkingAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParkingAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsPublicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicProperty', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsPublicPropertyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicProperty', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsSyncedWithServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsSyncedWithServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSyncedWithServer', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsWashRoomAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashRoomAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsWashRoomAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWashRoomAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByIsWellAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByIsWellAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWellAvailable', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByLightConnection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightConnection', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByLightConnectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightConnection', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxLeasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxLeasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxLeasePriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByMaxLeasePriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLeasePriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxRentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxRentPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByMaxRentPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRentPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxSellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxSellPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMaxSellPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByMaxSellPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSellPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinLeasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinLeasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinLeasePriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByMinLeasePriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLeasePriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinRentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinRentPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByMinRentPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRentPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinSellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPrice', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinSellPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPrice', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByMinSellPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPriceUnit', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByMinSellPriceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSellPriceUnit', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByNegotiationAllowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negotiationAllowed', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByNegotiationAllowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'negotiationAllowed', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPriceUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPriceUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPriceUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPriceUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyAreaSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaSize', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyAreaSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaSize', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyAreaUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyAreaUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyAreaUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyAreaUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAreaUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyFurnishedStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyFurnishedStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyFurnishedStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyFurnishedStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyLeasePricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyLeasePricePerArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyLeasePricePerAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyLeasePricePerArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyPricePerAreaUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyPricePerAreaUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyPricePerAreaUnitValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyPricePerAreaUnitValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyPricePerAreaUnitValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyRentPricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyRentPricePerArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyRentPricePerAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyRentPricePerArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertySellPricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySellPricePerArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertySellPricePerAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySellPricePerArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertySoldStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySoldStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertySoldStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertySoldStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyStatusIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyStatusValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyStatusValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyStatusValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPropertyTypeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeValue', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPropertyTypeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyTypeValue', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPublicAddressLandMark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicAddressLandMark', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPublicAddressLandMarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicAddressLandMark', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPublicArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicArea', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPublicAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicArea', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPublicLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLatitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPublicLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLatitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByPublicLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLongitude', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByPublicLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicLongitude', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByRoomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySchemeTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemeTypeId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySchemeTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemeTypeId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySellerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerEmail', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySellerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerEmail', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySellerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerName', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySellerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerName', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySellerPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerPhoneNo', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySellerPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellerPhoneNo', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenBySharedByBrooon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenBySharedByBrooonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharedByBrooon', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByTotalFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy>
      thenByTotalFloorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFloorCount', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByVisitorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitorCount', Sort.asc);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QAfterSortBy> thenByVisitorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitorCount', Sort.desc);
    });
  }
}

extension DbPropertyQueryWhereDistinct
    on QueryBuilder<DbProperty, DbProperty, QDistinct> {
  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedAt');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByAdditionalFurnishing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'additionalFurnishing');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByAddressLandMark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addressLandMark',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByAmenitiesValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amenitiesValues');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByArea(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'area', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByAssociationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByAssociationPhoto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associationPhoto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBalcony() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balcony');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBathRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bathRoomCount');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBhkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhkId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBrokerChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brokerChain');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBrooonCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBrooonName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBrooonPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBrooonPhoto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonPhoto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByBuildingTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildingTypeId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closeDealId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByClosedDealBuyerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealBuyerName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByClosedDealBuyerPhoneNo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealBuyerPhoneNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByClosedDealNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByClosedLinkedInquiryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedLinkedInquiryId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByComments(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comments', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByConnectedRoads() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connectedRoads');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByConstructionTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'constructionTypeId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByDepthSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depthSize');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByDepthSizeUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depthSizeUnitId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByDepthSizeUnitValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depthSizeUnitValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByExchangeAllowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exchangeAllowed');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByFacingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'facingId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorCount');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByFrontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frontSize');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByFrontSizeUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frontSizeUnitId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByFrontSizeUnitValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frontSizeUnitValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByIsAllottedParking() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAllottedParking');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByIsCornerPiece() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCornerPiece');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByIsEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEdit');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByIsLiftAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLiftAvailable');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByIsParkingAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isParkingAvailable');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByIsPublicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPublicProperty');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByIsSyncedWithServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSyncedWithServer');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByIsWashRoomAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWashRoomAvailable');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByIsWellAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWellAvailable');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByLightConnection() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lightConnection');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMaxLeasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxLeasePrice');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByMaxLeasePriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxLeasePriceUnit');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMaxRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRentPrice');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMaxRentPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRentPriceUnit');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMaxSellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxSellPrice');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMaxSellPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxSellPriceUnit');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMinLeasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minLeasePrice');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByMinLeasePriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minLeasePriceUnit');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMinRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minRentPrice');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMinRentPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minRentPriceUnit');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMinSellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minSellPrice');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByMinSellPriceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minSellPriceUnit');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByNegotiationAllowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'negotiationAllowed');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPhotos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photos');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPreferredCommunityValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredCommunityValues');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPriceUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceUnitId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPriceUnitValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceUnitValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyAreaSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyAreaSize');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyAreaUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyAreaUnitId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyAreaUnitValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyAreaUnitValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyForIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyForIds');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyForValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyForValues');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyFurnishedStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyFurnishedStatusId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyLeasePricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyLeasePricePerArea');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyPricePerAreaUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyPricePerAreaUnitId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyPricePerAreaUnitValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyPricePerAreaUnitValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertyRentPricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyRentPricePerArea');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertySellPricePerArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertySellPricePerArea');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPropertySoldStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertySoldStatusId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyStatusId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyStatusId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyStatusValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyStatusValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyTypeId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPropertyTypeValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyTypeValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct>
      distinctByPublicAddressLandMark({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicAddressLandMark',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPublicArea(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicArea', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPublicLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicLatitude');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByPublicLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicLongitude');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByRoomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomCount');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctBySchemeTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'schemeTypeId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctBySellerEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellerEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctBySellerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctBySellerPhoneNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellerPhoneNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctBySharedByBrooon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sharedByBrooon');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByTotalFloorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFloorCount');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByUnmatchInquiries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unmatchInquiries');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<DbProperty, DbProperty, QDistinct> distinctByVisitorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitorCount');
    });
  }
}

extension DbPropertyQueryProperty
    on QueryBuilder<DbProperty, DbProperty, QQueryProperty> {
  QueryBuilder<DbProperty, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbProperty, DateTime, QQueryOperations> addedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedAt');
    });
  }

  QueryBuilder<DbProperty, List<String>?, QQueryOperations>
      additionalFurnishingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'additionalFurnishing');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      addressLandMarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addressLandMark');
    });
  }

  QueryBuilder<DbProperty, List<String>?, QQueryOperations>
      amenitiesValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amenitiesValues');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> areaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'area');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      associationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associationCode');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      associationPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associationPhoto');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations> balconyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balcony');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> bathRoomCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bathRoomCount');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> bhkIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhkId');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> brokerChainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brokerChain');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> brooonCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonCode');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> brooonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> brooonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonName');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> brooonPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonPhone');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> brooonPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonPhoto');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> buildingTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildingTypeId');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> closeDealIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closeDealId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      closedDealBuyerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealBuyerName');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      closedDealBuyerPhoneNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealBuyerPhoneNo');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      closedDealNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealNotes');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      closedLinkedInquiryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedLinkedInquiryId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> commentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comments');
    });
  }

  QueryBuilder<DbProperty, List<double>?, QQueryOperations>
      connectedRoadsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connectedRoads');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations>
      constructionTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'constructionTypeId');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> depthSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depthSize');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> depthSizeUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depthSizeUnitId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      depthSizeUnitValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depthSizeUnitValue');
    });
  }

  QueryBuilder<DbProperty, bool, QQueryOperations> exchangeAllowedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exchangeAllowed');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> facingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'facingId');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> floorCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorCount');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> frontSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frontSize');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> frontSizeUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frontSizeUnitId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      frontSizeUnitValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frontSizeUnitValue');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations>
      isAllottedParkingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAllottedParking');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations> isCornerPieceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCornerPiece');
    });
  }

  QueryBuilder<DbProperty, bool, QQueryOperations> isEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEdit');
    });
  }

  QueryBuilder<DbProperty, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations> isLiftAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLiftAvailable');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations>
      isParkingAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isParkingAvailable');
    });
  }

  QueryBuilder<DbProperty, bool, QQueryOperations> isPublicPropertyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPublicProperty');
    });
  }

  QueryBuilder<DbProperty, bool, QQueryOperations>
      isSyncedWithServerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSyncedWithServer');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations>
      isWashRoomAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWashRoomAvailable');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations> isWellAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWellAvailable');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<DbProperty, bool?, QQueryOperations> lightConnectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lightConnection');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> maxLeasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxLeasePrice');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> maxLeasePriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxLeasePriceUnit');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> maxRentPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRentPrice');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> maxRentPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRentPriceUnit');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> maxSellPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxSellPrice');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> maxSellPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxSellPriceUnit');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> minLeasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minLeasePrice');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> minLeasePriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minLeasePriceUnit');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> minRentPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minRentPrice');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> minRentPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minRentPriceUnit');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> minSellPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minSellPrice');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> minSellPriceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minSellPriceUnit');
    });
  }

  QueryBuilder<DbProperty, bool, QQueryOperations>
      negotiationAllowedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'negotiationAllowed');
    });
  }

  QueryBuilder<DbProperty, List<String>?, QQueryOperations> photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<DbProperty, List<String>?, QQueryOperations>
      preferredCommunityValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredCommunityValues');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> priceUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceUnitId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> priceUnitValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceUnitValue');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations>
      propertyAreaSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyAreaSize');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations>
      propertyAreaUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyAreaUnitId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      propertyAreaUnitValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyAreaUnitValue');
    });
  }

  QueryBuilder<DbProperty, List<int>?, QQueryOperations>
      propertyForIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyForIds');
    });
  }

  QueryBuilder<DbProperty, List<String>?, QQueryOperations>
      propertyForValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyForValues');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations>
      propertyFurnishedStatusIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyFurnishedStatusId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> propertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyId');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations>
      propertyLeasePricePerAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyLeasePricePerArea');
    });
  }

  QueryBuilder<DbProperty, String, QQueryOperations> propertyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyName');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations>
      propertyPricePerAreaUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyPricePerAreaUnitId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      propertyPricePerAreaUnitValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyPricePerAreaUnitValue');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations>
      propertyRentPricePerAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyRentPricePerArea');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations>
      propertySellPricePerAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertySellPricePerArea');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations>
      propertySoldStatusIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertySoldStatusId');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> propertyStatusIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyStatusId');
    });
  }

  QueryBuilder<DbProperty, String, QQueryOperations>
      propertyStatusValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyStatusValue');
    });
  }

  QueryBuilder<DbProperty, int, QQueryOperations> propertyTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyTypeId');
    });
  }

  QueryBuilder<DbProperty, String, QQueryOperations>
      propertyTypeValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyTypeValue');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations>
      publicAddressLandMarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicAddressLandMark');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> publicAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicArea');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations> publicLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicLatitude');
    });
  }

  QueryBuilder<DbProperty, double?, QQueryOperations>
      publicLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicLongitude');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> roomCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomCount');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> schemeTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schemeTypeId');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> sellerEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellerEmail');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> sellerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellerName');
    });
  }

  QueryBuilder<DbProperty, String?, QQueryOperations> sellerPhoneNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellerPhoneNo');
    });
  }

  QueryBuilder<DbProperty, bool, QQueryOperations> sharedByBrooonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sharedByBrooon');
    });
  }

  QueryBuilder<DbProperty, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> totalFloorCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFloorCount');
    });
  }

  QueryBuilder<DbProperty, List<String>, QQueryOperations>
      unmatchInquiriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unmatchInquiries');
    });
  }

  QueryBuilder<DbProperty, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<DbProperty, int?, QQueryOperations> visitorCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitorCount');
    });
  }
}
