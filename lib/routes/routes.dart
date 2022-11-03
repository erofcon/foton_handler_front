import 'package:foton_handler_front/pages/main_view/main_view.dart';
import 'package:get/get.dart';

import '../pages/controllers_view/controllers_view.dart';

class RoutesClass {
  static String home = '/';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const ControllersView())
  ];
}
