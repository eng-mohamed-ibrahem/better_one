/// for cache initialization interface for [Hive || SQLite] or any other cache service
abstract class InitCacheInterface {
  Future<void> init();
}
