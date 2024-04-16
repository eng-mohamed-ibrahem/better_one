import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/view/pages/home/home_screen.dart';
import 'package:better_one/view/pages/onborading/onboarding_screen.dart';
import 'package:better_one/view/pages/settings/settings_screen.dart';
import 'package:better_one/view/pages/splash/splash_screen.dart';
import 'package:better_one/view/pages/write_task/create_task_screen.dart';
import 'package:better_one/view/pages/write_task/task_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splashPath = '/';
  static const String splashName = 'splash_name';
  static const String onboardingPath = '/onboarding';
  static const String onboardingName = 'onboarding_name';

  static const String homePath = '/home';
  static const String homeName = 'home_name';
  static const String taskDetailsScreenPath = 'task';
  static const String taskDetailsScreenName = 'task_name';

  static const String createTaskScreenPath = 'create';
  static const String createTaskScreenName = 'create_name';

  static const String settingScreenPath = 'setting';
  static const String settingScreenName = 'setting_name';
  static String activeRoute = splashPath;

  static GoRouter get routerConfig {
    return GoRouter(
      initialLocation: splashPath,
      observers: [routeObserver],
      routes: [
        GoRoute(
          path: splashPath,
          name: splashName,
          builder: (context, state) {
            activeRoute = splashPath;
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: onboardingPath,
          name: onboardingName,
          builder: (context, state) {
            activeRoute = onboardingPath;
            return OnboardingScreen();
          },
        ),
        GoRoute(
          path: homePath,
          name: homeName,
          builder: (context, state) {
            activeRoute = homePath;
            return const HomeScreen();
          },
          routes: [
            GoRoute(
              path: createTaskScreenPath,
              name: createTaskScreenName,
              pageBuilder: (context, state) {
                activeRoute = createTaskScreenPath;
                return CustomTransitionPage(
                  child: CreateTaskScreen(),
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
              path: "$taskDetailsScreenPath/:task_id",
              name: taskDetailsScreenName,
              builder: (context, state) => const TaskDetailsScreen(),
              pageBuilder: (context, state) {
                activeRoute = taskDetailsScreenPath;
                return CustomTransitionPage(
                  child: const TaskDetailsScreen(),
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
              path: settingScreenPath,
              name: settingScreenName,
              builder: (context, state) {
                activeRoute = settingScreenPath;
                return const SettingScreen();
              },
            ),
          ],
        ),
      ],
    );
  }
}
