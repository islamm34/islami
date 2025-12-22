import 'package:flutter/material.dart';
import 'package:islami/ui/screen/splash_2.dart';
import 'package:islami/ui/screen/splash_screen.dart';
import 'package:islami/ui/screen/into_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          Splash.routeName: (_) =>  Splash(),
          Splash2.routeName: (_) =>  Splash2(),
          IntoScreen.routeName: (_) =>  IntoScreen(),
        },
      initialRoute: Splash.routeName,
    );
  }
}
