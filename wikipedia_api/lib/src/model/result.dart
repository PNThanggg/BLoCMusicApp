part of '../wikipedia_api.dart';

class Result extends Equatable {
  /// Returns a new [Result] instance.
  const Result({
    required this.itemType,
    required this.title,
    required this.url,
  });

  final String itemType;

  final String title;

  final String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result && other.itemType == itemType && other.title == title && other.url == url;

  @override
  int get hashCode =>
      (itemType.hashCode) + (title.hashCode) + (url.hashCode);

  @override
  String toString() => 'Result[itemType=$itemType, title=$title, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'itemType'] = itemType;
    json[r'title'] = title;
    json[r'url'] = url;
    return json;
  }

  /// Returns a new [Result] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static Result? fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "Result[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "Result[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return Result(
      itemType: mapValueOfType<String>(json, r'itemType')!,
      title: mapValueOfType<String>(json, r'title')!,
      url: mapValueOfType<String>(json, r'url')!,
    );
  }

  static List<Result> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Result>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Result.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Result> mapFromJson(dynamic json) {
    final map = <String, Result>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Result.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Result-objects as value to a dart map
  static Map<String, List<Result>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Result>>{};
    if (json is Map && json.isNotEmpty) {

      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Result.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'itemType',
    'title',
    'url',
  };

  @override
  List<Object> get props => [
        itemType,
        title,
        url,
      ];
}
