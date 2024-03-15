// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_property_furnished_status.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbPropertyFurnishedStatusCollection on Isar {
  IsarCollection<DbPropertyFurnishedStatus> get dbPropertyFurnishedStatus =>
      this.collection();
}

const DbPropertyFurnishedStatusSchema = CollectionSchema(
  name: r'DbPropertyFurnishedStatus',
  id: 4253426792637552784,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _dbPropertyFurnishedStatusEstimateSize,
  serialize: _dbPropertyFurnishedStatusSerialize,
  deserialize: _dbPropertyFurnishedStatusDeserialize,
  deserializeProp: _dbPropertyFurnishedStatusDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbPropertyFurnishedStatusGetId,
  getLinks: _dbPropertyFurnishedStatusGetLinks,
  attach: _dbPropertyFurnishedStatusAttach,
  version: '3.0.5',
);

int _dbPropertyFurnishedStatusEstimateSize(
  DbPropertyFurnishedStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _dbPropertyFurnishedStatusSerialize(
  DbPropertyFurnishedStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

DbPropertyFurnishedStatus _dbPropertyFurnishedStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbPropertyFurnishedStatus();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _dbPropertyFurnishedStatusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbPropertyFurnishedStatusGetId(DbPropertyFurnishedStatus object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbPropertyFurnishedStatusGetLinks(
    DbPropertyFurnishedStatus object) {
  return [];
}

void _dbPropertyFurnishedStatusAttach(
    IsarCollection<dynamic> col, Id id, DbPropertyFurnishedStatus object) {
  object.id = id;
}

extension DbPropertyFurnishedStatusQueryWhereSort on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QWhere> {
  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbPropertyFurnishedStatusQueryWhere on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QWhereClause> {
  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterWhereClause> idBetween(
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

extension DbPropertyFurnishedStatusQueryFilter on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QFilterCondition> {
  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DbPropertyFurnishedStatusQueryObject on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QFilterCondition> {}

extension DbPropertyFurnishedStatusQueryLinks on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QFilterCondition> {}

extension DbPropertyFurnishedStatusQuerySortBy on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QSortBy> {
  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DbPropertyFurnishedStatusQuerySortThenBy on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QSortThenBy> {
  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus,
      QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DbPropertyFurnishedStatusQueryWhereDistinct on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QDistinct> {
  QueryBuilder<DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension DbPropertyFurnishedStatusQueryProperty on QueryBuilder<
    DbPropertyFurnishedStatus, DbPropertyFurnishedStatus, QQueryProperty> {
  QueryBuilder<DbPropertyFurnishedStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbPropertyFurnishedStatus, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
