// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_bool_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppSettingsBoolDatabaseCollection on Isar {
  IsarCollection<AppSettingsBoolDatabase> get appSettingsBoolDatabases =>
      this.collection();
}

const AppSettingsBoolDatabaseSchema = CollectionSchema(
  name: r'AppSettingsBoolDatabase',
  id: -1588436359218729245,
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
  estimateSize: _appSettingsBoolDatabaseEstimateSize,
  serialize: _appSettingsBoolDatabaseSerialize,
  deserialize: _appSettingsBoolDatabaseDeserialize,
  deserializeProp: _appSettingsBoolDatabaseDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appSettingsBoolDatabaseGetId,
  getLinks: _appSettingsBoolDatabaseGetLinks,
  attach: _appSettingsBoolDatabaseAttach,
  version: '3.1.0+1',
);

int _appSettingsBoolDatabaseEstimateSize(
  AppSettingsBoolDatabase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.settingName.length * 3;
  return bytesCount;
}

void _appSettingsBoolDatabaseSerialize(
  AppSettingsBoolDatabase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeString(offsets[1], object.settingName);
  writer.writeBool(offsets[2], object.settingValue);
}

AppSettingsBoolDatabase _appSettingsBoolDatabaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppSettingsBoolDatabase(
    settingName: reader.readString(offsets[1]),
    settingValue: reader.readBool(offsets[2]),
  );
  return object;
}

P _appSettingsBoolDatabaseDeserializeProp<P>(
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

Id _appSettingsBoolDatabaseGetId(AppSettingsBoolDatabase object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _appSettingsBoolDatabaseGetLinks(
    AppSettingsBoolDatabase object) {
  return [];
}

void _appSettingsBoolDatabaseAttach(
    IsarCollection<dynamic> col, Id id, AppSettingsBoolDatabase object) {}

extension AppSettingsBoolDatabaseQueryWhereSort
    on QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QWhere> {
  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppSettingsBoolDatabaseQueryWhere on QueryBuilder<
    AppSettingsBoolDatabase, AppSettingsBoolDatabase, QWhereClause> {
  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterWhereClause> isarIdBetween(
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

extension AppSettingsBoolDatabaseQueryFilter on QueryBuilder<
    AppSettingsBoolDatabase, AppSettingsBoolDatabase, QFilterCondition> {
  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameEqualTo(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameGreaterThan(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameLessThan(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameBetween(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameStartsWith(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameEndsWith(
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

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
          QAfterFilterCondition>
      settingNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'settingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
          QAfterFilterCondition>
      settingNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'settingName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'settingName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase,
      QAfterFilterCondition> settingValueEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'settingValue',
        value: value,
      ));
    });
  }
}

extension AppSettingsBoolDatabaseQueryObject on QueryBuilder<
    AppSettingsBoolDatabase, AppSettingsBoolDatabase, QFilterCondition> {}

extension AppSettingsBoolDatabaseQueryLinks on QueryBuilder<
    AppSettingsBoolDatabase, AppSettingsBoolDatabase, QFilterCondition> {}

extension AppSettingsBoolDatabaseQuerySortBy
    on QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QSortBy> {
  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      sortBySettingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      sortBySettingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      sortBySettingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      sortBySettingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.desc);
    });
  }
}

extension AppSettingsBoolDatabaseQuerySortThenBy on QueryBuilder<
    AppSettingsBoolDatabase, AppSettingsBoolDatabase, QSortThenBy> {
  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenBySettingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenBySettingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingName', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenBySettingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QAfterSortBy>
      thenBySettingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingValue', Sort.desc);
    });
  }
}

extension AppSettingsBoolDatabaseQueryWhereDistinct on QueryBuilder<
    AppSettingsBoolDatabase, AppSettingsBoolDatabase, QDistinct> {
  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QDistinct>
      distinctBySettingName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'settingName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, AppSettingsBoolDatabase, QDistinct>
      distinctBySettingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'settingValue');
    });
  }
}

extension AppSettingsBoolDatabaseQueryProperty on QueryBuilder<
    AppSettingsBoolDatabase, AppSettingsBoolDatabase, QQueryProperty> {
  QueryBuilder<AppSettingsBoolDatabase, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, int, QQueryOperations>
      hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, String, QQueryOperations>
      settingNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'settingName');
    });
  }

  QueryBuilder<AppSettingsBoolDatabase, bool, QQueryOperations>
      settingValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'settingValue');
    });
  }
}
