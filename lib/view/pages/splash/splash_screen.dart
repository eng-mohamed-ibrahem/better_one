import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
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
            context.go(seen ? Routes.home.path : Routes.onboarding.path);
          },
          failure: (error) {
            debugPrint(error.message);
            showSnackBar(context, message: error.message);
          },
        );
      },
    );
    return Scaffold(
      body: SvgPicture.asset(
        AppImages.splash,
      ),
    );
  }
}
