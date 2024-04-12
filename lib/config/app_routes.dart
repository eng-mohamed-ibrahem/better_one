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
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String taskDetailsScreen = 'task';
  static const String createTaskScreen = 'create';
  static const String settingScreen = 'setting';
  static String activeRoute = splash;

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
          routes: [
            GoRoute(
              path: createTaskScreen,
              name: createTaskScreen,
              pageBuilder: (context, state) {
                activeRoute = createTaskScreen;
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
              path: "$taskDetailsScreen/:task_id",
              name: taskDetailsScreen,
              builder: (context, state) => const TaskDetailsScreen(),
              pageBuilder: (context, state) {
                activeRoute = taskDetailsScreen;
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
              path: settingScreen,
              name: settingScreen,
              builder: (context, state) {
                activeRoute = settingScreen;
                return const SettingScreen();
              },
            ),
          ],
        ),
      ],
    );
  }
}
