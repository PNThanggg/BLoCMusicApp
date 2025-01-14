part of '../wikipedia_api.dart';

class CxDict extends Equatable {
  /// Returns a new [CxDict] instance.
  const CxDict({
    this.source_,
    this.translations = const [],
  });

  /// the original word to look up
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? source_;

  /// the translations found
  final List<CxDictTranslationsInner> translations;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CxDict && other.source_ == source_ && _deepEquality.equals(other.translations, translations);

  @override
  int get hashCode => (source_ == null ? 0 : source_!.hashCode) + translations.hashCode;

  @override
  String toString() => 'CxDict[source_=$source_, translations=$translations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (source_ != null) {
      json[r'source'] = source_;
    } else {
      json[r'source'] = null;
    }
    json[r'translations'] = translations;
    return json;
  }

  /// Returns a new [CxDict] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory CxDict.fromJson(dynamic value) {
    final json = value.cast<String, dynamic>();

    // Ensure that the map contains the required keys.
    // Note 1: the values aren't checked for validity beyond being non-null.
    // Note 2: this code is stripped in release mode!
    assert(() {
      for (var key in requiredKeys) {
        assert(json.containsKey(key), 'Required key "CxDict[$key]" is missing from JSON.');
        assert(json[key] != null, 'Required key "CxDict[$key]" has a null value in JSON.');
      }
      return true;
    }());

    return CxDict(
      source_: mapValueOfType<String>(json, r'source'),
      translations: CxDictTranslationsInner.listFromJson(json[r'translations']),
    );
  }

  static List<CxDict> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CxDict>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CxDict.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CxDict> mapFromJson(dynamic json) {
    final map = <String, CxDict>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = CxDict.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of CxDict-objects as value to a dart map
  static Map<String, List<CxDict>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CxDict>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CxDict.listFromJson(
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
  List<Object> get props => [];
}
