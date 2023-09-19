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
}
