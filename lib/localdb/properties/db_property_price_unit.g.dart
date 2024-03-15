// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_property_price_unit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbPropertyPriceUnitCollection on Isar {
  IsarCollection<DbPropertyPriceUnit> get dbPropertyPriceUnits =>
      this.collection();
}

const DbPropertyPriceUnitSchema = CollectionSchema(
  name: r'DbPropertyPriceUnit',
  id: 4358613184888522230,
  properties: {
    r'isDefaultUnit': PropertySchema(
      id: 0,
      name: r'isDefaultUnit',
      type: IsarType.bool,
    ),
    r'unit': PropertySchema(
      id: 1,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _dbPropertyPriceUnitEstimateSize,
  serialize: _dbPropertyPriceUnitSerialize,
  deserialize: _dbPropertyPriceUnitDeserialize,
  deserializeProp: _dbPropertyPriceUnitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbPropertyPriceUnitGetId,
  getLinks: _dbPropertyPriceUnitGetLinks,
  attach: _dbPropertyPriceUnitAttach,
  version: '3.0.5',
);

int _dbPropertyPriceUnitEstimateSize(
  DbPropertyPriceUnit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _dbPropertyPriceUnitSerialize(
  DbPropertyPriceUnit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isDefaultUnit);
  writer.writeString(offsets[1], object.unit);
}

DbPropertyPriceUnit _dbPropertyPriceUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbPropertyPriceUnit();
  object.id = id;
  object.isDefaultUnit = reader.readBool(offsets[0]);
  object.unit = reader.readString(offsets[1]);
  return object;
}

P _dbPropertyPriceUnitDeserializeProp<P>(
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

Id _dbPropertyPriceUnitGetId(DbPropertyPriceUnit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbPropertyPriceUnitGetLinks(
    DbPropertyPriceUnit object) {
  return [];
}

void _dbPropertyPriceUnitAttach(
    IsarCollection<dynamic> col, Id id, DbPropertyPriceUnit object) {
  object.id = id;
}

extension DbPropertyPriceUnitQueryWhereSort
    on QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QWhere> {
  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbPropertyPriceUnitQueryWhere
    on QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QWhereClause> {
  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterWhereClause>
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

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterWhereClause>
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

extension DbPropertyPriceUnitQueryFilter on QueryBuilder<DbPropertyPriceUnit,
    DbPropertyPriceUnit, QFilterCondition> {
  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
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

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
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

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
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

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      isDefaultUnitEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefaultUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension DbPropertyPriceUnitQueryObject on QueryBuilder<DbPropertyPriceUnit,
    DbPropertyPriceUnit, QFilterCondition> {}

extension DbPropertyPriceUnitQueryLinks on QueryBuilder<DbPropertyPriceUnit,
    DbPropertyPriceUnit, QFilterCondition> {}

extension DbPropertyPriceUnitQuerySortBy
    on QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QSortBy> {
  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      sortByIsDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultUnit', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      sortByIsDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultUnit', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension DbPropertyPriceUnitQuerySortThenBy
    on QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QSortThenBy> {
  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      thenByIsDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultUnit', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      thenByIsDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultUnit', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension DbPropertyPriceUnitQueryWhereDistinct
    on QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QDistinct> {
  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QDistinct>
      distinctByIsDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefaultUnit');
    });
  }

  QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension DbPropertyPriceUnitQueryProperty
    on QueryBuilder<DbPropertyPriceUnit, DbPropertyPriceUnit, QQueryProperty> {
  QueryBuilder<DbPropertyPriceUnit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbPropertyPriceUnit, bool, QQueryOperations>
      isDefaultUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefaultUnit');
    });
  }

  QueryBuilder<DbPropertyPriceUnit, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
