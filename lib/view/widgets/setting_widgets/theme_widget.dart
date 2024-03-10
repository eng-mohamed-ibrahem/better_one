import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/constants.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingViewModel, SettingViewModelState>(
      builder: (context, state) {
        var currentTheme = state.currentTheme;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            currentTheme == ThemeData.dark()
                ? const Icon(FontAwesomeIcons.moon)
                : const Icon(Icons.light_mode),
            const SizedBox(width: AppMetrices.widthSpace),
            IconButton(
              onPressed: () {
                SettingViewModel.get(context).toggleTheme();
              },
              icon: const Icon(Icons.compare_arrows_rounded,
                  color: AppColors.hightlightColor),
            ),
            const SizedBox(width: AppMetrices.widthSpace),
            currentTheme == ThemeData.dark()
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
