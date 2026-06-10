import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    
    // Color Scheme
    colorScheme: ColorScheme.dark(
      primary: NeonColors.neonCyan,
      secondary: NeonColors.neonPink,
      tertiary: NeonColors.neonYellow,
      surface: NeonColors.surfaceDark,
      background: NeonColors.backgroundDark,
      error: NeonColors.neonPink,
    ),
    
    // Scaffold Background
    scaffoldBackgroundColor: NeonColors.backgroundDark,
    
    // Text Theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: NeonColors.textPrimary,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: NeonColors.textPrimary,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: NeonColors.textPrimary,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: NeonColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: NeonColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: NeonColors.textMuted,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: NeonColors.textPrimary,
      ),
    ),
    
    // AppBar Theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: NeonColors.backgroundDark,
      foregroundColor: NeonColors.textPrimary,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: NeonColors.textPrimary,
      ),
    ),
    
    // Card Theme
    cardTheme: CardTheme(
      elevation: 4,
      shadowColor: NeonColors.neonCyan.withOpacity(0.16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(
          color: NeonColors.borderLight,
          width: 1,
        ),
      ),
      color: NeonColors.surfaceDark,
    ),
    
    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: WidgetStateColor.resolveWith((state) =>
          NeonColors.neonCyan
        ),
        foregroundColor: WidgetStateColor.resolveWith((state) =>
          NeonColors.backgroundDark
        ),
        shape: WidgetStateColor.resolveWith((state) =>
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          )
        ),
        padding: WidgetStatePadding.all(16),
      ),
    ),
    
    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: WidgetStateColor.resolveWith((state) =>
          NeonColors.textPrimary
        ),
        shape: WidgetStateColor.resolveWith((state) =>
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: NeonColors.borderLight),
          )
        ),
      ),
    ),
    
    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: NeonColors.surfaceDark2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: NeonColors.borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: NeonColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: NeonColors.neonCyan, width: 2),
      ),
      labelStyle: GoogleFonts.inter(color: NeonColors.textMuted),
    ),
  );
}
