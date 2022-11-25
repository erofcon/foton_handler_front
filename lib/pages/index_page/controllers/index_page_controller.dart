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
import '../models/get_controller_to_edit_response.dart';
import '../models/get_controllers_count_response.dart';
import '../models/update_controller_request.dart';

class IndexPageController extends GetxController {
  final LoginPageController loginPageController =
      Get.put(LoginPageController());

  final dataLoading = true.obs;
  final controllerAdding = false.obs;
  final controllerDeleting = false.obs;
  final controllersCount = 0.obs;
  final controllersSearch = false.obs;

  bool controllerEditLoading = false;

  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> filterData = [];

  int rowPages = 15;

  final TextEditingController searchTextEditingController =
      TextEditingController();
  final TextEditingController locationEditingController =
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

  int currentSortColumn = 0;
  bool isAscending = true;

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
    locationEditingController.dispose();
    searchTextEditingController.dispose();
    ipEditingController.dispose();
    controllerLoginEditingController.dispose();
    controllerPasswordEditingController.dispose();
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
          "local_address": responseData[index].localAddress,
          "controller_address": responseData[index].controllerAddress,
          "status": responseData[index].status,
          "charge": responseData[index].charge,
        },
      );
      updateTime = DateTime.now();
      currentSortColumn = 0;
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
        localAddress: locationEditingController.text,
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
      controllersSearch(true);
      filterData = data
          .where((element) => element["controller_address"].contains(value))
          .toList();
      update();
    } else {
      controllersSearch(false);
      update();
    }
  }

  void clearTextEditingControllers() {
    locationEditingController.clear();
    ipEditingController.clear();
    controllerLoginEditingController.clear();
    controllerPasswordEditingController.clear();
  }

  void sort(int columnIndex, String dataLabelKey) {
    currentSortColumn = columnIndex;
    if (isAscending == true) {
      isAscending = false;
      data.sort((compareA, compareB) => compareB[dataLabelKey]
          .toString()
          .compareTo(compareA[dataLabelKey].toString()));
    } else {
      isAscending = true;
      data.sort((compareA, compareB) => compareA[dataLabelKey]
          .toString()
          .compareTo(compareB[dataLabelKey].toString()));
    }

    update();
  }

  void controllerEdit(int controllerId) async {
    controllerEditLoading = true;
    update();
    GetControllerToEditResponse? result =
        await ApiService().getControllerToEditData(controllerId);

    if (result != null) {
      locationEditingController.text = result.localAddress;
      ipEditingController.text = result.controllerAddress;
      controllerLoginEditingController.text = result.login;
      controllerPasswordEditingController.text = result.password;
    }

    controllerEditLoading = false;
    update();
  }

  Future<void> updateController(int controllerId) async {
    UpdateControllerRequest updateControllerRequest = UpdateControllerRequest(
      controllerAddress: ipEditingController.text,
      localAddress: locationEditingController.text,
      login: controllerLoginEditingController.text,
      password: controllerPasswordEditingController.text,
      id: controllerId,
    );

    bool result = await ApiService().controllerUpdate(updateControllerRequest);

    if (result) {
      for (var element in data) {
        if (element["id"] == controllerId) {
          element["local_address"] = updateControllerRequest.localAddress;
          element["controller_address"] =
              updateControllerRequest.controllerAddress;
          update();
          break;
        }
      }
    }
  }
}
