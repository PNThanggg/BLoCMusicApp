part of '../wikipedia_api.dart';

class ListId extends Equatable {
  /// Returns a new [ListId] instance.
  const ListId({
    required this.id,
  });

  /// List ID
  final int id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListId && other.id == id;

  @override
  int get hashCode => (id.hashCode);

  @override
  String toString() => 'ListId[id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = id;
    return json;
  }

  /// Returns a new [ListId] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory ListId.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "ListId[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "ListId[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return ListId(
      id: mapValueOfType<int>(json, r'id')!,
    );
  }

  static List<ListId> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ListId>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListId.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListId> mapFromJson(dynamic json) {
    final map = <String, ListId>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = ListId.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of ListId-objects as value to a dart map
  static Map<String, List<ListId>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ListId>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListId.listFromJson(
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
  };

  @override
  List<Object> get props => [
        id,
      ];
}
