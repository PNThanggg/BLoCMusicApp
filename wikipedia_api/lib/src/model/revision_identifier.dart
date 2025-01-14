part of '../wikipedia_api.dart';

class RevisionIdentifier extends Equatable {
  /// Returns a new [RevisionIdentifier] instance.
  const RevisionIdentifier({
    this.revision,
    this.tid,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final int? revision;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? tid;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is RevisionIdentifier && other.revision == revision && other.tid == tid;

  @override
  int get hashCode => (revision == null ? 0 : revision!.hashCode) + (tid == null ? 0 : tid!.hashCode);

  @override
  String toString() => 'RevisionIdentifier[revision=$revision, tid=$tid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (revision != null) {
      json[r'revision'] = revision;
    } else {
      json[r'revision'] = null;
    }
    if (tid != null) {
      json[r'tid'] = tid;
    } else {
      json[r'tid'] = null;
    }
    return json;
  }

  /// Returns a new [RevisionIdentifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory RevisionIdentifier.fromJson(dynamic value) {
    final json = value.cast<String, dynamic>();

    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "RevisionIdentifier[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "RevisionIdentifier[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return RevisionIdentifier(
      revision: mapValueOfType<int>(json, r'revision'),
      tid: mapValueOfType<String>(json, r'tid'),
    );
  }

  static List<RevisionIdentifier> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RevisionIdentifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RevisionIdentifier.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RevisionIdentifier> mapFromJson(dynamic json) {
    final map = <String, RevisionIdentifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = RevisionIdentifier.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of RevisionIdentifier-objects as value to a dart map
  static Map<String, List<RevisionIdentifier>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RevisionIdentifier>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RevisionIdentifier.listFromJson(
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
        tid,
        revision,
      ];
}
