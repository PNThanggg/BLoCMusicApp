// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecentlyPlayedDatabaseCollection on Isar {
  IsarCollection<RecentlyPlayedDatabase> get recentlyPlayedDatabases =>
      this.collection();
}

const RecentlyPlayedDatabaseSchema = CollectionSchema(
  name: r'RecentlyPlayedDatabase',
  id: -1421317723364813089,
  properties: {
    r'lastPlayed': PropertySchema(
      id: 0,
      name: r'lastPlayed',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _recentlyPlayedDatabaseEstimateSize,
  serialize: _recentlyPlayedDatabaseSerialize,
  deserialize: _recentlyPlayedDatabaseDeserialize,
  deserializeProp: _recentlyPlayedDatabaseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'mediaItem': LinkSchema(
      id: 39513132341645175,
      name: r'mediaItem',
      target: r'MediaItemDatabase',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _recentlyPlayedDatabaseGetId,
  getLinks: _recentlyPlayedDatabaseGetLinks,
  attach: _recentlyPlayedDatabaseAttach,
  version: '3.1.0+1',
);

int _recentlyPlayedDatabaseEstimateSize(
  RecentlyPlayedDatabase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _recentlyPlayedDatabaseSerialize(
  RecentlyPlayedDatabase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastPlayed);
}

RecentlyPlayedDatabase _recentlyPlayedDatabaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecentlyPlayedDatabase(
    id: id,
    lastPlayed: reader.readDateTime(offsets[0]),
  );
  return object;
}

P _recentlyPlayedDatabaseDeserializeProp<P>(
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

Id _recentlyPlayedDatabaseGetId(RecentlyPlayedDatabase object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _recentlyPlayedDatabaseGetLinks(
    RecentlyPlayedDatabase object) {
  return [object.mediaItem];
}

void _recentlyPlayedDatabaseAttach(
    IsarCollection<dynamic> col, Id id, RecentlyPlayedDatabase object) {
  object.id = id;
  object.mediaItem
      .attach(col, col.isar.collection<MediaItemDatabase>(), r'mediaItem', id);
}

extension RecentlyPlayedDatabaseQueryWhereSort
    on QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QWhere> {
  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecentlyPlayedDatabaseQueryWhere on QueryBuilder<
    RecentlyPlayedDatabase, RecentlyPlayedDatabase, QWhereClause> {
  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterWhereClause> idBetween(
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

extension RecentlyPlayedDatabaseQueryFilter on QueryBuilder<
    RecentlyPlayedDatabase, RecentlyPlayedDatabase, QFilterCondition> {
  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> lastPlayedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> lastPlayedGreaterThan(
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

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> lastPlayedLessThan(
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

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> lastPlayedBetween(
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

extension RecentlyPlayedDatabaseQueryObject on QueryBuilder<
    RecentlyPlayedDatabase, RecentlyPlayedDatabase, QFilterCondition> {}

extension RecentlyPlayedDatabaseQueryLinks on QueryBuilder<
    RecentlyPlayedDatabase, RecentlyPlayedDatabase, QFilterCondition> {
  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> mediaItem(FilterQuery<MediaItemDatabase> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mediaItem');
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase,
      QAfterFilterCondition> mediaItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaItem', 0, true, 0, true);
    });
  }
}

extension RecentlyPlayedDatabaseQuerySortBy
    on QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QSortBy> {
  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QAfterSortBy>
      sortByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QAfterSortBy>
      sortByLastPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.desc);
    });
  }
}

extension RecentlyPlayedDatabaseQuerySortThenBy on QueryBuilder<
    RecentlyPlayedDatabase, RecentlyPlayedDatabase, QSortThenBy> {
  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QAfterSortBy>
      thenByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QAfterSortBy>
      thenByLastPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.desc);
    });
  }
}

extension RecentlyPlayedDatabaseQueryWhereDistinct
    on QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QDistinct> {
  QueryBuilder<RecentlyPlayedDatabase, RecentlyPlayedDatabase, QDistinct>
      distinctByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPlayed');
    });
  }
}

extension RecentlyPlayedDatabaseQueryProperty on QueryBuilder<
    RecentlyPlayedDatabase, RecentlyPlayedDatabase, QQueryProperty> {
  QueryBuilder<RecentlyPlayedDatabase, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecentlyPlayedDatabase, DateTime, QQueryOperations>
      lastPlayedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPlayed');
    });
  }
}
