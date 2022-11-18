import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/index_page/models/create_controler_request.dart';
import 'package:foton_handler_front/pages/login_page/controllers/login_page_controller.dart';
import 'package:foton_handler_front/services/api_service.dart';
import 'package:foton_handler_front/utils/constants.dart';
import 'package:get/get.dart';

import '../models/check_data_collections_status_response.dart';
import '../models/delete_controller_request.dart';
import '../models/get_all_controllers_response.dart';
import '../models/get_controllers_count_response.dart';

class IndexPageController extends GetxController {
  final LoginPageController loginPageController =
      Get.put(LoginPageController());

  final dataLoading = true.obs;
  final controllerAdding = false.obs;
  final controllerDeleting = false.obs;
  final controllersCount = 0.obs;

  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> filterData = [];

  int rowPages = PaginatedDataTable.defaultRowsPerPage;

  final TextEditingController searchTextEditingController =
      TextEditingController();
  final TextEditingController ipEditingController = TextEditingController();
  final TextEditingController controllerLoginEditingController =
      TextEditingController();
  final TextEditingController controllerPasswordEditingController =
      TextEditingController();

  DateTime updateTime = DateTime.now();

  final checkDataCollectionsStatusResponse =
      CheckDataCollectionsStatusResponse().obs;

  late Timer timer;

  @override
  void onInit() {
    asyncInit();
    timer = Timer.periodic(
        const Duration(minutes: Constants.updatePeriodMinute),
        (Timer t) => asyncInit());
    updateTime = DateTime.now();
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  Future<void> asyncInit() async {
    dataLoading(true);
    getControllers();
    getControllersCount();
    getDataCollectionsStatus();
    dataLoading(false);
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
          "charge": responseData[index].charge,
        },
      );
      updateTime = DateTime.now();
      update();
    }
  }

  void getControllersCount() async {
    final GetControllerCountResponse? getControllerCountResponse =
        await ApiService().getControllerCount();

    if (getControllerCountResponse != null) {
      controllersCount(getControllerCountResponse.count);
    }
  }

  Future<bool> addController() async {
    controllerAdding(true);
    CreateControllerRequest createControllerRequest = CreateControllerRequest(
        controllerAddress: ipEditingController.text,
        login: controllerLoginEditingController.text,
        password: controllerPasswordEditingController.text);

    if (await ApiService().createController(createControllerRequest)) {
      asyncInit();
      controllerAdding(false);
      return true;
    } else {
      controllerAdding(false);
      return false;
    }
  }

  Future<bool> deleteController(int controllerId) async {
    controllerDeleting(true);
    DeleteControllerRequest deleteControllerRequest =
        DeleteControllerRequest(controllerId: controllerId.toString());
    if (await ApiService().deleteController(deleteControllerRequest)) {
      controllerDeleting(false);
      return true;
    } else {
      controllerDeleting(false);
      return false;
    }
  }

  Future<void> setDataCollectionsPause() async {
    if (await ApiService().setDataCollectionsPause()) {
      checkDataCollectionsStatusResponse(
          CheckDataCollectionsStatusResponse(taskStatus: 2));
    }
  }

  Future<void> setDataCollectionsResume() async {
    if (await ApiService().setDataCollectionsResume()) {
      checkDataCollectionsStatusResponse(
          CheckDataCollectionsStatusResponse(taskStatus: 1));
    }
  }

  void getDataCollectionsStatus() async {
    checkDataCollectionsStatusResponse(
        await ApiService().getDataCollectionsStatus());
  }

  void changeRowPages(int page) {
    rowPages = page;
  }

  void onSearch(String value) {
    filterData.clear();
    if (value != '') {
      filterData = data
          .where((element) => element["controller_address"].contains(value))
          .toList();
    }
    update();
  }

  void clearTextEditingControllers() {
    ipEditingController.clear();
    controllerLoginEditingController.clear();
    controllerPasswordEditingController.clear();
  }
}
