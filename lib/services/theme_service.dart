import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final _storageKey = "isDarkMode";

  bool isDarkMode() {
    return _getStorage.read(_storageKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> saveThemeMode(bool isDarkMode) async {
    await _getStorage.write(_storageKey, isDarkMode);
  }

  void changeThemeMode() async {
    Get.changeThemeMode(!isDarkMode() ? ThemeMode.dark : ThemeMode.light);
    await saveThemeMode(!isDarkMode());
  }
}
