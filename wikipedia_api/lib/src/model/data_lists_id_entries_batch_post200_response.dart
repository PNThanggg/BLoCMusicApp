part of '../wikipedia_api.dart';

class DataListsIdEntriesBatchPost200Response extends Equatable {
  /// Returns a new [DataListsIdEntriesBatchPost200Response] instance.
  const DataListsIdEntriesBatchPost200Response({
    this.batch = const [],
    this.entries = const [],
  });

  final List<DataListsIdEntriesBatchPost200ResponseBatchInner> batch;

  final List<ListEntryRead> entries;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataListsIdEntriesBatchPost200Response &&
          _deepEquality.equals(other.batch, batch) &&
          _deepEquality.equals(other.entries, entries);

  @override
  int get hashCode => (batch.hashCode) + (entries.hashCode);

  @override
  String toString() => 'DataListsIdEntriesBatchPost200Response[batch=$batch, entries=$entries]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'batch'] = this.batch;
    json[r'entries'] = this.entries;
    return json;
  }

  /// Returns a new [DataListsIdEntriesBatchPost200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DataListsIdEntriesBatchPost200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "DataListsIdEntriesBatchPost200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "DataListsIdEntriesBatchPost200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DataListsIdEntriesBatchPost200Response(
        batch: DataListsIdEntriesBatchPost200ResponseBatchInner.listFromJson(json[r'batch']),
        entries: ListEntryRead.listFromJson(json[r'entries']),
      );
    }
    return null;
  }

  static List<DataListsIdEntriesBatchPost200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DataListsIdEntriesBatchPost200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DataListsIdEntriesBatchPost200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DataListsIdEntriesBatchPost200Response> mapFromJson(dynamic json) {
    final map = <String, DataListsIdEntriesBatchPost200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = DataListsIdEntriesBatchPost200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DataListsIdEntriesBatchPost200Response-objects as value to a dart map
  static Map<String, List<DataListsIdEntriesBatchPost200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DataListsIdEntriesBatchPost200Response>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DataListsIdEntriesBatchPost200Response.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'batch',
    'entries',
  };

  @override
  List<Object> get props => [
        batch,
        entries,
      ];
}
