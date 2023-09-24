import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/Utilities/app_assets.dart';
import 'package:islami_app/ui/Utilities/app_colors.dart';

import 'package:islami_app/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/radio_tab.dart/radio_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String iD = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhatethTab(),
    const SebhaTab(),
    const RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    getPrefs();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          provider.isDarkMode()
              ? AppAssets.backgroundDark
              : AppAssets.background,
        ),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
          ),
        ),
        body: tabs[currentTabIndex],
        backgroundColor: AppColor.transparent,
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          iconSize: 30,
          currentIndex: currentTabIndex,
          onTap: (value) {
            currentTabIndex = value;
            setState(() {});
          },
          items: [
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: 'Quran'),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
                label: 'Ahadeth'),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: 'Sebha'),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: 'Radio'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
      );

  getPrefs() async {
    SettingsProvider provider = Provider.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mode = prefs.get('Dark mode');
    if (mode == true) {
      provider.setCurrentMode(ThemeMode.dark);
    } else {
      provider.setCurrentMode(ThemeMode.light);
    }
    var language = prefs.get('language');
    if (language == true) {
      provider.setCurrentLocal('en');
    } else {
      provider.setCurrentLocal('ar');
    }
  }
}
