part of '../wikipedia_api.dart';

class MostRead {
  /// Returns a new [MostRead] instance.
  MostRead({
    required this.date,
    this.articles = const [],
  });

  /// The date which the data correspond to
  final String date;

  /// Array of most popular articles
  final List<MostreadArticle> articles;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostRead && other.date == date && _deepEquality.equals(other.articles, articles);

  @override
  int get hashCode => (date.hashCode) + (articles.hashCode);

  @override
  String toString() => 'MostRead[date=$date, articles=$articles]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'date'] = date;
    json[r'articles'] = articles;
    return json;
  }

  /// Returns a new [MostRead] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory MostRead.fromJson(dynamic value) {
    final json = value.cast<String, dynamic>();

    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (String key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "MostRead[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "MostRead[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return MostRead(
      date: mapValueOfType<String>(json, r'date')!,
      articles: MostreadArticle.listFromJson(json[r'articles']),
    );
  }

  static List<MostRead> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MostRead>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MostRead.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MostRead> mapFromJson(dynamic json) {
    final map = <String, MostRead>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = MostRead.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of Mostread-objects as value to a dart map
  static Map<String, List<MostRead>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MostRead>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MostRead.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'date',
    'articles',
  };
}
