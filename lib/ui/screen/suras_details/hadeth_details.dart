import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home_screens/tabs/ahdeath/hadeth_screen.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';

class hadeth_details extends StatefulWidget {
  static const routeName = "hadeth_details";

  const hadeth_details({super.key});

  @override
  State<hadeth_details> createState() => _hadeth_detailsState();
}

class _hadeth_detailsState extends State<hadeth_details> {
  late HadethDm hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    hadeth = ModalRoute.of(context)!.settings.arguments as HadethDm;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        title: Text("Hadeth_${hadeth.index}", style: AppStyles.goldBold24),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.gold),
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
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      right: 18,
                      top: 18,
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppAssets.img_left_cornergold),
                            Image.asset(AppAssets.img_right_cornergold),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(
                                hadeth.title,
                                style: AppStyles.goldBold24,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                hadeth.content,
                                style: AppStyles.goldBold20,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              Image.asset(AppAssets.mosque),
                            ],
                          ),
                        ),
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
}
