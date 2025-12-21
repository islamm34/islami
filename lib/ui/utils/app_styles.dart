import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';

abstract final class StyleApp {
  static final TextStyle WhiteBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );static final TextStyle WhiteBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );static final TextStyle WhiteBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );static final TextStyle goldBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.gold,
  );static final TextStyle lightBlack16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );static final TextStyle lightBlack24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );
}
