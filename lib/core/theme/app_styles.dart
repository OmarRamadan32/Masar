import 'package:flutter/material.dart';
import 'package:masar/core/constants/app_constants.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/utils/size_config.dart';

abstract class AppStyles {
  //-- Secondary Font --
  static TextStyle secondaryBold26 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(25),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle secondaryBold24 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(23),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle secondaryBold20 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(19),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle secondaryMedium18 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(17),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: const FontWeight(500),
  );

  static TextStyle secondaryMedium14 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(13),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.primaryColor,
    fontWeight: const FontWeight(500),
  );

  static TextStyle secondaryMedium13 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(12),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.primaryColor,
    fontWeight: const FontWeight(500),
  );

  static TextStyle secondaryMedium12 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(11),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.inactiveBottomNavItemColor,
    fontWeight: const FontWeight(500),
  );

  static TextStyle secondaryRegular11 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(10),
    fontFamily: AppFonts.secondaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: const FontWeight(400),
  );

  // -- Primary Font --
  static TextStyle primaryBold16 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(15),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle primaryBold14 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(13),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle primaryRegular12 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(11),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: const FontWeight(400),
  );

  static TextStyle primaryRegular13 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(12),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: const FontWeight(400),
  );

  static TextStyle primaryBold13 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(12),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle primaryRegular11 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(10),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.surfacePrimaryColor,
    fontWeight: const FontWeight(400),
  );

  static TextStyle primaryRegular14 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(13),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondaryColor,
    fontWeight: const FontWeight(400),
  );

  static TextStyle primaryBold20 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(19),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle primaryRegular16 = TextStyle(
    fontSize: ResponsizeSizer.getResponsiveFontSize(15),
    fontFamily: AppFonts.primaryFontFamily,
    color: AppColors.textSecondary75Color,
    fontWeight: const FontWeight(400),
  );
}
