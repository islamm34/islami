import '../../utils/app_assets.dart';

class OnbordingModel {
  String image;
  String title;
  String? description; // Fixed spelling

  OnbordingModel({required this.image, required this.title, this.description});

  static List<OnbordingModel> datalist = [
    OnbordingModel(
      image: AppAssets.intro1,
      title: "Welcome To Islmi App",
      description: "",
    ),
    OnbordingModel(
      image: AppAssets.frame3,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnbordingModel(
      image: AppAssets.frame,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnbordingModel(
      image: AppAssets.quran,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnbordingModel(
      image: AppAssets.splash5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
