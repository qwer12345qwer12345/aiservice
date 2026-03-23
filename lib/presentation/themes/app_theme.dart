import 'package:flutter/material.dart';
import 'app_tokens.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppTokens.primary,
      brightness: Brightness.light,
      primary: AppTokens.primary,
      surface: AppTokens.surface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppTokens.bg,
      canvasColor: AppTokens.bg,
      dividerColor: AppTokens.border,
      splashFactory: InkRipple.splashFactory,

      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppTokens.textPrimary,
        centerTitle: false,
      ),

      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppTokens.textPrimary,
          letterSpacing: -0.4,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppTokens.textPrimary,
          letterSpacing: -0.2,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppTokens.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          height: 1.65,
          color: AppTokens.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.6,
          color: AppTokens.textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.45,
          color: AppTokens.textSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTokens.textPrimary,
        ),
      ),

      cardTheme: CardThemeData(
        color: AppTokens.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brLg,
          side: const BorderSide(color: AppTokens.border),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppTokens.surface,
        hintStyle: const TextStyle(
          color: AppTokens.textTertiary,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(color: AppTokens.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(color: AppTokens.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(
            color: AppTokens.primary,
            width: 1.4,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(color: AppTokens.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(
            color: AppTokens.danger,
            width: 1.4,
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          backgroundColor: AppTokens.primary,
          foregroundColor: AppTokens.textOnPrimary,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brMd,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppTokens.textPrimary,
          side: const BorderSide(color: AppTokens.border),
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brMd,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppTokens.primary,
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brSm,
          ),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppTokens.textPrimary,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brSm,
          ),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppTokens.surfaceMuted,
        selectedColor: AppTokens.primarySoft,
        side: const BorderSide(color: AppTokens.border),
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brSm,
        ),
        labelStyle: const TextStyle(
          fontSize: 13,
          color: AppTokens.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppTokens.textPrimary,
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brMd,
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppTokens.primary,
      ),

      dividerTheme: const DividerThemeData(
        color: AppTokens.border,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTokens.primary,
        brightness: Brightness.dark,
      ),
    );
  }
}