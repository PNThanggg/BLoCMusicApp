part of '../wikipedia_api.dart';

class ListEntryWrite extends Equatable {
  /// Returns a new [ListEntryWrite] instance.
  const ListEntryWrite({
    required this.project,
    required this.title,
  });

  /// Domain of the wiki containing the page.
  final String project;

  /// Title of the page containing the page, in database format.
  final String title;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ListEntryWrite && other.project == project && other.title == title;

  @override
  int get hashCode => (project.hashCode) + (title.hashCode);

  @override
  String toString() => 'ListEntryWrite[project=$project, title=$title]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'project'] = project;
    json[r'title'] = title;
    return json;
  }

  /// Returns a new [ListEntryWrite] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory ListEntryWrite.fromJson(dynamic value) {
    final json = value.cast<String, dynamic>();

    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (String key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "ListEntryWrite[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "ListEntryWrite[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return ListEntryWrite(
      project: mapValueOfType<String>(json, r'project') ?? '',
      title: mapValueOfType<String>(json, r'title') ?? '',
    );
  }

  static List<ListEntryWrite> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ListEntryWrite>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListEntryWrite.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListEntryWrite> mapFromJson(dynamic json) {
    final map = <String, ListEntryWrite>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = ListEntryWrite.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of ListEntryWrite-objects as value to a dart map
  static Map<String, List<ListEntryWrite>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ListEntryWrite>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListEntryWrite.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'project',
    'title',
  };

  @override
  List<Object?> get props => [
        project,
        title,
      ];
}
