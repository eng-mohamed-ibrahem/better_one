import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/model/onboarding/onboarding_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboardingList.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
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
                      const Spacer(),
                      index != onboardingList.length - 1
                          ? const Text('')
                          : TextButton(
                              onPressed: () {
                                settingRepo.setOnBoardingSeen(true);
                                context.go(Routes.home.path);
                              },
                              child: Text('core.get_started'.tr()),
                            )
                    ],
                  );
                },
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
