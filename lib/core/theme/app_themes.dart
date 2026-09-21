import 'package:flutter/material.dart';
import 'package:masar/core/constants/app_fonts.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_styles.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.primaryFontFamily,
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    brightness: Brightness.light,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
    scaffoldBackgroundColor: AppColors.surfacePrimaryColor,
    appBarTheme: appBarTheme,
  );
  //------------
  static final ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
  //------------
  static final InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
    filled: false,
    fillColor: AppColors.surfaceSecondaryColor,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,

    
  );

  static final appBarTheme = AppBarTheme(
    titleTextStyle: AppStyles.secondaryBold24,
    elevation: 0,
    backgroundColor: AppColors.surfacePrimaryColor,
  );
}
