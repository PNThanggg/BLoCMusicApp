// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charts_cache_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChartsCacheDBCollection on Isar {
  IsarCollection<ChartsCacheDB> get chartsCacheDBs => this.collection();
}

const ChartsCacheDBSchema = CollectionSchema(
  name: r'ChartsCacheDB',
  id: 7045537303772603982,
  properties: {
    r'chartItems': PropertySchema(
      id: 0,
      name: r'chartItems',
      type: IsarType.objectList,
      target: r'ChartItemDB',
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
  estimateSize: _chartsCacheDBEstimateSize,
  serialize: _chartsCacheDBSerialize,
  deserialize: _chartsCacheDBDeserialize,
  deserializeProp: _chartsCacheDBDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ChartItemDB': ChartItemDBSchema},
  getId: _chartsCacheDBGetId,
  getLinks: _chartsCacheDBGetLinks,
  attach: _chartsCacheDBAttach,
  version: '3.1.0+1',
);

int _chartsCacheDBEstimateSize(
  ChartsCacheDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chartItems.length * 3;
  {
    final offsets = allOffsets[ChartItemDB]!;
    for (var i = 0; i < object.chartItems.length; i++) {
      final value = object.chartItems[i];
      bytesCount += ChartItemDBSchema.estimateSize(value, offsets, allOffsets);
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

void _chartsCacheDBSerialize(
  ChartsCacheDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ChartItemDB>(
    offsets[0],
    allOffsets,
    ChartItemDBSchema.serialize,
    object.chartItems,
  );
  writer.writeString(offsets[1], object.chartName);
  writer.writeDateTime(offsets[2], object.lastUpdated);
  writer.writeString(offsets[3], object.permaURL);
}

ChartsCacheDB _chartsCacheDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChartsCacheDB(
    chartItems: reader.readObjectList<ChartItemDB>(
          offsets[0],
          ChartItemDBSchema.deserialize,
          allOffsets,
          ChartItemDB(),
        ) ??
        [],
    chartName: reader.readString(offsets[1]),
    lastUpdated: reader.readDateTime(offsets[2]),
    permaURL: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _chartsCacheDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ChartItemDB>(
            offset,
            ChartItemDBSchema.deserialize,
            allOffsets,
            ChartItemDB(),
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

Id _chartsCacheDBGetId(ChartsCacheDB object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _chartsCacheDBGetLinks(ChartsCacheDB object) {
  return [];
}

void _chartsCacheDBAttach(
    IsarCollection<dynamic> col, Id id, ChartsCacheDB object) {}

extension ChartsCacheDBQueryWhereSort
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QWhere> {
  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChartsCacheDBQueryWhere
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QWhereClause> {
  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterWhereClause>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterWhereClause> isarIdBetween(
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

extension ChartsCacheDBQueryFilter
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QFilterCondition> {
  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      chartNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chartName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      chartNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chartName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      chartNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chartName',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      chartNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chartName',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      permaURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'permaURL',
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      permaURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'permaURL',
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
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

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      permaURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'permaURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      permaURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'permaURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      permaURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permaURL',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      permaURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'permaURL',
        value: '',
      ));
    });
  }
}

extension ChartsCacheDBQueryObject
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QFilterCondition> {
  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterFilterCondition>
      chartItemsElement(FilterQuery<ChartItemDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'chartItems');
    });
  }
}

extension ChartsCacheDBQueryLinks
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QFilterCondition> {}

extension ChartsCacheDBQuerySortBy
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QSortBy> {
  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> sortByChartName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy>
      sortByChartNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> sortByPermaURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy>
      sortByPermaURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.desc);
    });
  }
}

extension ChartsCacheDBQuerySortThenBy
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QSortThenBy> {
  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> thenByChartName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy>
      thenByChartNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chartName', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy> thenByPermaURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.asc);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QAfterSortBy>
      thenByPermaURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permaURL', Sort.desc);
    });
  }
}

extension ChartsCacheDBQueryWhereDistinct
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QDistinct> {
  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QDistinct> distinctByChartName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chartName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<ChartsCacheDB, ChartsCacheDB, QDistinct> distinctByPermaURL(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'permaURL', caseSensitive: caseSensitive);
    });
  }
}

extension ChartsCacheDBQueryProperty
    on QueryBuilder<ChartsCacheDB, ChartsCacheDB, QQueryProperty> {
  QueryBuilder<ChartsCacheDB, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ChartsCacheDB, List<ChartItemDB>, QQueryOperations>
      chartItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chartItems');
    });
  }

  QueryBuilder<ChartsCacheDB, String, QQueryOperations> chartNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chartName');
    });
  }

  QueryBuilder<ChartsCacheDB, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<ChartsCacheDB, String?, QQueryOperations> permaURLProperty() {
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

const ChartItemDBSchema = Schema(
  name: r'ChartItemDB',
  id: 3430415545377878575,
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
  estimateSize: _chartItemDBEstimateSize,
  serialize: _chartItemDBSerialize,
  deserialize: _chartItemDBDeserialize,
  deserializeProp: _chartItemDBDeserializeProp,
);

int _chartItemDBEstimateSize(
  ChartItemDB object,
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

void _chartItemDBSerialize(
  ChartItemDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artURL);
  writer.writeString(offsets[1], object.artist);
  writer.writeString(offsets[2], object.title);
}

ChartItemDB _chartItemDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChartItemDB();
  object.artURL = reader.readStringOrNull(offsets[0]);
  object.artist = reader.readStringOrNull(offsets[1]);
  object.title = reader.readStringOrNull(offsets[2]);
  return object;
}

P _chartItemDBDeserializeProp<P>(
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

extension ChartItemDBQueryFilter
    on QueryBuilder<ChartItemDB, ChartItemDB, QFilterCondition> {
  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'artURL',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      artURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'artURL',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artURLEqualTo(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artURLLessThan(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artURLBetween(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artURLEndsWith(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artURLContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artURLMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      artURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artURL',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      artURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artURL',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      artistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artistEqualTo(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artistLessThan(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artistBetween(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artistEndsWith(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artistContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> artistMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artist',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChartItemDB, ChartItemDB, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ChartItemDBQueryObject
    on QueryBuilder<ChartItemDB, ChartItemDB, QFilterCondition> {}
