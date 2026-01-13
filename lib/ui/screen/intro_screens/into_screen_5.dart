import 'package:flutter/material.dart';
import 'package:islami/ui/home_screens/home.dart';

import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';

import 'intro_screen_4.dart';

class IntoScreen5 extends StatelessWidget {
  const IntoScreen5({super.key});
  static const routeName = '/into5';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              top: 240,
              right: 0,
              left: 0,
              child:
            Image.asset(AppAssets.splash5 ),),
            Positioned(
              top: 700,
              left: 20,
              right: 20,
              child: Center(
                child: Text(
                  "   Holy Quran Radio",
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
                  "    You can listen to the Holy Quran Radio \n through the application for free and easily ",
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 320,
              right: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Finish',
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
                        builder: (context) => const IntroScreen4(),
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
