import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'presentation/route/routes.dart';
import 'presentation/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
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
  }
}

class _CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
