part of '../wikipedia_api.dart';

class Related extends Equatable {
  /// Returns a new [Related] instance.
  const Related({
    this.pages = const [],
  });

  final List<Summary> pages;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Related && _deepEquality.equals(other.pages, pages);

  @override
  int get hashCode => pages.hashCode;

  @override
  String toString() => 'Related[pages=$pages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'pages'] = pages;
    return json;
  }

  /// Returns a new [Related] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory Related.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "Related[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "Related[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return Related(
      pages: Summary.listFromJson(json[r'pages']),
    );
  }

  static List<Related> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Related>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Related.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Related> mapFromJson(dynamic json) {
    final map = <String, Related>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Related.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of Related-objects as value to a dart map
  static Map<String, List<Related>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Related>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Related.listFromJson(
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
  List<Object> get props => [
        pages,
      ];
}
