part of '../wikipedia_api.dart';

class Thumbnail extends Equatable {
  /// Returns a new [Thumbnail] instance.
  const Thumbnail({
    required this.source_,
    required this.width,
    required this.height,
  });

  /// Thumbnail image URI
  final String source_;

  /// Thumbnail width
  final int width;

  /// Thumbnail height
  final int height;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Thumbnail && other.source_ == source_ && other.width == width && other.height == height;

  @override
  int get hashCode => source_.hashCode + width.hashCode + height.hashCode;

  @override
  String toString() => 'Thumbnail[source_=$source_, width=$width, height=$height]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'source'] = source_;
    json[r'width'] = width;
    json[r'height'] = height;
    return json;
  }

  /// Returns a new [Thumbnail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  factory Thumbnail.fromJson(dynamic value) {
    final json = value.cast<String, dynamic>();

    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "Thumbnail[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "Thumbnail[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return Thumbnail(
      source_: mapValueOfType<String>(json, r'source') ?? '',
      width: mapValueOfType<int>(json, r'width') ?? 0,
      height: mapValueOfType<int>(json, r'height') ?? 0,
    );
  }

  static List<Thumbnail> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Thumbnail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Thumbnail.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Thumbnail> mapFromJson(dynamic json) {
    final map = <String, Thumbnail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Thumbnail.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of Thumbnail-objects as value to a dart map
  static Map<String, List<Thumbnail>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Thumbnail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Thumbnail.listFromJson(
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
