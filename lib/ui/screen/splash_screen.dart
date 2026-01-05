import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/ui/screen/splash_2.dart';
import '../utils/app_assets.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Splash2.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              AppAssets.splashScreen,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
