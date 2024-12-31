// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecentlyPlayedDBCollection on Isar {
  IsarCollection<RecentlyPlayedDB> get recentlyPlayedDBs => this.collection();
}

const RecentlyPlayedDBSchema = CollectionSchema(
  name: r'RecentlyPlayedDB',
  id: -815534397388884072,
  properties: {
    r'lastPlayed': PropertySchema(
      id: 0,
      name: r'lastPlayed',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _recentlyPlayedDBEstimateSize,
  serialize: _recentlyPlayedDBSerialize,
  deserialize: _recentlyPlayedDBDeserialize,
  deserializeProp: _recentlyPlayedDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'mediaItem': LinkSchema(
      id: 5428180275953081554,
      name: r'mediaItem',
      target: r'MediaItemDatabase',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _recentlyPlayedDBGetId,
  getLinks: _recentlyPlayedDBGetLinks,
  attach: _recentlyPlayedDBAttach,
  version: '3.1.0+1',
);

int _recentlyPlayedDBEstimateSize(
  RecentlyPlayedDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _recentlyPlayedDBSerialize(
  RecentlyPlayedDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastPlayed);
}

RecentlyPlayedDB _recentlyPlayedDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecentlyPlayedDB(
    id: id,
    lastPlayed: reader.readDateTime(offsets[0]),
  );
  return object;
}

P _recentlyPlayedDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recentlyPlayedDBGetId(RecentlyPlayedDB object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _recentlyPlayedDBGetLinks(RecentlyPlayedDB object) {
  return [object.mediaItem];
}

void _recentlyPlayedDBAttach(
    IsarCollection<dynamic> col, Id id, RecentlyPlayedDB object) {
  object.id = id;
  object.mediaItem
      .attach(col, col.isar.collection<MediaItemDatabase>(), r'mediaItem', id);
}

extension RecentlyPlayedDBQueryWhereSort
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QWhere> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecentlyPlayedDBQueryWhere
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QWhereClause> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause>
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

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause> idBetween(
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

extension RecentlyPlayedDBQueryFilter
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QFilterCondition> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idLessThan(
    Id? value, {
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

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      lastPlayedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      lastPlayedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      lastPlayedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      lastPlayedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPlayed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecentlyPlayedDBQueryObject
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QFilterCondition> {}

extension RecentlyPlayedDBQueryLinks
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QFilterCondition> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      mediaItem(FilterQuery<MediaItemDatabase> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mediaItem');
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      mediaItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaItem', 0, true, 0, true);
    });
  }
}

extension RecentlyPlayedDBQuerySortBy
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QSortBy> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByLastPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.desc);
    });
  }
}

extension RecentlyPlayedDBQuerySortThenBy
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QSortThenBy> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByLastPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.desc);
    });
  }
}

extension RecentlyPlayedDBQueryWhereDistinct
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct>
      distinctByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPlayed');
    });
  }
}

extension RecentlyPlayedDBQueryProperty
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QQueryProperty> {
  QueryBuilder<RecentlyPlayedDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecentlyPlayedDB, DateTime, QQueryOperations>
      lastPlayedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPlayed');
    });
  }
}
