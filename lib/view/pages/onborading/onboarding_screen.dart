import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/service/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/model/onboarding/onboarding_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.viewPaddingOf(context).top,
          horizontal: MediaQuery.viewPaddingOf(context).left,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: onboardingList.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Theme.of(context).secondaryHeaderColor,
                    dotColor: Theme.of(context).secondaryHeaderColor,
                    expansionFactor: 5,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    inject<LocaleUserInfo>()
                        .setSeenOnboarding(seenOnboarding: true);
                    context.go(Routes.home.path);
                  },
                  child: Text('core.skip'.tr()),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                itemCount: onboardingList.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.asset(
                          onboardingList[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: AppMetrices.verticalGap),
                      Text(
                        onboardingList[index].title,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppMetrices.verticalGap),
                      Text(
                        onboardingList[index].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
