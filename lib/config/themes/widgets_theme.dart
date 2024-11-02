part of 'app_themes.dart';

class _WidgetsTheme {
  static BottomSheetThemeData bottomSheetTheme() {
    return BottomSheetThemeData(
      backgroundColor: AppColors.primaryColor,
      dragHandleColor: AppColors.secondColor,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppMetrices.borderRadius1),
      ),
    );
  }

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
    return const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(AppColors.primaryColor),
      checkColor: WidgetStatePropertyAll(AppColors.hightlightColor),
      side: BorderSide(
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
        backgroundColor: const WidgetStatePropertyAll(AppColors.secondColor),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          textTheme().bodyMedium!,
        ),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll<TextStyle>(
          textTheme().bodyMedium!,
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.secondColor),
      ),
    );
  }

  static IconButtonThemeData iconButtonTheme() {
    return const IconButtonThemeData(
      style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(AppColors.white),
          backgroundColor: WidgetStatePropertyAll(AppColors.secondColor),
          padding: WidgetStatePropertyAll(
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
      titleTextStyle: textTheme().titleMedium,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppMetrices.borderRadius3),
        ),
      ),
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
      contentPadding: EdgeInsets.all(AppMetrices.horizontalGap),
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
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
        surfaceTintColor: WidgetStatePropertyAll(AppColors.primaryColor),
        maximumSize: WidgetStatePropertyAll(Size.fromHeight(200)),
        shape: WidgetStatePropertyAll(
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
        contentPadding: EdgeInsets.all(AppMetrices.horizontalGap),
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
    return TextTheme(
      titleLarge: AppTextStyles.titleLarge,
      titleSmall: AppTextStyles.titleSmall,
      titleMedium: AppTextStyles.titleMedium,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
    );
  }

  static SwitchThemeData switchTheme() {
    return SwitchThemeData(
      trackOutlineColor: const WidgetStatePropertyAll(AppColors.secondColor),
      thumbColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.hightlightColor;
          }
          return AppColors.secondColor;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondColor;
          }
          return AppColors.primaryColor;
        },
      ),
    );
  }

  /// light methods theme
  static ChipThemeData lightChipTheme() {
    return chipTheme().copyWith(
      backgroundColor: AppColors.lightPrimaryColor,
      color: const WidgetStatePropertyAll(AppColors.lightSecondColor),
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

  static TextTheme lightTextTheme() {
    return TextTheme(
      titleLarge: AppTextStyles.titleLarge.copyWith(
        color: AppColors.lightWhite,
      ),
      titleSmall: AppTextStyles.titleSmall.copyWith(
        color: AppColors.lightWhite,
      ),
      titleMedium: AppTextStyles.titleMedium.copyWith(
        color: AppColors.lightWhite,
      ),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.lightWhite,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightWhite,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColors.lightWhite,
      ),
    );
  }
}
