part of '../wikipedia_api.dart';

class Action extends Equatable {
  /// Returns a new [Action] instance.
  const Action({
    required this.title,
    required this.url,
  });

  /// The title to display on the button that performs the action
  final String title;

  /// The URL to navigate to when the button is pressed
  final String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Action && other.title == title && other.url == url;

  @override
  int get hashCode => title.hashCode + url.hashCode;

  @override
  String toString() => 'Action[title=$title, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'title'] = title;
    json[r'url'] = url;
    return json;
  }

  /// Returns a new [Action] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory Action.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "Action[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "Action[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return Action(
      title: mapValueOfType<String>(json, r'title')!,
      url: mapValueOfType<String>(json, r'url')!,
    );
  }

  static List<Action> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Action>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Action.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Action> mapFromJson(dynamic json) {
    final map = <String, Action>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Action.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of Action-objects as value to a dart map
  static Map<String, List<Action>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Action>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Action.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'title',
    'url',
  };

  @override
  List<Object> get props => [
        title,
        url,
      ];
}
