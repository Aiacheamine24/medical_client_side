class LocalService {
  final dynamic storage = {};
  Future<void> saveData({
    required String key,
    required dynamic data,
  }) async {
    // Save data to local storage
    storage[key] = data;
  }

  Future<dynamic> getData(String key) async {
    // Get data from local storage
    return storage[key];
  }

  Future<void> deleteData(String key) async {
    // Delete data from local storage
    storage.remove(key);
  }
}
