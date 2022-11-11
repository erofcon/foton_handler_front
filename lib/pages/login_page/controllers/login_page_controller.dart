import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/login_page/models/login_response.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../services/api_service.dart';
import '../models/login_request.dart';

class LoginPageController extends GetxController {
  final TextEditingController loginEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  LoginResponse? user;

  void checkLoginStatus() {
    final box = GetStorage();
    var token = box.read('user');
    if (token == null) {
      return;
    }

    user = currentUser(box.read('user'));
  }

  Future<bool> login() async {
    // await ApiService().login(LoginRequest(
    //         username: loginEditingController.text,
    //         password: passwordEditingController.text));

    if (await ApiService().login(LoginRequest(
        username: loginEditingController.text,
        password: passwordEditingController.text))) {
      loginEditingController.clear();
      passwordEditingController.clear();

      checkLoginStatus();
      return true;
    }
    return false;
  }
}
