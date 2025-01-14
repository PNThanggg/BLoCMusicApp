import 'dart:developer';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;

import '../data/local/app_settings_bool_database.dart';
import '../data/local/app_settings_str_database.dart';
import '../data/local/charts_cache_database.dart';
import '../data/local/download_database.dart';
import '../data/local/lyrics_database.dart';
import '../data/local/media_item_database.dart';
import '../data/local/media_playlist_database.dart';
import '../data/local/notification_database.dart';
import '../data/local/playlists_info_database.dart';
import '../data/local/recently_played_database.dart';
import '../data/local/saved_collections_database.dart';
import '../data/local/youtube_link_cache_database.dart';
import '../models/chart_model.dart';
import '../models/media_item_model.dart';
import '../models/media_playlist_model.dart';
import '../presentation/route/global_str_consts.dart';

class AppDatabaseService {
  static late Future<Isar> database;
  static late String appSuppDir;
  static late String appDocDir;
  static final AppDatabaseService _instance = AppDatabaseService._internal();

  AppDatabaseService get instance => _instance;

  factory AppDatabaseService({String? appSuppPath, String? appDocPath}) {
    if (appSuppPath != null) {
      appSuppDir = appSuppPath;
    }
    if (appDocPath != null) {
      appDocDir = appDocPath;
    }

    return _instance;
  }

  AppDatabaseService._internal() {
    database = openDB();
    Future.delayed(const Duration(seconds: 30), () async {
      await refreshRecentlyPlayed();
      await purgeUnassociatedMediaItems();
    });
  }

  static Future<void> checkAndRestoreDB(String dbPath, List<String> bPaths) async {
    try {
      final File dbFile = File(dbPath);
      if (!await dbFile.exists()) {
        for (String element in bPaths) {
          final File backUpFile = File(element);
          if (await backUpFile.exists()) {
            await backUpFile.copy(dbFile.path);
            log("DB Restored from $element", name: "AppDatabaseService");
            break;
          }
        }
      }
    } catch (e) {
      log("Failed to restore DB", error: e, name: "AppDatabaseService");
    }
  }

  static Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      //check if DB exists in support directory
      final File dbFile = File(p.join(appSuppDir, 'default.isar'));
      if (!await dbFile.exists()) {
        // check for backup and restore
        await checkAndRestoreDB(
          dbFile.path,
          [
            p.join(appDocDir, 'default.isar'),
            p.join(appDocDir, 'bloomee_backup_db.isar'),
            p.join(appSuppDir, 'bloomee_backup_db.isar'),
          ],
        );
      }

      if (!await dbFile.exists() && await File(p.join(appDocDir, 'default.isar')).exists()) {
        final db = Isar.openSync(
          [
            MediaPlaylistDatabaseSchema,
            MediaItemDatabaseSchema,
            AppSettingsBoolDatabaseSchema,
            AppSettingsStrDatabaseSchema,
            RecentlyPlayedDatabaseSchema,
            ChartsCacheDatabaseSchema,
            YoutubeLinkCacheDatabaseSchema,
            NotificationDatabaseSchema,
            DownloadDatabaseSchema,
            PlaylistsInfoDatabaseSchema,
            SavedCollectionsDatabaseSchema,
            LyricsDatabaseSchema,
          ],
          directory: appDocDir,
        );
        db.copyToFile(dbFile.path);
        db.close();
      }

      return Isar.openSync(
        [
          MediaPlaylistDatabaseSchema,
          MediaItemDatabaseSchema,
          AppSettingsBoolDatabaseSchema,
          AppSettingsStrDatabaseSchema,
          RecentlyPlayedDatabaseSchema,
          ChartsCacheDatabaseSchema,
          YoutubeLinkCacheDatabaseSchema,
          NotificationDatabaseSchema,
          DownloadDatabaseSchema,
          PlaylistsInfoDatabaseSchema,
          SavedCollectionsDatabaseSchema,
          LyricsDatabaseSchema,
        ],
        directory: appSuppDir,
      );
    }
    return Future.value(Isar.getInstance());
  }

  static Future<bool> createBackUp() async {
    try {
      final isar = await database;
      String? backUpDir;
      try {
        backUpDir = await getSettingStr(GlobalStrConsts.backupPath);
      } catch (e) {
        backUpDir = appDocDir;
      }

      final File backUpFile = File('$backUpDir/app_backup_db.isar');
      if (await backUpFile.exists()) {
        await backUpFile.delete();
      }

      await isar.copyToFile('$backUpDir/app_backup_db.isar');

      log("Backup created successfully ${backUpFile.path}", name: "AppDBService");
      return true;
    } catch (e) {
      log("Failed to create backup", error: e, name: "AppDBService");
    }
    return false;
  }

  static Future<bool> backupExists() async {
    try {
      String? backUpDir;
      try {
        backUpDir = await getSettingStr(GlobalStrConsts.backupPath);
      } catch (e) {
        log(e.toString(), name: "DB");
        backUpDir = appDocDir;
      }

      final dbFile = File('$backUpDir/app_backup_db.isar');
      if (dbFile.existsSync()) {
        return true;
      }
    } catch (e) {
      log("No backup exists", error: e, name: "AppDBService");
    }
    return false;
  }

  static Future<bool> restoreDB() async {
    try {
      final isar = await database;

      String? backUpDir;
      try {
        backUpDir = await getSettingStr(GlobalStrConsts.backupPath);
      } catch (e) {
        log(e.toString(), name: "DB");
        backUpDir = appDocDir;
      }

      await isar.close();

      final dbFile = File('$backUpDir/app_backup_db.isar');
      final dbPath = File('$appSuppDir/default.isar');

      if (await dbFile.exists()) {
        await dbFile.copy(dbPath.path);
        log("Successfully restored", name: "AppDBService");
        AppDatabaseService();
        return true;
      }
    } catch (e) {
      log("Restoring DB failed", error: e, name: "AppDBService");
    }
    AppDatabaseService();
    return false;
  }

  static Future<void> refreshRecentlyPlayed() async {
    Isar isarDB = await database;
    List<int> ids = List.empty(growable: true);

    int days = int.parse((await getSettingStr(GlobalStrConsts.historyClearTime, defaultValue: "7"))!);

    List<RecentlyPlayedDatabase> recentlyPlayed = isarDB.recentlyPlayedDatabases.where().findAllSync();
    for (RecentlyPlayedDatabase element in recentlyPlayed) {
      if (DateTime.now().difference(element.lastPlayed).inDays > days) {
        await element.mediaItem.load();
        if (element.mediaItem.value != null) {
          removeMediaItemFromPlaylist(
            element.mediaItem.value!,
            MediaPlaylistDatabase(playlistName: "recently_played"),
          );
          ids.add(element.id!);
        } else {
          ids.add(element.id!);
        }
      }
    }
    isarDB.writeTxnSync(() => isarDB.recentlyPlayedDatabases.deleteAllSync(ids));
  }

  static Future<void> purgeUnassociatedMediaItems() async {
    // Remove media items that are not associated with any playlist
    Isar isarDB = await database;
    List<MediaItemDatabase> mediaItems = isarDB.mediaItemDatabases.where().findAllSync();
    for (var element in mediaItems) {
      await purgeUnassociatedMediaItem(element);
    }
  }

  static Future<String?> getSettingStr(
    String key, {
    String? defaultValue,
  }) async {
    Isar isarDB = await database;
    final settingValue = isarDB.appSettingsStrDatabases.filter().settingNameEqualTo(key).findFirstSync()?.settingValue;
    if (settingValue != null) {
      return settingValue;
    } else {
      return defaultValue;
    }
  }

  static Future<void> removeMediaItem(MediaItemDatabase mediaItemDB) async {
    Isar isarDB = await database;
    bool result = false;
    isarDB.writeTxnSync(
      () => result = isarDB.mediaItemDatabases.deleteSync(mediaItemDB.id!),
    );

    if (result) {
      log("${mediaItemDB.title} is Deleted!!", name: "DB");
    }
  }

  static Future<void> purgeUnassociatedMediaItem(MediaItemDatabase mediaItemDB) async {
    // Remove media items that are not associated with any playlist
    if (mediaItemDB.mediaInPlaylistsDB.isEmpty) {
      await removeMediaItem(mediaItemDB);
    }
  }

  static Future<void> removeMediaItemFromPlaylist(
    MediaItemDatabase mediaItemDatabase,
    MediaPlaylistDatabase mediaPlaylistDatabase,
  ) async {
    Isar isarDB = await database;
    MediaItemDatabase? mediaItem =
        isarDB.mediaItemDatabases.filter().permaURLEqualTo(mediaItemDatabase.permaURL).findFirstSync();

    MediaPlaylistDatabase? mediaPlaylist =
        isarDB.mediaPlaylistDatabases.filter().isarIdEqualTo(mediaPlaylistDatabase.isarId).findFirstSync();

    if (mediaItem != null && mediaPlaylist != null) {
      if (mediaItem.mediaInPlaylistsDB.contains(mediaPlaylistDatabase)) {
        mediaItem.mediaInPlaylistsDB.remove(mediaPlaylistDatabase);
        log("Removed from playlist", name: "DB");
        isarDB.writeTxnSync(() => isarDB.mediaItemDatabases.putSync(mediaItem));
        if (mediaItem.mediaInPlaylistsDB.isEmpty) {
          await removeMediaItem(mediaItem);
        }

        if (mediaPlaylist.mediaRanks.contains(mediaItem.id)) {
          List<int> list = mediaPlaylist.mediaRanks.toList(growable: true);
          list.remove(mediaItem.id);
          mediaPlaylist.mediaRanks = list;
          isarDB.writeTxnSync(
            () => isarDB.mediaPlaylistDatabases.putSync(mediaPlaylist),
          );
        }
      }
    } else {
      log("MediaItem or MediaPlaylist is null", name: "DB");
      if (mediaItem != null) {
        await purgeUnassociatedMediaItem(mediaItem);
      }
    }
  }

  static Future<int?> addMediaItem(
    MediaItemDatabase mediaItemDB,
    String playlistName,
  ) async {
    int? id;
    Isar isarDB = await database;
    MediaPlaylistDatabase mediaPlaylistDatabase = MediaPlaylistDatabase(playlistName: playlistName);

    // search for media item if already exists
    MediaItemDatabase? mediaItem =
        isarDB.mediaItemDatabases.filter().permaURLEqualTo(mediaItemDB.permaURL).findFirstSync();

    // search for playlist if already exists
    MediaPlaylistDatabase? mediaPlaylistDB =
        isarDB.mediaPlaylistDatabases.filter().isarIdEqualTo(mediaPlaylistDatabase.isarId).findFirstSync();

    if (mediaPlaylistDB == null) {
      // create playlist if not exists
      final tmpId = await createPlaylist(playlistName);
      mediaPlaylistDB =
          isarDB.mediaPlaylistDatabases.filter().isarIdEqualTo(mediaPlaylistDatabase.isarId).findFirstSync();
      log("${mediaPlaylistDB.toString()} ID: $tmpId", name: "DB");
    }

    // add playlist to _mediaitem
    if (mediaItem != null) {
      // update and save existing media item
      mediaItem.mediaInPlaylistsDB.add(mediaPlaylistDB!);
      id = mediaItem.id;
      isarDB.writeTxnSync(() => isarDB.mediaItemDatabases.putSync(mediaItem!));
    } else {
      // save given new media item
      mediaItem = mediaItemDB;
      log("id: ${mediaItem.id}", name: "DB");
      mediaItem.mediaInPlaylistsDB.add(mediaPlaylistDatabase);
      isarDB.writeTxnSync(() => id = isarDB.mediaItemDatabases.putSync(mediaItem!));
    }

    // add current rank for media item in playlist orderList
    if (!(mediaPlaylistDB?.mediaRanks.contains(mediaItem.id) ?? false)) {
      mediaPlaylistDB =
          mediaItem.mediaInPlaylistsDB.filter().isarIdEqualTo(mediaPlaylistDatabase.isarId).findFirstSync()!;

      List<int> list = mediaPlaylistDB.mediaRanks.toList(growable: true);
      list.add(mediaItem.id!);
      mediaPlaylistDB.mediaRanks = list;
      isarDB.writeTxnSync(() => isarDB.mediaPlaylistDatabases.putSync(mediaPlaylistDatabase));
      log(mediaPlaylistDB.mediaRanks.toString(), name: "DB");
    }

    return id;
  }

  static Future<int> addPlaylistInfo(
    PlaylistsInfoDatabase playlistInfoDatabase,
  ) async {
    Isar isarDB = await database;
    return isarDB.writeTxnSync(
      () => isarDB.playlistsInfoDatabases.putSync(playlistInfoDatabase),
    );
  }

  static Future<int?> addPlaylist(MediaPlaylistDatabase mediaPlaylistDB) async {
    Isar isarDB = await database;
    int? id;
    if (mediaPlaylistDB.playlistName.isEmpty) {
      return null;
    }

    MediaPlaylistDatabase? mediaPlaylist =
        isarDB.mediaPlaylistDatabases.filter().isarIdEqualTo(mediaPlaylistDB.isarId).findFirstSync();

    if (mediaPlaylist == null) {
      id = isarDB.writeTxnSync(
        () => isarDB.mediaPlaylistDatabases.putSync(mediaPlaylistDB),
      );
    } else {
      id = mediaPlaylist.isarId;
    }
    return id;
  }

  static Future<int?> createPlaylistInfo(
    String playlistName, {
    String? artURL,
    String? description,
    String? permaURL,
    String? source,
    String? artists,
    bool isAlbum = false,
  }) async {
    if (playlistName.isNotEmpty) {
      return await addPlaylistInfo(
        PlaylistsInfoDatabase(
          playlistName: playlistName,
          lastUpdated: DateTime.now(),
          artURL: artURL,
          description: description,
          permaURL: permaURL,
          source: source,
          artists: artists,
          isAlbum: isAlbum,
        ),
      );
    }
    return null;
  }

  static Future<int?> createPlaylist(
    String playlistName, {
    String? artURL,
    String? description,
    String? permaURL,
    String? source,
    String? artists,
    bool isAlbum = false,
    List<MediaItemDatabase> mediaItems = const [],
  }) async {
    if (playlistName.isEmpty) {
      return null;
    }

    int? id;
    MediaPlaylistDatabase mediaPlaylistDB = MediaPlaylistDatabase(
      playlistName: playlistName,
      lastUpdated: DateTime.now(),
    );
    id = await addPlaylist(mediaPlaylistDB);
    if (id != null) {
      if (mediaItems.isNotEmpty) {
        for (var element in mediaItems) {
          await addMediaItem(element, playlistName);
        }
      }
      if (artURL != null || description != null || permaURL != null || source != null || artists != null || isAlbum) {
        await createPlaylistInfo(
          playlistName,
          artURL: artURL,
          description: description,
          permaURL: permaURL,
          source: source,
          artists: artists,
          isAlbum: isAlbum,
        );
      }
      log("Playlist Created: $playlistName", name: "DB");
    }
    return id;
  }

  static Future<MediaPlaylistDatabase?> getPlaylist(String playlistName) async {
    Isar isarDB = await database;
    return isarDB.mediaPlaylistDatabases.filter().playlistNameEqualTo(playlistName).findFirstSync();
  }

  static Future<List<MediaItemDatabase>?> getPlaylistItems(MediaPlaylistDatabase mediaPlaylistDB) async {
    Isar isarDB = await database;
    return isarDB.mediaPlaylistDatabases.getSync(mediaPlaylistDB.isarId)?.mediaItems.toList();
  }

  static Future<PlaylistsInfoDatabase?> getPlaylistInfo(String playlistName) async {
    Isar isarDB = await database;
    return isarDB.playlistsInfoDatabases.filter().playlistNameEqualTo(playlistName).findFirstSync();
  }

  static Future<List<MediaPlaylist>> getPlaylists4Library() async {
    Isar isarDB = await database;
    final playlists = await isarDB.mediaPlaylistDatabases.where().findAll();
    List<MediaPlaylist> mediaPlaylists = [];
    for (var e in playlists) {
      PlaylistsInfoDatabase? info = await getPlaylistInfo(e.playlistName);
      mediaPlaylists.add(
        fromPlaylistDB2MediaPlaylist(
          e,
          playlistsInfoDB: info,
        ),
      );
    }
    return mediaPlaylists;
  }

  static Future<YoutubeLinkCacheDatabase?> getYtLinkCache(String id) async {
    Isar isarDB = await database;
    return isarDB.youtubeLinkCacheDatabases.filter().videoIdEqualTo(id).findFirstSync();
  }

  static Future<DownloadDatabase?> getDownloadDB(MediaItemModel mediaItem) async {
    Isar isarDB = await database;
    final temp = isarDB.downloadDatabases.filter().mediaIdEqualTo(mediaItem.id).findFirstSync();
    if (temp != null && File("${temp.filePath}/${temp.fileName}").existsSync()) {
      return temp;
    }
    return null;
  }

  static Future<void> putRecentlyPlayed(MediaItemDatabase mediaItemDatabase) async {
    Isar isarDB = await database;
    int? id = await addMediaItem(mediaItemDatabase, "recently_played");

    MediaItemDatabase? mediaItemDB = isarDB.mediaItemDatabases.filter().idEqualTo(id).findFirstSync();

    if (mediaItemDB != null) {
      RecentlyPlayedDatabase? recentlyPlayed = isarDB.recentlyPlayedDatabases
          .filter()
          .mediaItem(
            (q) => q.idEqualTo(mediaItemDB.id!),
          )
          .findFirstSync();
      if (recentlyPlayed != null) {
        isarDB.writeTxnSync(
          () => isarDB.recentlyPlayedDatabases.putSync(
            recentlyPlayed.copyWith(
              dateTime: DateTime.now(),
            ),
          ),
        );
      } else {
        isarDB.writeTxnSync(
          () => isarDB.recentlyPlayedDatabases.putSync(
            RecentlyPlayedDatabase(lastPlayed: DateTime.now())..mediaItem.value = mediaItemDB,
          ),
        );
      }
    } else {
      log("Failed to add in Recently_Played", name: "DB");
    }
  }

  static Future<void> putYtLinkCache(String id, String lowUrl, String highUrl, int expireAt) async {
    Isar isarDB = await database;
    isarDB.writeTxnSync(
      () => isarDB.youtubeLinkCacheDatabases.putSync(
        YoutubeLinkCacheDatabase(
          videoId: id,
          lowQURL: lowUrl,
          highQURL: highUrl,
          expireAt: expireAt,
        ),
      ),
    );
  }

  static Future<String?> getApiTokenDB(String apiName) async {
    Isar isarDB = await database;
    final apiToken = isarDB.appSettingsStrDatabases.filter().settingNameEqualTo(apiName).findFirstSync();
    if (apiToken != null) {
      if ((apiToken.lastUpdated!.difference(DateTime.now()).inSeconds + 30).abs() <
              int.parse(apiToken.settingValue2!) ||
          apiToken.settingValue2 == "0") {
        return apiToken.settingValue;
      }
    }
    return null;
  }

  static Future<void> putApiTokenDB(String apiName, String token, String expireIn) async {
    Isar isarDB = await database;
    isarDB.writeTxnSync(
      () => isarDB.appSettingsStrDatabases.putSync(
        AppSettingsStrDatabase(
          settingName: apiName,
          settingValue: token,
          settingValue2: expireIn,
          lastUpdated: DateTime.now(),
        ),
      ),
    );
  }

  static Future<void> putChart(ChartModel chartModel) async {
    Isar isarDB = await database;
    int? id;
    isarDB.writeTxnSync(() => id = isarDB.chartsCacheDatabases.putSync(chartModelToChartCacheDB(chartModel)));
    log("Chart Putted with ID: $id", name: "DB");
  }

  static Future<ChartModel?> getChart(String chartName) async {
    Isar isarDB = await database;
    final chartCacheDB = isarDB.chartsCacheDatabases.filter().chartNameEqualTo(chartName).findFirstSync();
    if (chartCacheDB != null) {
      return chartCacheDBToChartModel(chartCacheDB);
    } else {
      return null;
    }
  }

  static Future<void> removeDownloadDB(MediaItemModel mediaItem) async {
    Isar isarDB = await database;
    DownloadDatabase? downloadDB = isarDB.downloadDatabases.filter().mediaIdEqualTo(mediaItem.id).findFirstSync();
    if (downloadDB != null) {
      isarDB.writeTxnSync(
        () => isarDB.downloadDatabases.deleteSync(downloadDB.id!),
      );

      removeMediaItemFromPlaylist(
        mediaItem2MediaItemDB(mediaItem),
        MediaPlaylistDatabase(playlistName: GlobalStrConsts.downloadPlaylist),
      );
    }

    try {
      File file = File("${downloadDB!.filePath}/${downloadDB.fileName}");
      if (file.existsSync()) {
        file.deleteSync();
        log("File Deleted: ${downloadDB.fileName}", name: "DB");
      }
    } catch (e) {
      log("Failed to delete file: ${downloadDB!.fileName}", error: e, name: "DB");
    }
  }
}
