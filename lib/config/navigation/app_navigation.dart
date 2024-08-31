import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/auth_data_source/firebase_auth_impl.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_impl.dart';
import 'package:better_one/view/pages/pages.dart';
import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:better_one/view_models/notification_viewmodel/notification_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:better_one/view_models/search_viewmodel/search_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    TaskViewmodel(taskRepo: taskRepo, userRepo: kUserRepo),
              ),
              BlocProvider(
                create: (context) => NotificationViewmodel(userRepo: kUserRepo),
              ),
              BlocProvider(
                lazy: false,
                create: (context) => SettingViewModel(settingsRepo: settingRepo)
                  ..getLanguage()
                  ..getSearchSettings()
                  ..getNotificationSettings(),
              ),
            ],
            child: const HomeScreen(),
          );
        },
        routes: [
          GoRoute(
            path: Routes.task.path,
            name: Routes.task.name,
            pageBuilder: (context, state) {
              activeRoute = Routes.task.path;
              return CustomTransitionPage(
                child: BlocProvider.value(
                  value: inject<TaskViewmodel>(),
                  child: CreateTaskScreen(),
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return pageTransition(context, animation, child);
                },
              );
            },
          ),
          GoRoute(
            path: Routes.taskDetail.path,
            name: Routes.taskDetail.name,
            pageBuilder: (context, state) {
              activeRoute = Routes.taskDetail.path;
              return CustomTransitionPage(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => QuoteViewmodel(quoteRepo: quoteRepo),
                    ),
                    BlocProvider.value(
                      value: inject<TaskViewmodel>(),
                    ),
                  ],
                  child: TaskDetailsScreen(
                    taskId: state.uri.queryParameters['id'] as String,
                  ),
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return pageTransition(context, animation, child);
                },
              );
            },
          ),
          GoRoute(
            path: Routes.search.path,
            name: Routes.search.name,
            builder: (context, state) {
              activeRoute = Routes.search.path;
              return BlocProvider(
                lazy: false,
                create: (context) => SearchViewmodel(userRepo: kUserRepo),
                child: const SearchScreen(),
              );
            },
          ),
          GoRoute(
            path: Routes.settings.path,
            name: Routes.settings.name,
            builder: (context, state) {
              activeRoute = Routes.settings.path;
              return MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: inject<SettingViewModel>(),
                  ),
                  BlocProvider(
                    lazy: false,
                    create: (context) => AuthViewmodel(
                      authRepo: AuthRepoImpl(
                        authSource: FirebaseAuthImpl(),
                      ),
                    ),
                  ),
                ],
                child: const SettingScreen(),
              );
            },

            /// 3 paths {profile, search-setting, notification-setting}
            routes: [
              GoRoute(
                path: Routes.searchSetting.path,
                name: Routes.searchSetting.name,
                builder: (context, state) {
                  activeRoute = Routes.searchSetting.path;
                  return BlocProvider.value(
                    value: inject<SettingViewModel>(),
                    child: const SearchSettingScreen(),
                  );
                },
              ),
              GoRoute(
                path: Routes.notificationSetting.path,
                name: Routes.notificationSetting.name,
                builder: (context, state) {
                  activeRoute = Routes.notificationSetting.path;
                  return BlocProvider.value(
                    value: inject<SettingViewModel>(),
                    child: const NotificationSettingScreen(),
                  );
                },
              ),
              GoRoute(
                path: Routes.profile.path,
                name: Routes.profile.name,
                builder: (context, state) {
                  activeRoute = Routes.profile.path;
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => UserViewmodel(userRepo: kUserRepo),
                      ),
                      BlocProvider.value(
                        value: inject<TaskViewmodel>(),
                      ),
                    ],
                    child: const ProfileSettingScreen(),
                  );
                },
                redirect: (context, state) async {
                  return userLocaleDatabase.getUserIdFromLocale() != null &&
                          userLocaleDatabase.isVerified()
                      ? null
                      : state.namedLocation(Routes.login.name);
                },
              ),
              GoRoute(
                path: Routes.login.path,
                name: Routes.login.name,
                builder: (context, state) {
                  activeRoute = Routes.login.path;
                  return BlocProvider.value(
                    value: inject<AuthViewmodel>(),
                    child: const LogIn(),
                  );
                },
              ),
              GoRoute(
                path: Routes.signup.path,
                name: Routes.signup.name,
                builder: (context, state) {
                  activeRoute = Routes.signup.path;
                  return BlocProvider.value(
                    value: inject<AuthViewmodel>(),
                    child: const SignUp(),
                  );
                },
              ),
            ],
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

  static SlideTransition pageTransition(
      BuildContext context, Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Directionality.of(context) == TextDirection.ltr
            ? const Offset(1.0, 0)
            : const Offset(-1.0, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
