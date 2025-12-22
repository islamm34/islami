import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

// افترض إن عندك شاشة تانية اسمها IntoScreen2 (أو أي اسم تاني)
import 'into_screen2.dart'; // غيّر المسار حسب اسم الملف التاني

class IntoScreen extends StatefulWidget {
  static const routeName = '/IntoScreen';

  const IntoScreen({super.key});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  int currentPage = 0; // الصفحة الحالية (بدء من 0)

  // عدد الصفحات الكلي (غيّره حسب عدد الـ intro screens عندك)
  final int totalPages = 3;

  void goToNextPage() {
    if (currentPage < totalPages - 1) {
      // لو لسه فيه صفحات تانية → غيّر الصفحة
      setState(() {
        currentPage++;
      });
    } else {
      // لو دي آخر صفحة → انتقل للشاشة الرئيسية أو الـ home
      Navigator.pushReplacementNamed(context, '/home'); // غيّر الروت حسب اللي عندك
      // أو لو عايز تنتقل لشاشة تانية موجودة:
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey, // أو لون أسود زي الصورة
      body: SafeArea(
        child: Stack(
          children: [
            // المحتوى الرئيسي (الصور + النص)
            Column(
              children: [
                // الصورة العلوية (imgHeader)
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Image.asset(AppAssets.imgHeader),
                ),

                const SizedBox(height: 40),

                // النص الترحيبي
                const Text(
                  'Welcome To Islmi App',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.amber, // لون ذهبي زي الصورة
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                // الصورة الرئيسية في الأسفل (intro1 أو غيرها حسب الصفحة)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    AppAssets.intro1, // غيّرها لاحقًا حسب currentPage لو عندك أكتر من صورة
                    height: 300,
                  ),
                ),

                const SizedBox(height: 60),
              ],
            ),

            // Page Indicator + زر Next في الأسفل
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page Indicator (النقط)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      totalPages,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == currentPage ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == currentPage
                              ? Colors.amber
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // زر Next
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: goToNextPage,
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}