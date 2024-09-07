import 'package:better_one/config/themes/app_text_styles.dart';
import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/constants/ui_dimentions.dart';
import 'package:flutter/material.dart';

part 'widgets_theme.dart';

class AppThemes {
  /// dark theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primaryColor, brightness: Brightness.dark),
    fontFamily: 'Cairo',
    buttonTheme: _WidgetsTheme.buttonTheme(),
    appBarTheme: _WidgetsTheme.appBarTheme(),
    textTheme: _WidgetsTheme.textTheme(),
    textSelectionTheme: _WidgetsTheme.textFieldSelectionTheme(),
    iconTheme: _WidgetsTheme.iconTheme(),
    iconButtonTheme: _WidgetsTheme.iconButtonTheme(),
    filledButtonTheme: _WidgetsTheme.filledButtonTheme(),
    dialogTheme: _WidgetsTheme.dialogTheme(),
    listTileTheme: _WidgetsTheme.listTileTheme(),
    dropdownMenuTheme: _WidgetsTheme.dropdownMenuTheme(),
    chipTheme: _WidgetsTheme.chipTheme(),
    checkboxTheme: _WidgetsTheme.checkboxTheme(),
    dividerTheme: _WidgetsTheme.dividerTheme(),
    cardTheme: _WidgetsTheme.cardTheme(),
    bottomSheetTheme: _WidgetsTheme.bottomSheetTheme(),
    shadowColor: AppColors.white,
  );

  /// light theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimaryColor,
    secondaryHeaderColor: AppColors.lightSecondColor,
    scaffoldBackgroundColor: AppColors.lightPrimaryColor,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.lightSecondColor),
    fontFamily: 'Cairo',
    buttonTheme: _WidgetsTheme.buttonTheme().copyWith(
      buttonColor: AppColors.lightSecondColor,
    ),
    appBarTheme: _WidgetsTheme.appBarTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: _WidgetsTheme.lightTextTheme().titleMedium,
    ),
    textTheme: _WidgetsTheme.lightTextTheme(),
    textSelectionTheme: _WidgetsTheme.textFieldSelectionTheme().copyWith(
      cursorColor: AppColors.lightTextButtonColor,
      selectionColor: AppColors.lightTextButtonColor,
      selectionHandleColor: AppColors.lightTextButtonColor,
    ),
    iconTheme: _WidgetsTheme.iconTheme().copyWith(
      color: AppColors.lightTextButtonColor,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(25.0),
        iconColor: WidgetStatePropertyAll(AppColors.lightWhite),
        backgroundColor: WidgetStatePropertyAll(AppColors.lightSecondColor),
        padding: WidgetStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.lightSecondColor),
        foregroundColor: WidgetStatePropertyAll(AppColors.lightWhite),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyle(
            color: AppColors.lightTextButtonColor,
          ),
        ),
      ),
    ),
    dialogTheme: _WidgetsTheme.dialogTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: _WidgetsTheme.textTheme().titleLarge!.copyWith(
            color: AppColors.lightWhite,
          ),
      contentTextStyle: _WidgetsTheme.textTheme().bodyMedium!.copyWith(
            color: AppColors.lightWhite,
          ),
    ),
    listTileTheme: _WidgetsTheme.listTileTheme().copyWith(
      iconColor: AppColors.lightTextButtonColor,
      textColor: AppColors.lightWhite,
      tileColor: AppColors.lightPrimaryColor,
      contentPadding: const EdgeInsets.all(AppMetrices.horizontalGap),
      style: ListTileStyle.drawer,
    ),
    dropdownMenuTheme: _WidgetsTheme.dropdownMenuTheme().copyWith(
      menuStyle: const MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.lightPrimaryColor),
        surfaceTintColor: WidgetStatePropertyAll(AppColors.lightPrimaryColor),
      ),
      textStyle: const TextStyle(
        color: AppColors.lightWhite,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.lightPrimaryColor,
        filled: true,
        border: InputBorder.none,
        labelStyle: TextStyle(color: AppColors.lightTextButtonColor),
        contentPadding: EdgeInsets.all(AppMetrices.horizontalGap),
        isDense: true,
        iconColor: AppColors.lightTextButtonColor,
        suffixIconColor: AppColors.lightTextButtonColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.lightTextButtonColor,
        )),
        constraints: BoxConstraints(
          maxHeight: 35,
        ),
        hintStyle: TextStyle(color: AppColors.lightTextButtonColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightTextButtonColor,
          ),
        ),
      ),
    ),
    chipTheme: _WidgetsTheme.lightChipTheme(),
    checkboxTheme: _WidgetsTheme.checkboxTheme().copyWith(
      fillColor: const WidgetStatePropertyAll(AppColors.lightPrimaryColor),
      checkColor: const WidgetStatePropertyAll(AppColors.lightTextButtonColor),
      side: const BorderSide(
        color: AppColors.lightTextButtonColor,
        width: 2,
      ),
    ),
    dividerTheme: _WidgetsTheme.dividerTheme().copyWith(
      color: AppColors.lightHightlightColor,
    ),
    cardTheme: _WidgetsTheme.cardTheme().copyWith(
      color: AppColors.lightPrimaryColor,
    ),
    bottomSheetTheme: _WidgetsTheme.bottomSheetTheme().copyWith(
      dragHandleColor: AppColors.lightSecondColor,
      backgroundColor: AppColors.lightPrimaryColor,
    ),
    shadowColor: AppColors.secondColor,
  );
}
