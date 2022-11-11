import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../models/login_response.dart';

mixin LoginCache {
  Future<void> saveUser(LoginResponse response) async {
    final box = GetStorage();
    await box.remove('user');
    final user = json.encode(response);
    await box.write('user', user);
  }

  String? getToken() {
    final box = GetStorage();
    return currentUser(box.read('user')).accessToken;
  }

  Map<String, dynamic>? getRefreshToken() {
    final box = GetStorage();
    LoginResponse user = currentUser(box.read('user'));
    return {
      "token": user.refreshToken,
      "username": user.username,
    };
  }

  Future<void> logout() async {
    final box = GetStorage();
    await box.remove('user');
  }
}
