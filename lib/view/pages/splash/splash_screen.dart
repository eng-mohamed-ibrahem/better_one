import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Navigator.pushNamedAndRemoveUntil(
                context,
                seen ? GenerateRouter.home : GenerateRouter.onboarding,
                (route) => false);
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
