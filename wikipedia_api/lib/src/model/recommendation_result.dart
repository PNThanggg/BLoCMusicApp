part of '../wikipedia_api.dart';

class RecommendationResult extends Equatable {
  /// Returns a new [RecommendationResult] instance.
  const RecommendationResult({
    this.count,
    this.items = const [],
  });

  /// the number of recommendations returned
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final int? count;

  /// the list of articles recommended for translation
  final List<RecommendationResultItemsInner> items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendationResult && other.count == count && _deepEquality.equals(other.items, items);

  @override
  int get hashCode =>
      (count == null ? 0 : count!.hashCode) + (items.hashCode);

  @override
  String toString() => 'RecommendationResult[count=$count, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (count != null) {
      json[r'count'] = count;
    } else {
      json[r'count'] = null;
    }
    json[r'items'] = items;
    return json;
  }

  /// Returns a new [RecommendationResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  factory RecommendationResult.fromJson(Map<String, dynamic> json) {
    return RecommendationResult(
      count: mapValueOfType<int>(json, r'count'),
      items: RecommendationResultItemsInner.listFromJson(json[r'items']),
    );
  }

  static List<RecommendationResult> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RecommendationResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RecommendationResult.fromJson(row);
        result.add(value);
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RecommendationResult> mapFromJson(dynamic json) {
    final map = <String, RecommendationResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = RecommendationResult.fromJson(entry.value);
        map[entry.key] = value;
      }
    }
    return map;
  }

  // maps a json object with a list of RecommendationResult-objects as value to a dart map
  static Map<String, List<RecommendationResult>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RecommendationResult>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RecommendationResult.listFromJson(
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
        count,
        items,
      ];
}
