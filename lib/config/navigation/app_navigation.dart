import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/view/pages/pages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

class AppNavigation {
  AppNavigation._();

  static final GlobalKey<NavigatorState> _parrentNavigatorKey =
      GlobalKey<NavigatorState>();
  static String activeRoute = Routes.splash.path;

  static final GoRouter config = GoRouter(
    navigatorKey: _parrentNavigatorKey,
    initialLocation: Routes.splash.path,
    observers: [routeObserver],
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.onboarding.path,
        name: Routes.onboarding.name,
        builder: (context, state) {
          activeRoute = Routes.onboarding.path;
          return OnboardingScreen();
        },
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (context, state) {
          activeRoute = Routes.home.path;
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: Routes.task.path,
            name: Routes.task.name,
            pageBuilder: (context, state) {
              activeRoute = Routes.task.path;
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
            path: "${Routes.taskDetail.path}/:task_id",
            name: Routes.taskDetail.name,
            pageBuilder: (context, state) {
              activeRoute = Routes.taskDetail.path;
              return CustomTransitionPage(
                child: TaskDetailsScreen(
                  taskId: state.pathParameters['task_id'] as String,
                ),
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
            path: Routes.settings.path,
            name: Routes.settings.name,
            builder: (context, state) {
              activeRoute = Routes.settings.path;
              return const SettingScreen();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(
            state.error!.message,
          ),
        ),
      );
    },
  );
}
