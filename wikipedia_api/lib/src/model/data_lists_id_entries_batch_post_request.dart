part of '../wikipedia_api.dart';

class DataListsIdEntriesBatchPostRequest extends Equatable {
  /// Returns a new [DataListsIdEntriesBatchPostRequest] instance.
  const DataListsIdEntriesBatchPostRequest({
    this.batch = const [],
  });

  final List<ListEntryWrite> batch;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DataListsIdEntriesBatchPostRequest && _deepEquality.equals(other.batch, batch);

  @override
  int get hashCode => (batch.hashCode);

  @override
  String toString() => 'DataListsIdEntriesBatchPostRequest[batch=$batch]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'batch'] = batch;
    return json;
  }

  /// Returns a new [DataListsIdEntriesBatchPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static DataListsIdEntriesBatchPostRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(
              json.containsKey(key), 'Required key "DataListsIdEntriesBatchPostRequest[$key]" is missing from JSON.');
          assert(
              json[key] != null, 'Required key "DataListsIdEntriesBatchPostRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DataListsIdEntriesBatchPostRequest(
        batch: ListEntryWrite.listFromJson(json[r'batch']),
      );
    }
    return null;
  }

  static List<DataListsIdEntriesBatchPostRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DataListsIdEntriesBatchPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DataListsIdEntriesBatchPostRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DataListsIdEntriesBatchPostRequest> mapFromJson(dynamic json) {
    final map = <String, DataListsIdEntriesBatchPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = DataListsIdEntriesBatchPostRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DataListsIdEntriesBatchPostRequest-objects as value to a dart map
  static Map<String, List<DataListsIdEntriesBatchPostRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DataListsIdEntriesBatchPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DataListsIdEntriesBatchPostRequest.listFromJson(
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
  };

  @override
  List<Object?> get props => [];
}
