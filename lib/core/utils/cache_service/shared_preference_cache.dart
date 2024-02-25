import 'dart:developer';

import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceImpl implements CacheMethodInterface {
  late final SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    log('sharedPreferences: $_sharedPreferences');
  }

  @override
  void delete(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  void deleteAllData() async {
    await _sharedPreferences.clear();
  }

  @override
  dynamic get(String key) {
    return _sharedPreferences.get(key);
  }

  @override
  void removeTheDatabaseFile() async {
    throw UnimplementedError();
  }

  @override
  Future<void> save(String key, dynamic data) async {
    switch (data) {
      case String data:
        {
          await _sharedPreferences.setString(key, data);
        }
      case int data:
        {
          await _sharedPreferences.setInt(key, data);
        }
      case double data:
        {
          await _sharedPreferences.setDouble(key, data);
        }
      case bool data:
        {
          await _sharedPreferences.setBool(key, data);
        }
      default:
        {
          await _sharedPreferences.setStringList(key, data);
        }
    }
  }
}
