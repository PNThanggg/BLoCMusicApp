import 'media_item_model.dart';

MediaItemModel fromYtSongMap2MediaItem(Map<dynamic, dynamic> songItem) {
  String artists = '';
  List<String> listArtists = List.empty(growable: true);
  List<String> artistsID = List.empty(growable: true);

  try {
    for (var element in (songItem['artists'] as List)) {
      listArtists.add(element["name"]);
      artistsID.add(element["id"]);
    }
    artists = listArtists.join(',');
  } catch (e) {
    artists = songItem["artist"] ?? 'Unknown';
  }

  return MediaItemModel(
    id: songItem["id"] ?? 'Unknown',
    title: songItem["title"] ?? 'Unknown',
    album: songItem["album"] ?? 'Unknown',
    artist: (songItem['artist'] == null || (songItem['artist'] as String).isEmpty) ? artists : songItem['artist'],
    artUri: Uri.parse(songItem["image"]),
    genre: songItem["genre"] ?? 'Unknown',
    duration: Duration(
      seconds: (songItem["duration"] == "null" || songItem["duration"] == null || songItem["duration"] == "")
          ? 120
          : int.parse(
              songItem["duration"],
            ),
    ),
    extras: {
      "url": songItem["url"] ?? 'Unknown',
      "source": "youtube",
      "perma_url": 'https://www.youtube.com/watch?v=${songItem["id"].toString().replaceAll("youtube", '')}',
      "language": songItem["language"] ?? 'Unknown',
      "artistsID": artistsID
    },
  );
}

List<MediaItemModel> fromYtSongMapList2MediaItemList(List<dynamic> songList) {
  List<MediaItemModel> mediaList = [];
  mediaList = songList.map((e) => fromYtSongMap2MediaItem(e as Map<dynamic, dynamic>)).toList();
  return mediaList;
}
