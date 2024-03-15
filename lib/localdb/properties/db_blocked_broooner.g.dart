// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_blocked_broooner.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbBlockedBrooonerCollection on Isar {
  IsarCollection<DbBlockedBroooner> get dbBlockedBroooners => this.collection();
}

const DbBlockedBrooonerSchema = CollectionSchema(
  name: r'DbBlockedBroooner',
  id: 3037234749927103357,
  properties: {
    r'brooonCode': PropertySchema(
      id: 0,
      name: r'brooonCode',
      type: IsarType.string,
    ),
    r'brooonId': PropertySchema(
      id: 1,
      name: r'brooonId',
      type: IsarType.long,
    ),
    r'brooonName': PropertySchema(
      id: 2,
      name: r'brooonName',
      type: IsarType.string,
    ),
    r'brooonPhone': PropertySchema(
      id: 3,
      name: r'brooonPhone',
      type: IsarType.string,
    ),
    r'brooonPhoto': PropertySchema(
      id: 4,
      name: r'brooonPhoto',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 7,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _dbBlockedBrooonerEstimateSize,
  serialize: _dbBlockedBrooonerSerialize,
  deserialize: _dbBlockedBrooonerDeserialize,
  deserializeProp: _dbBlockedBrooonerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbBlockedBrooonerGetId,
  getLinks: _dbBlockedBrooonerGetLinks,
  attach: _dbBlockedBrooonerAttach,
  version: '3.0.5',
);

int _dbBlockedBrooonerEstimateSize(
  DbBlockedBroooner object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brooonCode.length * 3;
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
  return bytesCount;
}

void _dbBlockedBrooonerSerialize(
  DbBlockedBroooner object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brooonCode);
  writer.writeLong(offsets[1], object.brooonId);
  writer.writeString(offsets[2], object.brooonName);
  writer.writeString(offsets[3], object.brooonPhone);
  writer.writeString(offsets[4], object.brooonPhoto);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeLong(offsets[7], object.userId);
}

DbBlockedBroooner _dbBlockedBrooonerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbBlockedBroooner();
  object.brooonCode = reader.readString(offsets[0]);
  object.brooonId = reader.readLong(offsets[1]);
  object.brooonName = reader.readStringOrNull(offsets[2]);
  object.brooonPhone = reader.readStringOrNull(offsets[3]);
  object.brooonPhoto = reader.readStringOrNull(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.id = id;
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.userId = reader.readLong(offsets[7]);
  return object;
}

P _dbBlockedBrooonerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbBlockedBrooonerGetId(DbBlockedBroooner object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbBlockedBrooonerGetLinks(
    DbBlockedBroooner object) {
  return [];
}

void _dbBlockedBrooonerAttach(
    IsarCollection<dynamic> col, Id id, DbBlockedBroooner object) {
  object.id = id;
}

extension DbBlockedBrooonerQueryWhereSort
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QWhere> {
  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbBlockedBrooonerQueryWhere
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QWhereClause> {
  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterWhereClause>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterWhereClause>
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

extension DbBlockedBrooonerQueryFilter
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QFilterCondition> {
  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeEqualTo(
    String value, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeGreaterThan(
    String value, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeLessThan(
    String value, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonIdGreaterThan(
    int value, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonIdLessThan(
    int value, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonName',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonName',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonPhone',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonPhone',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brooonPhoto',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brooonPhoto',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brooonPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brooonPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brooonPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      brooonPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brooonPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
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

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterFilterCondition>
      userIdBetween(
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

extension DbBlockedBrooonerQueryObject
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QFilterCondition> {}

extension DbBlockedBrooonerQueryLinks
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QFilterCondition> {}

extension DbBlockedBrooonerQuerySortBy
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QSortBy> {
  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByBrooonPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbBlockedBrooonerQuerySortThenBy
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QSortThenBy> {
  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonCode', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonId', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonName', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhone', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByBrooonPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brooonPhoto', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbBlockedBrooonerQueryWhereDistinct
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct> {
  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByBrooonCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByBrooonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonId');
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByBrooonName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByBrooonPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByBrooonPhoto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brooonPhoto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension DbBlockedBrooonerQueryProperty
    on QueryBuilder<DbBlockedBroooner, DbBlockedBroooner, QQueryProperty> {
  QueryBuilder<DbBlockedBroooner, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbBlockedBroooner, String, QQueryOperations>
      brooonCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonCode');
    });
  }

  QueryBuilder<DbBlockedBroooner, int, QQueryOperations> brooonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonId');
    });
  }

  QueryBuilder<DbBlockedBroooner, String?, QQueryOperations>
      brooonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonName');
    });
  }

  QueryBuilder<DbBlockedBroooner, String?, QQueryOperations>
      brooonPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonPhone');
    });
  }

  QueryBuilder<DbBlockedBroooner, String?, QQueryOperations>
      brooonPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brooonPhoto');
    });
  }

  QueryBuilder<DbBlockedBroooner, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DbBlockedBroooner, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<DbBlockedBroooner, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
