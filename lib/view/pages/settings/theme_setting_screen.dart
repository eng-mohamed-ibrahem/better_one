import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/view_models/theme_viewmodel/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeSettingScreen extends StatelessWidget {
  const ThemeSettingScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonLl10n(),
        ),
      ),
      body: BlocBuilder<ThemeViewModel, ThemeViewModelState>(
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
      ),
    );
  }
}
