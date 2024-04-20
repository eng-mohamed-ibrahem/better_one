import 'package:better_one/view/pages/auth/login_page.dart';
import 'package:better_one/view/pages/auth/signup_page.dart';
import 'package:better_one/view/pages/home/home_screen.dart';
import 'package:better_one/view/pages/onborading/onboarding_screen.dart';
import 'package:better_one/view/pages/settings/settings_screen.dart';
import 'package:better_one/view/pages/splash/splash_screen.dart';
import 'package:better_one/view/pages/write_task/task_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenerateRouter {
  GenerateRouter._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String taskScreen = '/task_screen';
  static const String settingScreen = '/setting_screen';
  static const String signup = '/signup_screen';
  static const String login = '/login_screen';

  static String activeRoute = '/';

  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        {
          activeRoute = splash;
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          );
        }
      case onboarding:
        {
          activeRoute = onboarding;
          return MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          );
        }
      case home:
        {
          activeRoute = home;
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        }
      case taskScreen:
        {
          activeRoute = taskScreen;
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) {
              return const TaskScreen();
            },
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
        }
      case settingScreen:
        {
          activeRoute = settingScreen;
          return MaterialPageRoute(
            builder: (context) => const SettingScreen(),
          );
        }
      case signup:
        {
          activeRoute = signup;
          return MaterialPageRoute(
            builder: (context) => const SignUp(),
          );
        }
      case login:
        {
          activeRoute = login;
          return MaterialPageRoute(
            builder: (context) => const LogIn(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Page not found!'),
              ),
            ),
          );
        }
    }
  }
}
