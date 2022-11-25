import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/login_page/models/create_user_request.dart';
import 'package:foton_handler_front/pages/login_page/models/login_response.dart';
import 'package:foton_handler_front/pages/login_page/service/login_cache.dart';
import 'package:foton_handler_front/routes/routes.dart';
import 'package:get/get.dart';

import '../../../services/api_service.dart';
import '../models/get_all_users_response.dart';
import '../models/login_request.dart';

class LoginPageController extends GetxController with LoginCache {
  final user = LoginResponse().obs;

  final allUsers = <GetAllUserResponse>[].obs;

  final TextEditingController loginEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  final TextEditingController userLoginTextEditingController =
      TextEditingController();
  final TextEditingController userPasswordTextEditingController =
      TextEditingController();

  final TextEditingController hostAddressTextEditingController =
      TextEditingController();

  final userAdding = false.obs;
  final isSuperUserStatus = false.obs;
  final addUserWidget = false.obs;
  final loadAllUsers = true.obs;
  final checkLogin = false.obs;
  String? host;

  @override
  void onInit() {
    checkLoginStatus();
    host = getHostAddress();
    hostAddressTextEditingController.text = host ?? '';
    super.onInit();
  }



  void checkLoginStatus() {
    final saveUser = getSaveUser();
    if (saveUser == null) {
      return;
    }

    user(currentUser(saveUser));
  }

  Future<bool> login() async {
    try {
      checkLogin(true);

      if (await ApiService().login(LoginRequest(
          username: loginEditingController.text.toString(),
          password: passwordEditingController.text.toString()))) {
        loginEditingController.clear();
        passwordEditingController.clear();

        checkLoginStatus();
        checkLogin(false);
        return true;
      } else {
        checkLogin(false);
        return false;
      }
    } catch (e) {
      checkLogin(false);
      return false;
    }
  }

  void logout() {
    removeUser();
    user(LoginResponse());
    Get.offNamed(RoutesClass.login);
  }

  void closeAddUserDialog() {
    userLoginTextEditingController.clear();
    userPasswordTextEditingController.clear();
    isSuperUserStatus(false);
    addUserWidget(false);
  }

  void getAllUsers() async {
    loadAllUsers(true);
    List<GetAllUserResponse>? users = await ApiService().getAllUsers();
    if (users != null) {
      allUsers(users);
    }
    loadAllUsers(false);
  }

  Future<bool> createUser() async {
    userAdding(true);
    CreateUserRequest userRequest = CreateUserRequest(
        username: userLoginTextEditingController.text,
        password: userPasswordTextEditingController.text,
        isSuperUser: isSuperUserStatus.value);

    bool result = await ApiService().createUser(userRequest);
    userAdding(false);

    return result;
  }

  void deleteUser(int userId) async {
    bool result = await ApiService().deleteUser(userId);
    if (result) {
      allUsers.removeWhere((element) => element.id == userId);
    }
  }

  void hostSave() async{
    if (hostAddressTextEditingController.text != '') {
      await saveHostAddress(hostAddressTextEditingController.text);
    }
  }
}
