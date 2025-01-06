import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_font;
import '../appColors/app_colors.dart';

class AppTheme {
  static ThemeData androidDay({required BuildContext context}) {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primaryColor,
      ),
      disabledColor: AppColors.blackTextColor,
      hintColor: AppColors.blackTextColor,
      focusColor: AppColors.blackTextColor,
      scaffoldBackgroundColor: AppColors.scaffoldBgColor,
      appBarTheme: const AppBarTheme(color: AppColors.appBar),
      cardTheme: const CardTheme(
        color: AppColors.whiteTextColor,
        surfaceTintColor: AppColors.whiteTextColor,
      ),
      popupMenuTheme: const PopupMenuThemeData(
        surfaceTintColor: AppColors.whiteTextColor,
      ),
      datePickerTheme: const DatePickerThemeData(
        surfaceTintColor: AppColors.whiteTextColor,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColors.whiteTextColor,
        surfaceTintColor: AppColors.whiteTextColor,
        padding: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0,
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: AppColors.whiteTextColor,
      ),
      buttonTheme: const ButtonThemeData().copyWith(
        buttonColor: AppColors.buttonColor,
        alignedDropdown: true,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(
          AppColors.activeSwitchColor,
        ),
        trackOutlineColor: WidgetStatePropertyAll(
          AppColors.activeSwitchColor,
        ),
      ),
      textTheme: _buildAppLightTextTheme(base.textTheme),
    );
  }
}

TextTheme _buildAppLightTextTheme(TextTheme base) {
  return base.copyWith(
    headlineLarge: google_font.GoogleFonts.lato(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.appTitleColor,
    ),
    displayLarge: google_font.GoogleFonts.lato(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      color: AppColors.appTitleColor,
    ),
    displayMedium: google_font.GoogleFonts.lato(
      fontSize: 22,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: AppColors.appTitleColor,
    ),
    displaySmall: google_font.GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.0,
      color: AppColors.appTitleColor,
    ),
    headlineMedium: google_font.GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: AppColors.appTitleColor,
    ),
    headlineSmall: google_font.GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.appTitleColor,
      letterSpacing: 1.0,
    ),
    titleLarge: google_font.GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: AppColors.textColor,
    ),
    titleMedium: google_font.GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: AppColors.textColor,
    ),
    titleSmall: google_font.GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: AppColors.primaryColor,
    ),
    bodyLarge: google_font.GoogleFonts.lato(
      fontSize: 15.8,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    bodyMedium: google_font.GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    labelLarge: google_font.GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.25,
      color: AppColors.buttonWhiteTextColor,
      // backgroundColor: AppColors.primaryColor,
    ),
    bodySmall: google_font.GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: AppColors.textColor,
    ),
    labelSmall: google_font.GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      color: AppColors.primaryColor,
    ),
  );
}
