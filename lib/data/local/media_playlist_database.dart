import 'package:isar/isar.dart';

import '../fast_hash.dart';
import 'media_item_database.dart';

part 'media_playlist_database.g.dart';

@collection
class MediaPlaylistDatabase {
  Id get isarId => fastHash(playlistName);
  String playlistName;
  List<int> mediaRanks = List.empty(growable: true);
  DateTime? lastUpdated;

  MediaPlaylistDatabase({
    required this.playlistName,
    this.lastUpdated,
  });

  @Backlink(to: "mediaInPlaylistsDB")
  IsarLinks<MediaItemDatabase> mediaItems = IsarLinks<MediaItemDatabase>();

  @override
  bool operator ==(covariant MediaPlaylistDatabase other) {
    if (identical(this, other)) return true;

    return other.playlistName == playlistName;
  }

  @override
  int get hashCode => playlistName.hashCode;
}
