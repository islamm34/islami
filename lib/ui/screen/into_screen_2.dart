import 'package:flutter/material.dart';
import 'package:islami/ui/screen/into_screen.dart';
import 'package:islami/ui/screen/into_screen_3.dart';
import 'package:islami/ui/screen/splash_2.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class IntoScreen2 extends StatelessWidget {
  const IntoScreen2({super.key});

  static const routeName = '/into2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppAssets.imgHeader),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Image.asset(AppAssets.frame2),
          ),
          Positioned(
            top: 700,
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                "Welcome To Islami App",
                style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 770,
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                "We Are Very Excited To Have You In Our  \n                        Community",
                style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 300,
            right: 20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntoScreen3(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.gold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 300,
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntoScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.gold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],

      )
    );
  }
}
