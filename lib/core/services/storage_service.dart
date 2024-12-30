import 'package:get_storage/get_storage.dart';

class StorageService {
  late bool isFirstTimeAppOpening = false;
  late GetStorage storage;

  Future<void> loadData() async {
    await GetStorage.init();
    storage = GetStorage();
    _loadVariables();
  }

  _loadVariables() {
    isFirstTimeAppOpening =
        storage.read(StorageConstants.isFirstTimeAppOpening) ?? true;
  }

  Future<void> write<T>({required String key, required T data}) async {
    await storage.write(key, data);
  }
}

class StorageConstants {
  static const String isFirstTimeAppOpening = "isFirstTimeAppOpening";
}
