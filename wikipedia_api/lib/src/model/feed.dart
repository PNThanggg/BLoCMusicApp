part of '../wikipedia_api.dart';

class Feed extends Equatable {
  /// Returns a new [Feed] instance.
  const Feed({
    this.tfa,
    this.mostRead,
    this.news = const [],
    this.image,
    this.onThisDay = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final Summary? tfa;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final MostRead? mostRead;

  final List<NewsItem> news;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  final Image? image;

  final List<OnThisDayInner> onThisDay;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Feed &&
          other.tfa == tfa &&
          other.mostRead == mostRead &&
          _deepEquality.equals(other.news, news) &&
          other.image == image &&
          _deepEquality.equals(other.onThisDay, onThisDay);

  @override
  int get hashCode =>
      (tfa == null ? 0 : tfa!.hashCode) +
      (mostRead == null ? 0 : mostRead!.hashCode) +
      (news.hashCode) +
      (image == null ? 0 : image!.hashCode) +
      (onThisDay.hashCode);

  @override
  String toString() => 'Feed[tfa=$tfa, mostread=$mostRead, news=$news, image=$image, onthisday=$onThisDay]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tfa != null) {
      json[r'tfa'] = tfa;
    } else {
      json[r'tfa'] = null;
    }
    if (mostRead != null) {
      json[r'mostread'] = mostRead;
    } else {
      json[r'mostread'] = null;
    }
    json[r'news'] = news;
    if (image != null) {
      json[r'image'] = image;
    } else {
      json[r'image'] = null;
    }
    json[r'onthisday'] = onThisDay;
    return json;
  }

  /// Returns a new [Feed] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Feed? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        for (var key in requiredKeys) {
          assert(json.containsKey(key), 'Required key "Feed[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Feed[$key]" has a null value in JSON.');
        }
        return true;
      }());

      return Feed(
        tfa: Summary.fromJson(json[r'tfa']),
        mostRead: MostRead.fromJson(json[r'mostread']),
        news: NewsItem.listFromJson(json[r'news']),
        image: Image.fromJson(json[r'image']),
        onThisDay: OnThisDayInner.listFromJson(json[r'onthisday']),
      );
    }
    return null;
  }

  static List<Feed> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Feed>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Feed.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Feed> mapFromJson(dynamic json) {
    final map = <String, Feed>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        final value = Feed.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Feed-objects as value to a dart map
  static Map<String, List<Feed>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Feed>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Feed.listFromJson(
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
        tfa,
        mostRead,
        news,
        image,
        onThisDay,
      ];
}
