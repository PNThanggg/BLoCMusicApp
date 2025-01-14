part of '../wikipedia_api.dart';

class RecommendationResultItemsInner extends Equatable {
  /// Returns a new [RecommendationResultItemsInner] instance.
  const RecommendationResultItemsInner({
    this.wikidataId,
    this.title,
    this.siteLinkCount,
  });

  /// wikidata id for the item
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? wikidataId;

  /// title of the article in the source language
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? title;

  /// count of sites the wikidata item is linked to
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final int? siteLinkCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendationResultItemsInner &&
          other.wikidataId == wikidataId &&
          other.title == title &&
          other.siteLinkCount == siteLinkCount;

  @override
  int get hashCode =>
      (wikidataId == null ? 0 : wikidataId!.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (siteLinkCount == null ? 0 : siteLinkCount!.hashCode);

  @override
  String toString() =>
      'RecommendationResultItemsInner[wikidataId=$wikidataId, title=$title, siteLinkCount=$siteLinkCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (wikidataId != null) {
      json[r'wikidata_id'] = wikidataId;
    } else {
      json[r'wikidata_id'] = null;
    }
    if (title != null) {
      json[r'title'] = title;
    } else {
      json[r'title'] = null;
    }
    if (siteLinkCount != null) {
      json[r'sitelink_count'] = siteLinkCount;
    } else {
      json[r'sitelink_count'] = null;
    }
    return json;
  }

  static RecommendationResultItemsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        for (var key in requiredKeys) {
          assert(json.containsKey(key), 'Required key "RecommendationResultItemsInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RecommendationResultItemsInner[$key]" has a null value in JSON.');
        }
        return true;
      }());

      return RecommendationResultItemsInner(
        wikidataId: mapValueOfType<String>(json, r'wikidata_id'),
        title: mapValueOfType<String>(json, r'title'),
        siteLinkCount: mapValueOfType<int>(json, r'sitelink_count'),
      );
    }
    return null;
  }

  static List<RecommendationResultItemsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RecommendationResultItemsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RecommendationResultItemsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RecommendationResultItemsInner> mapFromJson(dynamic json) {
    final map = <String, RecommendationResultItemsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = RecommendationResultItemsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RecommendationResultItemsInner-objects as value to a dart map
  static Map<String, List<RecommendationResultItemsInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RecommendationResultItemsInner>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RecommendationResultItemsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};

  @override
  List<Object?> get props => [
        wikidataId,
        title,
        siteLinkCount,
      ];
}
