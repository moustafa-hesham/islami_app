import 'package:flutter/material.dart';
import 'package:islami_app/ui/Utilities/app_assets.dart';
import 'package:islami_app/ui/Utilities/app_colors.dart';
import 'package:islami_app/ui/Utilities/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String iD = 'home screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AppAssets.background,
        ),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Islami',
            style: AppTheme.appBarTitleTextStyle,
          ),
        ),
        backgroundColor: AppColor.transparent,
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: AppColor.primary),
        // To make the default color of it, as there is a bug in flutter
        child: BottomNavigationBar(
          backgroundColor: AppColor.primary,
          selectedItemColor: AppColor.accent,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: 'Quran'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
                label: 'Ahadeth'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: 'Sebha'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: 'Radio'),
          ],
        ),
      );
}
