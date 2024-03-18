/// for cache initialization interface for [Hive || SQLite] or any other cache service
abstract class CacheInitInterface {
  Future<void> init();
}
