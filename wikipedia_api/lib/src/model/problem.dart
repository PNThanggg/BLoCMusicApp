part of '../wikipedia_api.dart';

class Problem extends Equatable {
  /// Returns a new [Problem] instance.
  const Problem({
    required this.type,
    this.title,
    this.detail,
    this.instance,
  });

  final String type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? detail;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? instance;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Problem &&
          other.type == type &&
          other.title == title &&
          other.detail == detail &&
          other.instance == instance;

  @override
  int get hashCode =>
      (type.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (detail == null ? 0 : detail!.hashCode) +
      (instance == null ? 0 : instance!.hashCode);

  @override
  String toString() => 'Problem[type=$type, title=$title, detail=$detail, instance=$instance]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'type'] = type;
    if (title != null) {
      json[r'title'] = title;
    } else {
      json[r'title'] = null;
    }
    if (detail != null) {
      json[r'detail'] = detail;
    } else {
      json[r'detail'] = null;
    }
    if (instance != null) {
      json[r'instance'] = instance;
    } else {
      json[r'instance'] = null;
    }
    return json;
  }

  /// Returns a new [Problem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static Problem? fromJson(Map<String, dynamic> json) {
    assert(() {
      for (String key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "Problem[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "Problem[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return Problem(
      type: mapValueOfType<String>(json, r'type')!,
      title: mapValueOfType<String>(json, r'title'),
      detail: mapValueOfType<String>(json, r'detail'),
      instance: mapValueOfType<String>(json, r'instance'),
    );
  }

  static List<Problem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Problem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Problem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Problem> mapFromJson(dynamic json) {
    final map = <String, Problem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Problem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Problem-objects as value to a dart map
  static Map<String, List<Problem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Problem>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Problem.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };

  @override
  List<Object?> get props => [
        type,
        title,
        detail,
        instance,
      ];
}
