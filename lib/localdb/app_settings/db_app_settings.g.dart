// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbAppSettingsCollection on Isar {
  IsarCollection<DbAppSettings> get dbAppSettings => this.collection();
}

const DbAppSettingsSchema = CollectionSchema(
  name: r'DbAppSettings',
  id: 4999463315515175311,
  properties: {
    r'isAutoStartPermissionAsked': PropertySchema(
      id: 0,
      name: r'isAutoStartPermissionAsked',
      type: IsarType.bool,
    ),
    r'isSharingOptionDialogShown': PropertySchema(
      id: 1,
      name: r'isSharingOptionDialogShown',
      type: IsarType.bool,
    ),
    r'isWalkthroughSeen': PropertySchema(
      id: 2,
      name: r'isWalkthroughSeen',
      type: IsarType.bool,
    )
  },
  estimateSize: _dbAppSettingsEstimateSize,
  serialize: _dbAppSettingsSerialize,
  deserialize: _dbAppSettingsDeserialize,
  deserializeProp: _dbAppSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbAppSettingsGetId,
  getLinks: _dbAppSettingsGetLinks,
  attach: _dbAppSettingsAttach,
  version: '3.0.5',
);

int _dbAppSettingsEstimateSize(
  DbAppSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dbAppSettingsSerialize(
  DbAppSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isAutoStartPermissionAsked);
  writer.writeBool(offsets[1], object.isSharingOptionDialogShown);
  writer.writeBool(offsets[2], object.isWalkthroughSeen);
}

DbAppSettings _dbAppSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbAppSettings();
  object.id = id;
  object.isAutoStartPermissionAsked = reader.readBool(offsets[0]);
  object.isSharingOptionDialogShown = reader.readBool(offsets[1]);
  object.isWalkthroughSeen = reader.readBool(offsets[2]);
  return object;
}

P _dbAppSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbAppSettingsGetId(DbAppSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbAppSettingsGetLinks(DbAppSettings object) {
  return [];
}

void _dbAppSettingsAttach(
    IsarCollection<dynamic> col, Id id, DbAppSettings object) {
  object.id = id;
}

extension DbAppSettingsQueryWhereSort
    on QueryBuilder<DbAppSettings, DbAppSettings, QWhere> {
  QueryBuilder<DbAppSettings, DbAppSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbAppSettingsQueryWhere
    on QueryBuilder<DbAppSettings, DbAppSettings, QWhereClause> {
  QueryBuilder<DbAppSettings, DbAppSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterWhereClause> idBetween(
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

extension DbAppSettingsQueryFilter
    on QueryBuilder<DbAppSettings, DbAppSettings, QFilterCondition> {
  QueryBuilder<DbAppSettings, DbAppSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterFilterCondition>
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

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterFilterCondition>
      isAutoStartPermissionAskedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAutoStartPermissionAsked',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterFilterCondition>
      isSharingOptionDialogShownEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSharingOptionDialogShown',
        value: value,
      ));
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterFilterCondition>
      isWalkthroughSeenEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWalkthroughSeen',
        value: value,
      ));
    });
  }
}

extension DbAppSettingsQueryObject
    on QueryBuilder<DbAppSettings, DbAppSettings, QFilterCondition> {}

extension DbAppSettingsQueryLinks
    on QueryBuilder<DbAppSettings, DbAppSettings, QFilterCondition> {}

extension DbAppSettingsQuerySortBy
    on QueryBuilder<DbAppSettings, DbAppSettings, QSortBy> {
  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      sortByIsAutoStartPermissionAsked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoStartPermissionAsked', Sort.asc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      sortByIsAutoStartPermissionAskedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoStartPermissionAsked', Sort.desc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      sortByIsSharingOptionDialogShown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharingOptionDialogShown', Sort.asc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      sortByIsSharingOptionDialogShownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharingOptionDialogShown', Sort.desc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      sortByIsWalkthroughSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWalkthroughSeen', Sort.asc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      sortByIsWalkthroughSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWalkthroughSeen', Sort.desc);
    });
  }
}

extension DbAppSettingsQuerySortThenBy
    on QueryBuilder<DbAppSettings, DbAppSettings, QSortThenBy> {
  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      thenByIsAutoStartPermissionAsked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoStartPermissionAsked', Sort.asc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      thenByIsAutoStartPermissionAskedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoStartPermissionAsked', Sort.desc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      thenByIsSharingOptionDialogShown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharingOptionDialogShown', Sort.asc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      thenByIsSharingOptionDialogShownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSharingOptionDialogShown', Sort.desc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      thenByIsWalkthroughSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWalkthroughSeen', Sort.asc);
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QAfterSortBy>
      thenByIsWalkthroughSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWalkthroughSeen', Sort.desc);
    });
  }
}

extension DbAppSettingsQueryWhereDistinct
    on QueryBuilder<DbAppSettings, DbAppSettings, QDistinct> {
  QueryBuilder<DbAppSettings, DbAppSettings, QDistinct>
      distinctByIsAutoStartPermissionAsked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAutoStartPermissionAsked');
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QDistinct>
      distinctByIsSharingOptionDialogShown() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSharingOptionDialogShown');
    });
  }

  QueryBuilder<DbAppSettings, DbAppSettings, QDistinct>
      distinctByIsWalkthroughSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWalkthroughSeen');
    });
  }
}

extension DbAppSettingsQueryProperty
    on QueryBuilder<DbAppSettings, DbAppSettings, QQueryProperty> {
  QueryBuilder<DbAppSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbAppSettings, bool, QQueryOperations>
      isAutoStartPermissionAskedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAutoStartPermissionAsked');
    });
  }

  QueryBuilder<DbAppSettings, bool, QQueryOperations>
      isSharingOptionDialogShownProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSharingOptionDialogShown');
    });
  }

  QueryBuilder<DbAppSettings, bool, QQueryOperations>
      isWalkthroughSeenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWalkthroughSeen');
    });
  }
}
