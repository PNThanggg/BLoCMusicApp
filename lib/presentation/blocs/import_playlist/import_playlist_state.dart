part of 'import_playlist_cubit.dart';

class ImportPlaylistState extends Equatable {
  final String playlistName;
  final String itemName;
  final int totalLength;
  final int currentItem;

  const ImportPlaylistState({
    required this.playlistName,
    required this.itemName,
    required this.totalLength,
    required this.currentItem,
  });

  @override
  bool operator ==(covariant ImportPlaylistState other) {
    if (identical(this, other)) return true;

    return other.playlistName == playlistName &&
        other.itemName == itemName &&
        other.totalLength == totalLength &&
        other.currentItem == currentItem;
  }

  @override
  int get hashCode {
    return playlistName.hashCode ^ itemName.hashCode ^ totalLength.hashCode ^ currentItem.hashCode;
  }

  ImportPlaylistState copyWith({
    String? playlistName,
    String? itemName,
    int? totalLength,
    int? currentItem,
  }) {
    return ImportPlaylistState(
      playlistName: playlistName ?? this.playlistName,
      itemName: itemName ?? this.itemName,
      totalLength: totalLength ?? this.totalLength,
      currentItem: currentItem ?? this.currentItem,
    );
  }

  @override
  List<Object> get props => [
        playlistName,
        itemName,
        totalLength,
        currentItem,
      ];
}

class ImportPlaylistStateInitial extends ImportPlaylistState {
  const ImportPlaylistStateInitial()
      : super(
          playlistName: 'Loading',
          itemName: 'Loading',
          totalLength: 1,
          currentItem: 0,
        );
}

class ImportPlaylistStateComplete extends ImportPlaylistState {
  const ImportPlaylistStateComplete()
      : super(
          playlistName: 'Complete',
          itemName: 'Complete',
          totalLength: 1,
          currentItem: 1,
        );
}
