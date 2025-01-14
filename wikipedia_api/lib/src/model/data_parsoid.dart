part of '../wikipedia_api.dart';

class DataParsoid {
  /// Returns a new [DataParsoid] instance.
  DataParsoid({
    required this.counter,
    required this.ids,
  });

  int counter;

  Object ids;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataParsoid && other.counter == counter && other.ids == ids;

  @override
  int get hashCode =>
      (counter.hashCode) + (ids.hashCode);

  @override
  String toString() => 'DataParsoid[counter=$counter, ids=$ids]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'counter'] = this.counter;
    json[r'ids'] = this.ids;
    return json;
  }

  /// Returns a new [DataParsoid] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DataParsoid? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "DataParsoid[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "DataParsoid[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DataParsoid(
        counter: mapValueOfType<int>(json, r'counter')!,
        ids: mapValueOfType<Object>(json, r'ids')!,
      );
    }
    return null;
  }

  static List<DataParsoid> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DataParsoid>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DataParsoid.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DataParsoid> mapFromJson(dynamic json) {
    final map = <String, DataParsoid>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = DataParsoid.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DataParsoid-objects as value to a dart map
  static Map<String, List<DataParsoid>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DataParsoid>>{};
    if (json is Map && json.isNotEmpty) {

      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DataParsoid.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'counter',
    'ids',
  };
}
