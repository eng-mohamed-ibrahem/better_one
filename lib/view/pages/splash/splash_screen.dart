import 'package:better_one/config/generate_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        // will be here checking if user is logged in or OnBoardingScreen
        Navigator.of(context)
            .pushNamedAndRemoveUntil(GenerateRouter.home, (route) => false);
      },
    );
    return SvgPicture.asset(
      AppImages.splash,
    );
  }
}
