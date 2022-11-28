import 'package:get_storage/get_storage.dart';

class Storage {
  // 单例模式
  static final Storage _instance = Storage._internal();

  factory Storage() => _instance;

  Storage._internal() {
    init();
  }

  late GetStorage _storage;

  init() {
    _storage = GetStorage();
  }

  /// 本地存储
  void storageSetItem(String key, value) {
    _storage.write(key, value);
  }

  /// 获取存储
  getStorageItem(String key) {
    return _storage.read(key);
  }

  /// 删除存储
  removeStorageItem(String key) {
    _storage.remove(key);
  }

  /// 清空存储器
  removeStorage() {
    _storage.erase();
  }
}
