import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveImpl implements CacheMethodInterface {
  static const String _userdata = 'user_data';
  late final Box _appBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _appBox = await Hive.openBox(_userdata);
  }

  @override
  dynamic get(String key) {
    return _appBox.get(key);
  }

  @override
  Future<void> save(String key, dynamic data) async {
    await _appBox.put(key, data);
  }

  @override
  void delete(String key) async {
    await _appBox.delete(key);
  }

  @override
  void deleteAllData() async {
    await _appBox.deleteAll(_appBox.keys);
  }

  @override
  void removeTheDatabaseFile() async {
    await _appBox.deleteFromDisk();
  }
}
