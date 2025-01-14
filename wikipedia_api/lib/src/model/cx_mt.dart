part of '../wikipedia_api.dart';

class CxMt extends Equatable {
  /// Returns a new [CxMt] instance.
  const CxMt({
    this.contents,
  });

  /// the translated content
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? contents;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CxMt && other.contents == contents;

  @override
  int get hashCode => (contents == null ? 0 : contents!.hashCode);

  @override
  String toString() => 'CxMt[contents=$contents]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (contents != null) {
      json[r'contents'] = contents;
    } else {
      json[r'contents'] = null;
    }
    return json;
  }

  /// Returns a new [CxMt] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory CxMt.fromJson(Map<String, dynamic> json) {
    return CxMt(
      contents: mapValueOfType<String>(json, r'contents'),
    );
  }

  static List<CxMt> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CxMt>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CxMt.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CxMt> mapFromJson(dynamic json) {
    final map = <String, CxMt>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = CxMt.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of CxMt-objects as value to a dart map
  static Map<String, List<CxMt>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CxMt>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CxMt.listFromJson(
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
        contents,
      ];
}
