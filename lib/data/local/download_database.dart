import 'package:isar/isar.dart';

part 'download_database.g.dart';

@collection
class DownloadDatabase {
  Id? id = Isar.autoIncrement;
  final String fileName;
  final String filePath;
  final DateTime? lastDownloaded;
  final String mediaId;

  DownloadDatabase({
    this.id,
    required this.fileName,
    required this.filePath,
    required this.lastDownloaded,
    required this.mediaId,
  });
}
