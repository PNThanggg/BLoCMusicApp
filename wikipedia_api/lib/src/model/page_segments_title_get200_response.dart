part of '../wikipedia_api.dart';

class PageSegmentsTitleGet200Response {
  /// Returns a new [PageSegmentsTitleGet200Response] instance.
  PageSegmentsTitleGet200Response({
    this.sourceLanguage,
    this.title,
    this.revision,
    this.segmentedContent,
  });

  /// The source language of the page
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? sourceLanguage;

  /// The title of the segmented page returned
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? title;

  /// The revision ID of the segmented page
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final int? revision;

  /// The segmented HTML body of the contents of the page
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? segmentedContent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageSegmentsTitleGet200Response &&
          other.sourceLanguage == sourceLanguage &&
          other.title == title &&
          other.revision == revision &&
          other.segmentedContent == segmentedContent;

  @override
  int get hashCode =>
      (sourceLanguage == null ? 0 : sourceLanguage!.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (revision == null ? 0 : revision!.hashCode) +
      (segmentedContent == null ? 0 : segmentedContent!.hashCode);

  @override
  String toString() =>
      'PageSegmentsTitleGet200Response[sourceLanguage=$sourceLanguage, title=$title, revision=$revision, segmentedContent=$segmentedContent]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (sourceLanguage != null) {
      json[r'sourceLanguage'] = sourceLanguage;
    } else {
      json[r'sourceLanguage'] = null;
    }
    if (title != null) {
      json[r'title'] = title;
    } else {
      json[r'title'] = null;
    }
    if (revision != null) {
      json[r'revision'] = revision;
    } else {
      json[r'revision'] = null;
    }
    if (segmentedContent != null) {
      json[r'segmentedContent'] = segmentedContent;
    } else {
      json[r'segmentedContent'] = null;
    }
    return json;
  }

  /// Returns a new [PageSegmentsTitleGet200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static PageSegmentsTitleGet200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        for (var key in requiredKeys) {
          assert(
            json.containsKey(key),
            'Required key "PageSegmentsTitleGet200Response[$key]" is missing from JSON.',
          );
          assert(
            json[key] != null,
            'Required key "PageSegmentsTitleGet200Response[$key]" has a null value in JSON.',
          );
        }
        return true;
      }());

      return PageSegmentsTitleGet200Response(
        sourceLanguage: mapValueOfType<String>(json, r'sourceLanguage'),
        title: mapValueOfType<String>(json, r'title'),
        revision: mapValueOfType<int>(json, r'revision'),
        segmentedContent: mapValueOfType<String>(json, r'segmentedContent'),
      );
    }
    return null;
  }

  static List<PageSegmentsTitleGet200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PageSegmentsTitleGet200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PageSegmentsTitleGet200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PageSegmentsTitleGet200Response> mapFromJson(dynamic json) {
    final map = <String, PageSegmentsTitleGet200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = PageSegmentsTitleGet200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PageSegmentsTitleGet200Response-objects as value to a dart map
  static Map<String, List<PageSegmentsTitleGet200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PageSegmentsTitleGet200Response>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PageSegmentsTitleGet200Response.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
