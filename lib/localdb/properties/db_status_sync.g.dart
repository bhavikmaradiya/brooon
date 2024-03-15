// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_status_sync.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbStatusSyncCollection on Isar {
  IsarCollection<DbStatusSync> get dbStatusSyncs => this.collection();
}

const DbStatusSyncSchema = CollectionSchema(
  name: r'DbStatusSync',
  id: 6676111501976951488,
  properties: {
    r'closeDealId': PropertySchema(
      id: 0,
      name: r'closeDealId',
      type: IsarType.long,
    ),
    r'closedDealBuyerSellerMobile': PropertySchema(
      id: 1,
      name: r'closedDealBuyerSellerMobile',
      type: IsarType.string,
    ),
    r'closedDealBuyerSellerName': PropertySchema(
      id: 2,
      name: r'closedDealBuyerSellerName',
      type: IsarType.string,
    ),
    r'closedDealBuyerSellerNotes': PropertySchema(
      id: 3,
      name: r'closedDealBuyerSellerNotes',
      type: IsarType.string,
    ),
    r'closedDealPropertyInquiryId': PropertySchema(
      id: 4,
      name: r'closedDealPropertyInquiryId',
      type: IsarType.string,
    ),
    r'inquiryId': PropertySchema(
      id: 5,
      name: r'inquiryId',
      type: IsarType.string,
    ),
    r'isPublic': PropertySchema(
      id: 6,
      name: r'isPublic',
      type: IsarType.bool,
    ),
    r'propertyId': PropertySchema(
      id: 7,
      name: r'propertyId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.string,
    ),
    r'statusType': PropertySchema(
      id: 9,
      name: r'statusType',
      type: IsarType.string,
    ),
    r'syncType': PropertySchema(
      id: 10,
      name: r'syncType',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _dbStatusSyncEstimateSize,
  serialize: _dbStatusSyncSerialize,
  deserialize: _dbStatusSyncDeserialize,
  deserializeProp: _dbStatusSyncDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbStatusSyncGetId,
  getLinks: _dbStatusSyncGetLinks,
  attach: _dbStatusSyncAttach,
  version: '3.0.5',
);

int _dbStatusSyncEstimateSize(
  DbStatusSync object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.closedDealBuyerSellerMobile;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDealBuyerSellerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDealBuyerSellerNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDealPropertyInquiryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.inquiryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.propertyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.statusType.length * 3;
  bytesCount += 3 + object.syncType.length * 3;
  return bytesCount;
}

void _dbStatusSyncSerialize(
  DbStatusSync object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.closeDealId);
  writer.writeString(offsets[1], object.closedDealBuyerSellerMobile);
  writer.writeString(offsets[2], object.closedDealBuyerSellerName);
  writer.writeString(offsets[3], object.closedDealBuyerSellerNotes);
  writer.writeString(offsets[4], object.closedDealPropertyInquiryId);
  writer.writeString(offsets[5], object.inquiryId);
  writer.writeBool(offsets[6], object.isPublic);
  writer.writeString(offsets[7], object.propertyId);
  writer.writeString(offsets[8], object.status);
  writer.writeString(offsets[9], object.statusType);
  writer.writeString(offsets[10], object.syncType);
  writer.writeLong(offsets[11], object.userId);
}

DbStatusSync _dbStatusSyncDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbStatusSync();
  object.closeDealId = reader.readLongOrNull(offsets[0]);
  object.closedDealBuyerSellerMobile = reader.readStringOrNull(offsets[1]);
  object.closedDealBuyerSellerName = reader.readStringOrNull(offsets[2]);
  object.closedDealBuyerSellerNotes = reader.readStringOrNull(offsets[3]);
  object.closedDealPropertyInquiryId = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.inquiryId = reader.readStringOrNull(offsets[5]);
  object.isPublic = reader.readBoolOrNull(offsets[6]);
  object.propertyId = reader.readStringOrNull(offsets[7]);
  object.status = reader.readStringOrNull(offsets[8]);
  object.statusType = reader.readString(offsets[9]);
  object.syncType = reader.readString(offsets[10]);
  object.userId = reader.readLong(offsets[11]);
  return object;
}

P _dbStatusSyncDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbStatusSyncGetId(DbStatusSync object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbStatusSyncGetLinks(DbStatusSync object) {
  return [];
}

void _dbStatusSyncAttach(
    IsarCollection<dynamic> col, Id id, DbStatusSync object) {
  object.id = id;
}

extension DbStatusSyncQueryWhereSort
    on QueryBuilder<DbStatusSync, DbStatusSync, QWhere> {
  QueryBuilder<DbStatusSync, DbStatusSync, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbStatusSyncQueryWhere
    on QueryBuilder<DbStatusSync, DbStatusSync, QWhereClause> {
  QueryBuilder<DbStatusSync, DbStatusSync, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterWhereClause> idBetween(
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

extension DbStatusSyncQueryFilter
    on QueryBuilder<DbStatusSync, DbStatusSync, QFilterCondition> {
  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closeDealIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closeDealId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closeDealIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closeDealId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closeDealIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closeDealId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealBuyerSellerMobile',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealBuyerSellerMobile',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerSellerMobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealBuyerSellerMobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealBuyerSellerMobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealBuyerSellerMobile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealBuyerSellerMobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealBuyerSellerMobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealBuyerSellerMobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealBuyerSellerMobile',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerSellerMobile',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerMobileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealBuyerSellerMobile',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealBuyerSellerName',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealBuyerSellerName',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealBuyerSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealBuyerSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealBuyerSellerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealBuyerSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealBuyerSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealBuyerSellerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealBuyerSellerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerSellerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealBuyerSellerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealBuyerSellerNotes',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealBuyerSellerNotes',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerSellerNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealBuyerSellerNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealBuyerSellerNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealBuyerSellerNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealBuyerSellerNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealBuyerSellerNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealBuyerSellerNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealBuyerSellerNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealBuyerSellerNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealBuyerSellerNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealBuyerSellerNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDealPropertyInquiryId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDealPropertyInquiryId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealPropertyInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDealPropertyInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDealPropertyInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDealPropertyInquiryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDealPropertyInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDealPropertyInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDealPropertyInquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDealPropertyInquiryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDealPropertyInquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      closedDealPropertyInquiryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDealPropertyInquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      inquiryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inquiryId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      inquiryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inquiryId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      inquiryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inquiryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      inquiryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inquiryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      inquiryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      inquiryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inquiryId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      isPublicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isPublic',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      isPublicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isPublic',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      isPublicEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPublic',
        value: value,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyId',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdEqualTo(
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdBetween(
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      propertyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      statusTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      syncTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition>
      userIdLessThan(
    int value, {
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

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
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

extension DbStatusSyncQueryObject
    on QueryBuilder<DbStatusSync, DbStatusSync, QFilterCondition> {}

extension DbStatusSyncQueryLinks
    on QueryBuilder<DbStatusSync, DbStatusSync, QFilterCondition> {}

extension DbStatusSyncQuerySortBy
    on QueryBuilder<DbStatusSync, DbStatusSync, QSortBy> {
  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByCloseDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealBuyerSellerMobile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerMobile', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealBuyerSellerMobileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerMobile', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealBuyerSellerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerName', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealBuyerSellerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerName', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealBuyerSellerNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerNotes', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealBuyerSellerNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerNotes', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealPropertyInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealPropertyInquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByClosedDealPropertyInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealPropertyInquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByIsPublic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublic', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByIsPublicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublic', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByStatusType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      sortByStatusTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortBySyncType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncType', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortBySyncTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncType', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbStatusSyncQuerySortThenBy
    on QueryBuilder<DbStatusSync, DbStatusSync, QSortThenBy> {
  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByCloseDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closeDealId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealBuyerSellerMobile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerMobile', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealBuyerSellerMobileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerMobile', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealBuyerSellerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerName', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealBuyerSellerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerName', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealBuyerSellerNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerNotes', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealBuyerSellerNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealBuyerSellerNotes', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealPropertyInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealPropertyInquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByClosedDealPropertyInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDealPropertyInquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByInquiryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByInquiryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inquiryId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByIsPublic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublic', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByIsPublicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublic', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByStatusType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy>
      thenByStatusTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenBySyncType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncType', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenBySyncTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncType', Sort.desc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbStatusSyncQueryWhereDistinct
    on QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> {
  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctByCloseDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closeDealId');
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct>
      distinctByClosedDealBuyerSellerMobile({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealBuyerSellerMobile',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct>
      distinctByClosedDealBuyerSellerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealBuyerSellerName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct>
      distinctByClosedDealBuyerSellerNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealBuyerSellerNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct>
      distinctByClosedDealPropertyInquiryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDealPropertyInquiryId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctByInquiryId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inquiryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctByIsPublic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPublic');
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctByPropertyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctByStatusType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctBySyncType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbStatusSync, DbStatusSync, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension DbStatusSyncQueryProperty
    on QueryBuilder<DbStatusSync, DbStatusSync, QQueryProperty> {
  QueryBuilder<DbStatusSync, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbStatusSync, int?, QQueryOperations> closeDealIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closeDealId');
    });
  }

  QueryBuilder<DbStatusSync, String?, QQueryOperations>
      closedDealBuyerSellerMobileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealBuyerSellerMobile');
    });
  }

  QueryBuilder<DbStatusSync, String?, QQueryOperations>
      closedDealBuyerSellerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealBuyerSellerName');
    });
  }

  QueryBuilder<DbStatusSync, String?, QQueryOperations>
      closedDealBuyerSellerNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealBuyerSellerNotes');
    });
  }

  QueryBuilder<DbStatusSync, String?, QQueryOperations>
      closedDealPropertyInquiryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDealPropertyInquiryId');
    });
  }

  QueryBuilder<DbStatusSync, String?, QQueryOperations> inquiryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inquiryId');
    });
  }

  QueryBuilder<DbStatusSync, bool?, QQueryOperations> isPublicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPublic');
    });
  }

  QueryBuilder<DbStatusSync, String?, QQueryOperations> propertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyId');
    });
  }

  QueryBuilder<DbStatusSync, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DbStatusSync, String, QQueryOperations> statusTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusType');
    });
  }

  QueryBuilder<DbStatusSync, String, QQueryOperations> syncTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncType');
    });
  }

  QueryBuilder<DbStatusSync, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
