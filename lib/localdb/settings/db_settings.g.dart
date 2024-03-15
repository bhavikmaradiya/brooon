// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbSettingCollection on Isar {
  IsarCollection<DbSetting> get dbSettings => this.collection();
}

const DbSettingSchema = CollectionSchema(
  name: r'DbSetting',
  id: -2433752752242998692,
  properties: {
    r'isChecked': PropertySchema(
      id: 0,
      name: r'isChecked',
      type: IsarType.bool,
    ),
    r'settingId': PropertySchema(
      id: 1,
      name: r'settingId',
      type: IsarType.long,
    ),
    r'settingTitle': PropertySchema(
      id: 2,
      name: r'settingTitle',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _dbSettingEstimateSize,
  serialize: _dbSettingSerialize,
  deserialize: _dbSettingDeserialize,
  deserializeProp: _dbSettingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbSettingGetId,
  getLinks: _dbSettingGetLinks,
  attach: _dbSettingAttach,
  version: '3.0.5',
);

int _dbSettingEstimateSize(
  DbSetting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.settingTitle.length * 3;
  return bytesCount;
}

void _dbSettingSerialize(
  DbSetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isChecked);
  writer.writeLong(offsets[1], object.settingId);
  writer.writeString(offsets[2], object.settingTitle);
  writer.writeLong(offsets[3], object.userId);
}

DbSetting _dbSettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbSetting();
  object.id = id;
  object.isChecked = reader.readBool(offsets[0]);
  object.settingId = reader.readLongOrNull(offsets[1]);
  object.settingTitle = reader.readString(offsets[2]);
  object.userId = reader.readLongOrNull(offsets[3]);
  return object;
}

P _dbSettingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbSettingGetId(DbSetting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbSettingGetLinks(DbSetting object) {
  return [];
}

void _dbSettingAttach(IsarCollection<dynamic> col, Id id, DbSetting object) {
  object.id = id;
}

extension DbSettingQueryWhereSort
    on QueryBuilder<DbSetting, DbSetting, QWhere> {
  QueryBuilder<DbSetting, DbSetting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbSettingQueryWhere
    on QueryBuilder<DbSetting, DbSetting, QWhereClause> {
  QueryBuilder<DbSetting, DbSetting, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DbSetting, DbSetting, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterWhereClause> idBetween(
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

extension DbSettingQueryFilter
    on QueryBuilder<DbSetting, DbSetting, QFilterCondition> {
  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> isCheckedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isChecked',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> settingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'settingId',
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'settingId',
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> settingIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'settingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> settingIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'settingId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> settingIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'settingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> settingTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'settingTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'settingTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> settingTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'settingTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'settingTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'settingTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'settingTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> settingTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'settingTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition>
      settingTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'settingTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> userIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> userIdGreaterThan(
    int? value, {
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

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> userIdLessThan(
    int? value, {
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

  QueryBuilder<DbSetting, DbSetting, QAfterFilterCondition> userIdBetween(
    int? lower,
    int? upper, {
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

extension DbSettingQueryObject
    on QueryBuilder<DbSetting, DbSetting, QFilterCondition> {}

extension DbSettingQueryLinks
    on QueryBuilder<DbSetting, DbSetting, QFilterCondition> {}

extension DbSettingQuerySortBy on QueryBuilder<DbSetting, DbSetting, QSortBy> {
  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortByIsChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortByIsCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.desc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortBySettingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingId', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortBySettingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingId', Sort.desc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortBySettingTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingTitle', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortBySettingTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingTitle', Sort.desc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbSettingQuerySortThenBy
    on QueryBuilder<DbSetting, DbSetting, QSortThenBy> {
  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenByIsChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenByIsCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.desc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenBySettingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingId', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenBySettingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingId', Sort.desc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenBySettingTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingTitle', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenBySettingTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingTitle', Sort.desc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbSettingQueryWhereDistinct
    on QueryBuilder<DbSetting, DbSetting, QDistinct> {
  QueryBuilder<DbSetting, DbSetting, QDistinct> distinctByIsChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isChecked');
    });
  }

  QueryBuilder<DbSetting, DbSetting, QDistinct> distinctBySettingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'settingId');
    });
  }

  QueryBuilder<DbSetting, DbSetting, QDistinct> distinctBySettingTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'settingTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbSetting, DbSetting, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension DbSettingQueryProperty
    on QueryBuilder<DbSetting, DbSetting, QQueryProperty> {
  QueryBuilder<DbSetting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbSetting, bool, QQueryOperations> isCheckedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isChecked');
    });
  }

  QueryBuilder<DbSetting, int?, QQueryOperations> settingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'settingId');
    });
  }

  QueryBuilder<DbSetting, String, QQueryOperations> settingTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'settingTitle');
    });
  }

  QueryBuilder<DbSetting, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
