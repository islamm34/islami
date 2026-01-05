import 'package:flutter/material.dart';
import 'package:islami/ui/screen/into_screen_2.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class IntoScreen extends StatefulWidget {
  static const routeName = '/into';

  const IntoScreen({super.key});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
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
            child: Image.asset(
              AppAssets.imgHeader,
            ),
          ),
          Positioned(
            top:250 ,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                AppAssets.intro1,

              ),
            ),
          ),
          Positioned(
            top: 750,
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
                      builder: (context) => const IntoScreen2(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.gold,
                    ),
                  ),
                ),
              ),
            ),
          ), ],
      ),
    );
  }
}