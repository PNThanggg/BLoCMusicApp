part of '../wikipedia_api.dart';

class Revisions extends Equatable {
  /// Returns a new [Revisions] instance.
  const Revisions({
    required this.items,
  });

  final RevisionIdentifier items;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Revisions && other.items == items;

  @override
  int get hashCode => items.hashCode;

  @override
  String toString() => 'Revisions[items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'items'] = items;
    return json;
  }

  /// Returns a new [Revisions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory Revisions.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "Revisions[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "Revisions[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return Revisions(
      items: RevisionIdentifier.fromJson(
        json[r'items'],
      ),
    );
  }

  static List<Revisions> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Revisions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Revisions.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Revisions> mapFromJson(dynamic json) {
    final map = <String, Revisions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Revisions.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of Revisions-objects as value to a dart map
  static Map<String, List<Revisions>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Revisions>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Revisions.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'items',
  };

  @override
  List<Object> get props => [
        items,
      ];
}
