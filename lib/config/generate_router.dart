import 'package:better_one/view/pages/home/home_screen.dart';
import 'package:better_one/view/pages/splash/splash_screen.dart';
import 'package:better_one/view/pages/write_task/task_screen.dart';
import 'package:flutter/material.dart';

class GenerateRouter {
  GenerateRouter._();

  static const String splash = '/';
  static const String home = '/home';
  static const String taskScreen = '/task_screen';
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
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const TaskScreen(),
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
