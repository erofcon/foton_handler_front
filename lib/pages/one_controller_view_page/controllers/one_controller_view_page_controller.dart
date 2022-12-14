import 'package:foton_handler_front/pages/one_controller_view_page/models/get_controllers_data_request.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/models/get_controllers_data_response.dart';
import 'package:foton_handler_front/services/api_service.dart';
import 'package:get/get.dart';

class OneControllerViewPageController extends GetxController {
  DateTime? startDate;
  DateTime? endDate = DateTime.now();

  List<GetControllersDataResponse> chartData = [];

  bool loadData = true;

  @override
  void onInit() {
    getChartData();
    super.onInit();
  }

  @override
  void onClose() {
    chartData.clear();
    super.onClose();
  }

  void getChartData({DateTime? startDatetime, DateTime? endDatetime}) async {
    loadData = true;
    update();
    if (Get.arguments != null) {
      GetControllersDataRequest controllersDataRequest =
          GetControllersDataRequest(
        controllerId: Get.arguments['id'],
        startDatetime: startDatetime == null
            ? DateTime.now().toIso8601String()
            : startDatetime.toIso8601String(),
        endDatetime: endDatetime == null
            ? DateTime.now().toIso8601String()
            : endDatetime.toIso8601String(),
      );

      List<GetControllersDataResponse>? response =
          await ApiService().getControllerData(controllersDataRequest);

      if (response != null) {
        chartData = response;
      }
    }

    loadData = false;
    update();
  }

  void setStartTime(DateTime dateTime) {
    startDate = dateTime;
    update();
  }

  void setEndTime(DateTime dateTime) {
    endDate = dateTime;
    update();
  }
}
