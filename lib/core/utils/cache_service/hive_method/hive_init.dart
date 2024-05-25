import 'package:better_one/core/utils/cache_service/cach_interface/init_cache_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInit implements InitCacheInterface {
  static const String _userdata = 'user_data';
  late final Box appBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    appBox = await Hive.openBox(_userdata);
  }
}
