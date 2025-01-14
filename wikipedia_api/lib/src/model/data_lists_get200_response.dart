part of '../wikipedia_api.dart';

class DataListsGet200Response extends Equatable {
  /// Returns a new [DataListsGet200Response] instance.
  const DataListsGet200Response({
    this.lists = const [],
    this.next,
    this.continueFrom,
  });

  final List<ListRead> lists;

  /// Continuation token.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? next;

  /// Timestamp to sync from, to be used with the `GET /lists/changes/since/{date}` endpoint.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final DateTime? continueFrom;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataListsGet200Response &&
          _deepEquality.equals(other.lists, lists) &&
          other.next == next &&
          other.continueFrom == continueFrom;

  @override
  int get hashCode =>
      (lists.hashCode) + (next == null ? 0 : next!.hashCode) + (continueFrom == null ? 0 : continueFrom!.hashCode);

  @override
  String toString() => 'DataListsGet200Response[lists=$lists, next=$next, continueFrom=$continueFrom]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'lists'] = lists;
    if (next != null) {
      json[r'next'] = next;
    } else {
      json[r'next'] = null;
    }
    if (continueFrom != null) {
      json[r'continue-from'] = continueFrom!.toUtc().toIso8601String();
    } else {
      json[r'continue-from'] = null;
    }
    return json;
  }

  /// Returns a new [DataListsGet200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static DataListsGet200Response? fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (String key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "DataListsGet200Response[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "DataListsGet200Response[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return DataListsGet200Response(
      lists: ListRead.listFromJson(json[r'lists']),
      next: mapValueOfType<String>(json, r'next'),
      continueFrom: mapDateTime(json, r'continue-from', r''),
    );
  }

  static List<DataListsGet200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DataListsGet200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DataListsGet200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DataListsGet200Response> mapFromJson(dynamic json) {
    final map = <String, DataListsGet200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = DataListsGet200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DataListsGet200Response-objects as value to a dart map
  static Map<String, List<DataListsGet200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DataListsGet200Response>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DataListsGet200Response.listFromJson(
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
        lists,
        next,
        continueFrom,
      ];
}
