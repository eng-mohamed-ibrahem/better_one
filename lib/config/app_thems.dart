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
    checkboxTheme: checkboxTheme(),
    dividerTheme: dividerTheme(),
    cardTheme: cardTheme(),
    // datePickerTheme: DatePickerThemeData(
    //   backgroundColor: AppColors.secondColor,
    //   dayStyle: textTheme().bodySmall,
    //   dayForegroundColor: const MaterialStatePropertyAll(AppColors.white),
    // ),
  );

  static CardTheme cardTheme() {
    return CardTheme(
      color: AppColors.primaryColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppMetrices.borderRadius1),
      ),
    );
  }

  static DividerThemeData dividerTheme() {
    return const DividerThemeData(
      space: 10,
      thickness: 1,
      color: AppColors.hightlightColor,
    );
  }

  static CheckboxThemeData checkboxTheme() {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryColor),
      checkColor: MaterialStateProperty.all(AppColors.hightlightColor),
      side: const BorderSide(
        color: AppColors.secondColor,
        width: 2,
      ),
    );
  }

  static ChipThemeData chipTheme() {
    return ChipThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedColor: AppColors.primaryColor,
      labelStyle: textTheme().bodySmall,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppMetrices.borderRadius1),
        ),
        side: BorderSide(
          color: AppColors.secondColor,
          width: 2,
        ),
      ),
      showCheckmark: true,
      disabledColor: AppColors.primaryColor,
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
        .copyWith(secondary: AppColors.lightSecondColor),
    fontFamily: 'Tajawal',
    buttonTheme: lightButtonTheme(),
    appBarTheme: lightAppBarTheme(),
    textTheme: lightTextTheme(),
    textSelectionTheme: lightTextSelectionTheme(),
    iconTheme: lightIconTheme(),
    iconButtonTheme: lightIconButtonTheme(),
    filledButtonTheme: lightFilledButtonTheme(),
    dialogTheme: lightDialogTheme(),
    listTileTheme: lightListtileTheme(),
    dropdownMenuTheme: lightDropdownMenuTheme(),
    chipTheme: lightChipTheme(),
    checkboxTheme: lightCheckboxTheme(),
    dividerTheme: lightDividerTheme(),
    cardTheme: lightCardTheme(),
  );

  static CardTheme lightCardTheme() {
    return cardTheme().copyWith(
      color: AppColors.lightPrimaryColor,
    );
  }

  static DividerThemeData lightDividerTheme() {
    return dividerTheme().copyWith(
      color: AppColors.lightHightlightColor,
    );
  }

  static CheckboxThemeData lightCheckboxTheme() {
    return checkboxTheme().copyWith(
      fillColor: MaterialStateProperty.all(AppColors.lightPrimaryColor),
      checkColor: MaterialStateProperty.all(AppColors.lightTextButtonColor),
      side: const BorderSide(
        color: AppColors.lightTextButtonColor,
        width: 2,
      ),
    );
  }

  static ChipThemeData lightChipTheme() {
    return chipTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
      color: const MaterialStatePropertyAll(AppColors.lightSecondColor),
      selectedColor: AppColors.lightPrimaryColor,
      secondarySelectedColor: AppColors.lightPrimaryColor,
      labelStyle: textTheme().bodySmall!.copyWith(color: AppColors.lightWhite),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppMetrices.borderRadius1),
        ),
        side: BorderSide(
          color: AppColors.lightSecondColor,
          width: 1,
        ),
      ),
      showCheckmark: true,
      disabledColor: AppColors.lightPrimaryColor,
      checkmarkColor: AppColors.lightHightlightColor,
    );
  }

  static DropdownMenuThemeData lightDropdownMenuTheme() {
    return dropdownMenuTheme().copyWith(
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
    );
  }

  static ListTileThemeData lightListtileTheme() {
    return listTileTheme().copyWith(
      iconColor: AppColors.lightTextButtonColor,
      textColor: AppColors.lightWhite,
      tileColor: AppColors.lightPrimaryColor,
      contentPadding: const EdgeInsets.all(AppMetrices.widthSpace),
      style: ListTileStyle.drawer,
    );
  }

  static DialogTheme lightDialogTheme() {
    return dialogTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: textTheme().titleLarge!.copyWith(
            color: AppColors.lightWhite,
          ),
      contentTextStyle: textTheme().bodyMedium!.copyWith(
            color: AppColors.lightWhite,
          ),
    );
  }

  static FilledButtonThemeData lightFilledButtonTheme() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.lightSecondColor),
        foregroundColor: const MaterialStatePropertyAll(AppColors.lightWhite),
        textStyle: const MaterialStatePropertyAll<TextStyle>(
          TextStyle(
            color: AppColors.lightTextButtonColor,
          ),
        ),
      ),
    );
  }

  static IconButtonThemeData lightIconButtonTheme() {
    return const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStatePropertyAll(25.0),
        iconColor: MaterialStatePropertyAll(AppColors.lightWhite),
        backgroundColor: MaterialStatePropertyAll(AppColors.lightSecondColor),
        padding: MaterialStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
    );
  }

  static IconThemeData lightIconTheme() {
    return iconTheme().copyWith(
      color: AppColors.lightTextButtonColor,
    );
  }

  static TextSelectionThemeData lightTextSelectionTheme() {
    return textFieldSelectionTheme().copyWith(
      cursorColor: AppColors.lightTextButtonColor,
      selectionColor: AppColors.lightTextButtonColor,
      selectionHandleColor: AppColors.lightTextButtonColor,
    );
  }

  static TextTheme lightTextTheme() {
    return textTheme().copyWith(
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
    );
  }

  static AppBarTheme lightAppBarTheme() {
    return appBarTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
    );
  }

  static ButtonThemeData lightButtonTheme() {
    return buttonTheme().copyWith(
      buttonColor: AppColors.lightSecondColor,
    );
  }
}
