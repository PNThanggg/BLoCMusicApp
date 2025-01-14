import 'dart:convert';

class ScrobbleTrack {
  final String artist;
  final String trackName;
  int timestamp;
  final String? album;
  final int? duration;
  final bool chosenByUser;

  ScrobbleTrack({
    required this.artist,
    required this.trackName,
    this.timestamp = 0,
    this.album,
    this.duration,
    this.chosenByUser = false,
  }) {
    if (timestamp == 0) {
      timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    }
  }

  Map<String, String> toParams(int index) {
    Map<String, String> params = {
      'artist[$index]': artist,
      'track[$index]': trackName,
      'timestamp[$index]': timestamp.toString(),
    };
    if (album != null) {
      params['album[$index]'] = album!;
    }
    if (duration != null) {
      params['duration[$index]'] = duration.toString();
    }
    if (!chosenByUser) {
      params['chosenByUser[$index]'] = '0';
    }
    return params;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'artist': artist,
      'trackName': trackName,
      'timestamp': timestamp,
      'album': album,
      'duration': duration,
      'chosenByUser': chosenByUser,
    };
  }

  factory ScrobbleTrack.fromMap(Map<String, dynamic> map) {
    return ScrobbleTrack(
      artist: map['artist'] as String,
      trackName: map['trackName'] as String,
      timestamp: map['timestamp'] as int,
      album: map['album'] != null ? map['album'] as String : null,
      duration: map['duration'] != null ? map['duration'] as int : null,
      chosenByUser: map['chosenByUser'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScrobbleTrack.fromJson(Map source) => ScrobbleTrack.fromMap(source as Map<String, dynamic>);
}
