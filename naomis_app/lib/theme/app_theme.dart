import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens — kept in sync with the website's css/tokens.css so the
/// app and site read as the same brand.
class AppColors {
  AppColors._();

  static const background = Color(0xFF0D0B09);
  static const cream = Color(0xFFEFE6D8);
  static const espresso = Color(0xFF3D2B1F);
  static const tan = Color(0xFF8A6F52);
  static const accent = Color(0xFFD97A3F);
  static const accentHover = Color(0xFFC76A30);
}

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    final displayFont = GoogleFonts.cormorantGaramond();
    final bodyFont = GoogleFonts.workSans();

    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.background,
        primary: AppColors.accent,
        secondary: AppColors.tan,
        onSurface: AppColors.cream,
        onPrimary: AppColors.background,
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme
          .apply(
            bodyColor: AppColors.cream,
            displayColor: AppColors.cream,
            fontFamily: bodyFont.fontFamily,
          )
          .copyWith(
            displayLarge: displayFont.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: AppColors.cream,
            ),
            headlineMedium: displayFont.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: AppColors.cream,
            ),
            titleLarge: displayFont.copyWith(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: AppColors.accent,
            ),
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.cream,
        elevation: 0,
        titleTextStyle: displayFont.copyWith(
          fontSize: 20,
          letterSpacing: 1.2,
          color: AppColors.cream,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.tan,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.background,
          textStyle: bodyFont.copyWith(fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.cream,
          side: const BorderSide(color: AppColors.tan),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.tan.withValues(alpha: 0.25),
        thickness: 1,
      ),
    );
  }
}
