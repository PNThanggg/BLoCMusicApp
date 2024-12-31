// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_playlist_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMediaPlaylistDatabaseCollection on Isar {
  IsarCollection<MediaPlaylistDatabase> get mediaPlaylistDatabases =>
      this.collection();
}

const MediaPlaylistDatabaseSchema = CollectionSchema(
  name: r'MediaPlaylistDatabase',
  id: 5185179501067526144,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'lastUpdated': PropertySchema(
      id: 1,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'mediaRanks': PropertySchema(
      id: 2,
      name: r'mediaRanks',
      type: IsarType.longList,
    ),
    r'playlistName': PropertySchema(
      id: 3,
      name: r'playlistName',
      type: IsarType.string,
    )
  },
  estimateSize: _mediaPlaylistDatabaseEstimateSize,
  serialize: _mediaPlaylistDatabaseSerialize,
  deserialize: _mediaPlaylistDatabaseDeserialize,
  deserializeProp: _mediaPlaylistDatabaseDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {
    r'mediaItems': LinkSchema(
      id: -7967781462480006408,
      name: r'mediaItems',
      target: r'MediaItemDatabase',
      single: false,
      linkName: r'mediaInPlaylistsDB',
    )
  },
  embeddedSchemas: {},
  getId: _mediaPlaylistDatabaseGetId,
  getLinks: _mediaPlaylistDatabaseGetLinks,
  attach: _mediaPlaylistDatabaseAttach,
  version: '3.1.0+1',
);

int _mediaPlaylistDatabaseEstimateSize(
  MediaPlaylistDatabase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.mediaRanks.length * 8;
  bytesCount += 3 + object.playlistName.length * 3;
  return bytesCount;
}

void _mediaPlaylistDatabaseSerialize(
  MediaPlaylistDatabase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeDateTime(offsets[1], object.lastUpdated);
  writer.writeLongList(offsets[2], object.mediaRanks);
  writer.writeString(offsets[3], object.playlistName);
}

MediaPlaylistDatabase _mediaPlaylistDatabaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MediaPlaylistDatabase(
    lastUpdated: reader.readDateTimeOrNull(offsets[1]),
    playlistName: reader.readString(offsets[3]),
  );
  object.mediaRanks = reader.readLongList(offsets[2]) ?? [];
  return object;
}

P _mediaPlaylistDatabaseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mediaPlaylistDatabaseGetId(MediaPlaylistDatabase object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _mediaPlaylistDatabaseGetLinks(
    MediaPlaylistDatabase object) {
  return [object.mediaItems];
}

void _mediaPlaylistDatabaseAttach(
    IsarCollection<dynamic> col, Id id, MediaPlaylistDatabase object) {
  object.mediaItems
      .attach(col, col.isar.collection<MediaItemDatabase>(), r'mediaItems', id);
}

extension MediaPlaylistDatabaseQueryWhereSort
    on QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QWhere> {
  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MediaPlaylistDatabaseQueryWhere on QueryBuilder<MediaPlaylistDatabase,
    MediaPlaylistDatabase, QWhereClause> {
  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterWhereClause>
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterWhereClause>
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

extension MediaPlaylistDatabaseQueryFilter on QueryBuilder<
    MediaPlaylistDatabase, MediaPlaylistDatabase, QFilterCondition> {
  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> lastUpdatedGreaterThan(
    DateTime? value, {
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> lastUpdatedLessThan(
    DateTime? value, {
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaRanks',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mediaRanks',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mediaRanks',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mediaRanks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediaRanks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediaRanks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediaRanks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediaRanks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediaRanks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaRanksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediaRanks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playlistName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
          QAfterFilterCondition>
      playlistNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
          QAfterFilterCondition>
      playlistNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playlistName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistName',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> playlistNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playlistName',
        value: '',
      ));
    });
  }
}

extension MediaPlaylistDatabaseQueryObject on QueryBuilder<
    MediaPlaylistDatabase, MediaPlaylistDatabase, QFilterCondition> {}

extension MediaPlaylistDatabaseQueryLinks on QueryBuilder<MediaPlaylistDatabase,
    MediaPlaylistDatabase, QFilterCondition> {
  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaItems(FilterQuery<MediaItemDatabase> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mediaItems');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaItems', length, true, length, true);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaItems', 0, true, 0, true);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaItems', 0, false, 999999, true);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaItems', 0, true, length, include);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaItems', length, include, 999999, true);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase,
      QAfterFilterCondition> mediaItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'mediaItems', lower, includeLower, upper, includeUpper);
    });
  }
}

extension MediaPlaylistDatabaseQuerySortBy
    on QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QSortBy> {
  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      sortByPlaylistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.asc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      sortByPlaylistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.desc);
    });
  }
}

extension MediaPlaylistDatabaseQuerySortThenBy
    on QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QSortThenBy> {
  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByPlaylistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.asc);
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QAfterSortBy>
      thenByPlaylistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.desc);
    });
  }
}

extension MediaPlaylistDatabaseQueryWhereDistinct
    on QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QDistinct> {
  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QDistinct>
      distinctByMediaRanks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mediaRanks');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, MediaPlaylistDatabase, QDistinct>
      distinctByPlaylistName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playlistName', caseSensitive: caseSensitive);
    });
  }
}

extension MediaPlaylistDatabaseQueryProperty on QueryBuilder<
    MediaPlaylistDatabase, MediaPlaylistDatabase, QQueryProperty> {
  QueryBuilder<MediaPlaylistDatabase, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, int, QQueryOperations>
      hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, DateTime?, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, List<int>, QQueryOperations>
      mediaRanksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediaRanks');
    });
  }

  QueryBuilder<MediaPlaylistDatabase, String, QQueryOperations>
      playlistNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playlistName');
    });
  }
}
