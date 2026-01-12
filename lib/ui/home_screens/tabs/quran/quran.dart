import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/utils/constants.dart';
import '../../../screen/suras_details/sura_details.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';

class Quran extends StatefulWidget {
  Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<SuraDM> filteredSuras = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all suras at the start
    filteredSuras = suras;
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranTabBg),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.imgHeader),
          const SizedBox(height: 24),
          buildSuraNameTextFiled(),
          const SizedBox(height: 16),
          Text("Suras List", style: AppStyles.whiteBold16),
          Expanded(flex: 7, child: buildSuraNameList()),
        ],
      ),
    );
  }

  Widget buildSuraNameTextFiled() {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.gold, width: 1),
    );
    return TextField(
      decoration: InputDecoration(
        labelText: "SuraName",
        labelStyle: AppStyles.whiteBold16,
        errorBorder: border,
        focusedErrorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        border: border,
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
        ),
      ),
      cursorColor: AppColors.gold,
      style: AppStyles.whiteBold16,
      onChanged: (query) {
        if (query.trim().isEmpty) {
          filteredSuras = suras;
        } else {
          filteredSuras = suras.where((suras) {
            return suras.nameEn.toLowerCase().contains(query.toLowerCase())||
                suras.nameAr.toLowerCase().contains(query.toLowerCase());
          }).toList();
        }
        setState(() {});
      },
    );
  }

  Widget buildSuraNameList() {
    return ListView.separated(
      itemCount: filteredSuras.length,
      separatorBuilder: (context, index) =>
          const Divider(color: AppColors.gold),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return buildSuraNameItem(context, filteredSuras[index]);
      },
    );
  }
}

Widget buildSuraNameItem(BuildContext context, SuraDM sura) => InkWell(
  onTap: () {
    Navigator.pushNamed(context, SuraDetails.routeName, arguments: sura);
  },
  child: Row(
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.surahNumberFrame),
            fit: BoxFit.fill,
          ),
        ),
        child: Text("${sura.index}", style: AppStyles.whiteBold14),
      ),
      const SizedBox(width: 24),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sura.nameEn, style: AppStyles.whiteBold20),
            Text("${sura.verses} Verses", style: AppStyles.whiteBold14),
          ],
        ),
      ),
      Text(sura.nameAr, style: AppStyles.whiteBold20),
    ],
  ),
);

class SuraDM {
  String nameEn;
  String nameAr;
  String verses;
  int index;

  SuraDM({
    required this.nameEn,
    required this.nameAr,
    required this.verses,
    required this.index,
  });
}
