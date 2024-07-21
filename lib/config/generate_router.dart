import 'package:better_one/view/pages/pages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenerateRouter {
  GenerateRouter._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String taskScreen = '/task';
  static const String settingScreen = '/setting';
  static const String languageSettingScreen = '/language';
  static const String themeSettingScreen = '/theme';
  static const String notificationSettingScreen = '/notification';
  static const String searchSettingScreen = '/search';
  static const String accountSettingScreen = '/account_setting';
  static const String signup = '/signup';
  static const String login = '/login';

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
              return TaskDetailsScreen(
                taskId: settings.arguments as String,
              );
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

      case searchSettingScreen:
        {
          activeRoute = searchSettingScreen;
          return MaterialPageRoute(
            builder: (context) => SearchSettingScreen(
              title: settings.arguments as String,
            ),
          );
        }
      case notificationSettingScreen:
        {
          activeRoute = notificationSettingScreen;
          return MaterialPageRoute(
            builder: (context) => NotificationSettingScreen(
              title: settings.arguments as String,
            ),
          );
        }
      case accountSettingScreen:
        {
          activeRoute = accountSettingScreen;
          return MaterialPageRoute(
            builder: (context) => const AccountSettingScreen(),
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
