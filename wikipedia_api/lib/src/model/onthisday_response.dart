part of '../wikipedia_api.dart';

class OnThisDayResponse extends Equatable {
  /// Returns a new [OnThisDayResponse] instance.
  const OnThisDayResponse({
    this.births = const [],
    this.deaths = const [],
    this.events = const [],
    this.holidays = const [],
    this.selected = const [],
  });

  final List<OnThisDayInner> births;

  final List<OnThisDayInner> deaths;

  final List<OnThisDayInner> events;

  final List<OnThisDayInner> holidays;

  final List<OnThisDayInner> selected;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnThisDayResponse &&
          _deepEquality.equals(other.births, births) &&
          _deepEquality.equals(other.deaths, deaths) &&
          _deepEquality.equals(other.events, events) &&
          _deepEquality.equals(other.holidays, holidays) &&
          _deepEquality.equals(other.selected, selected);

  @override
  int get hashCode => births.hashCode + deaths.hashCode + events.hashCode + holidays.hashCode + selected.hashCode;

  @override
  String toString() =>
      'OnThisDayInner[births=$births, deaths=$deaths, events=$events, holidays=$holidays, selected=$selected]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'births'] = births;
    json[r'deaths'] = deaths;
    json[r'events'] = events;
    json[r'holidays'] = holidays;
    json[r'selected'] = selected;
    return json;
  }

  /// Returns a new [OnThisDayResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory OnThisDayResponse.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (String key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "OnThisDayResponse[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "OnThisDayResponse[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return OnThisDayResponse(
      births: OnThisDayInner.listFromJson(json[r'births']),
      deaths: OnThisDayInner.listFromJson(json[r'deaths']),
      events: OnThisDayInner.listFromJson(json[r'events']),
      holidays: OnThisDayInner.listFromJson(json[r'holidays']),
      selected: OnThisDayInner.listFromJson(json[r'selected']),
    );
  }

  static List<OnThisDayResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OnThisDayResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OnThisDayResponse.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OnThisDayResponse> mapFromJson(dynamic json) {
    final map = <String, OnThisDayResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = OnThisDayResponse.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of OnThisDayResponse-objects as value to a dart map
  static Map<String, List<OnThisDayResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OnThisDayResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OnThisDayResponse.listFromJson(
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
        births,
        deaths,
        events,
        holidays,
        selected,
      ];
}
