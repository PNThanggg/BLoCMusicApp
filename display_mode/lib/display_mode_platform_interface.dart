import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'display_mode_method_channel.dart';
import 'model/display_mode_model.dart';

abstract class DisplayModePlatform extends PlatformInterface {
  /// Constructs a DisplayModePlatform.
  DisplayModePlatform() : super(token: _token);

  static final Object _token = Object();

  static DisplayModePlatform _instance = MethodChannelDisplayMode();

  /// The default instance of [DisplayModePlatform] to use.
  ///
  /// Defaults to [MethodChannelDisplayMode].
  static DisplayModePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DisplayModePlatform] when
  /// they register themselves.
  static set instance(DisplayModePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<List<DisplayModeModel>> get supported {
    throw UnimplementedError('getSupportedModes() has not been implemented.');
  }

  Future<DisplayModeModel> get active {
    throw UnimplementedError('getActiveMode() has not been implemented.');
  }

  Future<DisplayModeModel> get preferred {
    throw UnimplementedError('getPreferredMode() has not been implemented.');
  }

  Future<void> setPreferredMode(DisplayModeModel mode) {
    throw UnimplementedError('setPreferredMode() has not been implemented.');
  }

  Future<void> setHighRefreshRate() {
    throw UnimplementedError('setHighRefreshRate() has not been implemented.');
  }

  Future<void> setLowRefreshRate() {
    throw UnimplementedError('setHighRefreshRate() has not been implemented.');
  }
}
