import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../suras_details/inbording_model.dart';

class Splash2 extends StatefulWidget {
  static const routeName = '/splash2';

  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  PageController pageController = PageController(initialPage: 0);
  var dataList = OnbordingModel.datalist;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.imgHeader),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: dataList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(dataList[index].image),
                        SizedBox(height: 40),
                        Text(
                          dataList[index].title,
                          style: AppStyles.goldBold24,
                        ),
                        SizedBox(height: 20),
                        Text(
                          dataList[index].description!,
                          style: AppStyles.goldBold20,
                        ),
                      ],
                    ),
                  );
                },
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentPage == 0
                    ? const SizedBox(width: 0,)
                    : TextButton(
                  onPressed: () {
                    pageController.animateToPage(
                      currentPage - 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInSine,
                    );
                  },
                  child: Text("Back", style: AppStyles.goldBold16),
                ),
                Expanded(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: dataList.length,
                      effect: WormEffect(
                        dotColor: AppColors.grey2,
                        activeDotColor: AppColors.gold,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                      onDotClicked: (index) {},
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    int lastPageIndex = dataList.length - 1;

                    if (currentPage < lastPageIndex) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  child: Text(
                    currentPage == dataList.length - 1 ? "Finish" : "Next",
                    style: AppStyles.goldBold16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
