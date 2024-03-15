// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_additional_furnish.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbAdditionalFurnishCollection on Isar {
  IsarCollection<DbAdditionalFurnish> get dbAdditionalFurnishs =>
      this.collection();
}

const DbAdditionalFurnishSchema = CollectionSchema(
  name: r'DbAdditionalFurnish',
  id: 7077874913190523529,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _dbAdditionalFurnishEstimateSize,
  serialize: _dbAdditionalFurnishSerialize,
  deserialize: _dbAdditionalFurnishDeserialize,
  deserializeProp: _dbAdditionalFurnishDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbAdditionalFurnishGetId,
  getLinks: _dbAdditionalFurnishGetLinks,
  attach: _dbAdditionalFurnishAttach,
  version: '3.0.5',
);

int _dbAdditionalFurnishEstimateSize(
  DbAdditionalFurnish object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _dbAdditionalFurnishSerialize(
  DbAdditionalFurnish object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

DbAdditionalFurnish _dbAdditionalFurnishDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbAdditionalFurnish();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _dbAdditionalFurnishDeserializeProp<P>(
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

Id _dbAdditionalFurnishGetId(DbAdditionalFurnish object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbAdditionalFurnishGetLinks(
    DbAdditionalFurnish object) {
  return [];
}

void _dbAdditionalFurnishAttach(
    IsarCollection<dynamic> col, Id id, DbAdditionalFurnish object) {
  object.id = id;
}

extension DbAdditionalFurnishQueryWhereSort
    on QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QWhere> {
  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbAdditionalFurnishQueryWhere
    on QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QWhereClause> {
  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterWhereClause>
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterWhereClause>
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

extension DbAdditionalFurnishQueryFilter on QueryBuilder<DbAdditionalFurnish,
    DbAdditionalFurnish, QFilterCondition> {
  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DbAdditionalFurnishQueryObject on QueryBuilder<DbAdditionalFurnish,
    DbAdditionalFurnish, QFilterCondition> {}

extension DbAdditionalFurnishQueryLinks on QueryBuilder<DbAdditionalFurnish,
    DbAdditionalFurnish, QFilterCondition> {}

extension DbAdditionalFurnishQuerySortBy
    on QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QSortBy> {
  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DbAdditionalFurnishQuerySortThenBy
    on QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QSortThenBy> {
  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DbAdditionalFurnishQueryWhereDistinct
    on QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QDistinct> {
  QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension DbAdditionalFurnishQueryProperty
    on QueryBuilder<DbAdditionalFurnish, DbAdditionalFurnish, QQueryProperty> {
  QueryBuilder<DbAdditionalFurnish, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbAdditionalFurnish, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
