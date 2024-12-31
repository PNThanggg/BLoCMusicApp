import 'package:audio_service/audio_service.dart';

import '../presentation/theme/app_color.dart';
import 'app_player.dart';

class AudioServiceInitializer {
  static final AudioServiceInitializer _instance = AudioServiceInitializer._internal();

  factory AudioServiceInitializer() {
    return _instance;
  }

  AudioServiceInitializer._internal();

  static bool _isInitialized = false;
  static AppMusicPlayer? appMusicPlayer;

  Future<void> _initialize() async {
    appMusicPlayer = await AudioService.init(
      builder: () => AppMusicPlayer(),
      config: const AudioServiceConfig(
        androidStopForegroundOnPause: false,
        androidNotificationChannelId: 'com.hoicham.notification.status',
        androidNotificationChannelName: 'AppMusic',
        androidResumeOnClick: true,
        androidShowNotificationBadge: true,
        notificationColor: AppColor.accentColor2,
      ),
    );
  }

  Future<AppMusicPlayer> getAppMusicPlayer() async {
    if (!_isInitialized) {
      await _initialize();
      _isInitialized = true;
    }
    return appMusicPlayer!;
  }
}
