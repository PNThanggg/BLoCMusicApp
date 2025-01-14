import 'dart:async';
import 'dart:developer';
import 'dart:io' as io;

import 'package:display_mode/display_mode.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'presentation/blocs/add_to_playlist/add_to_playlist_cubit.dart';
import 'presentation/blocs/app_database/app_database_cubit.dart';
import 'presentation/blocs/current_playlist/current_playlist_cubit.dart';
import 'presentation/blocs/downloader/downloader_cubit.dart';
import 'presentation/blocs/import_playlist/import_playlist_cubit.dart';
import 'presentation/blocs/internet_connectivity/connectivity_cubit.dart';
import 'presentation/blocs/lastdotfm/lastdotfm_cubit.dart';
import 'presentation/blocs/library/library_items_cubit.dart';
import 'presentation/blocs/lyrics/lyrics_cubit.dart';
import 'presentation/blocs/media_player/app_player_cubit.dart';
import 'presentation/blocs/mini_player/mini_player_bloc.dart';
import 'presentation/blocs/notification/notification_cubit.dart';
import 'presentation/blocs/search/fetch_search_results.dart';
import 'presentation/blocs/settings_cubit/settings_cubit.dart';
import 'presentation/blocs/timer/timer_bloc.dart';
import 'presentation/route/routes.dart';
import 'presentation/theme/app_theme.dart';
import 'repository/youtube/youtube_api.dart';
import 'service/app_database_service.dart';
import 'service/app_file_manager.dart';
import 'service/shortcuts_intents.dart';
import 'service/snack_bar_service.dart';
import 'utils/external_list_importer.dart';
import 'utils/ticker.dart';
import 'utils/url_checker.dart';

AppPlayerCubit appPlayerCubit = AppPlayerCubit();

Future<void> initServices() async {
  String appDocPath = (await getApplicationDocumentsDirectory()).path;
  String appSuppPath = (await getApplicationSupportDirectory()).path;
  AppDatabaseService(appDocPath: appDocPath, appSuppPath: appSuppPath);
  YouTubeServices(appDocPath: appDocPath, appSuppPath: appSuppPath);
}

void processIncomingIntent(List<SharedMediaFile> sharedMediaFiles) {
  if (isUrl(sharedMediaFiles[0].path)) {
    final UrlType urlType = UrlType.getUrlType(sharedMediaFiles[0].path);
    switch (urlType) {
      case UrlType.spotifyTrack:
        ExternalMediaImporter.sfyMediaImporter(sharedMediaFiles[0].path).then((value) async {
          if (value != null) {
            await appPlayerCubit.appMusicPlayer.addQueueItem(
              value,
              doPlay: true,
            );
          }
        });
        break;
      case UrlType.spotifyPlaylist:
        SnackBarService.showMessage("Import Spotify Playlist from library!");
        break;
      case UrlType.youtubePlaylist:
        SnackBarService.showMessage("Import Youtube Playlist from library!");
        break;
      case UrlType.spotifyAlbum:
        SnackBarService.showMessage("Import Spotify Album from library!");
        break;
      case UrlType.youtubeVideo:
        ExternalMediaImporter.ytMediaImporter(sharedMediaFiles[0].path).then((value) async {
          if (value != null) {
            await appPlayerCubit.appMusicPlayer.addQueueItem(value, doPlay: true);
          }
        });
        break;
      case UrlType.other:
        if (sharedMediaFiles[0].mimeType == "application/octet-stream") {
          SnackBarService.showMessage("Processing File...");
          importItems(Uri.parse(sharedMediaFiles[0].path).toFilePath().toString());
        }
      default:
        log("Invalid URL");
    }
  }
}

Future<void> importItems(String path) async {
  bool res = await AppFileManager.importMediaItem(path);
  if (res) {
    SnackBarService.showMessage("Media Item Imported");
  } else {
    res = await AppFileManager.importPlaylist(path);
    if (res) {
      SnackBarService.showMessage("Playlist Imported");
    } else {
      SnackBarService.showMessage("Invalid File Format");
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  if (io.Platform.isAndroid) {
    await DisplayMode.setHighRefreshRate();
  }

  if (io.Platform.isLinux) {
    JustAudioMediaKit.ensureInitialized(
      linux: true,
      windows: false,
    );
  }
  await initServices();
  MetadataGod.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Initialize the player
  // This widget is the root of your application.
  late StreamSubscription _intentSub;
  final sharedMediaFiles = <SharedMediaFile>[];

  @override
  void initState() {
    super.initState();
    if (io.Platform.isAndroid) {
      // For sharing or opening urls/text coming from outside the app while the app is in the memory
      _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((event) {
        sharedMediaFiles.clear();
        sharedMediaFiles.addAll(event);
        processIncomingIntent(sharedMediaFiles);

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      });

      // For sharing or opening urls/text coming from outside the app while the app is closed

      ReceiveSharingIntent.instance.getInitialMedia().then((event) {
        sharedMediaFiles.clear();
        sharedMediaFiles.addAll(event);
        processIncomingIntent(sharedMediaFiles);
        ReceiveSharingIntent.instance.reset();
      });
    }
  }

  @override
  void dispose() {
    _intentSub.cancel();

    appPlayerCubit.appMusicPlayer.audioPlayer.dispose();
    appPlayerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => appPlayerCubit,
          lazy: false,
        ),
        BlocProvider(
          create: (context) => MiniPlayerBloc(playerCubit: appPlayerCubit),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => AppDatabaseCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => TimerBloc(
            ticker: const Ticker(),
            appPlayerCubit: appPlayerCubit,
          ),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CurrentPlaylistCubit(
            appDatabaseCubit: context.read<AppDatabaseCubit>(),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => LibraryItemsCubit(
            appDatabaseCubit: context.read<AppDatabaseCubit>(),
          ),
        ),
        BlocProvider(
          create: (context) => AddToPlaylistCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ImportPlaylistCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSearchResultsCubit(),
        ),
        BlocProvider(
          create: (context) => LyricsCubit(appPlayerCubit),
        ),
        BlocProvider(
          create: (context) => LastdotfmCubit(playerCubit: appPlayerCubit),
          lazy: false,
        ),
      ],
      child: RepositoryProvider(
        create: (context) => DownloaderCubit(
          connectivityCubit: context.read<ConnectivityCubit>(),
        ),
        lazy: false,
        child: BlocBuilder<AppPlayerCubit, AppPlayerState>(
          builder: (context, state) {
            if (state is AppPlayerInitial) {
              return const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              );
            }

            return MaterialApp.router(
              title: 'Flutter Demo',
              shortcuts: {
                LogicalKeySet(LogicalKeyboardKey.space): const PlayPauseIntent(),
                LogicalKeySet(LogicalKeyboardKey.mediaPlayPause): const PlayPauseIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowLeft): const PreviousIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowRight): const NextIntent(),
                LogicalKeySet(LogicalKeyboardKey.keyR): const RepeatIntent(),
                LogicalKeySet(LogicalKeyboardKey.keyL): const LikeIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowRight, LogicalKeyboardKey.alt): const NSecForwardIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowLeft, LogicalKeyboardKey.alt): const NSecBackwardIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowUp): const VolumeUpIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowDown): const VolumeDownIntent(),
              },
              actions: {
                PlayPauseIntent: CallbackAction(onInvoke: (intent) {
                  if (context.read<AppPlayerCubit>().appMusicPlayer.audioPlayer.playing) {
                    context.read<AppPlayerCubit>().appMusicPlayer.audioPlayer.pause();
                  } else {
                    context.read<AppPlayerCubit>().appMusicPlayer.audioPlayer.play();
                  }
                  return null;
                }),
                NextIntent: CallbackAction(onInvoke: (intent) {
                  context.read<AppPlayerCubit>().appMusicPlayer.skipToNext();
                  return null;
                }),
                PreviousIntent: CallbackAction(onInvoke: (intent) {
                  context.read<AppPlayerCubit>().appMusicPlayer.skipToPrevious();
                  return null;
                }),
                NSecForwardIntent: CallbackAction(onInvoke: (intent) {
                  context.read<AppPlayerCubit>().appMusicPlayer.seekNSecForward(
                        const Duration(seconds: 5),
                      );
                  return null;
                }),
                NSecBackwardIntent: CallbackAction(onInvoke: (intent) {
                  context.read<AppPlayerCubit>().appMusicPlayer.seekNSecBackward(
                        const Duration(seconds: 5),
                      );
                  return null;
                }),
                VolumeUpIntent: CallbackAction(onInvoke: (intent) {
                  context.read<AppPlayerCubit>().appMusicPlayer.audioPlayer.setVolume(
                        (context.read<AppPlayerCubit>().appMusicPlayer.audioPlayer.volume + 0.1).clamp(0.0, 1.0),
                      );
                  return null;
                }),
                VolumeDownIntent: CallbackAction(onInvoke: (intent) {
                  context.read<AppPlayerCubit>().appMusicPlayer.audioPlayer.setVolume(
                        (context.read<AppPlayerCubit>().appMusicPlayer.audioPlayer.volume - 0.1).clamp(0.0, 1.0),
                      );
                  return null;
                }),
              },
              debugShowCheckedModeBanner: false,
              theme: AppTheme.defaultThemeData,
              darkTheme: AppTheme.defaultThemeData,
              themeMode: ThemeMode.dark,
              scrollBehavior: _CustomScrollBehavior(),
              routerConfig: GlobalRoutes.globalRouter,
              builder: (context, child) {
                return ResponsiveBreakpoints.builder(
                  breakpoints: [
                    const Breakpoint(
                      start: 0,
                      end: 450,
                      name: MOBILE,
                    ),
                    const Breakpoint(
                      start: 451,
                      end: 800,
                      name: TABLET,
                    ),
                    const Breakpoint(
                      start: 801,
                      end: 1920,
                      name: DESKTOP,
                    ),
                    const Breakpoint(
                      start: 1921,
                      end: double.infinity,
                      name: '4K',
                    ),
                  ],
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

/// A custom scroll behavior class that extends [MaterialScrollBehavior].
///
/// This class overrides the [dragDevices] property to support drag gestures
/// from both touch and mouse devices. By default, Flutter's scroll behavior
/// only supports touch-based interactions. Adding mouse support ensures that
/// the scrollable components in the app are accessible on devices using a mouse.
///
/// Example usage:
/// ```dart
/// MaterialApp(
///   scrollBehavior: _CustomScrollBehavior(),
///   home: MyHomePage(),
/// );
/// ```
///
/// Devices supported for dragging:
/// - [PointerDeviceKind.touch]: Touchscreens (e.g., phones, tablets).
/// - [PointerDeviceKind.mouse]: Mouse input (e.g., desktops).
class _CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
