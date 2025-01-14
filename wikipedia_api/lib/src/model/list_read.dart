part of '../wikipedia_api.dart';

class ListRead extends Equatable {
  /// Returns a new [ListRead] instance.
  const ListRead({
    required this.id,
    required this.name,
    this.description,
    required this.created,
    required this.updated,
  });

  final int id;

  final String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? description;

  /// Creation date (in ISO 8601)
  final DateTime created;

  /// Last modification date (in ISO 8601)
  final DateTime updated;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListRead &&
          other.id == id &&
          other.name == name &&
          other.description == description &&
          other.created == created &&
          other.updated == updated;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      (description == null ? 0 : description!.hashCode) +
      created.hashCode +
      updated.hashCode;

  @override
  String toString() => 'ListRead[id=$id, name=$name, description=$description, created=$created, updated=$updated]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = id;
    json[r'name'] = name;
    if (description != null) {
      json[r'description'] = description;
    } else {
      json[r'description'] = null;
    }
    json[r'created'] = created.toUtc().toIso8601String();
    json[r'updated'] = updated.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [ListRead] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListRead? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        for (var key in requiredKeys) {
          assert(json.containsKey(key), 'Required key "ListRead[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ListRead[$key]" has a null value in JSON.');
        }
        return true;
      }());

      return ListRead(
        id: mapValueOfType<int>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description'),
        created: mapDateTime(json, r'created', r'')!,
        updated: mapDateTime(json, r'updated', r'')!,
      );
    }
    return null;
  }

  static List<ListRead> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ListRead>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListRead.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListRead> mapFromJson(dynamic json) {
    final map = <String, ListRead>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = ListRead.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListRead-objects as value to a dart map
  static Map<String, List<ListRead>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ListRead>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListRead.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'created',
    'updated',
  };

  @override
  List<Object> get props => [
        id,
        name,
        created,
        updated,
      ];
}
