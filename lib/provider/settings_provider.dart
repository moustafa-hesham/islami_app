import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocal = "en";
  ThemeMode currentMode = ThemeMode.light;

  void setCurrentLocal(String newLocale) {
    currentLocal = newLocale;
    notifyListeners();
  }

  void setCurrentMode(ThemeMode newTheme) {
    currentMode = newTheme;
    notifyListeners();
  }

  bool isDarkMode() => currentMode == ThemeMode.dark;
}
