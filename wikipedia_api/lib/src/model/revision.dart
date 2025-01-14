part of '../wikipedia_api.dart';

class Revision extends Equatable {
  /// Returns a new [Revision] instance.
  const Revision({
    required this.count,
    required this.items,
  });

  final int count;

  final RevisionInfo items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Revision && other.count == count && other.items == items;

  @override
  int get hashCode => count.hashCode + items.hashCode;

  @override
  String toString() => 'Revision[count=$count, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'count'] = count;
    json[r'items'] = items;
    return json;
  }

  /// Returns a new [Revision] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static Revision? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        for (var key in requiredKeys) {
          assert(json.containsKey(key), 'Required key "Revision[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Revision[$key]" has a null value in JSON.');
        }
        return true;
      }());

      return Revision(
        count: mapValueOfType<int>(json, r'count')!,
        items: RevisionInfo.fromJson(json[r'items']),
      );
    }
    return null;
  }

  static List<Revision> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Revision>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Revision.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Revision> mapFromJson(dynamic json) {
    final map = <String, Revision>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Revision.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Revision-objects as value to a dart map
  static Map<String, List<Revision>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Revision>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Revision.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'count',
    'items',
  };

  @override
  List<Object> get props => [
        count,
        items,
      ];
}
