import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../screen/suras_details/hadeth_details.dart';
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
  List<HadethDm> hadethList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadetList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.Background_hadeth),
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
                itemCount: hadethList.length,
                itemBuilder: (context, index, _) {
                  return buildHadethWidget(hadethList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadHadetList() async {
    String filecontent = await rootBundle.loadString(
      "assets/files/ahadeth.txt",
    );

    List<String> tempAhadeth = filecontent.trim().split("#");
    for (int i = 0; i < tempAhadeth.length; i++) {
      String hadethContent = tempAhadeth[i].trim();

      // 1. Split the lines
      List<String> lines = hadethContent.split('\n');

      // 2. Safety check: Ensure the item isn't empty
      if (lines.isNotEmpty) {
        String title = lines[0];

        // 3. Skip the first line (title) and join the rest with a space or newline
        // use .join('\n') if you want to keep the paragraphs formatted
        String content = lines.skip(1).join(" ").trim();

        hadethList.add(HadethDm(
          title: title,
          content: content,
          index: i + 1,
        ));

      }
    }
    setState(() {});
  }

  Widget buildHadethWidget(HadethDm hadeth) {
    return InkWell(
      onTap: (){

        Navigator.pushNamed(context, hadeth_details.routeName, arguments: hadeth);
      },

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.img_left_cornergold,
                  color: AppColors.lightBlack,
                ),
      
                Image.asset(
                  AppAssets.img_right_cornergold,
                  color: AppColors.lightBlack,
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppAssets.HadithCardBackGround
              ),
            ), Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppAssets.mosque
              ),
            ),
            Column(
              children: [
                SizedBox(height: 42),
                Text(
                  hadeth.title.trim(),
                  style: AppStyles.lightBlackBold20,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                SizedBox(height: 42),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      hadeth.content,
                      style: AppStyles.lightBlackBold16,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
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

class HadethDm {
  String title;
  String content;
  int index;

  HadethDm({required this.title, required this.content,required this.index});
}
