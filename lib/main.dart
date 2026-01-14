import 'package:flutter/material.dart';
import 'package:islami/ui/home_screens/home.dart';
import 'package:islami/ui/home_screens/tabs/ahdeath/hadeth_details.dart';
import 'package:islami/ui/home_screens/tabs/sebha/sebha.dart';
import 'package:islami/ui/screen/intro_screens/splash_2.dart';
import 'package:islami/ui/screen/intro_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {'/home': (context) => const HomeScreen(),
          Splash.routeName: (_) =>  Splash(),
          Splash2.routeName: (_) =>  Splash2(),
          hadeth_details.routeName: (_) =>  hadeth_details(),
          Sebha.routeName: (_) =>  Sebha(),
        },
      initialRoute: Splash.routeName,
    );
  }
}
