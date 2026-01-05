import 'package:flutter/material.dart';
import 'package:islami/ui/screen/into_screen_3.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';

class IntroScreen4 extends StatelessWidget {
  const IntroScreen4({super.key});
static const routeName = '/into4';
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
              top: 250,
              left: 0,
              right: 0,
              child: Image.asset(AppAssets.frame),
            ),
            Positioned(
              top: 700,
              left: 20,
              right: 20,
              child: Center(
                child: Text(
                  "Bearish",
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
                  "Praise the name of your Lord, the Most High",
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
              left: 300,
              right: 20,
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
                        builder: (context) => const IntoScreen3(),
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
    );;
  }
}
