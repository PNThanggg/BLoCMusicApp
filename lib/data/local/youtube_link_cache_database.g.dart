// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_link_cache_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetYoutubeLinkCacheDatabaseCollection on Isar {
  IsarCollection<YoutubeLinkCacheDatabase> get youtubeLinkCacheDatabases =>
      this.collection();
}

const YoutubeLinkCacheDatabaseSchema = CollectionSchema(
  name: r'YoutubeLinkCacheDatabase',
  id: 7148151356457197326,
  properties: {
    r'expireAt': PropertySchema(
      id: 0,
      name: r'expireAt',
      type: IsarType.long,
    ),
    r'highQURL': PropertySchema(
      id: 1,
      name: r'highQURL',
      type: IsarType.string,
    ),
    r'lowQURL': PropertySchema(
      id: 2,
      name: r'lowQURL',
      type: IsarType.string,
    ),
    r'videoId': PropertySchema(
      id: 3,
      name: r'videoId',
      type: IsarType.string,
    )
  },
  estimateSize: _youtubeLinkCacheDatabaseEstimateSize,
  serialize: _youtubeLinkCacheDatabaseSerialize,
  deserialize: _youtubeLinkCacheDatabaseDeserialize,
  deserializeProp: _youtubeLinkCacheDatabaseDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _youtubeLinkCacheDatabaseGetId,
  getLinks: _youtubeLinkCacheDatabaseGetLinks,
  attach: _youtubeLinkCacheDatabaseAttach,
  version: '3.1.0+1',
);

int _youtubeLinkCacheDatabaseEstimateSize(
  YoutubeLinkCacheDatabase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.highQURL.length * 3;
  {
    final value = object.lowQURL;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.videoId.length * 3;
  return bytesCount;
}

void _youtubeLinkCacheDatabaseSerialize(
  YoutubeLinkCacheDatabase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.expireAt);
  writer.writeString(offsets[1], object.highQURL);
  writer.writeString(offsets[2], object.lowQURL);
  writer.writeString(offsets[3], object.videoId);
}

YoutubeLinkCacheDatabase _youtubeLinkCacheDatabaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = YoutubeLinkCacheDatabase(
    expireAt: reader.readLong(offsets[0]),
    highQURL: reader.readString(offsets[1]),
    lowQURL: reader.readStringOrNull(offsets[2]),
    videoId: reader.readString(offsets[3]),
  );
  return object;
}

P _youtubeLinkCacheDatabaseDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _youtubeLinkCacheDatabaseGetId(YoutubeLinkCacheDatabase object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _youtubeLinkCacheDatabaseGetLinks(
    YoutubeLinkCacheDatabase object) {
  return [];
}

void _youtubeLinkCacheDatabaseAttach(
    IsarCollection<dynamic> col, Id id, YoutubeLinkCacheDatabase object) {}

extension YoutubeLinkCacheDatabaseQueryWhereSort on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QWhere> {
  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension YoutubeLinkCacheDatabaseQueryWhere on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QWhereClause> {
  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
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

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
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

extension YoutubeLinkCacheDatabaseQueryFilter on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QFilterCondition> {
  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> expireAtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expireAt',
        value: value,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> expireAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expireAt',
        value: value,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> expireAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expireAt',
        value: value,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> expireAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expireAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'highQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'highQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'highQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'highQURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'highQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'highQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
          QAfterFilterCondition>
      highQURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'highQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
          QAfterFilterCondition>
      highQURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'highQURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'highQURL',
        value: '',
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> highQURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'highQURL',
        value: '',
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
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

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
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

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
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

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lowQURL',
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lowQURL',
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lowQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lowQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lowQURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lowQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lowQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
          QAfterFilterCondition>
      lowQURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lowQURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
          QAfterFilterCondition>
      lowQURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lowQURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowQURL',
        value: '',
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> lowQURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lowQURL',
        value: '',
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'videoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
          QAfterFilterCondition>
      videoIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
          QAfterFilterCondition>
      videoIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'videoId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoId',
        value: '',
      ));
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase,
      QAfterFilterCondition> videoIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'videoId',
        value: '',
      ));
    });
  }
}

extension YoutubeLinkCacheDatabaseQueryObject on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QFilterCondition> {}

extension YoutubeLinkCacheDatabaseQueryLinks on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QFilterCondition> {}

extension YoutubeLinkCacheDatabaseQuerySortBy on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QSortBy> {
  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByExpireAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expireAt', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByExpireAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expireAt', Sort.desc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByHighQURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highQURL', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByHighQURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highQURL', Sort.desc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByLowQURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowQURL', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByLowQURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowQURL', Sort.desc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      sortByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension YoutubeLinkCacheDatabaseQuerySortThenBy on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QSortThenBy> {
  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByExpireAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expireAt', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByExpireAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expireAt', Sort.desc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByHighQURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highQURL', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByHighQURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highQURL', Sort.desc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByLowQURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowQURL', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByLowQURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowQURL', Sort.desc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QAfterSortBy>
      thenByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension YoutubeLinkCacheDatabaseQueryWhereDistinct on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QDistinct> {
  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QDistinct>
      distinctByExpireAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expireAt');
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QDistinct>
      distinctByHighQURL({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'highQURL', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QDistinct>
      distinctByLowQURL({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lowQURL', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QDistinct>
      distinctByVideoId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoId', caseSensitive: caseSensitive);
    });
  }
}

extension YoutubeLinkCacheDatabaseQueryProperty on QueryBuilder<
    YoutubeLinkCacheDatabase, YoutubeLinkCacheDatabase, QQueryProperty> {
  QueryBuilder<YoutubeLinkCacheDatabase, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, int, QQueryOperations>
      expireAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expireAt');
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, String, QQueryOperations>
      highQURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'highQURL');
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, String?, QQueryOperations>
      lowQURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lowQURL');
    });
  }

  QueryBuilder<YoutubeLinkCacheDatabase, String, QQueryOperations>
      videoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoId');
    });
  }
}
