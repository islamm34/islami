import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home_screens/tabs/quran/quran.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDM sura;

  String suraCount = "";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      readFile();
    });
  }
  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDM;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.gold),
        title: Text(
          sura.nameEn,
          style: AppStyles.goldBold24,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18,top: 18),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppAssets.img_left_cornergold),
                            Spacer(),
                            Text(sura.nameAr, style: AppStyles.goldBold24),
                            Spacer(),
                            Image.asset(AppAssets.img_right_cornergold),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          suraCount,
                          style: AppStyles.goldBold20,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                        Spacer(),
                        Image.asset(AppAssets.mosque),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> readFile() async {
    var fileName = "assets/files/quran/${sura.suraIdex}.txt";

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
