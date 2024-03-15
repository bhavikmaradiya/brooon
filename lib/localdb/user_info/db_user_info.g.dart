// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_user_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbUserInfoCollection on Isar {
  IsarCollection<DbUserInfo> get dbUserInfos => this.collection();
}

const DbUserInfoSchema = CollectionSchema(
  name: r'DbUserInfo',
  id: -6956533605394166387,
  properties: {
    r'accessToken': PropertySchema(
      id: 0,
      name: r'accessToken',
      type: IsarType.string,
    ),
    r'appSubscriptionEndTime': PropertySchema(
      id: 1,
      name: r'appSubscriptionEndTime',
      type: IsarType.dateTime,
    ),
    r'associationCode': PropertySchema(
      id: 2,
      name: r'associationCode',
      type: IsarType.string,
    ),
    r'associationId': PropertySchema(
      id: 3,
      name: r'associationId',
      type: IsarType.string,
    ),
    r'associationPhoto': PropertySchema(
      id: 4,
      name: r'associationPhoto',
      type: IsarType.string,
    ),
    r'backupSize': PropertySchema(
      id: 5,
      name: r'backupSize',
      type: IsarType.long,
    ),
    r'backupTakenAt': PropertySchema(
      id: 6,
      name: r'backupTakenAt',
      type: IsarType.dateTime,
    ),
    r'brokerCode': PropertySchema(
      id: 7,
      name: r'brokerCode',
      type: IsarType.string,
    ),
    r'brooonSearchDistance': PropertySchema(
      id: 8,
      name: r'brooonSearchDistance',
      type: IsarType.double,
    ),
    r'currentArea': PropertySchema(
      id: 9,
      name: r'currentArea',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 10,
      name: r'email',
      type: IsarType.string,
    ),
    r'firebaseUserId': PropertySchema(
      id: 11,
      name: r'firebaseUserId',
      type: IsarType.string,
    ),
    r'firstName': PropertySchema(
      id: 12,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'freeTrialExpired': PropertySchema(
      id: 13,
      name: r'freeTrialExpired',
      type: IsarType.bool,
    ),
    r'gDriveEmailAddress': PropertySchema(
      id: 14,
      name: r'gDriveEmailAddress',
      type: IsarType.string,
    ),
    r'gDriveId': PropertySchema(
      id: 15,
      name: r'gDriveId',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 16,
      name: r'gender',
      type: IsarType.string,
    ),
    r'isActiveUser': PropertySchema(
      id: 17,
      name: r'isActiveUser',
      type: IsarType.bool,
    ),
    r'isUserLoggedOut': PropertySchema(
      id: 18,
      name: r'isUserLoggedOut',
      type: IsarType.bool,
    ),
    r'isVerifiedUser': PropertySchema(
      id: 19,
      name: r'isVerifiedUser',
      type: IsarType.bool,
    ),
    r'lastInquiryId': PropertySchema(
      id: 20,
      name: r'lastInquiryId',
      type: IsarType.string,
    ),
    r'lastName': PropertySchema(
      id: 21,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'lastPropertyId': PropertySchema(
      id: 22,
      name: r'lastPropertyId',
      type: IsarType.string,
    ),
    r'latitude': PropertySchema(
      id: 23,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'liveLatitude': PropertySchema(
      id: 24,
      name: r'liveLatitude',
      type: IsarType.double,
    ),
    r'liveLongitude': PropertySchema(
      id: 25,
      name: r'liveLongitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 26,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'mobileNo': PropertySchema(
      id: 27,
      name: r'mobileNo',
      type: IsarType.string,
    ),
    r'nearByDistance': PropertySchema(
      id: 28,
      name: r'nearByDistance',
      type: IsarType.double,
    ),
    r'privateSearchDistance': PropertySchema(
      id: 29,
      name: r'privateSearchDistance',
      type: IsarType.double,
    ),
    r'profilePic': PropertySchema(
      id: 30,
      name: r'profilePic',
      type: IsarType.string,
    ),
    r'radius': PropertySchema(
      id: 31,
      name: r'radius',
      type: IsarType.long,
    ),
    r'refreshToken': PropertySchema(
      id: 32,
      name: r'refreshToken',
      type: IsarType.string,
    ),
    r'subscribedPlanId': PropertySchema(
      id: 33,
      name: r'subscribedPlanId',
      type: IsarType.long,
    ),
    r'subscribedPlanType': PropertySchema(
      id: 34,
      name: r'subscribedPlanType',
      type: IsarType.string,
    ),
    r'watermarkLogoPath': PropertySchema(
      id: 35,
      name: r'watermarkLogoPath',
      type: IsarType.string,
    ),
    r'watermarkText': PropertySchema(
      id: 36,
      name: r'watermarkText',
      type: IsarType.string,
    ),
    r'watermarkType': PropertySchema(
      id: 37,
      name: r'watermarkType',
      type: IsarType.long,
    )
  },
  estimateSize: _dbUserInfoEstimateSize,
  serialize: _dbUserInfoSerialize,
  deserialize: _dbUserInfoDeserialize,
  deserializeProp: _dbUserInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbUserInfoGetId,
  getLinks: _dbUserInfoGetLinks,
  attach: _dbUserInfoAttach,
  version: '3.0.5',
);

int _dbUserInfoEstimateSize(
  DbUserInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accessToken;
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
    final value = object.associationId;
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
    final value = object.brokerCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currentArea;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firebaseUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gDriveEmailAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gDriveId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastInquiryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastPropertyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.mobileNo.length * 3;
  {
    final value = object.profilePic;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.refreshToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subscribedPlanType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.watermarkLogoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.watermarkText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dbUserInfoSerialize(
  DbUserInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accessToken);
  writer.writeDateTime(offsets[1], object.appSubscriptionEndTime);
  writer.writeString(offsets[2], object.associationCode);
  writer.writeString(offsets[3], object.associationId);
  writer.writeString(offsets[4], object.associationPhoto);
  writer.writeLong(offsets[5], object.backupSize);
  writer.writeDateTime(offsets[6], object.backupTakenAt);
  writer.writeString(offsets[7], object.brokerCode);
  writer.writeDouble(offsets[8], object.brooonSearchDistance);
  writer.writeString(offsets[9], object.currentArea);
  writer.writeString(offsets[10], object.email);
  writer.writeString(offsets[11], object.firebaseUserId);
  writer.writeString(offsets[12], object.firstName);
  writer.writeBool(offsets[13], object.freeTrialExpired);
  writer.writeString(offsets[14], object.gDriveEmailAddress);
  writer.writeString(offsets[15], object.gDriveId);
  writer.writeString(offsets[16], object.gender);
  writer.writeBool(offsets[17], object.isActiveUser);
  writer.writeBool(offsets[18], object.isUserLoggedOut);
  writer.writeBool(offsets[19], object.isVerifiedUser);
  writer.writeString(offsets[20], object.lastInquiryId);
  writer.writeString(offsets[21], object.lastName);
  writer.writeString(offsets[22], object.lastPropertyId);
  writer.writeDouble(offsets[23], object.latitude);
  writer.writeDouble(offsets[24], object.liveLatitude);
  writer.writeDouble(offsets[25], object.liveLongitude);
  writer.writeDouble(offsets[26], object.longitude);
  writer.writeString(offsets[27], object.mobileNo);
  writer.writeDouble(offsets[28], object.nearByDistance);
  writer.writeDouble(offsets[29], object.privateSearchDistance);
  writer.writeString(offsets[30], object.profilePic);
  writer.writeLong(offsets[31], object.radius);
  writer.writeString(offsets[32], object.refreshToken);
  writer.writeLong(offsets[33], object.subscribedPlanId);
  writer.writeString(offsets[34], object.subscribedPlanType);
  writer.writeString(offsets[35], object.watermarkLogoPath);
  writer.writeString(offsets[36], object.watermarkText);
  writer.writeLong(offsets[37], object.watermarkType);
}

DbUserInfo _dbUserInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbUserInfo();
  object.accessToken = reader.readStringOrNull(offsets[0]);
  object.appSubscriptionEndTime = reader.readDateTimeOrNull(offsets[1]);
  object.associationCode = reader.readStringOrNull(offsets[2]);
  object.associationId = reader.readStringOrNull(offsets[3]);
  object.associationPhoto = reader.readStringOrNull(offsets[4]);
  object.backupSize = reader.readLongOrNull(offsets[5]);
  object.backupTakenAt = reader.readDateTimeOrNull(offsets[6]);
  object.brokerCode = reader.readStringOrNull(offsets[7]);
  object.brooonSearchDistance = reader.readDouble(offsets[8]);
  object.currentArea = reader.readStringOrNull(offsets[9]);
  object.email = reader.readStringOrNull(offsets[10]);
  object.firebaseUserId = reader.readStringOrNull(offsets[11]);
  object.firstName = reader.readStringOrNull(offsets[12]);
  object.freeTrialExpired = reader.readBoolOrNull(offsets[13]);
  object.gDriveEmailAddress = reader.readStringOrNull(offsets[14]);
  object.gDriveId = reader.readStringOrNull(offsets[15]);
  object.gender = reader.readStringOrNull(offsets[16]);
  object.id = id;
  object.isActiveUser = reader.readBool(offsets[17]);
  object.isUserLoggedOut = reader.readBool(offsets[18]);
  object.isVerifiedUser = reader.readBool(offsets[19]);
  object.lastInquiryId = reader.readStringOrNull(offsets[20]);
  object.lastName = reader.readStringOrNull(offsets[21]);
  object.lastPropertyId = reader.readStringOrNull(offsets[22]);
  object.latitude = reader.readDoubleOrNull(offsets[23]);
  object.liveLatitude = reader.readDoubleOrNull(offsets[24]);
  object.liveLongitude = reader.readDoubleOrNull(offsets[25]);
  object.longitude = reader.readDoubleOrNull(offsets[26]);
  object.mobileNo = reader.readString(offsets[27]);
  object.nearByDistance = reader.readDouble(offsets[28]);
  object.privateSearchDistance = reader.readDouble(offsets[29]);
  object.profilePic = reader.readStringOrNull(offsets[30]);
  object.radius = reader.readLong(offsets[31]);
  object.refreshToken = reader.readStringOrNull(offsets[32]);
  object.subscribedPlanId = reader.readLongOrNull(offsets[33]);
  object.subscribedPlanType = reader.readStringOrNull(offsets[34]);
  object.watermarkLogoPath = reader.readStringOrNull(offsets[35]);
  object.watermarkText = reader.readStringOrNull(offsets[36]);
  object.watermarkType = reader.readLong(offsets[37]);
  return object;
}

P _dbUserInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readDoubleOrNull(offset)) as P;
    case 26:
      return (reader.readDoubleOrNull(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readDouble(offset)) as P;
    case 29:
      return (reader.readDouble(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readLong(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readLongOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbUserInfoGetId(DbUserInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbUserInfoGetLinks(DbUserInfo object) {
  return [];
}

void _dbUserInfoAttach(IsarCollection<dynamic> col, Id id, DbUserInfo object) {
  object.id = id;
}

extension DbUserInfoQueryWhereSort
    on QueryBuilder<DbUserInfo, DbUserInfo, QWhere> {
  QueryBuilder<DbUserInfo, DbUserInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbUserInfoQueryWhere
    on QueryBuilder<DbUserInfo, DbUserInfo, QWhereClause> {
  QueryBuilder<DbUserInfo, DbUserInfo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterWhereClause> idBetween(
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

extension DbUserInfoQueryFilter
    on QueryBuilder<DbUserInfo, DbUserInfo, QFilterCondition> {
  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accessToken',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accessToken',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accessToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accessToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessToken',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      accessTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accessToken',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      appSubscriptionEndTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appSubscriptionEndTime',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      appSubscriptionEndTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appSubscriptionEndTime',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      appSubscriptionEndTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appSubscriptionEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      appSubscriptionEndTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appSubscriptionEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      appSubscriptionEndTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appSubscriptionEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      appSubscriptionEndTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appSubscriptionEndTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associationCode',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associationCode',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associationId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associationId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'associationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'associationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'associationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'associationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'associationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associationId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associationPhoto',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associationPhoto',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationPhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associationPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationPhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associationPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associationPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      associationPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associationPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backupSize',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backupSize',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> backupSizeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backupSize',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backupSize',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backupSize',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> backupSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backupSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupTakenAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backupTakenAt',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupTakenAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backupTakenAt',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupTakenAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backupTakenAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupTakenAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backupTakenAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupTakenAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backupTakenAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      backupTakenAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backupTakenAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brokerCode',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brokerCode',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> brokerCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brokerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brokerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brokerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> brokerCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brokerCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brokerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brokerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brokerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> brokerCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brokerCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brokerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brokerCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brokerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brooonSearchDistanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonSearchDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brooonSearchDistanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brooonSearchDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brooonSearchDistanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brooonSearchDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      brooonSearchDistanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brooonSearchDistance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentArea',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentArea',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentArea',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentArea',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      currentAreaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentArea',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firebaseUserId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firebaseUserId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firebaseUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firebaseUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firebaseUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firebaseUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firebaseUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firebaseUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firebaseUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firebaseUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firebaseUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> firstNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firstNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> firstNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> firstNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> firstNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> firstNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      freeTrialExpiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'freeTrialExpired',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      freeTrialExpiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'freeTrialExpired',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      freeTrialExpiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'freeTrialExpired',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gDriveEmailAddress',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gDriveEmailAddress',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gDriveEmailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gDriveEmailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gDriveEmailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gDriveEmailAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gDriveEmailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gDriveEmailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gDriveEmailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gDriveEmailAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gDriveEmailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveEmailAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gDriveEmailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> gDriveIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gDriveId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gDriveId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> gDriveIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gDriveId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gDriveId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> gDriveIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gDriveId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> gDriveIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gDriveId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gDriveId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> gDriveIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gDriveId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> gDriveIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gDriveId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> gDriveIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gDriveId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gDriveId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      gDriveIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gDriveId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      isActiveUserEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActiveUser',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      isUserLoggedOutEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUserLoggedOut',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      isVerifiedUserEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVerifiedUser',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastInquiryId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastInquiryId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastInquiryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastInquiryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastInquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastInquiryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastInquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> lastNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> lastNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> lastNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPropertyId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPropertyId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPropertyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastPropertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastPropertyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPropertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      lastPropertyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastPropertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> latitudeLessThan(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLatitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'liveLatitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLatitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'liveLatitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLatitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'liveLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLatitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'liveLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLatitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'liveLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLatitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'liveLatitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLongitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'liveLongitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLongitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'liveLongitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLongitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'liveLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLongitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'liveLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLongitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'liveLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      liveLongitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'liveLongitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> longitudeEqualTo(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> longitudeLessThan(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> longitudeBetween(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> mobileNoEqualTo(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> mobileNoLessThan(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> mobileNoBetween(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> mobileNoEndsWith(
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

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> mobileNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mobileNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> mobileNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mobileNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      mobileNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobileNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      mobileNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mobileNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      nearByDistanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nearByDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      nearByDistanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nearByDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      nearByDistanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nearByDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      nearByDistanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nearByDistance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      privateSearchDistanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privateSearchDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      privateSearchDistanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'privateSearchDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      privateSearchDistanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'privateSearchDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      privateSearchDistanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'privateSearchDistance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'profilePic',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'profilePic',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> profilePicEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profilePic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profilePic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profilePic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> profilePicBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profilePic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'profilePic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'profilePic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'profilePic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> profilePicMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'profilePic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profilePic',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      profilePicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'profilePic',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> radiusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'radius',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> radiusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'radius',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> radiusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'radius',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition> radiusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'radius',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'refreshToken',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'refreshToken',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refreshToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'refreshToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refreshToken',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      refreshTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'refreshToken',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subscribedPlanId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subscribedPlanId',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscribedPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subscribedPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subscribedPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subscribedPlanId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subscribedPlanType',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subscribedPlanType',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscribedPlanType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subscribedPlanType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subscribedPlanType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subscribedPlanType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subscribedPlanType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subscribedPlanType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subscribedPlanType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subscribedPlanType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscribedPlanType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      subscribedPlanTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subscribedPlanType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'watermarkLogoPath',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'watermarkLogoPath',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watermarkLogoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watermarkLogoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watermarkLogoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watermarkLogoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'watermarkLogoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'watermarkLogoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'watermarkLogoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'watermarkLogoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watermarkLogoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkLogoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'watermarkLogoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'watermarkText',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'watermarkText',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watermarkText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watermarkText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watermarkText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watermarkText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'watermarkText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'watermarkText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'watermarkText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'watermarkText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watermarkText',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'watermarkText',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watermarkType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watermarkType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watermarkType',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterFilterCondition>
      watermarkTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watermarkType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbUserInfoQueryObject
    on QueryBuilder<DbUserInfo, DbUserInfo, QFilterCondition> {}

extension DbUserInfoQueryLinks
    on QueryBuilder<DbUserInfo, DbUserInfo, QFilterCondition> {}

extension DbUserInfoQuerySortBy
    on QueryBuilder<DbUserInfo, DbUserInfo, QSortBy> {
  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByAppSubscriptionEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appSubscriptionEndTime', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByAppSubscriptionEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appSubscriptionEndTime', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByAssociationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByAssociationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByAssociationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByAssociationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByAssociationPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByAssociationPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByBackupSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupSize', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByBackupSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupSize', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByBackupTakenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTakenAt', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByBackupTakenAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTakenAt', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByBrokerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerCode', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByBrokerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerCode', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByBrooonSearchDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonSearchDistance', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByBrooonSearchDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonSearchDistance', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByCurrentArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentArea', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByCurrentAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentArea', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByFirebaseUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseUserId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByFirebaseUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseUserId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByFreeTrialExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freeTrialExpired', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByFreeTrialExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freeTrialExpired', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByGDriveEmailAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveEmailAddress', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByGDriveEmailAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveEmailAddress', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByGDriveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByGDriveIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByIsActiveUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveUser', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByIsActiveUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveUser', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByIsUserLoggedOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserLoggedOut', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByIsUserLoggedOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserLoggedOut', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByIsVerifiedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerifiedUser', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByIsVerifiedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerifiedUser', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLastInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLastInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLastPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPropertyId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByLastPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPropertyId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLiveLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLatitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLiveLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLatitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLiveLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLongitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLiveLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLongitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByMobileNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByMobileNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByNearByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearByDistance', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByNearByDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearByDistance', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByPrivateSearchDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateSearchDistance', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByPrivateSearchDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateSearchDistance', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByProfilePic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePic', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByProfilePicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePic', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radius', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByRadiusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radius', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByRefreshToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByRefreshTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortBySubscribedPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortBySubscribedPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortBySubscribedPlanType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanType', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortBySubscribedPlanTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanType', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByWatermarkLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkLogoPath', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      sortByWatermarkLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkLogoPath', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByWatermarkText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkText', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByWatermarkTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkText', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByWatermarkType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkType', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> sortByWatermarkTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkType', Sort.desc);
    });
  }
}

extension DbUserInfoQuerySortThenBy
    on QueryBuilder<DbUserInfo, DbUserInfo, QSortThenBy> {
  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByAppSubscriptionEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appSubscriptionEndTime', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByAppSubscriptionEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appSubscriptionEndTime', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByAssociationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByAssociationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationCode', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByAssociationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByAssociationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByAssociationPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByAssociationPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associationPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByBackupSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupSize', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByBackupSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupSize', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByBackupTakenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTakenAt', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByBackupTakenAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTakenAt', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByBrokerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerCode', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByBrokerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brokerCode', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByBrooonSearchDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonSearchDistance', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByBrooonSearchDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonSearchDistance', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByCurrentArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentArea', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByCurrentAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentArea', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByFirebaseUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseUserId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByFirebaseUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseUserId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByFreeTrialExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freeTrialExpired', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByFreeTrialExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freeTrialExpired', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByGDriveEmailAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveEmailAddress', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByGDriveEmailAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveEmailAddress', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByGDriveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByGDriveIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gDriveId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByIsActiveUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveUser', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByIsActiveUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActiveUser', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByIsUserLoggedOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserLoggedOut', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByIsUserLoggedOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserLoggedOut', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByIsVerifiedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerifiedUser', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByIsVerifiedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerifiedUser', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLastInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLastInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLastPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPropertyId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByLastPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPropertyId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLiveLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLatitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLiveLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLatitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLiveLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLongitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLiveLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liveLongitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByMobileNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByMobileNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNo', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByNearByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearByDistance', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByNearByDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearByDistance', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByPrivateSearchDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateSearchDistance', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByPrivateSearchDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateSearchDistance', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByProfilePic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePic', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByProfilePicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePic', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radius', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByRadiusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radius', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByRefreshToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByRefreshTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenBySubscribedPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanId', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenBySubscribedPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanId', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenBySubscribedPlanType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanType', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenBySubscribedPlanTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscribedPlanType', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByWatermarkLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkLogoPath', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy>
      thenByWatermarkLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkLogoPath', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByWatermarkText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkText', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByWatermarkTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkText', Sort.desc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByWatermarkType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkType', Sort.asc);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QAfterSortBy> thenByWatermarkTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watermarkType', Sort.desc);
    });
  }
}

extension DbUserInfoQueryWhereDistinct
    on QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> {
  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByAccessToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accessToken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct>
      distinctByAppSubscriptionEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appSubscriptionEndTime');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByAssociationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByAssociationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByAssociationPhoto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associationPhoto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByBackupSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backupSize');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByBackupTakenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backupTakenAt');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByBrokerCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brokerCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct>
      distinctByBrooonSearchDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonSearchDistance');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByCurrentArea(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentArea', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByFirebaseUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firebaseUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByFreeTrialExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'freeTrialExpired');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByGDriveEmailAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gDriveEmailAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByGDriveId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gDriveId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByIsActiveUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActiveUser');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByIsUserLoggedOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUserLoggedOut');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByIsVerifiedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVerifiedUser');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByLastInquiryId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastInquiryId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByLastPropertyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPropertyId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByLiveLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'liveLatitude');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByLiveLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'liveLongitude');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByMobileNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mobileNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByNearByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nearByDistance');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct>
      distinctByPrivateSearchDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'privateSearchDistance');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByProfilePic(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profilePic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'radius');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByRefreshToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refreshToken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctBySubscribedPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subscribedPlanId');
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctBySubscribedPlanType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subscribedPlanType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByWatermarkLogoPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watermarkLogoPath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByWatermarkText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watermarkText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserInfo, DbUserInfo, QDistinct> distinctByWatermarkType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watermarkType');
    });
  }
}

extension DbUserInfoQueryProperty
    on QueryBuilder<DbUserInfo, DbUserInfo, QQueryProperty> {
  QueryBuilder<DbUserInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> accessTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accessToken');
    });
  }

  QueryBuilder<DbUserInfo, DateTime?, QQueryOperations>
      appSubscriptionEndTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appSubscriptionEndTime');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations>
      associationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associationCode');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> associationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associationId');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations>
      associationPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associationPhoto');
    });
  }

  QueryBuilder<DbUserInfo, int?, QQueryOperations> backupSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backupSize');
    });
  }

  QueryBuilder<DbUserInfo, DateTime?, QQueryOperations>
      backupTakenAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backupTakenAt');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> brokerCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brokerCode');
    });
  }

  QueryBuilder<DbUserInfo, double, QQueryOperations>
      brooonSearchDistanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonSearchDistance');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> currentAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentArea');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> firebaseUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firebaseUserId');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<DbUserInfo, bool?, QQueryOperations> freeTrialExpiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'freeTrialExpired');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations>
      gDriveEmailAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gDriveEmailAddress');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> gDriveIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gDriveId');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<DbUserInfo, bool, QQueryOperations> isActiveUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActiveUser');
    });
  }

  QueryBuilder<DbUserInfo, bool, QQueryOperations> isUserLoggedOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUserLoggedOut');
    });
  }

  QueryBuilder<DbUserInfo, bool, QQueryOperations> isVerifiedUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVerifiedUser');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> lastInquiryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastInquiryId');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> lastPropertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPropertyId');
    });
  }

  QueryBuilder<DbUserInfo, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<DbUserInfo, double?, QQueryOperations> liveLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'liveLatitude');
    });
  }

  QueryBuilder<DbUserInfo, double?, QQueryOperations> liveLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'liveLongitude');
    });
  }

  QueryBuilder<DbUserInfo, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<DbUserInfo, String, QQueryOperations> mobileNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mobileNo');
    });
  }

  QueryBuilder<DbUserInfo, double, QQueryOperations> nearByDistanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nearByDistance');
    });
  }

  QueryBuilder<DbUserInfo, double, QQueryOperations>
      privateSearchDistanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privateSearchDistance');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> profilePicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profilePic');
    });
  }

  QueryBuilder<DbUserInfo, int, QQueryOperations> radiusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'radius');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> refreshTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refreshToken');
    });
  }

  QueryBuilder<DbUserInfo, int?, QQueryOperations> subscribedPlanIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subscribedPlanId');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations>
      subscribedPlanTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subscribedPlanType');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations>
      watermarkLogoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watermarkLogoPath');
    });
  }

  QueryBuilder<DbUserInfo, String?, QQueryOperations> watermarkTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watermarkText');
    });
  }

  QueryBuilder<DbUserInfo, int, QQueryOperations> watermarkTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watermarkType');
    });
  }
}
