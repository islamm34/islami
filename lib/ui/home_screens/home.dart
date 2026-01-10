import 'package:flutter/material.dart';
import 'package:islami/ui/home_screens/tabs/quran/quran.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
 List<Widget> tabs =[
   Quran(),
   Container(color: Colors.green),
   Container(color: Colors.blue),
   Container(color: Colors.red),
   Container(color: Colors.black),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:tabs[selectedTabIndex] ,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Theme buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.gold),
      child: BottomNavigationBar(
        backgroundColor: AppColors.gold,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.lightBlack,
        showSelectedLabels: true,
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        currentIndex: selectedTabIndex,
        items: [
          buildBottomNavigationBarItem(
              AppAssets.icQuran, 'Quran', 0),
          buildBottomNavigationBarItem(
              AppAssets.icHadeth, 'Hadeth', 1),
          buildBottomNavigationBarItem(
              AppAssets.icSebha, 'Sebha', 2),
          buildBottomNavigationBarItem(
              AppAssets.icRadio, 'Radio', 3),
          buildBottomNavigationBarItem(
              AppAssets.icTime, 'Time', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String imgPath, String title, int tabIndex) {
    bool isSelected = selectedTabIndex == tabIndex;

    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightBlack.withAlpha(153)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 4,
        ),
        child: Image.asset(
          imgPath,
          width: 24,
          height: 24,
          color: isSelected ? AppColors.white : AppColors.lightBlack,
        ),
      ),
      label: title,
    );
  }
}