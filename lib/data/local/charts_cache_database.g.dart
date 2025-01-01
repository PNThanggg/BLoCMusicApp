// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charts_cache_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChartsCacheDatabaseCollection on Isar {
  IsarCollection<ChartsCacheDatabase> get chartsCacheDatabases =>
      this.collection();
}

const ChartsCacheDatabaseSchema = CollectionSchema(
  name: r'ChartsCacheDatabase',
  id: 1014599706117767194,
  properties: {
    r'chartItems': PropertySchema(
      id: 0,
      name: r'chartItems',
      type: IsarType.objectList,
      target: r'ChartItemDatabase',
    ),
    r'chartName': PropertySchema(
      id: 1,
      name: r'chartName',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 2,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'permaURL': PropertySchema(
      id: 3,
      name: r'permaURL',
      type: IsarType.string,
    )
  },
  estimateSize: _chartsCacheDatabaseEstimateSize,
  serialize: _chartsCacheDatabaseSerialize,
  deserialize: _chartsCacheDatabaseDeserialize,
  deserializeProp: _chartsCacheDatabaseDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ChartItemDatabase': ChartItemDatabaseSchema},
  getId: _chartsCacheDatabaseGetId,
  getLinks: _chartsCacheDatabaseGetLinks,
  attach: _chartsCacheDatabaseAttach,
  version: '3.1.0+1',
);

int _chartsCacheDatabaseEstimateSize(
  ChartsCacheDatabase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chartItems.length * 3;
  {
    final offsets = allOffsets[ChartItemDatabase]!;
    for (var i = 0; i < object.chartItems.length; i++) {
      final value = object.chartItems[i];
      bytesCount +=
          ChartItemDatabaseSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.chartName.length * 3;
  {
    final value = object.permaURL;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _chartsCacheDatabaseSerialize(
  ChartsCacheDatabase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ChartItemDatabase>(
    offsets[0],
    allOffsets,
    ChartItemDatabaseSchema.serialize,
    object.chartItems,
  );
  writer.writeString(offsets[1], object.chartName);
  writer.writeDateTime(offsets[2], object.lastUpdated);
  writer.writeString(offsets[3], object.permaURL);
}

ChartsCacheDatabase _chartsCacheDatabaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChartsCacheDatabase(
    chartItems: reader.readObjectList<ChartItemDatabase>(
          offsets[0],
          ChartItemDatabaseSchema.deserialize,
          allOffsets,
          ChartItemDatabase(),
        ) ??
        [],
    chartName: reader.readString(offsets[1]),
    lastUpdated: reader.readDateTime(offsets[2]),
    permaURL: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _chartsCacheDatabaseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ChartItemDatabase>(
            offset,
            ChartItemDatabaseSchema.deserialize,
            allOffsets,
            ChartItemDatabase(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chartsCacheDatabaseGetId(ChartsCacheDatabase object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _chartsCacheDatabaseGetLinks(
    ChartsCacheDatabase object) {
  return [];
}

void _chartsCacheDatabaseAttach(
    IsarCollection<dynamic> col, Id id, ChartsCacheDatabase object) {}

extension ChartsCacheDatabaseQueryWhereSort
    on QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QWhere> {
  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChartsCacheDatabaseQueryWhere
    on QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QWhereClause> {
  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterWhereClause>
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

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterWhereClause>
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

extension ChartsCacheDatabaseQueryFilter on QueryBuilder<ChartsCacheDatabase,
    ChartsCacheDatabase, QFilterCondition> {
  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chartItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chartItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chartItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chartItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chartItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chartItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chartName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chartName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chartName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chartName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chartName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chartName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chartName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chartName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chartName',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chartName',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'permaURL',
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'permaURL',
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permaURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'permaURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'permaURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'permaURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'permaURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'permaURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'permaURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'permaURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permaURL',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      permaURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'permaURL',
        value: '',
      ));
    });
  }
}

extension ChartsCacheDatabaseQueryObject on QueryBuilder<ChartsCacheDatabase,
    ChartsCacheDatabase, QFilterCondition> {
  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterFilterCondition>
      chartItemsElement(FilterQuery<ChartItemDatabase> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'chartItems');
    });
  }
}

extension ChartsCacheDatabaseQueryLinks on QueryBuilder<ChartsCacheDatabase,
    ChartsCacheDatabase, QFilterCondition> {}

extension ChartsCacheDatabaseQuerySortBy
    on QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QSortBy> {
  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      sortByChartName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      sortByChartNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      sortByPermaURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      sortByPermaURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.desc);
    });
  }
}

extension ChartsCacheDatabaseQuerySortThenBy
    on QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QSortThenBy> {
  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByChartName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByChartNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByPermaURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QAfterSortBy>
      thenByPermaURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.desc);
    });
  }
}

extension ChartsCacheDatabaseQueryWhereDistinct
    on QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QDistinct> {
  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QDistinct>
      distinctByChartName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chartName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QDistinct>
      distinctByPermaURL({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'permaURL', caseSensitive: caseSensitive);
    });
  }
}

extension ChartsCacheDatabaseQueryProperty
    on QueryBuilder<ChartsCacheDatabase, ChartsCacheDatabase, QQueryProperty> {
  QueryBuilder<ChartsCacheDatabase, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ChartsCacheDatabase, List<ChartItemDatabase>, QQueryOperations>
      chartItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chartItems');
    });
  }

  QueryBuilder<ChartsCacheDatabase, String, QQueryOperations>
      chartNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chartName');
    });
  }

  QueryBuilder<ChartsCacheDatabase, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<ChartsCacheDatabase, String?, QQueryOperations>
      permaURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'permaURL');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ChartItemDatabaseSchema = Schema(
  name: r'ChartItemDatabase',
  id: -8539424264678980885,
  properties: {
    r'artURL': PropertySchema(
      id: 0,
      name: r'artURL',
      type: IsarType.string,
    ),
    r'artist': PropertySchema(
      id: 1,
      name: r'artist',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _chartItemDatabaseEstimateSize,
  serialize: _chartItemDatabaseSerialize,
  deserialize: _chartItemDatabaseDeserialize,
  deserializeProp: _chartItemDatabaseDeserializeProp,
);

int _chartItemDatabaseEstimateSize(
  ChartItemDatabase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.artURL;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.artist;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _chartItemDatabaseSerialize(
  ChartItemDatabase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artURL);
  writer.writeString(offsets[1], object.artist);
  writer.writeString(offsets[2], object.title);
}

ChartItemDatabase _chartItemDatabaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChartItemDatabase();
  object.artURL = reader.readStringOrNull(offsets[0]);
  object.artist = reader.readStringOrNull(offsets[1]);
  object.title = reader.readStringOrNull(offsets[2]);
  return object;
}

P _chartItemDatabaseDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ChartItemDatabaseQueryFilter
    on QueryBuilder<ChartItemDatabase, ChartItemDatabase, QFilterCondition> {
  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'artURL',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'artURL',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artURL',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artURL',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artist',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artist',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDatabase, ChartItemDatabase, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ChartItemDatabaseQueryObject
    on QueryBuilder<ChartItemDatabase, ChartItemDatabase, QFilterCondition> {}
