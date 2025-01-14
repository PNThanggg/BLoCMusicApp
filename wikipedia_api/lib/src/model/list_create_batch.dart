part of '../wikipedia_api.dart';

class ListCreateBatch extends Equatable {
  /// Returns a new [ListCreateBatch] instance.
  const ListCreateBatch({
    this.batch = const [],
    this.lists = const [],
  });

  /// Deprecated, will be removed. Use the full list objects instead.
  final List<ListId> batch;

  final List<ListRead> lists;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListCreateBatch && _deepEquality.equals(other.batch, batch) && _deepEquality.equals(other.lists, lists);

  @override
  int get hashCode => batch.hashCode + lists.hashCode;

  @override
  String toString() => 'ListCreateBatch[batch=$batch, lists=$lists]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'batch'] = batch;
    json[r'lists'] = lists;
    return json;
  }

  /// Returns a new [ListCreateBatch] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  static ListCreateBatch? fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (String key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "ListCreateBatch[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "ListCreateBatch[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return ListCreateBatch(
      batch: ListId.listFromJson(json[r'batch']),
      lists: ListRead.listFromJson(json[r'lists']),
    );
  }

  static List<ListCreateBatch> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ListCreateBatch>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListCreateBatch.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListCreateBatch> mapFromJson(dynamic json) {
    final map = <String, ListCreateBatch>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = ListCreateBatch.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListCreateBatch-objects as value to a dart map
  static Map<String, List<ListCreateBatch>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ListCreateBatch>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListCreateBatch.listFromJson(
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
    'lists',
  };

  @override
  List<Object> get props => [
        batch,
        lists,
      ];
}
