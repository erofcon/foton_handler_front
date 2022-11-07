import 'package:foton_handler_front/pages/controllers_view/bindings/datatable_controller_binding.dart';
import 'package:get/get.dart';

import '../pages/admin_panel/admin_panel.dart';
import '../pages/controllers_view/controllers_view.dart';

class RoutesClass {
  static String home = '/';
  static String adminPanel = '/admin_panel';

  static List<GetPage> routes = [
    GetPage(
        name: home,
        page: () => const ControllersView(),
        binding: DataTableControllerBinding()),
    GetPage(name: adminPanel, page: () => const AdminPanel()),
  ];
}
