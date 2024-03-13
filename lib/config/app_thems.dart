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
    chipTheme: chipTheme(),
  );

  static ChipThemeData chipTheme() {
    return ChipThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedColor: AppColors.primaryColor,
      labelStyle: textTheme().bodySmall,
      padding: EdgeInsets.zero,
      showCheckmark: true,
      checkmarkColor: AppColors.hightlightColor,
    );
  }

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
          padding: MaterialStatePropertyAll(
            EdgeInsets.zero,
          )),
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
    primaryColor: AppColors.lightPrimaryColor,
    secondaryHeaderColor: AppColors.lightSecondColor,
    scaffoldBackgroundColor: AppColors.lightPrimaryColor,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.lightPrimaryColor),
    fontFamily: 'Tajawal',
    buttonTheme: buttonTheme().copyWith(
      buttonColor: AppColors.lightSecondColor,
    ),
    appBarTheme: appBarTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
    ),
    textTheme: textTheme().copyWith(
      titleLarge: textTheme().titleLarge!.copyWith(
            color: AppColors.lightWhite,
          ),
      titleSmall: textTheme().titleSmall!.copyWith(
            color: AppColors.lightWhite,
          ),
      titleMedium: textTheme().titleMedium!.copyWith(
            color: AppColors.lightWhite,
          ),
      bodyMedium: textTheme().bodyMedium!.copyWith(
            color: AppColors.lightWhite,
          ),
      bodySmall: textTheme().bodySmall!.copyWith(
            color: AppColors.lightWhite,
          ),
    ),
    textSelectionTheme: textFieldSelectionTheme().copyWith(
      cursorColor: AppColors.lightTextButtonColor,
    ),
    iconTheme: iconTheme().copyWith(
      color: AppColors.lightTextButtonColor,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStatePropertyAll(25.0),
        iconColor: MaterialStatePropertyAll(AppColors.lightWhite),
        backgroundColor: MaterialStatePropertyAll(AppColors.lightSecondColor),
        padding: MaterialStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.lightSecondColor),
        textStyle: const MaterialStatePropertyAll<TextStyle>(
          TextStyle(
            color: AppColors.lightTextButtonColor,
          ),
        ),
      ),
    ),
    dialogTheme: dialogTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: textTheme().titleLarge!.copyWith(
            color: AppColors.lightWhite,
          ),
      contentTextStyle: textTheme().bodyMedium!.copyWith(
            color: AppColors.lightWhite,
          ),
    ),
    listTileTheme: listTileTheme().copyWith(
      iconColor: AppColors.lightTextButtonColor,
      textColor: AppColors.lightWhite,
      tileColor: AppColors.lightPrimaryColor,
      contentPadding: const EdgeInsets.all(AppMetrices.widthSpace),
      style: ListTileStyle.drawer,
    ),
    dropdownMenuTheme: dropdownMenuTheme().copyWith(
      menuStyle: const MenuStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.lightPrimaryColor),
        surfaceTintColor: MaterialStatePropertyAll(AppColors.lightPrimaryColor),
      ),
      textStyle: const TextStyle(
        color: AppColors.lightWhite,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.lightPrimaryColor,
        filled: true,
        border: InputBorder.none,
        labelStyle: TextStyle(color: AppColors.lightTextButtonColor),
        contentPadding: EdgeInsets.all(AppMetrices.widthSpace),
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
    chipTheme: chipTheme(),
  );
}
