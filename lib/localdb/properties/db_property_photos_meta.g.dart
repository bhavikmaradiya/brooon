// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_property_photos_meta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbPropertyPhotoMetaCollection on Isar {
  IsarCollection<DbPropertyPhotoMeta> get dbPropertyPhotoMetas =>
      this.collection();
}

const DbPropertyPhotoMetaSchema = CollectionSchema(
  name: r'DbPropertyPhotoMeta',
  id: -2796338830217615019,
  properties: {
    r'imagePath': PropertySchema(
      id: 0,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isWatermarkGenerated': PropertySchema(
      id: 1,
      name: r'isWatermarkGenerated',
      type: IsarType.bool,
    ),
    r'propertyId': PropertySchema(
      id: 2,
      name: r'propertyId',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _dbPropertyPhotoMetaEstimateSize,
  serialize: _dbPropertyPhotoMetaSerialize,
  deserialize: _dbPropertyPhotoMetaDeserialize,
  deserializeProp: _dbPropertyPhotoMetaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbPropertyPhotoMetaGetId,
  getLinks: _dbPropertyPhotoMetaGetLinks,
  attach: _dbPropertyPhotoMetaAttach,
  version: '3.0.5',
);

int _dbPropertyPhotoMetaEstimateSize(
  DbPropertyPhotoMeta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imagePath.length * 3;
  return bytesCount;
}

void _dbPropertyPhotoMetaSerialize(
  DbPropertyPhotoMeta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imagePath);
  writer.writeBool(offsets[1], object.isWatermarkGenerated);
  writer.writeLong(offsets[2], object.propertyId);
  writer.writeLong(offsets[3], object.userId);
}

DbPropertyPhotoMeta _dbPropertyPhotoMetaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbPropertyPhotoMeta();
  object.id = id;
  object.imagePath = reader.readString(offsets[0]);
  object.isWatermarkGenerated = reader.readBool(offsets[1]);
  object.propertyId = reader.readLong(offsets[2]);
  object.userId = reader.readLongOrNull(offsets[3]);
  return object;
}

P _dbPropertyPhotoMetaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbPropertyPhotoMetaGetId(DbPropertyPhotoMeta object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbPropertyPhotoMetaGetLinks(
    DbPropertyPhotoMeta object) {
  return [];
}

void _dbPropertyPhotoMetaAttach(
    IsarCollection<dynamic> col, Id id, DbPropertyPhotoMeta object) {
  object.id = id;
}

extension DbPropertyPhotoMetaQueryWhereSort
    on QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QWhere> {
  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbPropertyPhotoMetaQueryWhere
    on QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QWhereClause> {
  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterWhereClause>
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

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterWhereClause>
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

extension DbPropertyPhotoMetaQueryFilter on QueryBuilder<DbPropertyPhotoMeta,
    DbPropertyPhotoMeta, QFilterCondition> {
  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
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

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
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

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
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

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      isWatermarkGeneratedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWatermarkGenerated',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      propertyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      propertyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      propertyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      propertyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      userIdGreaterThan(
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

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      userIdLessThan(
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

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterFilterCondition>
      userIdBetween(
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

extension DbPropertyPhotoMetaQueryObject on QueryBuilder<DbPropertyPhotoMeta,
    DbPropertyPhotoMeta, QFilterCondition> {}

extension DbPropertyPhotoMetaQueryLinks on QueryBuilder<DbPropertyPhotoMeta,
    DbPropertyPhotoMeta, QFilterCondition> {}

extension DbPropertyPhotoMetaQuerySortBy
    on QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QSortBy> {
  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByIsWatermarkGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatermarkGenerated', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByIsWatermarkGeneratedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatermarkGenerated', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbPropertyPhotoMetaQuerySortThenBy
    on QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QSortThenBy> {
  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByIsWatermarkGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatermarkGenerated', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByIsWatermarkGeneratedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatermarkGenerated', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbPropertyPhotoMetaQueryWhereDistinct
    on QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QDistinct> {
  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QDistinct>
      distinctByImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QDistinct>
      distinctByIsWatermarkGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWatermarkGenerated');
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QDistinct>
      distinctByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyId');
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension DbPropertyPhotoMetaQueryProperty
    on QueryBuilder<DbPropertyPhotoMeta, DbPropertyPhotoMeta, QQueryProperty> {
  QueryBuilder<DbPropertyPhotoMeta, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, String, QQueryOperations>
      imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, bool, QQueryOperations>
      isWatermarkGeneratedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWatermarkGenerated');
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, int, QQueryOperations>
      propertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyId');
    });
  }

  QueryBuilder<DbPropertyPhotoMeta, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
