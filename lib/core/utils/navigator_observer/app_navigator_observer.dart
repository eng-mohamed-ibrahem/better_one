import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

/// use firebase analaytics observer to track navigation
class AppNavigatorObserver extends NavigatorObserver {
  AppNavigatorObserver(this.analytics);
  final FirebaseAnalytics analytics;
  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      analytics.logScreenView(screenName: previousRoute.settings.name);
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    analytics.logScreenView(screenName: route.settings.name);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      analytics.logScreenView(screenName: previousRoute.settings.name);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null) {
      analytics.logScreenView(screenName: newRoute.settings.name);
    }
  }
}
