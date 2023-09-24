import 'package:flutter/material.dart';

import 'package:islami_app/ui/Utilities/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTitleTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColor.accent,
  );
  static const TextStyle quranTabTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: AppColor.accent,
  );
  static const TextStyle settingsTabTitle = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.accent);
  static const TextStyle settingsOptionTitle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.normal, color: AppColor.accent);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    primaryColor: AppColor.primary,
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: AppColor.primary,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      elevation: 0,
      titleTextStyle: appBarTitleTextStyle,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.accent,
        selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 26)),
    textTheme: const TextTheme(
        bodySmall: settingsOptionTitle,
        bodyMedium: settingsTabTitle,
        displayMedium: quranTabTitleTextStyle),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    primaryColor: AppColor.primaryDak,
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: AppColor.primaryDak,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      elevation: 0,
      titleTextStyle: appBarTitleTextStyle.copyWith(color: AppColor.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.accentDark,
        selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 26)),
    textTheme: TextTheme(
        bodySmall: settingsOptionTitle.copyWith(color: AppColor.white),
        bodyMedium: settingsTabTitle.copyWith(color: AppColor.white),
        displayMedium: quranTabTitleTextStyle.copyWith(color: AppColor.white)),
  );
}
