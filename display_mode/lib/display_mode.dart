import 'display_mode_platform_interface.dart';
import 'model/display_mode_model.dart';

abstract class DisplayMode {
  static Future<List<DisplayModeModel>> get supported {
    return DisplayModePlatform.instance.supported;
  }

  static Future<DisplayModeModel> get active {
    return DisplayModePlatform.instance.active;
  }

  static Future<DisplayModeModel> get preferred {
    return DisplayModePlatform.instance.preferred;
  }

  static Future<void> setPreferredMode(DisplayModeModel mode) {
    return DisplayModePlatform.instance.setPreferredMode(mode);
  }

  static Future<void> setHighRefreshRate() {
    return DisplayModePlatform.instance.setHighRefreshRate();
  }

  static Future<void> setLowRefreshRate() {
    return DisplayModePlatform.instance.setLowRefreshRate();
  }
}
