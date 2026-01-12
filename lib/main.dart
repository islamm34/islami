import 'package:flutter/material.dart';
import 'package:islami/ui/screen/into_screen_2.dart';
import 'package:islami/ui/screen/into_screen_3.dart';
import 'package:islami/ui/screen/intro_screen_4.dart';
import 'package:islami/ui/screen/splash_2.dart';
import 'package:islami/ui/screen/splash_screen.dart';
import 'package:islami/ui/screen/into_screen.dart';
import 'package:islami/ui/screen/suras_details/sura_details.dart';

import 'ui/screen/into_screen_5.dart';
import 'ui/screen/suras_details/hadeth_details.dart';

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
          IntoScreen2.routeName: (_) =>  IntoScreen2(),
          IntoScreen3.routeName: (_) =>  IntoScreen3(),
          IntroScreen4.routeName: (_) =>  IntroScreen4(),
          IntoScreen5.routeName: (_) =>  IntoScreen5(),
          SuraDetails.routeName: (_) =>  SuraDetails(),
          hadeth_details.routeName: (_) =>  hadeth_details(),
        },
      initialRoute: Splash.routeName,
    );
  }
}
