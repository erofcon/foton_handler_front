import 'package:foton_handler_front/pages/controllers_view/controllers/data_table_controller.dart';
import 'package:get/get.dart';

class DataTableControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataTableController());
  }
}
