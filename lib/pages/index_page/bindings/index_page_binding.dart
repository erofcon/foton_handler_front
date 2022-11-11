import 'package:foton_handler_front/pages/index_page/controllers/controllers_tab_controller.dart';
import 'package:foton_handler_front/pages/index_page/controllers/users_tab_controller.dart';
import 'package:get/get.dart';

class IndexPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControllersTabController());
    Get.lazyPut(() => UserTabController());
  }
}
