// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_bool_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppSettingsBoolDBCollection on Isar {
  IsarCollection<AppSettingsBoolDB> get appSettingsBoolDBs => this.collection();
}

const AppSettingsBoolDBSchema = CollectionSchema(
  name: r'AppSettingsBoolDB',
  id: -3642544654543208017,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'settingName': PropertySchema(
      id: 1,
      name: r'settingName',
      type: IsarType.string,
    ),
    r'settingValue': PropertySchema(
      id: 2,
      name: r'settingValue',
      type: IsarType.bool,
    )
  },
  estimateSize: _appSettingsBoolDBEstimateSize,
  serialize: _appSettingsBoolDBSerialize,
  deserialize: _appSettingsBoolDBDeserialize,
  deserializeProp: _appSettingsBoolDBDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appSettingsBoolDBGetId,
  getLinks: _appSettingsBoolDBGetLinks,
  attach: _appSettingsBoolDBAttach,
  version: '3.1.0+1',
);

int _appSettingsBoolDBEstimateSize(
  AppSettingsBoolDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.settingName.length * 3;
  return bytesCount;
}

void _appSettingsBoolDBSerialize(
  AppSettingsBoolDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeString(offsets[1], object.settingName);
  writer.writeBool(offsets[2], object.settingValue);
}

AppSettingsBoolDB _appSettingsBoolDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppSettingsBoolDB(
    settingName: reader.readString(offsets[1]),
    settingValue: reader.readBool(offsets[2]),
  );
  return object;
}

P _appSettingsBoolDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appSettingsBoolDBGetId(AppSettingsBoolDB object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _appSettingsBoolDBGetLinks(
    AppSettingsBoolDB object) {
  return [];
}

void _appSettingsBoolDBAttach(
    IsarCollection<dynamic> col, Id id, AppSettingsBoolDB object) {}

extension AppSettingsBoolDBQueryWhereSort
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QWhere> {
  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppSettingsBoolDBQueryWhere
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QWhereClause> {
  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppSettingsBoolDBQueryFilter
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QFilterCondition> {
  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'settingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'settingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'settingName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'settingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'settingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'settingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'settingName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'settingName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterFilterCondition>
      settingValueEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingValue',
        value: value,
      ));
    });
  }
}

extension AppSettingsBoolDBQueryObject
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QFilterCondition> {}

extension AppSettingsBoolDBQueryLinks
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QFilterCondition> {}

extension AppSettingsBoolDBQuerySortBy
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QSortBy> {
  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      sortBySettingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      sortBySettingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      sortBySettingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      sortBySettingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.desc);
    });
  }
}

extension AppSettingsBoolDBQuerySortThenBy
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QSortThenBy> {
  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenBySettingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenBySettingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenBySettingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QAfterSortBy>
      thenBySettingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.desc);
    });
  }
}

extension AppSettingsBoolDBQueryWhereDistinct
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QDistinct> {
  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QDistinct>
      distinctBySettingName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'settingName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QDistinct>
      distinctBySettingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'settingValue');
    });
  }
}

extension AppSettingsBoolDBQueryProperty
    on QueryBuilder<AppSettingsBoolDB, AppSettingsBoolDB, QQueryProperty> {
  QueryBuilder<AppSettingsBoolDB, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AppSettingsBoolDB, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<AppSettingsBoolDB, String, QQueryOperations>
      settingNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'settingName');
    });
  }

  QueryBuilder<AppSettingsBoolDB, bool, QQueryOperations>
      settingValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'settingValue');
    });
  }
}
