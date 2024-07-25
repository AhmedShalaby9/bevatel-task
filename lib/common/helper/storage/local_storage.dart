import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHelper {
  static const _boxName = "LOCAL_STORAGE";

  late Box _box;

  LocalStorageHelper._privateConstructor();

  static final LocalStorageHelper _instance =
  LocalStorageHelper._privateConstructor();

  factory LocalStorageHelper() {
    return _instance;
  }

  Future<void> _initLocalStorage() async {
    _box = await Hive.openBox(_boxName);
  }

  Future<void> init() async {
    await _initLocalStorage();
  }

  Future<void> setItem({required String key, required var data}) async {
    await _box.put(key, data);
  }

  dynamic getItem({required String key}) {
    return _box.get(key);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
