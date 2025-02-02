import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music/presentation/screens/splash/splash_screen.dart';

import 'global_str_consts.dart';

abstract class GlobalRoutes {
  static final globalRouterKey = GlobalKey<NavigatorState>();

  static final globalRouter = GoRouter(
    initialLocation: GlobalStrConsts.splashScreen,
    navigatorKey: globalRouterKey,
    routes: [
      GoRoute(
        path: GlobalStrConsts.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      // GoRoute(
      //   name: GlobalStrConsts.playerScreen,
      //   path: "/MusicPlayer",
      //   parentNavigatorKey: globalRouterKey,
      //   pageBuilder: (context, state) {
      //     return CustomTransitionPage(
      //       child: const AudioPlayerView(),
      //       transitionDuration: const Duration(milliseconds: 400),
      //       reverseTransitionDuration: const Duration(milliseconds: 400),
      //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //         const begin = Offset(0.0, 1.0);
      //         const end = Offset.zero;
      //         final tween = Tween(begin: begin, end: end);
      //         final curvedAnimation = CurvedAnimation(
      //           parent: animation,
      //           reverseCurve: Curves.easeIn,
      //           curve: Curves.easeInOut,
      //         );
      //         final offsetAnimation = curvedAnimation.drive(tween);
      //         return SlideTransition(
      //           position: offsetAnimation,
      //           child: child,
      //         );
      //       },
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: GlobalStrConsts.playlistView,
      //   // parentNavigatorKey: globalRouterKey,
      //   path: '/PlaylistView',
      //   builder: (context, state) {
      //     return const PlaylistView();
      //   },
      // ),
      // GoRoute(
      //   path: '/AddToPlaylist',
      //   parentNavigatorKey: globalRouterKey,
      //   name: GlobalStrConsts.addToPlaylistScreen,
      //   builder: (context, state) => const AddToPlaylistScreen(),
      // ),
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) => GlobalFooter(navigationShell: navigationShell),
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           name: GlobalStrConsts.exploreScreen,
      //           path: '/Explore',
      //           builder: (context, state) => const ExploreScreen(),
      //           routes: [
      //             GoRoute(
      //               name: GlobalStrConsts.ChartScreen,
      //               path: 'ChartScreen:chartName',
      //               builder: (context, state) => ChartScreen(
      //                 chartName: state.pathParameters['chartName'] ?? "none",
      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           name: GlobalStrConsts.libraryScreen,
      //           path: '/Library',
      //           builder: (context, state) => const LibraryScreen(),
      //           routes: [
      //             GoRoute(
      //               path: "ImportMediaFromPlatforms",
      //               name: GlobalStrConsts.ImportMediaFromPlatforms,
      //               builder: (context, state) => const ImportMediaFromPlatformsView(),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           name: GlobalStrConsts.searchScreen,
      //           path: '/Search',
      //           builder: (context, state) {
      //             if (state.uri.queryParameters['query'] != null) {
      //               return SearchScreen(
      //                 searchQuery: state.uri.queryParameters['query']!.toString(),
      //               );
      //             } else {
      //               return const SearchScreen();
      //             }
      //           },
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           name: GlobalStrConsts.offlineScreen,
      //           path: '/Offline',
      //           builder: (context, state) => const OfflineScreen(),
      //         ),
      //       ],
      //     ),
      //   ],
      // )
    ],
  );
}
