part of '../wikipedia_api.dart';

class ImageDescription {
  /// Returns a new [ImageDescription] instance.
  ImageDescription({
    required this.text,
    required this.lang,
  });

  /// Text of the description
  String text;

  /// Language code of the description
  String lang;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDescription && other.text == text && other.lang == lang;

  @override
  int get hashCode =>
      (text.hashCode) + (lang.hashCode);

  @override
  String toString() => 'ImageDescription[text=$text, lang=$lang]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'text'] = this.text;
    json[r'lang'] = this.lang;
    return json;
  }

  /// Returns a new [ImageDescription] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageDescription? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ImageDescription[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ImageDescription[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageDescription(
        text: mapValueOfType<String>(json, r'text')!,
        lang: mapValueOfType<String>(json, r'lang')!,
      );
    }
    return null;
  }

  static List<ImageDescription> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ImageDescription>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageDescription.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageDescription> mapFromJson(dynamic json) {
    final map = <String, ImageDescription>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = ImageDescription.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageDescription-objects as value to a dart map
  static Map<String, List<ImageDescription>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ImageDescription>>{};
    if (json is Map && json.isNotEmpty) {

      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageDescription.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'text',
    'lang',
  };
}
