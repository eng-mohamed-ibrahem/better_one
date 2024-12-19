import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/service/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
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
        var seen = inject<LocaleUserInfo>().seenOnboarding();
        context.go(seen ? Routes.home.path : Routes.onboarding.path);
      },
    );
    return Scaffold(
      body: SvgPicture.asset(
        AppImages.splash,
      ),
    );
  }
}
