import 'package:get/get.dart';

import '../controllers/one_controller_view_page_controller.dart';

class OneControllerViewPagePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OneControllerViewPageController());
  }
}
