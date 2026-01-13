import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../screen/suras_details/most_recent_sura.dart';
import '../../../screen/suras_details/sura_details.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';

class Quran extends StatefulWidget {
  Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<SuraDM> filteredSuras = suras;
  List<SuraDM> mostRecentSuras = [];

  Future<void> loadSurasFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? surasIndex = prefs.getStringList("recentSuras");
    if (surasIndex == null || surasIndex.isEmpty) return;

    mostRecentSuras = surasIndex.map((suraIndex) {
      int index = int.parse(suraIndex);
      return suras[index - 1];
    }).toList();

    setState(() {});
  }

  // دالة محسنة للحفظ وتحديث الواجهة
  Future<void> saveAndUpdateRecentSuras(SuraDM sura) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? currentList = prefs.getStringList('recentSuras') ?? [];

    // إزالة إذا كانت موجودة مسبقًا لتجنب التكرار
    currentList.remove(sura.suraIdex);
    // إضافة في البداية
    currentList.insert(0, sura.suraIdex);

    // الاحتفاظ بآخر 5 فقط
    if (currentList.length > 5) {
      currentList = currentList.sublist(0, 5);
    }

    await prefs.setStringList('recentSuras', currentList);

    // تحديث القائمة المحلية
    mostRecentSuras = currentList.map((suraIndex) {
      int index = int.parse(suraIndex);
      return suras[index - 1];
    }).toList();

    // تحديث الواجهة
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    filteredSuras = suras;
    loadSurasFromSharedPreferences();
  }

  @override
  @override
  @override
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
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.imgHeader),
                const SizedBox(height: 24),
                buildSuraNameTextFiled(),
                const SizedBox(height: 16),
                if (mostRecentSuras.isNotEmpty) ...[
                  Text("Most Recent", style: AppStyles.whiteBold16),
                  const SizedBox(height: 8),
                  buildMostRecentSection(),
                  const SizedBox(height: 16),
                ],
                Text("Suras List", style: AppStyles.whiteBold16),
                const SizedBox(height: 8),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (index < filteredSuras.length) {
                  return Column(
                    children: [
                      buildSuraNameItem(context, filteredSuras[index]),
                      if (index < filteredSuras.length - 1)
                        const Divider(color: AppColors.gold),
                    ],
                  );
                }
                return null;
              },
              childCount: filteredSuras.length,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildMostRecentSection() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mostRecentSuras.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await saveAndUpdateRecentSuras(mostRecentSuras[index]);
              Navigator.pushNamed(
                context,
                SuraDetails.routeName,
                arguments: mostRecentSuras[index],
              );
            },
            child: MostRecentSura(sura: mostRecentSuras[index]),
          );
        },
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
          filteredSuras = suras.where((sura) {
            return sura.nameEn.toLowerCase().contains(query.toLowerCase()) ||
                sura.nameAr.toLowerCase().contains(query.toLowerCase());
          }).toList();
        }
        setState(() {});
      },
    );
  }

  Widget buildSuraNameList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.separated(
        itemCount: filteredSuras.length,
        separatorBuilder: (context, index) =>
            const Divider(color: AppColors.gold),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return buildSuraNameItem(context, filteredSuras[index]);
        },
      ),
    );
  }

  Widget buildSuraNameItem(BuildContext context, SuraDM sura) => InkWell(
    onTap: () async {
      await saveAndUpdateRecentSuras(sura);

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
          child: Text(sura.suraIdex, style: AppStyles.whiteBold14),
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
}

class SuraDM {
  String nameEn;
  String nameAr;
  String verses;
  String suraIdex;

  SuraDM({
    required this.nameEn,
    required this.nameAr,
    required this.verses,
    required this.suraIdex,
  });
}
