import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import 'into_screen.dart';
class Splash2 extends StatefulWidget {
  static const routeName = '/splash2';
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, IntoScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Center(
        child: Image.asset(
          AppAssets.group28,
        ),
      ),
    );
  }
}