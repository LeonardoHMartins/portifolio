import 'package:flutter/material.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';
import 'package:portfolio/core/common/extensions/color_extension.dart';

/// > A class that contains all the colors used in the app
class AppTheme {
  static ThemeData get light => ThemeData(
        fontFamily: 'Jost',
        primarySwatch: AppColors.brown_400.toMaterialColor(),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.green_700,
          cursorColor: AppColors.green_700,
          selectionColor: AppColors.green_700.withOpacity(0.2),
        ),
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xFFF4F4F3),
        canvasColor: AppColors.brown_400,
        primaryColor: AppColors.brown_400,
        colorScheme: const ColorScheme.light().copyWith(
          secondary: AppColors.brown_400,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          labelStyle: const TextStyle(
            color: AppColors.green_700,
          ),
          hintStyle: TextStyle(
            color: AppColors.green_700.withOpacity(0.3),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),

          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.green_700,
              width: 2.0,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.green_700.withOpacity(0.3),
            ),
          ),
          //DISABLE  ------
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.green_700.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          //ERROR  ------
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.red_400,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.red_400.withOpacity(0.8),
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.red_400),
          ),
        ),
      );
}
