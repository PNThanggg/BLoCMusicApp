part of '../wikipedia_api.dart';

class TransformWikitextToLintPostRequest extends Equatable {
  /// Returns a new [TransformWikitextToLintPostRequest] instance.
  const TransformWikitextToLintPostRequest({
    required this.wikitext,
  });

  /// The Wikitext to check
  final String wikitext;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TransformWikitextToLintPostRequest && other.wikitext == wikitext;

  @override
  int get hashCode => wikitext.hashCode;

  @override
  String toString() => 'TransformWikitextToLintPostRequest[wikitext=$wikitext]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'wikitext'] = wikitext;
    return json;
  }

  /// Returns a new [TransformWikitextToLintPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  factory TransformWikitextToLintPostRequest.fromJson(Map<String, dynamic> json) {
    assert(() {
      for (String key in requiredKeys) {
        assert(
          json.containsKey(key),
          'Required key "TransformWikitextToLintPostRequest[$key]" is missing from JSON.',
        );
        assert(
          json[key] != null,
          'Required key "TransformWikitextToLintPostRequest[$key]" has a null value in JSON.',
        );
      }
      return true;
    }());

    return TransformWikitextToLintPostRequest(
      wikitext: mapValueOfType<String>(json, r'wikitext') ?? '',
    );
  }

  static List<TransformWikitextToLintPostRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TransformWikitextToLintPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransformWikitextToLintPostRequest.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TransformWikitextToLintPostRequest> mapFromJson(dynamic json) {
    final map = <String, TransformWikitextToLintPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = TransformWikitextToLintPostRequest.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of TransformWikitextToLintPostRequest-objects as value to a dart map
  static Map<String, List<TransformWikitextToLintPostRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<TransformWikitextToLintPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TransformWikitextToLintPostRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'wikitext',
  };

  @override
  List<Object> get props => [
        wikitext,
      ];
}
