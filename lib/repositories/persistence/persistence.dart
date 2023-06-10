class PersistenceRepository {
  final _db = <String, dynamic>{};

  Future<void> save<T>(String key, T value) async {
    _db[key] = value;
  }

  Future<T> load<T>(String key) async {
    return _db[key] as T;
  }
}
