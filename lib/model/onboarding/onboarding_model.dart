import 'package:better_one/core/constants/app_images.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String image;

  const OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: 'onboarding.1.title'.tr(),
    description: 'onboarding.1.body'.tr(),
    image: AppImages.onboarding1,
  ),
  OnboardingModel(
    title: 'onboarding.2.title'.tr(),
    description: 'onboarding.2.body'.tr(),
    image: AppImages.onboarding2,
  ),
  OnboardingModel(
    title: 'onboarding.3.title'.tr(),
    description: 'onboarding.3.body'.tr(),
    image: AppImages.onboarding3,
  ),
  OnboardingModel(
    title: 'onboarding.4.title'.tr(),
    description: 'onboarding.4.body'.tr(),
    image: AppImages.onboarding4,
  ),
  OnboardingModel(
    title: 'onboarding.5.title'.tr(),
    description: 'onboarding.5.body'.tr(),
    image: AppImages.onboarding5,
  )
];
