import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import 'into_screen.dart';

class Splash2 extends StatelessWidget {
  static const routeName = '/splash2';
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, IntoScreen.routeName);
    });

    return Scaffold(
      backgroundColor: AppColors.grey,
      body:Stack(
        children: [
          Center(
            child: Image.asset(
              AppAssets.group28,
            ),
          ),
        ],
      )
    );
  }
}