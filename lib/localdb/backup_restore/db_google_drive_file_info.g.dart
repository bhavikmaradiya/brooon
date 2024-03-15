// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_google_drive_file_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDbGoogleDriveFileInfoCollection on Isar {
  IsarCollection<DbGoogleDriveFileInfo> get dbGoogleDriveFileInfos =>
      this.collection();
}

const DbGoogleDriveFileInfoSchema = CollectionSchema(
  name: r'DbGoogleDriveFileInfo',
  id: 3869217295434615980,
  properties: {
    r'fileId': PropertySchema(
      id: 0,
      name: r'fileId',
      type: IsarType.string,
    ),
    r'fileName': PropertySchema(
      id: 1,
      name: r'fileName',
      type: IsarType.string,
    ),
    r'fileSizeInByte': PropertySchema(
      id: 2,
      name: r'fileSizeInByte',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 4,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _dbGoogleDriveFileInfoEstimateSize,
  serialize: _dbGoogleDriveFileInfoSerialize,
  deserialize: _dbGoogleDriveFileInfoDeserialize,
  deserializeProp: _dbGoogleDriveFileInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbGoogleDriveFileInfoGetId,
  getLinks: _dbGoogleDriveFileInfoGetLinks,
  attach: _dbGoogleDriveFileInfoAttach,
  version: '3.0.5',
);

int _dbGoogleDriveFileInfoEstimateSize(
  DbGoogleDriveFileInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fileId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fileName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dbGoogleDriveFileInfoSerialize(
  DbGoogleDriveFileInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fileId);
  writer.writeString(offsets[1], object.fileName);
  writer.writeLong(offsets[2], object.fileSizeInByte);
  writer.writeString(offsets[3], object.status);
  writer.writeLong(offsets[4], object.userId);
}

DbGoogleDriveFileInfo _dbGoogleDriveFileInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbGoogleDriveFileInfo();
  object.fileId = reader.readStringOrNull(offsets[0]);
  object.fileName = reader.readStringOrNull(offsets[1]);
  object.fileSizeInByte = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.status = reader.readStringOrNull(offsets[3]);
  object.userId = reader.readLongOrNull(offsets[4]);
  return object;
}

P _dbGoogleDriveFileInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbGoogleDriveFileInfoGetId(DbGoogleDriveFileInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbGoogleDriveFileInfoGetLinks(
    DbGoogleDriveFileInfo object) {
  return [];
}

void _dbGoogleDriveFileInfoAttach(
    IsarCollection<dynamic> col, Id id, DbGoogleDriveFileInfo object) {
  object.id = id;
}

extension DbGoogleDriveFileInfoQueryWhereSort
    on QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QWhere> {
  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbGoogleDriveFileInfoQueryWhere on QueryBuilder<DbGoogleDriveFileInfo,
    DbGoogleDriveFileInfo, QWhereClause> {
  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterWhereClause>
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

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterWhereClause>
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

extension DbGoogleDriveFileInfoQueryFilter on QueryBuilder<
    DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QFilterCondition> {
  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileId',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileId',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
          QAfterFilterCondition>
      fileIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
          QAfterFilterCondition>
      fileIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileId',
        value: '',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileName',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileName',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
          QAfterFilterCondition>
      fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
          QAfterFilterCondition>
      fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileSizeInByteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileSizeInByte',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileSizeInByteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileSizeInByte',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileSizeInByteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileSizeInByte',
        value: value,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileSizeInByteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileSizeInByte',
        value: value,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileSizeInByteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileSizeInByte',
        value: value,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> fileSizeInByteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileSizeInByte',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
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

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
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

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
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

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo,
      QAfterFilterCondition> userIdBetween(
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

extension DbGoogleDriveFileInfoQueryObject on QueryBuilder<
    DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QFilterCondition> {}

extension DbGoogleDriveFileInfoQueryLinks on QueryBuilder<DbGoogleDriveFileInfo,
    DbGoogleDriveFileInfo, QFilterCondition> {}

extension DbGoogleDriveFileInfoQuerySortBy
    on QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QSortBy> {
  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByFileSizeInByte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSizeInByte', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByFileSizeInByteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSizeInByte', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbGoogleDriveFileInfoQuerySortThenBy
    on QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QSortThenBy> {
  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByFileSizeInByte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSizeInByte', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByFileSizeInByteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSizeInByte', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DbGoogleDriveFileInfoQueryWhereDistinct
    on QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QDistinct> {
  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QDistinct>
      distinctByFileId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QDistinct>
      distinctByFileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QDistinct>
      distinctByFileSizeInByte() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileSizeInByte');
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension DbGoogleDriveFileInfoQueryProperty on QueryBuilder<
    DbGoogleDriveFileInfo, DbGoogleDriveFileInfo, QQueryProperty> {
  QueryBuilder<DbGoogleDriveFileInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, String?, QQueryOperations>
      fileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileId');
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, String?, QQueryOperations>
      fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, int?, QQueryOperations>
      fileSizeInByteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileSizeInByte');
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, String?, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DbGoogleDriveFileInfo, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
