part of '../wikipedia_api.dart';

class Announcement extends Equatable {
  /// Returns a new [Announcement] instance.
  const Announcement({
    required this.id,
    required this.type,
    required this.startTime,
    required this.endTime,
    this.platforms = const [],
    required this.text,
    this.image,
    this.action,
    this.captionHTML,
    this.countries = const [],
  });

  /// Unique ID of the announcement
  final String id;

  /// The type of announcement. Possible values are \"survey\" or \"fundraising\"
  final String type;

  /// The date to begin showing the announcement
  final String startTime;

  /// The date to stop showing the announcement
  final String endTime;

  /// An array of platforms to display the announcement. Possible values are \"iOSApp\" or \"AndroidApp\"
  final List<String> platforms;

  /// The text of the announcement
  final String text;

  /// The URL of the image for the announcement
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? image;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final Action? action;

  /// HTML to display below the announcement. Usually a privacy statment and link to a policy
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? captionHTML;

  /// An array of country codes in which to display the announcement. Clients should derive the country from 'GeoIP' portion of the Set-Cookie header
  final List<String> countries;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Announcement &&
          other.id == id &&
          other.type == type &&
          other.startTime == startTime &&
          other.endTime == endTime &&
          _deepEquality.equals(other.platforms, platforms) &&
          other.text == text &&
          other.image == image &&
          other.action == action &&
          other.captionHTML == captionHTML &&
          _deepEquality.equals(other.countries, countries);

  @override
  int get hashCode =>
      (id.hashCode) +
      (type.hashCode) +
      (startTime.hashCode) +
      (endTime.hashCode) +
      (platforms.hashCode) +
      (text.hashCode) +
      (image == null ? 0 : image!.hashCode) +
      (action == null ? 0 : action!.hashCode) +
      (captionHTML == null ? 0 : captionHTML!.hashCode) +
      (countries.hashCode);

  @override
  String toString() =>
      'Announcement[id=$id, type=$type, startTime=$startTime, endTime=$endTime, platforms=$platforms, text=$text, image=$image, action=$action, captionHTML=$captionHTML, countries=$countries]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = id;
    json[r'type'] = type;
    json[r'start_time'] = startTime;
    json[r'end_time'] = endTime;
    json[r'platforms'] = platforms;
    json[r'text'] = text;
    if (image != null) {
      json[r'image'] = image;
    } else {
      json[r'image'] = null;
    }
    if (action != null) {
      json[r'action'] = action;
    } else {
      json[r'action'] = null;
    }
    if (captionHTML != null) {
      json[r'caption_HTML'] = captionHTML;
    } else {
      json[r'caption_HTML'] = null;
    }
    json[r'countries'] = countries;
    return json;
  }

  /// Returns a new [Announcement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory Announcement.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (String key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "Announcement[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "Announcement[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return Announcement(
      id: mapValueOfType<String>(json, r'id')!,
      type: mapValueOfType<String>(json, r'type')!,
      startTime: mapValueOfType<String>(json, r'start_time')!,
      endTime: mapValueOfType<String>(json, r'end_time')!,
      platforms: json[r'platforms'] is Iterable
          ? (json[r'platforms'] as Iterable).cast<String>().toList(growable: false)
          : const [],
      text: mapValueOfType<String>(json, r'text')!,
      image: mapValueOfType<String>(json, r'image'),
      action: Action.fromJson(json[r'action']),
      captionHTML: mapValueOfType<String>(json, r'caption_HTML'),
      countries: json[r'countries'] is Iterable
          ? (json[r'countries'] as Iterable).cast<String>().toList(growable: false)
          : const [],
    );
  }

  static List<Announcement> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Announcement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Announcement.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Announcement> mapFromJson(dynamic json) {
    final map = <String, Announcement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Announcement.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of Announcement-objects as value to a dart map
  static Map<String, List<Announcement>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Announcement>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Announcement.listFromJson(
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
    'type',
    'start_time',
    'end_time',
    'platforms',
    'text',
    'countries',
  };

  @override
  List<Object> get props => [
        id,
        type,
        startTime,
        endTime,
        platforms,
        text,
        countries,
      ];
}
