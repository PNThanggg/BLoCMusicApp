import 'album_model.dart';
import 'media_item_model.dart';
import 'media_playlist_model.dart';

class ArtistModel {
  final String name;
  final String imageUrl;
  final String sourceURL;
  final String source;
  final String sourceId;
  final String? description;
  final String? genre;
  final String? country;
  final List<MediaItemModel> songs;
  final List<AlbumModel> albums;
  final Map extra;

  const ArtistModel({
    required this.name,
    required this.imageUrl,
    required this.source,
    required this.sourceId,
    required this.sourceURL,
    this.description,
    this.genre,
    this.country,
    this.songs = const [],
    this.albums = const [],
    this.extra = const {},
  });

  @override
  String toString() {
    return 'ArtistModel(name: $name, imageUrl: $imageUrl, profileURL: $sourceURL, source: $source, sourceId: $sourceId, description: $description, songs: $songs, albums: $albums,extra: $extra)';
  }

  get playlist {
    return MediaPlaylist(
      playlistName: name,
      description: description ?? '',
      source: source,
      permaURL: sourceURL,
      imgUrl: imageUrl,
      mediaItems: songs,
      artists: name,
      isAlbum: false,
      lastUpdated: DateTime.now(),
    );
  }

  ArtistModel copyWith({
    String? name,
    String? imageUrl,
    String? sourceURL,
    String? source,
    String? sourceId,
    String? description,
    String? genre,
    String? country,
    List<MediaItemModel>? songs,
    List<AlbumModel>? albums,
    Map? extra,
  }) {
    return ArtistModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      sourceURL: sourceURL ?? this.sourceURL,
      source: source ?? this.source,
      sourceId: sourceId ?? this.sourceId,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      country: country ?? this.country,
      songs: songs ?? this.songs,
      albums: albums ?? this.albums,
      extra: extra ?? this.extra,
    );
  }
}

List<ArtistModel> saavnMap2Artists(Map<String, dynamic> json) {
  List<ArtistModel> artists = [];
  if (json['Artists'] != null) {
    json['Artists'].forEach((artist) {
      artists.add(ArtistModel(
        name: artist['title'],
        imageUrl: artist['image'],
        source: 'saavn',
        sourceId: artist['artistId'],
        sourceURL: artist['perma_url'],
        genre: artist['genre'],
        country: artist['country'],
        description: artist['subtitle'],
      ));
    });
  }
  return artists;
}

List<ArtistModel> ytmMap2Artists(Map<String, dynamic> json) {
  List<ArtistModel> artists = [];
  json['artists']?.forEach((artist) {
    artists.add(
      ArtistModel(
        name: artist['title'],
        imageUrl: artist['image'],
        source: 'ytm',
        sourceId: artist['id'].toString().replaceAll('youtube', ''),
        sourceURL: 'https://music.youtube.com/channel/${artist['id'].toString().replaceAll('youtube', '')}',
        description: artist['subtitle'],
        extra: {
          'songBrowseId': artist['songBrowseId'],
          'songBrowseParams': artist['songBrowseParams'],
        },
      ),
    );
  });
  return artists;
}
