import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/Utilities/app_theme.dart';
import 'package:islami_app/ui/screens/home/details_screen/details_screen.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context); //lazm fl build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.iD: (context) => HomeScreen(),
        DetailsScreen.iD: (context) => DetailsScreen(),
      },
      initialRoute: HomeScreen.iD,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.currentLocal),
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
