// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app_privacy_logs.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbAppPrivacyLogsCollection on Isar {
  IsarCollection<DbAppPrivacyLogs> get dbAppPrivacyLogs => this.collection();
}

const DbAppPrivacyLogsSchema = CollectionSchema(
  name: r'DbAppPrivacyLogs',
  id: 2674919658538201752,
  properties: {
    r'appLoginTime': PropertySchema(
      id: 0,
      name: r'appLoginTime',
      type: IsarType.dateTime,
    ),
    r'appOpenTime': PropertySchema(
      id: 1,
      name: r'appOpenTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _dbAppPrivacyLogsEstimateSize,
  serialize: _dbAppPrivacyLogsSerialize,
  deserialize: _dbAppPrivacyLogsDeserialize,
  deserializeProp: _dbAppPrivacyLogsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbAppPrivacyLogsGetId,
  getLinks: _dbAppPrivacyLogsGetLinks,
  attach: _dbAppPrivacyLogsAttach,
  version: '3.0.5',
);

int _dbAppPrivacyLogsEstimateSize(
  DbAppPrivacyLogs object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dbAppPrivacyLogsSerialize(
  DbAppPrivacyLogs object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.appLoginTime);
  writer.writeDateTime(offsets[1], object.appOpenTime);
}

DbAppPrivacyLogs _dbAppPrivacyLogsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbAppPrivacyLogs();
  object.appLoginTime = reader.readDateTimeOrNull(offsets[0]);
  object.appOpenTime = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  return object;
}

P _dbAppPrivacyLogsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbAppPrivacyLogsGetId(DbAppPrivacyLogs object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbAppPrivacyLogsGetLinks(DbAppPrivacyLogs object) {
  return [];
}

void _dbAppPrivacyLogsAttach(
    IsarCollection<dynamic> col, Id id, DbAppPrivacyLogs object) {
  object.id = id;
}

extension DbAppPrivacyLogsQueryWhereSort
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QWhere> {
  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbAppPrivacyLogsQueryWhere
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QWhereClause> {
  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterWhereClause>
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

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterWhereClause> idBetween(
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

extension DbAppPrivacyLogsQueryFilter
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QFilterCondition> {
  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appLoginTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appLoginTime',
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appLoginTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appLoginTime',
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appLoginTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appLoginTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appLoginTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appLoginTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appLoginTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appLoginTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appLoginTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appLoginTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appOpenTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appOpenTime',
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appOpenTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appOpenTime',
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appOpenTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appOpenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appOpenTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appOpenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appOpenTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appOpenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      appOpenTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appOpenTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
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

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
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

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterFilterCondition>
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
}

extension DbAppPrivacyLogsQueryObject
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QFilterCondition> {}

extension DbAppPrivacyLogsQueryLinks
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QFilterCondition> {}

extension DbAppPrivacyLogsQuerySortBy
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QSortBy> {
  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      sortByAppLoginTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLoginTime', Sort.asc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      sortByAppLoginTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLoginTime', Sort.desc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      sortByAppOpenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appOpenTime', Sort.asc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      sortByAppOpenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appOpenTime', Sort.desc);
    });
  }
}

extension DbAppPrivacyLogsQuerySortThenBy
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QSortThenBy> {
  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      thenByAppLoginTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLoginTime', Sort.asc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      thenByAppLoginTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLoginTime', Sort.desc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      thenByAppOpenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appOpenTime', Sort.asc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      thenByAppOpenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appOpenTime', Sort.desc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DbAppPrivacyLogsQueryWhereDistinct
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QDistinct> {
  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QDistinct>
      distinctByAppLoginTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appLoginTime');
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QDistinct>
      distinctByAppOpenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appOpenTime');
    });
  }
}

extension DbAppPrivacyLogsQueryProperty
    on QueryBuilder<DbAppPrivacyLogs, DbAppPrivacyLogs, QQueryProperty> {
  QueryBuilder<DbAppPrivacyLogs, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DateTime?, QQueryOperations>
      appLoginTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appLoginTime');
    });
  }

  QueryBuilder<DbAppPrivacyLogs, DateTime?, QQueryOperations>
      appOpenTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appOpenTime');
    });
  }
}
