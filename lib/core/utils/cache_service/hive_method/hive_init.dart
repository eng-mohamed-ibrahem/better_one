import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveCacheInit {
  static const String _userdata = 'user_data';
  late final Box appCache;

  Future<void> init() async {
    await Hive.initFlutter();
    appCache = await Hive.openBox(_userdata);
    GetIt.instance.registerSingleton<HiveCache>(HiveCache(appCache));
  }
}

class HiveCache {
  HiveCache(this.appCache);
  final Box appCache;

  /// will be executed later
  // final Box tasksCache = Hive.box('tasks');
  // final Box settingsCache = Hive.box('settings');
  // final Box profileCache = Hive.box('profile');
}
