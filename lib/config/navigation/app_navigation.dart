import 'dart:convert';

import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/notification_constants.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/encryption/encryption_handler.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/navigator_observer/app_navigator_observer.dart';
import 'package:better_one/core/utils/notification_service/flutter_local_notification.dart';
import 'package:better_one/data_source/auth_data_source/firebase_auth_impl.dart';
import 'package:better_one/data_source/feedback_data_source/firebase_feedback_source.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_impl.dart';
import 'package:better_one/repositories/feedback_repo/feedback_repo_impl.dart';
import 'package:better_one/repositories/notification_repo/notification_repo_interface.dart';
import 'package:better_one/view/pages/pages.dart';
import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:better_one/view_models/feedback_viewmodel/feedback_viewmodel.dart';
import 'package:better_one/view_models/notification_viewmodel/notification_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:better_one/view_models/search_viewmodel/search_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:go_router/go_router.dart";

class AppNavigation {
  AppNavigation._();

  static final GlobalKey<NavigatorState> _parrentNavigatorKey =
      GlobalKey<NavigatorState>();
  static String activeRoute = Routes.splash.path;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static final GoRouter config = GoRouter(
    navigatorKey: _parrentNavigatorKey,
    initialLocation: Routes.splash.path,
    observers: [
      routeObserver,
      AppNavigatorObserver(analytics),
    ],
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        builder: (context, state) {
          return const SplashScreen();
        },
        redirect: (context, state) async {
          return await inject<FlutterLocalNotification>()
              .getNotificationAppLaunchDetails
              .then(
            (notification) async {
              kDebugPrint("launched notification: $notification");

              if (notification != null &&
                  notification.didNotificationLaunchApp) {
                var encryptedSenderId = await EncryptionHandler().encrypt(
                    jsonDecode(notification.notificationResponse!.payload!)[
                        NotificaitonConstants.senderId]);
                return state.namedLocation(
                  Routes.sharedTask.name,
                  pathParameters: {
                    "id":
                        jsonDecode(notification.notificationResponse!.payload!)[
                            NotificaitonConstants.taskId]
                  },
                  queryParameters: {
                    NotificaitonConstants.senderId: encryptedSenderId,
                  },
                );
              }
              return null;
            },
          );
        },
      ),
      GoRoute(
        path: Routes.onboarding.path,
        name: Routes.onboarding.name,
        builder: (context, state) {
          activeRoute = Routes.onboarding.path;
          return const OnboardingScreen();
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
                lazy: false,
                create: (context) => SettingViewmodel(settingsRepo: settingRepo)
                  ..getLanguage()
                  ..getSearchSettings()
                  ..getNotificationSettings(),
              ),
            ],
            child: const HomeScreen(),
          );
        },
        // redirect: (context, state) async {
        //   return await inject<FlutterLocalNotification>()
        //       .getNotificationAppLaunchDetails
        //       .then(
        //     (notification) {
        //       kDebugPrint("launched notification: $notification");
        //       if (notification != null &&
        //           notification.didNotificationLaunchApp) {
        //         return state.namedLocation(
        //           Routes.sharedTask.name,
        //           pathParameters: {
        //             "id":
        //                 jsonDecode(notification.notificationResponse!.payload!)[
        //                     NotificaitonConstants.taskId]
        //           },
        //           queryParameters: {
        //             NotificaitonConstants.senderId:
        //                 jsonDecode(notification.notificationResponse!.payload!)[
        //                     NotificaitonConstants.senderId],
        //           },
        //         );
        //       }
        //       return null;
        //     },
        //   );
        // },
        routes: [
          GoRoute(
            path: Routes.createTask.path,
            name: Routes.createTask.name,
            pageBuilder: (context, state) {
              activeRoute = Routes.createTask.path;
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
            path: Routes.taskDetails.path,
            name: Routes.taskDetails.name,
            pageBuilder: (context, state) {
              activeRoute = Routes.taskDetails.path;
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
                    taskId: state.pathParameters['id'] as String,
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
            path: Routes.notification.path,
            name: Routes.notification.name,
            builder: (context, state) {
              activeRoute = Routes.notification.path;
              return BlocProvider(
                lazy: false,
                create: (context) => NotificationViewmodel(
                  notificationRepo: inject<NotificationRepoInterface>(),
                ),
                child: const NotificationScreen(),
              );
            },
            routes: [
              GoRoute(
                path: Routes.sharedTask.path,
                name: Routes.sharedTask.name,
                builder: (context, state) {
                  activeRoute = Routes.sharedTask.path;
                  return BlocProvider.value(
                    value: inject<NotificationViewmodel>(),
                    child: SharedTaskScreen(
                      payload: {
                        NotificaitonConstants.taskId:
                            state.pathParameters["id"],
                        NotificaitonConstants.senderId: state
                            .uri.queryParameters[NotificaitonConstants.senderId]
                      },
                    ),
                  );
                },
              ),
            ],
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
                    value: inject<SettingViewmodel>(),
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
                    value: inject<SettingViewmodel>(),
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
                    value: inject<SettingViewmodel>(),
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
                    child: const ProfileScreen(),
                  );
                },
                redirect: (context, state) async {
                  return inject<LocaleUserInfo>().getUserData() != null
                      ? null
                      : state.namedLocation(Routes.login.name);
                },
                routes: [
                  GoRoute(
                    path: Routes.changeName.path,
                    name: Routes.changeName.name,
                    builder: (context, state) {
                      activeRoute = Routes.changeName.path;
                      return BlocProvider.value(
                        value: inject<UserViewmodel>(),
                        child: const ChangeNameScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: Routes.changeEmail.path,
                    name: Routes.changeEmail.name,
                    builder: (context, state) {
                      activeRoute = Routes.changeEmail.path;
                      return BlocProvider.value(
                        value: inject<UserViewmodel>(),
                        child: const ChangeEmailScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: Routes.changePassword.path,
                    name: Routes.changePassword.name,
                    builder: (context, state) {
                      activeRoute = Routes.changePassword.path;
                      return BlocProvider.value(
                        value: inject<UserViewmodel>(),
                        child: const ChangePasswordScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: Routes.feedback.path,
                    name: Routes.feedback.name,
                    builder: (context, state) {
                      activeRoute = Routes.feedback.path;
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => FeedbackViewmodel(
                              feedbackRepo: FeedbackRepoImpl(
                                feedbackDataSource: FirebaseFeedbackSource(),
                              ),
                            ),
                          ),
                          BlocProvider.value(
                            value: inject<UserViewmodel>(),
                          ),
                        ],
                        child: const FeedbackScreen(),
                      );
                    },
                  ),
                ],
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
                  routes: [
                    GoRoute(
                      path: Routes.forgotPassword.path,
                      name: Routes.forgotPassword.name,
                      builder: (context, state) {
                        activeRoute = Routes.forgotPassword.path;
                        return BlocProvider.value(
                          value: inject<AuthViewmodel>(),
                          child: const ForgotPassword(),
                        );
                      },
                    ),
                  ]),
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
