import 'package:flutter/material.dart';
import 'package:foton_handler_front/services/api_service.dart';
import 'package:get/get.dart';

import '../models/get_all_controllers_response.dart';

class ControllersTabController extends GetxController {
  // final data = <Map<String, dynamic>>[].obs;
  // final filterData = <Map<String, dynamic>>[].obs;
  // final rowPages = PaginatedDataTable.defaultRowsPerPage.obs;

  // final isSearch = false.obs;
  final isLoading = true.obs;

  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> filterData = [];
  bool isSearch = false;
  int rowPages = PaginatedDataTable.defaultRowsPerPage;
  final TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  void onInit() {
    asyncInit();

    super.onInit();
  }

  Future<void> asyncInit() async {
    await getControllers();
    isLoading(false);
  }

  Future<void> getControllers() async {
    List<GetAllControllersResponse>? responseData =
        await ApiService().getControllers();

    if (responseData != null) {
      data = List.generate(
        responseData.length,
        (index) => {
          "№": index + 1,
          "id": responseData[index].id,
          "controller_address": responseData[index].controllerAddress,
          "status": responseData[index].status,
        },
      );
      print("yes");
      update();
    } else {
      print("sddssd");
    }
  }

  void changeRowPages(int page) {
    rowPages = page;
  }

  void onSearch(String value) {
    isSearch = true;
    filterData.clear();
    filterData =
        data.where((element) => element["controller_address"].contains(value)).toList();
    update();
  }
}
