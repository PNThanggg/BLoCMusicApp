import 'dart:io' as io;

import 'package:display_mode/display_mode.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'presentation/blocs/add_to_playlist/add_to_playlist_cubit.dart';
import 'presentation/blocs/app_database/app_database_cubit.dart';
import 'presentation/blocs/internet_connectivity/connectivity_cubit.dart';
import 'presentation/blocs/lastdotfm/lastdotfm_cubit.dart';
import 'presentation/blocs/library/library_items_cubit.dart';
import 'presentation/blocs/lyrics/lyrics_cubit.dart';
import 'presentation/blocs/media_player/bloomee_player_cubit.dart';
import 'presentation/blocs/mini_player/mini_player_bloc.dart';
import 'presentation/blocs/notification/notification_cubit.dart';
import 'presentation/blocs/search/fetch_search_results.dart';
import 'presentation/blocs/settings_cubit/settings_cubit.dart';
import 'presentation/blocs/timer/timer_bloc.dart';
import 'presentation/route/routes.dart';
import 'presentation/theme/app_theme.dart';
import 'service/shortcuts_intents.dart';
import 'utils/ticker.dart';

late BloomeePlayerCubit bloomeePlayerCubit;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  if (io.Platform.isAndroid) {
    await DisplayMode.setHighRefreshRate();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloomeePlayerCubit,
          lazy: false,
        ),
        BlocProvider(
          create: (context) => MiniPlayerBloc(playerCubit: bloomeePlayerCubit),
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
            bloomeePlayer: bloomeePlayerCubit,
          ),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CurrentPlaylistCubit(
            bloomeeDBCubit: context.read<AppDatabaseCubit>(),
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
          create: (context) => LyricsCubit(bloomeePlayerCubit),
        ),
        BlocProvider(
          create: (context) => LastdotfmCubit(playerCubit: bloomeePlayerCubit),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}

class _CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
