import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static final StorageManager _route = StorageManager._instance();
  late final SharedPreferences init;

  factory StorageManager() {
    return _route;
  }

  StorageManager._instance() {
    initProcess();
  }

  void initProcess() async {
    init = await SharedPreferences.getInstance();
  }

  Future<Map<String, dynamic>> getMap(String key) async {
    try {
      final data = init.getString(key);
      const dataNull = {"data": "kosong"};
      if (data == null) {
        return dataNull;
      } else {
        return jsonDecode(data);
      }
    } catch (e) {
      const dataNull = {"data": "kosong"};
      print(e.toString());
      return dataNull;
    }
  }

  Future<String> getString(String key) async {
    try {
      final data = init.getString(key);
      const dataNull = "kosong";
      return data ?? dataNull;
    } catch (e) {
      print(e.toString());
      return "kosong";
    }
  }

  Future<bool> getBool(String key) async {
    try {
      final data = init.getBool(key);
      return data ?? false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> setBool(String key, bool value) async {
    try {
      await init.setBool(key, value);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> setString(String key, String value) async {
    try {
      await init.setString(key, value);
    } catch (e) {
      print(e.toString());
    }
  }
}
