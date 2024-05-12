import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/view_models/theme_viewmodel/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeViewModel, ThemeViewModelState>(
      builder: (context, state) {
        var currentTheme = state.currentThemeMode;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            currentTheme == ThemeMode.dark
                ? const Icon(FontAwesomeIcons.moon)
                : const Icon(Icons.light_mode),
            const SizedBox(width: AppMetrices.widthSpace),
            IconButton(
              onPressed: () {
                ThemeViewModel.get(context).toggleTheme();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.compare_arrows_rounded,
                  color: AppColors.hightlightColor),
            ),
            const SizedBox(width: AppMetrices.widthSpace),
            currentTheme == ThemeMode.dark
                ? const Icon(Icons.light_mode)
                : const Icon(
                    FontAwesomeIcons.moon,
                  )
          ],
        );
      },
    );
  }
}
