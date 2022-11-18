import 'package:foton_handler_front/pages/index_page/controllers/index_page_controller.dart';
import 'package:get/get.dart';

class IndexPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexPageController());
  }
}
