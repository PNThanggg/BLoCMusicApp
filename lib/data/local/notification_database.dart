import 'package:isar/isar.dart';

part 'notification_database.g.dart';

@collection
class NotificationDB {
  Id? id = Isar.autoIncrement;
  final String title;
  final String body;
  final String type;
  final String? url;
  final String? payload;
  final DateTime? time;

  NotificationDB({
    this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.url,
    this.payload,
  });
}
