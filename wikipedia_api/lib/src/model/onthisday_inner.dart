part of '../wikipedia_api.dart';

class OnThisDayInner extends Equatable {
  /// Returns a new [OnThisDayInner] instance.
  const OnThisDayInner({
    this.text,
    this.pages = const [],
  });

  /// Short description of the event
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? text;

  /// List of pages related to the event
  final List<Summary> pages;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnThisDayInner && other.text == text && _deepEquality.equals(other.pages, pages);

  @override
  int get hashCode => (text == null ? 0 : text!.hashCode) + pages.hashCode;

  @override
  String toString() => 'OnThisDayInner[text=$text, pages=$pages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (text != null) {
      json[r'text'] = text;
    } else {
      json[r'text'] = null;
    }
    json[r'pages'] = pages;
    return json;
  }

  /// Returns a new [OnThisDayInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory OnThisDayInner.fromJson(dynamic value) {
    final json = value.cast<String, dynamic>();

    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "OnThisDayInner[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "OnThisDayInner[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return OnThisDayInner(
      text: mapValueOfType<String>(json, r'text'),
      pages: Summary.listFromJson(json[r'pages']),
    );
  }

  static List<OnThisDayInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OnThisDayInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OnThisDayInner.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OnThisDayInner> mapFromJson(dynamic json) {
    final map = <String, OnThisDayInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = OnThisDayInner.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of OnThisDayInner-objects as value to a dart map
  static Map<String, List<OnThisDayInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OnThisDayInner>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OnThisDayInner.listFromJson(
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
        text,
        pages,
      ];
}
