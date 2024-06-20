import 'package:flutter/material.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';
import 'package:medical_client_side/core/theme/app_pallete.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppPallete.primaryColor,
    hintColor: AppPallete.secondaryTextColor,
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    dialogBackgroundColor: AppPallete.secondaryBackgroundColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: Sizes.p24,
        color: AppPallete.primaryTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: Sizes.p20,
        color: AppPallete.primaryTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: Sizes.p16,
        color: AppPallete.primaryTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: Sizes.p18,
        color: AppPallete.secondaryTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: Sizes.p16,
        color: AppPallete.secondaryTextColor,
      ),
      bodySmall: TextStyle(
        fontSize: Sizes.p14,
        color: AppPallete.secondaryTextColor,
      ),
    ),

    // Define the default button theme
    buttonTheme: ButtonThemeData(
      buttonColor: AppPallete.buttonColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
    ),

    // TextFormField
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppPallete.backgroundColor,
      hintStyle: TextStyle(
        color: AppPallete.tertiaryTextColor,
      ),
      labelStyle: TextStyle(
        color: AppPallete.primaryTextColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPallete.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPallete.primaryColor,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppPallete.backgroundColor),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
              vertical: Sizes.p16, horizontal: Sizes.p32),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: Sizes.p16,
            color: AppPallete.primaryTextColor,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),
        ),
      ),
    ),
  );
}
