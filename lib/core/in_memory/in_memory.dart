import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:flutter/material.dart';

/// In-memory storage for application data.
///
/// This class is used to store data in memory for the application.
/// once the application is closed, the data will be deleted.
///
/// listening to [didPop] and [didPush] events to manage data while poping or pushing specific route
///
/// This class is a singleton, meaning that there is only ever one
/// instance of it.
class InMemory extends NavigatorObserver {
  InMemory._();
  factory InMemory() => _instance;
  static final InMemory _instance = InMemory._();

  /// the in-memory storage
  final _data = <String, dynamic>{};

  /// Adds data to the in-memory storage.
  ///
  /// [T] is the type of data being stored.
  /// [key] is the unique identifier for the data.
  /// [data] is the data to be stored.
  void addData<T>(
    String key,
    T data,
  ) {
    _data[key] = data;
  }

  /// retrieves data from memory
  ///
  /// [key] is the unique identifier given when adding the data to memory
  T getData<T>(String key) {
    return _data[key] as T;
  }

  /// Retrieves data from memory.
  ///
  /// [key] is the unique identifier given when adding the data to memory
  void removeData(String key) {
    _data.remove(key);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name == Routes.notification.name) {
      kDebugPrint("pop route: ${route.settings.name}");
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    kDebugPrint("push route: ${route.settings.name}");
    super.didPush(route, previousRoute);
  }
}
