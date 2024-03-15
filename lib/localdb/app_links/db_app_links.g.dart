// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app_links.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbAppLinksCollection on Isar {
  IsarCollection<DbAppLinks> get dbAppLinks => this.collection();
}

const DbAppLinksSchema = CollectionSchema(
  name: r'DbAppLinks',
  id: -5272137442189228696,
  properties: {
    r'webLink': PropertySchema(
      id: 0,
      name: r'webLink',
      type: IsarType.string,
    )
  },
  estimateSize: _dbAppLinksEstimateSize,
  serialize: _dbAppLinksSerialize,
  deserialize: _dbAppLinksDeserialize,
  deserializeProp: _dbAppLinksDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbAppLinksGetId,
  getLinks: _dbAppLinksGetLinks,
  attach: _dbAppLinksAttach,
  version: '3.0.5',
);

int _dbAppLinksEstimateSize(
  DbAppLinks object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.webLink.length * 3;
  return bytesCount;
}

void _dbAppLinksSerialize(
  DbAppLinks object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.webLink);
}

DbAppLinks _dbAppLinksDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbAppLinks();
  object.id = id;
  object.webLink = reader.readString(offsets[0]);
  return object;
}

P _dbAppLinksDeserializeProp<P>(
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

Id _dbAppLinksGetId(DbAppLinks object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbAppLinksGetLinks(DbAppLinks object) {
  return [];
}

void _dbAppLinksAttach(IsarCollection<dynamic> col, Id id, DbAppLinks object) {
  object.id = id;
}

extension DbAppLinksQueryWhereSort
    on QueryBuilder<DbAppLinks, DbAppLinks, QWhere> {
  QueryBuilder<DbAppLinks, DbAppLinks, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbAppLinksQueryWhere
    on QueryBuilder<DbAppLinks, DbAppLinks, QWhereClause> {
  QueryBuilder<DbAppLinks, DbAppLinks, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterWhereClause> idBetween(
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

extension DbAppLinksQueryFilter
    on QueryBuilder<DbAppLinks, DbAppLinks, QFilterCondition> {
  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition>
      webLinkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition> webLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webLink',
        value: '',
      ));
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterFilterCondition>
      webLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webLink',
        value: '',
      ));
    });
  }
}

extension DbAppLinksQueryObject
    on QueryBuilder<DbAppLinks, DbAppLinks, QFilterCondition> {}

extension DbAppLinksQueryLinks
    on QueryBuilder<DbAppLinks, DbAppLinks, QFilterCondition> {}

extension DbAppLinksQuerySortBy
    on QueryBuilder<DbAppLinks, DbAppLinks, QSortBy> {
  QueryBuilder<DbAppLinks, DbAppLinks, QAfterSortBy> sortByWebLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLink', Sort.asc);
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterSortBy> sortByWebLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLink', Sort.desc);
    });
  }
}

extension DbAppLinksQuerySortThenBy
    on QueryBuilder<DbAppLinks, DbAppLinks, QSortThenBy> {
  QueryBuilder<DbAppLinks, DbAppLinks, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterSortBy> thenByWebLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLink', Sort.asc);
    });
  }

  QueryBuilder<DbAppLinks, DbAppLinks, QAfterSortBy> thenByWebLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLink', Sort.desc);
    });
  }
}

extension DbAppLinksQueryWhereDistinct
    on QueryBuilder<DbAppLinks, DbAppLinks, QDistinct> {
  QueryBuilder<DbAppLinks, DbAppLinks, QDistinct> distinctByWebLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webLink', caseSensitive: caseSensitive);
    });
  }
}

extension DbAppLinksQueryProperty
    on QueryBuilder<DbAppLinks, DbAppLinks, QQueryProperty> {
  QueryBuilder<DbAppLinks, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbAppLinks, String, QQueryOperations> webLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webLink');
    });
  }
}
