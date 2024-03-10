import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/constants/app_metrices.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
    fontFamily: 'Tajawal',
    buttonTheme: buttonTheme(),
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    textSelectionTheme: textFieldSelectionTheme(),
    iconTheme: iconTheme(),
    iconButtonTheme: iconButtonTheme(),
    filledButtonTheme: filledButtonTheme(),
    dialogTheme: dialogTheme(),
    listTileTheme: listTileTheme(),
    dropdownMenuTheme: dropdownMenuTheme(),
  );

  static IconThemeData iconTheme() =>
      const IconThemeData(color: AppColors.textButtonColor, size: 25);

  static FilledButtonThemeData filledButtonTheme() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.secondColor),
        textStyle: const MaterialStatePropertyAll<TextStyle>(
          TextStyle(
            color: AppColors.textButtonColor,
          ),
        ),
      ),
    );
  }

  static IconButtonThemeData iconButtonTheme() {
    return const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(AppColors.white),
        backgroundColor: MaterialStatePropertyAll(AppColors.secondColor),
      ),
    );
  }

  static TextSelectionThemeData textFieldSelectionTheme() {
    return const TextSelectionThemeData(
      cursorColor: AppColors.textButtonColor,
      selectionColor: AppColors.textButtonColor,
      selectionHandleColor: AppColors.textButtonColor,
    );
  }

  static AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      iconTheme: iconTheme(),
    );
  }

  static ButtonThemeData buttonTheme() {
    return const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.secondColor,
    );
  }

  static ListTileThemeData listTileTheme() {
    return const ListTileThemeData(
      iconColor: AppColors.textButtonColor,
      textColor: AppColors.white,
      tileColor: AppColors.primaryColor,
      contentPadding: EdgeInsets.all(AppMetrices.widthSpace),
      style: ListTileStyle.drawer,
    );
  }

  static DialogTheme dialogTheme() {
    return const DialogTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: AppColors.white,
      ),
      contentTextStyle: TextStyle(
        color: AppColors.white,
      ),
    );
  }

  static DropdownMenuThemeData dropdownMenuTheme() {
    return const DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
        surfaceTintColor: MaterialStatePropertyAll(AppColors.primaryColor),
        maximumSize: MaterialStatePropertyAll(Size.fromHeight(200)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppMetrices.borderRadius1)),
          ),
        ),
      ),
      textStyle: TextStyle(
        color: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.primaryColor,
        filled: true,
        border: InputBorder.none,
        labelStyle: TextStyle(color: AppColors.textButtonColor),
        contentPadding: EdgeInsets.all(AppMetrices.widthSpace),
        isDense: true,
        iconColor: AppColors.textButtonColor,
        suffixIconColor: AppColors.textButtonColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textButtonColor,
          ),
        ),
        constraints: BoxConstraints(
          maxHeight: 35,
        ),
        hintStyle: TextStyle(color: AppColors.textButtonColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textButtonColor,
          ),
        ),
      ),
    );
  }

  static TextTheme textTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        height: 1.2,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.2,
      ),
    );
  }

  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    fontFamily: 'Tajawal',
    buttonTheme: buttonTheme(),
    iconTheme: iconTheme(),
    iconButtonTheme: iconButtonTheme(),
    dropdownMenuTheme: dropdownMenuTheme(),
  );
}
