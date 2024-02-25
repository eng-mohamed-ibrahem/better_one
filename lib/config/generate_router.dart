import 'package:better_one/view/pages/home/home_screen.dart';
import 'package:better_one/view/pages/splash/splash_screen.dart';
import 'package:better_one/view/pages/write_note/note_screen.dart';
import 'package:flutter/material.dart';

class GenerateRouter {
  GenerateRouter._();

  static const String splash = '/';
  static const String home = '/home';
  static const String noteScreen = '/note_screen';
  static String activeRoute = '/';

  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          );
        }
      case home:
        {
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        }
      case noteScreen:
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const NoteScreen(),
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
