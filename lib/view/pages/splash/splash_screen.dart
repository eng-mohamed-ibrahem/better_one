import 'package:better_one/config/generate_router.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeViewmodel.get(context).getTasks();
      HomeViewmodel.get(context).getTotalEstimatedTime();
      SettingViewModel.get(context).getLanguage();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(GenerateRouter.home, (route) => false);
    });
    return SvgPicture.asset(
      AppImages.splash,
    );
  }
}
