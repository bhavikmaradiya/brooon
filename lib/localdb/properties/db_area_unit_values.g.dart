// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_area_unit_values.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbAreaUnitValueCollection on Isar {
  IsarCollection<DbAreaUnitValue> get dbAreaUnitValues => this.collection();
}

const DbAreaUnitValueSchema = CollectionSchema(
  name: r'DbAreaUnitValue',
  id: -7230142641068007023,
  properties: {
    r'fromId': PropertySchema(
      id: 0,
      name: r'fromId',
      type: IsarType.long,
    ),
    r'toId': PropertySchema(
      id: 1,
      name: r'toId',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 2,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _dbAreaUnitValueEstimateSize,
  serialize: _dbAreaUnitValueSerialize,
  deserialize: _dbAreaUnitValueDeserialize,
  deserializeProp: _dbAreaUnitValueDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbAreaUnitValueGetId,
  getLinks: _dbAreaUnitValueGetLinks,
  attach: _dbAreaUnitValueAttach,
  version: '3.0.5',
);

int _dbAreaUnitValueEstimateSize(
  DbAreaUnitValue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dbAreaUnitValueSerialize(
  DbAreaUnitValue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.fromId);
  writer.writeLong(offsets[1], object.toId);
  writer.writeDouble(offsets[2], object.value);
}

DbAreaUnitValue _dbAreaUnitValueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbAreaUnitValue();
  object.fromId = reader.readLong(offsets[0]);
  object.id = id;
  object.toId = reader.readLong(offsets[1]);
  object.value = reader.readDouble(offsets[2]);
  return object;
}

P _dbAreaUnitValueDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbAreaUnitValueGetId(DbAreaUnitValue object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbAreaUnitValueGetLinks(DbAreaUnitValue object) {
  return [];
}

void _dbAreaUnitValueAttach(
    IsarCollection<dynamic> col, Id id, DbAreaUnitValue object) {
  object.id = id;
}

extension DbAreaUnitValueQueryWhereSort
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QWhere> {
  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbAreaUnitValueQueryWhere
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QWhereClause> {
  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterWhereClause>
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

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterWhereClause> idBetween(
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

extension DbAreaUnitValueQueryFilter
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QFilterCondition> {
  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      fromIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      fromIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      fromIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      fromIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
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

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
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

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
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

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      toIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      toIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      toIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      toIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      valueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      valueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      valueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterFilterCondition>
      valueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DbAreaUnitValueQueryObject
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QFilterCondition> {}

extension DbAreaUnitValueQueryLinks
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QFilterCondition> {}

extension DbAreaUnitValueQuerySortBy
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QSortBy> {
  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> sortByFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.asc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy>
      sortByFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.desc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> sortByToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.asc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy>
      sortByToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.desc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension DbAreaUnitValueQuerySortThenBy
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QSortThenBy> {
  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> thenByFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.asc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy>
      thenByFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.desc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> thenByToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.asc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy>
      thenByToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.desc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension DbAreaUnitValueQueryWhereDistinct
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QDistinct> {
  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QDistinct> distinctByFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromId');
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QDistinct> distinctByToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toId');
    });
  }

  QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension DbAreaUnitValueQueryProperty
    on QueryBuilder<DbAreaUnitValue, DbAreaUnitValue, QQueryProperty> {
  QueryBuilder<DbAreaUnitValue, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbAreaUnitValue, int, QQueryOperations> fromIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromId');
    });
  }

  QueryBuilder<DbAreaUnitValue, int, QQueryOperations> toIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toId');
    });
  }

  QueryBuilder<DbAreaUnitValue, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
