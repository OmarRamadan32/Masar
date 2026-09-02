import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';

import 'package:masar/core/constants/app_constants.dart';

abstract class AppStyles {
  //-- Secondary Font --
  static const TextStyle secondaryBold26 = TextStyle(
    fontSize: 26,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle secondaryBold24 = TextStyle(
    fontSize: 24,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle secondaryBold20 = TextStyle(
    fontSize: 20,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle secondaryMedium18 = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight(500),
  );

  static const TextStyle secondaryMedium14 = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.primaryColor,
    fontWeight: FontWeight(500),
  );

  static const TextStyle secondaryMedium13 = TextStyle(
    fontSize: 13,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.primaryColor,
    fontWeight: FontWeight(500),
  );

  static const TextStyle secondaryMedium12 = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.inactiveBottomNavItemColor,
    fontWeight: FontWeight(500),
  );

  static const TextStyle secondaryRegular11 = TextStyle(
    fontSize: 11,
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: FontWeight(400),
  );
  
  // -- Primary Font --

  static const TextStyle primaryBold16 = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle primaryBold14 = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle primaryRegular12 = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: FontWeight(400),
  );

  static const TextStyle primaryRegular13 = TextStyle(
    fontSize: 13,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: FontWeight(400),
  );

  static const TextStyle primaryBold13 = TextStyle(
    fontSize: 13,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle primaryRegular11 = TextStyle(
    fontSize: 11,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.surfacePrimaryColor,
    fontWeight: FontWeight(400),
  );

  static const TextStyle primaryRegular14 = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: FontWeight(400),
  );

  static const TextStyle primaryBold20 = TextStyle(
    fontSize: 20,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle primaryRegular16 = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondary75Color,
    fontWeight: FontWeight(400),
  );
}
