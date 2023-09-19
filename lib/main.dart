import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/details_screen/details_screen.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.iD: (context) => HomeScreen(),
        DetailsScreen.iD: (context) => DetailsScreen(),
      },
      initialRoute: HomeScreen.iD,
    );
  }
}
