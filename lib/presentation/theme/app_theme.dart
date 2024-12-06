import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text_theme.dart';

abstract class AppTheme {
  static ThemeData get defaultThemeData => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.themeColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColor.accentColor2,
          secondary: AppColor.accentColor1,
          brightness: Brightness.dark,
          surface: AppColor.themeColor,
        ),
        fontFamily: AppTextTheme.fontFamilyUnageo,
        textTheme: AppTextTheme.textTheme,
        iconTheme: const IconThemeData(
          color: AppColor.primaryColor1,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.themeColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColor.primaryColor1,
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColor.accentColor2,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColor.accentColor2,
          selectionColor: AppColor.accentColor2,
          selectionHandleColor: AppColor.accentColor2,
        ),
        brightness: Brightness.dark,
        switchTheme: SwitchThemeData(
          thumbColor: const WidgetStatePropertyAll(AppColor.primaryColor1),
          trackOutlineColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected) ? AppColor.accentColor1 : AppColor.accentColor2,
          ),
          trackColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected) ? AppColor.accentColor1 : Colors.transparent,
          ),
        ),
        searchBarTheme: const SearchBarThemeData(
          backgroundColor: WidgetStatePropertyAll(AppColor.themeColor),
        ),
      );
}
