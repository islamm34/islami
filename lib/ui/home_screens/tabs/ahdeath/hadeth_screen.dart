import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class Hadeth extends StatefulWidget {
  const Hadeth({super.key});

  static const routeName = '/hadeth';

  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<HadethDm> hadeth = [];

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadetList();
  }

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.imgHeader),
            Expanded(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: double.infinity,
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
                            Image.asset(
                              AppAssets.img_left_cornergold,
                              color: AppColors.lightBlack,
                            ),
                            Spacer(),
                            Text(
                              "الحديث الاول ",
                              style: AppStyles.lightBlackBold24,
                            ),
                            Spacer(),
                            Image.asset(
                              AppAssets.img_right_cornergold,
                              color: AppColors.lightBlack,
                            ),
                          ],
                        ),
                        Text("", style: AppStyles.lightBlackBold14),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadHadetList() async {
    String filecontent = await rootBundle.loadString(
      "assets/files/ahadeth.txt",
    );

   List<String>tempAhadeth = filecontent.split("#\r\n");
  }
}

class HadethDm {
  String title;
  String content;

  HadethDm({required this.title, required this.content});
}
