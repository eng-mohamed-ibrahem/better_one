import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/view/pages/home/home_screen.dart';
import 'package:better_one/view/pages/onborading/onboarding_screen.dart';
import 'package:better_one/view/pages/settings/settings_screen.dart';
import 'package:better_one/view/pages/splash/splash_screen.dart';
import 'package:better_one/view/pages/write_task/task_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String taskScreen = '/task_screen';
  static const String settingScreen = '/setting_screen';
  static String activeRoute = '/';

  static GoRouter get routerConfig {
    return GoRouter(
      initialLocation: splash,
      observers: [routeObserver],
      routes: [
        GoRoute(
          path: splash,
          name: 'splash',
          builder: (context, state) {
            activeRoute = splash;
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: onboarding,
          name: onboarding.split('/').last,
          builder: (context, state) {
            activeRoute = onboarding;
            return OnboardingScreen();
          },
        ),
        GoRoute(
          path: home,
          name: home.split('/').last,
          builder: (context, state) {
            activeRoute = home;
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: "$taskScreen/:task_id",
          name: taskScreen.split('/').last,
          builder: (context, state) => const TaskScreen(),
          pageBuilder: (context, state) {
            activeRoute = taskScreen;
            return CustomTransitionPage(
              child: const TaskScreen(),
              arguments: state.pathParameters['task_id'],
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: context.locale.languageCode == 'en'
                        ? const Offset(1.0, 0)
                        : const Offset(-1.0, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: settingScreen,
          name: settingScreen.split('/').last,
          builder: (context, state) {
            activeRoute = settingScreen;
            return const SettingScreen();
          },
        ),
      ],
    );
  }
}
