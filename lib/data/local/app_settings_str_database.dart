import 'package:isar/isar.dart';

import '../../utils/fast_hash.dart';

part 'app_settings_str_database.g.dart';

@collection
class AppSettingsStrDatabase {
  Id get isarId => fastHash(settingName);
  final String settingName;
  final String settingValue;
  final String? settingValue2;
  final DateTime? lastUpdated;

  AppSettingsStrDatabase({
    required this.settingName,
    required this.settingValue,
    this.settingValue2,
    this.lastUpdated,
  });

  @override
  bool operator ==(covariant AppSettingsStrDatabase other) {
    if (identical(this, other)) return true;

    return other.settingName == settingName && other.settingValue == settingValue;
  }

  @override
  int get hashCode => settingName.hashCode ^ settingValue.hashCode;
}
