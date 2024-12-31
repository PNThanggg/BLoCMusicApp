import 'package:isar/isar.dart';

import '../fast_hash.dart';

part 'app_settings_bool_database.g.dart';

@collection
class AppSettingsBoolDB {
  Id get isarId => fastHash(settingName);
  final String settingName;
  final bool settingValue;

  AppSettingsBoolDB({
    required this.settingName,
    required this.settingValue,
  });

  @override
  bool operator ==(covariant AppSettingsBoolDB other) {
    if (identical(this, other)) return true;

    return other.settingName == settingName && other.settingValue == settingValue;
  }

  @override
  int get hashCode => settingName.hashCode ^ settingValue.hashCode;
}
