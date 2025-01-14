part of '../wikipedia_api.dart';

class ListEntryRead extends Equatable {
  /// Returns a new [ListEntryRead] instance.
  const ListEntryRead({
    this.id,
    this.project,
    this.title,
    this.created,
    this.updated,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final int? id;

  /// Domain of the wiki containing the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? project;

  /// Title of the page containing the page, in database format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? title;

  /// Creation date (in ISO 8601)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final DateTime? created;

  /// Last modification date (in ISO 8601)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final DateTime? updated;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListEntryRead &&
          other.id == id &&
          other.project == project &&
          other.title == title &&
          other.created == created &&
          other.updated == updated;

  @override
  int get hashCode =>
      (id == null ? 0 : id!.hashCode) +
      (project == null ? 0 : project!.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (created == null ? 0 : created!.hashCode) +
      (updated == null ? 0 : updated!.hashCode);

  @override
  String toString() => 'ListEntryRead[id=$id, project=$project, title=$title, created=$created, updated=$updated]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    } else {
      json[r'id'] = null;
    }
    if (project != null) {
      json[r'project'] = project;
    } else {
      json[r'project'] = null;
    }
    if (title != null) {
      json[r'title'] = title;
    } else {
      json[r'title'] = null;
    }
    if (created != null) {
      json[r'created'] = created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (updated != null) {
      json[r'updated'] = updated!.toUtc().toIso8601String();
    } else {
      json[r'updated'] = null;
    }
    return json;
  }

  /// Returns a new [ListEntryRead] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListEntryRead? fromJson(Map<String, dynamic> json) {
    assert(() {
      for (String key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "ListEntryRead[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "ListEntryRead[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return ListEntryRead(
      id: mapValueOfType<int>(json, r'id'),
      project: mapValueOfType<String>(json, r'project'),
      title: mapValueOfType<String>(json, r'title'),
      created: mapDateTime(json, r'created', r''),
      updated: mapDateTime(json, r'updated', r''),
    );
  }

  static List<ListEntryRead> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ListEntryRead>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListEntryRead.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListEntryRead> mapFromJson(dynamic json) {
    final map = <String, ListEntryRead>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = ListEntryRead.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListEntryRead-objects as value to a dart map
  static Map<String, List<ListEntryRead>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ListEntryRead>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListEntryRead.listFromJson(
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
        id,
        project,
        title,
        created,
        updated,
      ];
}
