// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_purchased_status.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbPurchasedStatusCollection on Isar {
  IsarCollection<DbPurchasedStatus> get dbPurchasedStatus => this.collection();
}

const DbPurchasedStatusSchema = CollectionSchema(
  name: r'DbPurchasedStatus',
  id: -8152789993510887844,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'errorMessage': PropertySchema(
      id: 1,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'planId': PropertySchema(
      id: 2,
      name: r'planId',
      type: IsarType.long,
    ),
    r'planType': PropertySchema(
      id: 3,
      name: r'planType',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 4,
      name: r'price',
      type: IsarType.string,
    ),
    r'productID': PropertySchema(
      id: 5,
      name: r'productID',
      type: IsarType.string,
    ),
    r'purchaseID': PropertySchema(
      id: 6,
      name: r'purchaseID',
      type: IsarType.string,
    ),
    r'purchaseStatus': PropertySchema(
      id: 7,
      name: r'purchaseStatus',
      type: IsarType.string,
    ),
    r'source': PropertySchema(
      id: 8,
      name: r'source',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 9,
      name: r'transactionDate',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uploadedToServer': PropertySchema(
      id: 11,
      name: r'uploadedToServer',
      type: IsarType.bool,
    ),
    r'userId': PropertySchema(
      id: 12,
      name: r'userId',
      type: IsarType.long,
    ),
    r'verificationToken': PropertySchema(
      id: 13,
      name: r'verificationToken',
      type: IsarType.string,
    )
  },
  estimateSize: _dbPurchasedStatusEstimateSize,
  serialize: _dbPurchasedStatusSerialize,
  deserialize: _dbPurchasedStatusDeserialize,
  deserializeProp: _dbPurchasedStatusDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbPurchasedStatusGetId,
  getLinks: _dbPurchasedStatusGetLinks,
  attach: _dbPurchasedStatusAttach,
  version: '3.0.5',
);

int _dbPurchasedStatusEstimateSize(
  DbPurchasedStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.errorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.planType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.price;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.purchaseID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.purchaseStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transactionDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.verificationToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dbPurchasedStatusSerialize(
  DbPurchasedStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.errorMessage);
  writer.writeLong(offsets[2], object.planId);
  writer.writeString(offsets[3], object.planType);
  writer.writeString(offsets[4], object.price);
  writer.writeString(offsets[5], object.productID);
  writer.writeString(offsets[6], object.purchaseID);
  writer.writeString(offsets[7], object.purchaseStatus);
  writer.writeString(offsets[8], object.source);
  writer.writeString(offsets[9], object.transactionDate);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeBool(offsets[11], object.uploadedToServer);
  writer.writeLong(offsets[12], object.userId);
  writer.writeString(offsets[13], object.verificationToken);
}

DbPurchasedStatus _dbPurchasedStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbPurchasedStatus();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.errorMessage = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.planId = reader.readLongOrNull(offsets[2]);
  object.planType = reader.readStringOrNull(offsets[3]);
  object.price = reader.readStringOrNull(offsets[4]);
  object.productID = reader.readStringOrNull(offsets[5]);
  object.purchaseID = reader.readStringOrNull(offsets[6]);
  object.purchaseStatus = reader.readStringOrNull(offsets[7]);
  object.source = reader.readStringOrNull(offsets[8]);
  object.transactionDate = reader.readStringOrNull(offsets[9]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[10]);
  object.uploadedToServer = reader.readBoolOrNull(offsets[11]);
  object.userId = reader.readLongOrNull(offsets[12]);
  object.verificationToken = reader.readStringOrNull(offsets[13]);
  return object;
}

P _dbPurchasedStatusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbPurchasedStatusGetId(DbPurchasedStatus object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbPurchasedStatusGetLinks(
    DbPurchasedStatus object) {
  return [];
}

void _dbPurchasedStatusAttach(
    IsarCollection<dynamic> col, Id id, DbPurchasedStatus object) {
  object.id = id;
}

extension DbPurchasedStatusQueryWhereSort
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QWhere> {
  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbPurchasedStatusQueryWhere
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QWhereClause> {
  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterWhereClause>
      idBetween(
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

extension DbPurchasedStatusQueryFilter
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QFilterCondition> {
  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'planId',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'planId',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'planId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'planId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'planId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'planType',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'planType',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'planType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'planType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'planType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'planType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'planType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'planType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'planType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      planTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'planType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'price',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'price',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      priceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'price',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productID',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productID',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productID',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      productIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productID',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchaseID',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchaseID',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'purchaseID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'purchaseID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'purchaseID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'purchaseID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseID',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'purchaseID',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchaseStatus',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchaseStatus',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'purchaseStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'purchaseStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'purchaseStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'purchaseStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      purchaseStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'purchaseStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      transactionDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionDate',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      uploadedToServerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploadedToServer',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      uploadedToServerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploadedToServer',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      uploadedToServerEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadedToServer',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
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

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verificationToken',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verificationToken',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verificationToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verificationToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verificationToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verificationToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'verificationToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'verificationToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'verificationToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'verificationToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verificationToken',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterFilterCondition>
      verificationTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'verificationToken',
        value: '',
      ));
    });
  }
}

extension DbPurchasedStatusQueryObject
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QFilterCondition> {}

extension DbPurchasedStatusQueryLinks
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QFilterCondition> {}

extension DbPurchasedStatusQuerySortBy
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QSortBy> {
  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPlanType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planType', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPlanTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planType', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByProductIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPurchaseID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseID', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPurchaseIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseID', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPurchaseStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseStatus', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByPurchaseStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseStatus', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByUploadedToServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadedToServer', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByUploadedToServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadedToServer', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByVerificationToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationToken', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      sortByVerificationTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationToken', Sort.desc);
    });
  }
}

extension DbPurchasedStatusQuerySortThenBy
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QSortThenBy> {
  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPlanType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planType', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPlanTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planType', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByProductIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPurchaseID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseID', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPurchaseIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseID', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPurchaseStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseStatus', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByPurchaseStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseStatus', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByUploadedToServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadedToServer', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByUploadedToServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadedToServer', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByVerificationToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationToken', Sort.asc);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QAfterSortBy>
      thenByVerificationTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationToken', Sort.desc);
    });
  }
}

extension DbPurchasedStatusQueryWhereDistinct
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct> {
  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByErrorMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planId');
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByPlanType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct> distinctByPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByProductID({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByPurchaseID({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByPurchaseStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctBySource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByTransactionDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByUploadedToServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadedToServer');
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QDistinct>
      distinctByVerificationToken({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verificationToken',
          caseSensitive: caseSensitive);
    });
  }
}

extension DbPurchasedStatusQueryProperty
    on QueryBuilder<DbPurchasedStatus, DbPurchasedStatus, QQueryProperty> {
  QueryBuilder<DbPurchasedStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbPurchasedStatus, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations>
      errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<DbPurchasedStatus, int?, QQueryOperations> planIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planId');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations>
      planTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planType');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations>
      productIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productID');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations>
      purchaseIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseID');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations>
      purchaseStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseStatus');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<DbPurchasedStatus, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<DbPurchasedStatus, bool?, QQueryOperations>
      uploadedToServerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadedToServer');
    });
  }

  QueryBuilder<DbPurchasedStatus, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<DbPurchasedStatus, String?, QQueryOperations>
      verificationTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verificationToken');
    });
  }
}
