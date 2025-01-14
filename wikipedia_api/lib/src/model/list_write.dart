part of '../wikipedia_api.dart';

class ListWrite extends Equatable {
  /// Returns a new [ListWrite] instance.
  const ListWrite({
    required this.name,
    this.description,
  });

  final String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ListWrite && other.name == name && other.description == description;

  @override
  int get hashCode => (name.hashCode) + (description == null ? 0 : description!.hashCode);

  @override
  String toString() => 'ListWrite[name=$name, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = name;
    if (description != null) {
      json[r'description'] = description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [ListWrite] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static ListWrite? fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "ListWrite[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "ListWrite[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return ListWrite(
      name: mapValueOfType<String>(json, r'name')!,
      description: mapValueOfType<String>(json, r'description'),
    );
  }

  static List<ListWrite> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ListWrite>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListWrite.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListWrite> mapFromJson(dynamic json) {
    final map = <String, ListWrite>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = ListWrite.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListWrite-objects as value to a dart map
  static Map<String, List<ListWrite>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ListWrite>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListWrite.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };

  @override
  List<Object?> get props => [
        name,
        description,
      ];
}
