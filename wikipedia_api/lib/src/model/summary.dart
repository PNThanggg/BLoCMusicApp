part of '../wikipedia_api.dart';

class Summary extends Equatable {
  /// Returns a new [Summary] instance.
  const Summary({
    required this.titles,
    required this.extract,
    required this.lang,
    required this.dir,
    this.type,
    this.title,
    this.displayTitle,
    this.pageId,
    this.extractHtml,
    this.thumbnail,
    this.originalImage,
    this.timestamp,
    this.description,
    this.coordinates,
  });

  final String? type;

  final TitlesSet titles;

  /// The page title. Deprecated: Use `titles.normalized` instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? title;

  /// The page title how it should be shown to the user. Deprecated: Use `titles.display` instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? displayTitle;

  /// The page ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final int? pageId;

  /// First several sentences of an article in plain text
  final String extract;

  /// First several sentences of an article in simple HTML format
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? extractHtml;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final Thumbnail? thumbnail;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final OriginalImage? originalImage;

  /// The page language code
  final String lang;

  /// The page language direction code
  final String dir;

  /// The time when the page was last edited in the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? timestamp;

  /// Wikidata description for the page
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final SummaryCoordinates? coordinates;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Summary &&
          other.type == type &&
          other.titles == titles &&
          other.title == title &&
          other.displayTitle == displayTitle &&
          other.pageId == pageId &&
          other.extract == extract &&
          other.extractHtml == extractHtml &&
          other.thumbnail == thumbnail &&
          other.originalImage == originalImage &&
          other.lang == lang &&
          other.dir == dir &&
          other.timestamp == timestamp &&
          other.description == description &&
          other.coordinates == coordinates;

  @override
  int get hashCode =>
      (titles.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (displayTitle == null ? 0 : displayTitle!.hashCode) +
      (pageId == null ? 0 : pageId!.hashCode) +
      (extract.hashCode) +
      (extractHtml == null ? 0 : extractHtml!.hashCode) +
      (thumbnail == null ? 0 : thumbnail!.hashCode) +
      (originalImage == null ? 0 : originalImage!.hashCode) +
      (lang.hashCode) +
      (dir.hashCode) +
      (timestamp == null ? 0 : timestamp!.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (coordinates == null ? 0 : coordinates!.hashCode);

  @override
  String toString() =>
      'Summary[type=$type, titles=$titles, title=$title, displaytitle=$displayTitle, pageid=$pageId, extract=$extract, extractHtml=$extractHtml, thumbnail=$thumbnail, originalimage=$originalImage, lang=$lang, dir=$dir, timestamp=$timestamp, description=$description, coordinates=$coordinates]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'titles'] = titles;
    if (type != null) {
      json[r'type'] = type;
    } else {
      json[r'type'] = null;
    }
    if (title != null) {
      json[r'title'] = title;
    } else {
      json[r'title'] = null;
    }
    if (displayTitle != null) {
      json[r'displaytitle'] = displayTitle;
    } else {
      json[r'displaytitle'] = null;
    }
    if (pageId != null) {
      json[r'pageid'] = pageId;
    } else {
      json[r'pageid'] = null;
    }
    json[r'extract'] = extract;
    if (extractHtml != null) {
      json[r'extract_html'] = extractHtml;
    } else {
      json[r'extract_html'] = null;
    }
    if (thumbnail != null) {
      json[r'thumbnail'] = thumbnail;
    } else {
      json[r'thumbnail'] = null;
    }
    if (originalImage != null) {
      json[r'originalimage'] = originalImage;
    } else {
      json[r'originalimage'] = null;
    }
    json[r'lang'] = lang;
    json[r'dir'] = dir;
    if (timestamp != null) {
      json[r'timestamp'] = timestamp;
    } else {
      json[r'timestamp'] = null;
    }
    if (description != null) {
      json[r'description'] = description;
    } else {
      json[r'description'] = null;
    }
    if (coordinates != null) {
      json[r'coordinates'] = coordinates;
    } else {
      json[r'coordinates'] = null;
    }
    return json;
  }

  /// Returns a new [Summary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  factory Summary.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "Summary[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "Summary[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return Summary(
      type: mapValueOfType<String>(json, r'type'),
      titles: TitlesSet.fromJson(json[r'titles']),
      title: mapValueOfType<String>(json, r'title'),
      displayTitle: mapValueOfType<String>(json, r'displaytitle'),
      pageId: mapValueOfType<int>(json, r'pageid'),
      extract: mapValueOfType<String>(json, r'extract')!,
      extractHtml: mapValueOfType<String>(json, r'extract_html'),
      thumbnail: Thumbnail.fromJson(json[r'thumbnail']),
      originalImage: OriginalImage.fromJson(json[r'originalimage']),
      lang: mapValueOfType<String>(json, r'lang')!,
      dir: mapValueOfType<String>(json, r'dir')!,
      timestamp: mapValueOfType<String>(json, r'timestamp'),
      description: mapValueOfType<String>(json, r'description'),
      coordinates: SummaryCoordinates.fromJson(json[r'coordinates']),
    );
  }

  static List<Summary> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Summary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Summary.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Summary> mapFromJson(dynamic json) {
    final map = <String, Summary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Summary.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of Summary-objects as value to a dart map
  static Map<String, List<Summary>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Summary>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Summary.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'titles',
    'extract',
    'lang',
    'dir',
  };

  @override
  List<Object> get props => [
        titles,
        extract,
        lang,
        dir,
      ];
}
