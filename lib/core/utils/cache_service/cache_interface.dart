abstract class CacheMethodInterface {
  /// init cache method
  Future<void> init();

  /// save data in local storage of key
  Future<void> save(String key, dynamic data);

  /// get data corresponding to the key
  dynamic get(String key);

  /// delete data corresponding to the key
  void delete(String key);

  /// delete all data
  void deleteAllData();

  /// delete the cached file
  void removeTheDatabaseFile();
}
