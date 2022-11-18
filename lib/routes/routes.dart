import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/index_page/bindings/index_page_binding.dart';
import 'package:foton_handler_front/pages/index_page/index_page.dart';
import 'package:foton_handler_front/pages/login_page/login_page.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/one_controller_view_page.dart';
import 'package:get/get.dart';

import '../pages/login_page/controllers/login_page_controller.dart';
import '../pages/one_controller_view_page/bindings/one_controller_view_page_binding.dart';

class RoutesClass {
  static String home = '/';
  static String login = '/login';
  static String controllerView = '/controller_view';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const IndexPage(),
      binding: IndexPageBinding(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: controllerView,
      page: () => const OneControllerViewPage(),
      binding: OneControllerViewPagePageBinding(),
      middlewares: [AuthGuard()],
    )
  ];
}

class AuthGuard extends GetMiddleware {
  final authService = Get.find<LoginPageController>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.user.value.username != null
        ? null
        : RouteSettings(name: RoutesClass.login);
  }
}
