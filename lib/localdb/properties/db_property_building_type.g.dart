// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_property_building_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbPropertyBuildingTypeCollection on Isar {
  IsarCollection<DbPropertyBuildingType> get dbPropertyBuildingTypes =>
      this.collection();
}

const DbPropertyBuildingTypeSchema = CollectionSchema(
  name: r'DbPropertyBuildingType',
  id: 6500865719100037332,
  properties: {
    r'isForAgricultureOnly': PropertySchema(
      id: 0,
      name: r'isForAgricultureOnly',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _dbPropertyBuildingTypeEstimateSize,
  serialize: _dbPropertyBuildingTypeSerialize,
  deserialize: _dbPropertyBuildingTypeDeserialize,
  deserializeProp: _dbPropertyBuildingTypeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbPropertyBuildingTypeGetId,
  getLinks: _dbPropertyBuildingTypeGetLinks,
  attach: _dbPropertyBuildingTypeAttach,
  version: '3.0.5',
);

int _dbPropertyBuildingTypeEstimateSize(
  DbPropertyBuildingType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _dbPropertyBuildingTypeSerialize(
  DbPropertyBuildingType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isForAgricultureOnly);
  writer.writeString(offsets[1], object.name);
}

DbPropertyBuildingType _dbPropertyBuildingTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbPropertyBuildingType();
  object.id = id;
  object.isForAgricultureOnly = reader.readBool(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _dbPropertyBuildingTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbPropertyBuildingTypeGetId(DbPropertyBuildingType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbPropertyBuildingTypeGetLinks(
    DbPropertyBuildingType object) {
  return [];
}

void _dbPropertyBuildingTypeAttach(
    IsarCollection<dynamic> col, Id id, DbPropertyBuildingType object) {
  object.id = id;
}

extension DbPropertyBuildingTypeQueryWhereSort
    on QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QWhere> {
  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbPropertyBuildingTypeQueryWhere on QueryBuilder<
    DbPropertyBuildingType, DbPropertyBuildingType, QWhereClause> {
  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

extension DbPropertyBuildingTypeQueryFilter on QueryBuilder<
    DbPropertyBuildingType, DbPropertyBuildingType, QFilterCondition> {
  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
      QAfterFilterCondition> isForAgricultureOnlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isForAgricultureOnly',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
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

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DbPropertyBuildingTypeQueryObject on QueryBuilder<
    DbPropertyBuildingType, DbPropertyBuildingType, QFilterCondition> {}

extension DbPropertyBuildingTypeQueryLinks on QueryBuilder<
    DbPropertyBuildingType, DbPropertyBuildingType, QFilterCondition> {}

extension DbPropertyBuildingTypeQuerySortBy
    on QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QSortBy> {
  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      sortByIsForAgricultureOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isForAgricultureOnly', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      sortByIsForAgricultureOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isForAgricultureOnly', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DbPropertyBuildingTypeQuerySortThenBy on QueryBuilder<
    DbPropertyBuildingType, DbPropertyBuildingType, QSortThenBy> {
  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      thenByIsForAgricultureOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isForAgricultureOnly', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      thenByIsForAgricultureOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isForAgricultureOnly', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DbPropertyBuildingTypeQueryWhereDistinct
    on QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QDistinct> {
  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QDistinct>
      distinctByIsForAgricultureOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isForAgricultureOnly');
    });
  }

  QueryBuilder<DbPropertyBuildingType, DbPropertyBuildingType, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension DbPropertyBuildingTypeQueryProperty on QueryBuilder<
    DbPropertyBuildingType, DbPropertyBuildingType, QQueryProperty> {
  QueryBuilder<DbPropertyBuildingType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbPropertyBuildingType, bool, QQueryOperations>
      isForAgricultureOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isForAgricultureOnly');
    });
  }

  QueryBuilder<DbPropertyBuildingType, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
