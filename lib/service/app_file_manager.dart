import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../data/local/media_item_database.dart';
import 'app_database_service.dart';

abstract class AppFileManager {
  const AppFileManager();

  static Future<bool> isPlaylistExists(String playlistName) async {
    // check if playlist exists
    final list = await AppDatabaseService.getPlaylists4Library();
    return list.any((playlist) => playlist.playlistName == playlistName);
  }

  static Future<String?> exportPlaylist(String playlistName) async {
    // export playlist to json file
    final mediaPlaylistDB = await AppDatabaseService.getPlaylist(playlistName);
    if (mediaPlaylistDB != null) {
      try {
        List<MediaItemDatabase>? playlistItems = await AppDatabaseService.getPlaylistItems(mediaPlaylistDB);
        if (playlistItems != null) {
          final Map<String, dynamic> playlistMap = {
            'playlistName': mediaPlaylistDB.playlistName,
            'mediaRanks': mediaPlaylistDB.mediaRanks,
            'mediaItems': playlistItems.map((e) => e.toMap()).toList(),
          };
          final path = await writeToJSON('${mediaPlaylistDB.playlistName}_AppPlaylist.blm', playlistMap);
          log("Playlist exported successfully", name: "FileManager");
          return path;
        }
      } catch (e) {
        log("Error exporting playlist: $e");
        return null;
      }
    } else {
      log("Playlist not found", name: "FileManager");
    }
    return null;
  }

  static Future<String?> exportMediaItem(MediaItemDatabase mediaItemDatabase) async {
    // export media item to json file
    try {
      final Map<String, dynamic> mediaItemMap = mediaItemDatabase.toMap();
      final path = await writeToJSON('${mediaItemDatabase.title}_AppSong.blm', mediaItemMap);
      log("Media item exported successfully", name: "FileManager");
      return path;
    } catch (e) {
      log("Error exporting media item: $e", name: "FileManager");
      return null;
    }
  }

  static Future<bool> importPlaylist(String filePath) async {
    //check if file is json or not
    // if (!filePath.endsWith('.blm')) {
    //   log("Invalid file format", name: "FileManager");
    //   return;
    // }
    // import playlist from json file
    try {
      await readFromJSON(filePath).then((playlistMap) async {
        log("Playlist map: $playlistMap", name: "FileManager");
        if (playlistMap != null && playlistMap.isNotEmpty) {
          bool playlistExists = await isPlaylistExists(playlistMap['playlistName']);
          int i = 1;
          String playlistName = playlistMap['playlistName'];
          while (playlistExists) {
            playlistName = playlistMap['playlistName'] + "_$i";
            playlistExists = await isPlaylistExists(playlistName);
            i++;
          }
          log("Playlist name: $playlistName", name: "FileManager");

          for (final mediaItemMap in playlistMap['mediaItems']) {
            final mediaItemDB = MediaItemDatabase.fromMap(mediaItemMap);
            await AppDatabaseService.addMediaItem(mediaItemDB, playlistName);
            log("Media item imported successfully - ${mediaItemDB.title}", name: "FileManager");
          }

          log("Playlist imported successfully");
        }
      });
      return true;
    } catch (e) {
      log("Invalid file format");
      return false;
    }
  }

  static Future<bool> importMediaItem(String filePath) async {
    try {
      await readFromJSON(filePath).then((mediaItemMap) {
        if (mediaItemMap != null && mediaItemMap.isNotEmpty) {
          final mediaItemDB = MediaItemDatabase.fromMap(mediaItemMap);
          AppDatabaseService.addMediaItem(mediaItemDB, "Imported");
          log("Media item imported successfully");
        }
      });
      return true;
    } catch (e) {
      log("Invalid file format");
    }
    return false;
  }

  static Future<String?> writeToJSON(String fileName, Map<String, dynamic> data) async {
    // write data to file
    try {
      final filePath = (await getApplicationCacheDirectory()).path;
      final file = File('$filePath/$fileName');
      await file.writeAsString(jsonEncode(data));
      log("Data written to file: $filePath/$fileName", name: "FileManager");
      return '$filePath/$fileName';
    } catch (e) {
      log("Error writing file:", error: e, name: "FileManager");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> readFromJSON(String filePath) async {
    // read data from file
    try {
      final file = File(filePath);
      final data = await file.readAsString();
      log("Data read from file: $filePath", name: "FileManager");
      return jsonDecode(data);
    } catch (e) {
      log("Error reading file:", error: e);
      return null;
    }
  }
}
