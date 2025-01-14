part of '../wikipedia_api.dart';

class CxDictTranslationsInner extends Equatable {
  /// Returns a new [CxDictTranslationsInner] instance.
  const CxDictTranslationsInner({
    this.phrase,
    this.info,
    this.sources,
  });

  /// the translated phrase
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? phrase;

  /// extra information about the phrase
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? info;

  /// the source dictionary used for the translation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final String? sources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CxDictTranslationsInner && other.phrase == phrase && other.info == info && other.sources == sources;

  @override
  int get hashCode =>
      (phrase == null ? 0 : phrase!.hashCode) +
      (info == null ? 0 : info!.hashCode) +
      (sources == null ? 0 : sources!.hashCode);

  @override
  String toString() => 'CxDictTranslationsInner[phrase=$phrase, info=$info, sources=$sources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (phrase != null) {
      json[r'phrase'] = phrase;
    } else {
      json[r'phrase'] = null;
    }
    if (info != null) {
      json[r'info'] = info;
    } else {
      json[r'info'] = null;
    }
    if (sources != null) {
      json[r'sources'] = sources;
    } else {
      json[r'sources'] = null;
    }
    return json;
  }

  /// Returns a new [CxDictTranslationsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CxDictTranslationsInner? fromJson(Map<String, dynamic> json) {
    return CxDictTranslationsInner(
      phrase: mapValueOfType<String>(json, r'phrase'),
      info: mapValueOfType<String>(json, r'info'),
      sources: mapValueOfType<String>(json, r'sources'),
    );
  }

  static List<CxDictTranslationsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CxDictTranslationsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CxDictTranslationsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CxDictTranslationsInner> mapFromJson(dynamic json) {
    final map = <String, CxDictTranslationsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = CxDictTranslationsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CxDictTranslationsInner-objects as value to a dart map
  static Map<String, List<CxDictTranslationsInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CxDictTranslationsInner>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CxDictTranslationsInner.listFromJson(
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
        phrase,
        info,
        sources,
      ];
}
