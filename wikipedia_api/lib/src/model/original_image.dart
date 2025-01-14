part of '../wikipedia_api.dart';

class OriginalImage extends Equatable {
  /// Returns a new [OriginalImage] instance.
  const OriginalImage({
    required this.source_,
    required this.width,
    required this.height,
  });

  /// Original image URI
  final String source_;

  /// Original image width
  final int width;

  /// Original image height
  final int height;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OriginalImage && other.source_ == source_ && other.width == width && other.height == height;

  @override
  int get hashCode => source_.hashCode + width.hashCode + height.hashCode;

  @override
  String toString() => 'OriginalImage[source_=$source_, width=$width, height=$height]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'source'] = source_;
    json[r'width'] = width;
    json[r'height'] = height;
    return json;
  }

  factory OriginalImage.fromJson(Map<String, dynamic> json) {
    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "OriginalImage[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "OriginalImage[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return OriginalImage(
      source_: mapValueOfType<String>(json, r'source')!,
      width: mapValueOfType<int>(json, r'width')!,
      height: mapValueOfType<int>(json, r'height')!,
    );
  }

  static List<OriginalImage> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OriginalImage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OriginalImage.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OriginalImage> mapFromJson(dynamic json) {
    final map = <String, OriginalImage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = OriginalImage.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of OriginalImage-objects as value to a dart map
  static Map<String, List<OriginalImage>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OriginalImage>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OriginalImage.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'source',
    'width',
    'height',
  };

  @override
  List<Object> get props => [
        source_,
        width,
        height,
      ];
}
