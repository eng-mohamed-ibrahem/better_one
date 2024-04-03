import 'package:better_one/config/app_routes.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        var result = await settingRepo.getOnBoardingSeen();
        result.when(
          success: (seen) {
            // Navigator.pushNamedAndRemoveUntil(context,
            //     seen ? AppRoutes.home : AppRoutes.onboarding, (route) => false);

            context.go(
              seen ? AppRoutes.home : AppRoutes.onboarding,
            );
          },
          failure: (error) {},
        );
      },
    );
    return SvgPicture.asset(
      AppImages.splash,
    );
  }
}
