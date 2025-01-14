import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'display_mode_platform_interface.dart';
import 'model/display_mode_model.dart';

/// An implementation of [DisplayModePlatform] that uses method channels.
class MethodChannelDisplayMode extends DisplayModePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('display_mode');

  @override
  Future<List<DisplayModeModel>> get supported async {
    final List<dynamic> rawModes = await methodChannel.invokeMethod<List<dynamic>>('getSupportedModes') ?? [];

    final List<DisplayModeModel> modes = rawModes.map((dynamic i) {
      final Map<String, dynamic> item = (i as Map<dynamic, dynamic>).cast<String, dynamic>();
      return DisplayModeModel.fromJson(item);
    }).toList();

    modes.insert(0, DisplayModeModel.auto);
    return modes;
  }

  @override
  Future<DisplayModeModel> get active async {
    final Map<dynamic, dynamic> mode = await methodChannel.invokeMethod<Map<dynamic, dynamic>>('getActiveMode') ?? {};

    return DisplayModeModel.fromJson(mode.cast<String, dynamic>());
  }

  @override
  Future<DisplayModeModel> get preferred async {
    final Map<dynamic, dynamic> mode =
        await methodChannel.invokeMethod<Map<dynamic, dynamic>>('getPreferredMode') ?? {};

    return DisplayModeModel.fromJson(mode.cast<String, dynamic>());
  }

  @override
  Future<void> setPreferredMode(DisplayModeModel mode) async {
    return await methodChannel.invokeMethod<void>(
      'setPreferredMode',
      <String, dynamic>{
        'mode': mode.id,
      },
    );
  }

  @override
  Future<void> setHighRefreshRate() async {
    final List<DisplayModeModel> modes = await supported;
    final DisplayModeModel activeMode = await active;

    DisplayModeModel newMode = activeMode;
    for (final DisplayModeModel mode in modes) {
      if (mode.height == newMode.height && mode.width == newMode.width && mode.refreshRate > newMode.refreshRate) {
        newMode = mode;
      }
    }

    await setPreferredMode(newMode);
  }

  @override
  Future<void> setLowRefreshRate() async {
    final List<DisplayModeModel> modes = await supported;
    final DisplayModeModel activeMode = await active;

    DisplayModeModel newMode = activeMode;
    for (final DisplayModeModel mode in modes) {
      if (mode.height == newMode.height && mode.width == newMode.width && mode.refreshRate < newMode.refreshRate) {
        newMode = mode;
      }
    }

    await setPreferredMode(newMode);
  }
}
