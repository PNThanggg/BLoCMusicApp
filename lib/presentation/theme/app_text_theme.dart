import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppTextTheme {
  static const String fontFamilyUnageo = "Unageo";
  static const String fontFamilyGilroy = "Gilroy";
  static const String fontFamilyCodePro = "CodePro";
  static const String fontFamilyReThinkSans = "ReThink-Sans";
  static const String fontFamilyNotoSans = "NotoSans";
  static const String fontFamilyFjalla = "Fjalla";
  static const String fontFamilyFontAwesome = "FontAwesome";

  static TextTheme get textTheme => const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          color: AppColor.primaryColor1,
        ),
        displayMedium: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
          color: AppColor.primaryColor1,
        ),
        displaySmall: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
          color: AppColor.primaryColor1,
        ),
        headlineLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0,
          color: AppColor.primaryColor1,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0,
          color: AppColor.primaryColor1,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0,
          color: AppColor.primaryColor1,
        ),
        titleLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.0,
          color: AppColor.primaryColor1,
        ),
        titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColor.primaryColor1,
        ),
        titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: AppColor.primaryColor1,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
          color: AppColor.primaryColor1,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.25,
          color: AppColor.primaryColor1,
        ),
        bodySmall: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.4,
          color: AppColor.primaryColor1,
        ),
        labelLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: AppColor.primaryColor1,
        ),
        labelMedium: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: AppColor.primaryColor1,
        ),
        labelSmall: TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: AppColor.primaryColor1,
        ),
      );
}
