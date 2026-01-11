import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class Hadeth extends StatelessWidget {
  const Hadeth({super.key});

  static const routeName = '/hadeth';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranTabBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.imgHeader),
          Expanded(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemCount: 10,
              itemBuilder: (context, index, _) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.img_left_cornergold,color: AppColors.lightBlack,),
                          Spacer(),
                          Text("الحديث الاول ", style: AppStyles.lightBlackBold24),
                          Spacer(),
                          Image.asset(AppAssets.img_right_cornergold,color: AppColors.lightBlack,),
                        ],
                      ),
                      Text("11111111111111111111111111111111111111111111111111111111311111111sasdasdasd111111",style: AppStyles.lightBlackBold14,)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
