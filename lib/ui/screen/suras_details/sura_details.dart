import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home_screens/tabs/quran/quran.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDM sura;

  String suraCount = "";

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDM;
    readFile();
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.img_left_cornergold),
                 Spacer(),
                Text(
                  sura.nameAr,
                  style: AppStyles.goldBold20,
                ),
                 Spacer(),
                Image.asset(AppAssets.img_right_cornergold),
                 Spacer(),
              ],
            ),
            Text(
              sura.nameEn,
              style: AppStyles.goldBold20,
              textAlign: TextAlign.center,
            ),
            Text(
              suraCount,
              style: AppStyles.goldBold20,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> readFile() async {
    var fileName = "assets/files/quran/${sura.index}.txt";

    suraCount = await rootBundle.loadString(fileName);
    suraCount = suraCount.trim();
    List<String> suralines = suraCount.split("\n");
    for (int i = 0; i < suralines.length; i++) {
      suralines[i] += "{${i + 1}}";
    }
    suraCount = suralines.join();
    setState(() {});
  }
}
