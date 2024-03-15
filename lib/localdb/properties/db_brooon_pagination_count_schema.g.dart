// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_brooon_pagination_count_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbBrooonPaginationCountSchemaCollection on Isar {
  IsarCollection<DbBrooonPaginationCountSchema>
      get dbBrooonPaginationCountSchemas => this.collection();
}

const DbBrooonPaginationCountSchemaSchema = CollectionSchema(
  name: r'DbBrooonPaginationCountSchema',
  id: -297298348138988029,
  properties: {
    r'currentPage': PropertySchema(
      id: 0,
      name: r'currentPage',
      type: IsarType.long,
    ),
    r'nextPage': PropertySchema(
      id: 1,
      name: r'nextPage',
      type: IsarType.long,
    ),
    r'totalItemsCount': PropertySchema(
      id: 2,
      name: r'totalItemsCount',
      type: IsarType.long,
    ),
    r'totalPages': PropertySchema(
      id: 3,
      name: r'totalPages',
      type: IsarType.long,
    )
  },
  estimateSize: _dbBrooonPaginationCountSchemaEstimateSize,
  serialize: _dbBrooonPaginationCountSchemaSerialize,
  deserialize: _dbBrooonPaginationCountSchemaDeserialize,
  deserializeProp: _dbBrooonPaginationCountSchemaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbBrooonPaginationCountSchemaGetId,
  getLinks: _dbBrooonPaginationCountSchemaGetLinks,
  attach: _dbBrooonPaginationCountSchemaAttach,
  version: '3.0.5',
);

int _dbBrooonPaginationCountSchemaEstimateSize(
  DbBrooonPaginationCountSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dbBrooonPaginationCountSchemaSerialize(
  DbBrooonPaginationCountSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentPage);
  writer.writeLong(offsets[1], object.nextPage);
  writer.writeLong(offsets[2], object.totalItemsCount);
  writer.writeLong(offsets[3], object.totalPages);
}

DbBrooonPaginationCountSchema _dbBrooonPaginationCountSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbBrooonPaginationCountSchema();
  object.currentPage = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.nextPage = reader.readLongOrNull(offsets[1]);
  object.totalItemsCount = reader.readLongOrNull(offsets[2]);
  object.totalPages = reader.readLongOrNull(offsets[3]);
  return object;
}

P _dbBrooonPaginationCountSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbBrooonPaginationCountSchemaGetId(DbBrooonPaginationCountSchema object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbBrooonPaginationCountSchemaGetLinks(
    DbBrooonPaginationCountSchema object) {
  return [];
}

void _dbBrooonPaginationCountSchemaAttach(
    IsarCollection<dynamic> col, Id id, DbBrooonPaginationCountSchema object) {
  object.id = id;
}

extension DbBrooonPaginationCountSchemaQueryWhereSort on QueryBuilder<
    DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema, QWhere> {
  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbBrooonPaginationCountSchemaQueryWhere on QueryBuilder<
    DbBrooonPaginationCountSchema,
    DbBrooonPaginationCountSchema,
    QWhereClause> {
  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
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

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
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

extension DbBrooonPaginationCountSchemaQueryFilter on QueryBuilder<
    DbBrooonPaginationCountSchema,
    DbBrooonPaginationCountSchema,
    QFilterCondition> {
  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> currentPageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentPage',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> currentPageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentPage',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> currentPageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPage',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> currentPageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPage',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> currentPageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPage',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> currentPageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
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

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
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

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
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

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> nextPageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextPage',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> nextPageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextPage',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> nextPageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextPage',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> nextPageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextPage',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> nextPageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextPage',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> nextPageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextPage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalItemsCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalItemsCount',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalItemsCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalItemsCount',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalItemsCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalItemsCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalItemsCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalItemsCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalItemsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalPagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPages',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalPagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPages',
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalPagesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPages',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalPagesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPages',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalPagesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPages',
        value: value,
      ));
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterFilterCondition> totalPagesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbBrooonPaginationCountSchemaQueryObject on QueryBuilder<
    DbBrooonPaginationCountSchema,
    DbBrooonPaginationCountSchema,
    QFilterCondition> {}

extension DbBrooonPaginationCountSchemaQueryLinks on QueryBuilder<
    DbBrooonPaginationCountSchema,
    DbBrooonPaginationCountSchema,
    QFilterCondition> {}

extension DbBrooonPaginationCountSchemaQuerySortBy on QueryBuilder<
    DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema, QSortBy> {
  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByCurrentPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPage', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByCurrentPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPage', Sort.desc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByNextPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPage', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByNextPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPage', Sort.desc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByTotalItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsCount', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByTotalItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsCount', Sort.desc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByTotalPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> sortByTotalPagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.desc);
    });
  }
}

extension DbBrooonPaginationCountSchemaQuerySortThenBy on QueryBuilder<
    DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema, QSortThenBy> {
  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByCurrentPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPage', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByCurrentPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPage', Sort.desc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByNextPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPage', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByNextPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPage', Sort.desc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByTotalItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsCount', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByTotalItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsCount', Sort.desc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByTotalPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.asc);
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QAfterSortBy> thenByTotalPagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.desc);
    });
  }
}

extension DbBrooonPaginationCountSchemaQueryWhereDistinct on QueryBuilder<
    DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema, QDistinct> {
  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QDistinct> distinctByCurrentPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPage');
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QDistinct> distinctByNextPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextPage');
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QDistinct> distinctByTotalItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalItemsCount');
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, DbBrooonPaginationCountSchema,
      QDistinct> distinctByTotalPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPages');
    });
  }
}

extension DbBrooonPaginationCountSchemaQueryProperty on QueryBuilder<
    DbBrooonPaginationCountSchema,
    DbBrooonPaginationCountSchema,
    QQueryProperty> {
  QueryBuilder<DbBrooonPaginationCountSchema, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, int?, QQueryOperations>
      currentPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPage');
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, int?, QQueryOperations>
      nextPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextPage');
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, int?, QQueryOperations>
      totalItemsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalItemsCount');
    });
  }

  QueryBuilder<DbBrooonPaginationCountSchema, int?, QQueryOperations>
      totalPagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPages');
    });
  }
}
