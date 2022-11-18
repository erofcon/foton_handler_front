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
    final user = box.read('user');
    if (user != null) {
      return currentUser(user).accessToken;
    }
    return null;
  }

  String? getSaveUser() {
    final box = GetStorage();
    final user = box.read('user');
    if (user != null) {
      return user;
    }
    return null;
  }

  Map<String, dynamic>? getRefreshToken() {
    final box = GetStorage();
    LoginResponse user = currentUser(box.read('user'));
    return {
      "token": user.refreshToken,
      "username": user.username,
    };
  }

  Future<void> removeUser() async {
    final box = GetStorage();
    await box.remove('user');
  }

  Future<void> saveHostAddress(String host) async {
    final box = GetStorage();
    await box.remove('host');
    await box.write('host', host);
  }

  String? getHostAddress() {
    final box = GetStorage();
    final host = box.read('host');
    if (host != null) {
      return host;
    }
    return null;
  }
}
