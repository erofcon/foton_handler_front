import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/index_page/components/edit_container_dialog.dart';
import 'package:foton_handler_front/routes/routes.dart';
import 'package:foton_handler_front/utils/constants.dart';
import 'package:get/get.dart';

import '../../../shared_components/icon_button_with_effect.dart';
import '../controllers/index_page_controller.dart';

class ControllersDataTable extends GetView<IndexPageController> {
  const ControllersDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexPageController>(
      builder: (controller) => PaginatedDataTable2(
        source: ControllerDataSource(
          controller.controllersSearch.isTrue
              ? controller.filterData
              : controller.data,
          (controllerId) => controller.deleteController(controllerId),
        ),
        columnSpacing: 12,
        horizontalMargin: 12,
        availableRowsPerPage: <int>[
          controller.rowPages,
          controller.rowPages * 2,
          controller.rowPages * 5,
          controller.rowPages * 10
        ],
        rowsPerPage: 15,
        onRowsPerPageChanged: (r) => controller.changeRowPages(r!),
        wrapInCard: false,
        empty: Text("no_data".tr),
        sortColumnIndex: controller.currentSortColumn,
        sortAscending: controller.isAscending,
        columns: [
          const DataColumn2(label: Text("№")),
          DataColumn2(label: Text("local_address".tr)),
          DataColumn2(
            label: Text("controller_address".tr),
            onSort: (columIndex, _) =>
                controller.sort(columIndex, "controller_address"),
          ),
          DataColumn2(
            label: Text("status".tr),
            onSort: (columIndex, _) => controller.sort(columIndex, "status"),
          ),
          DataColumn2(
            label: Text("charge".tr),
            onSort: (columIndex, _) => controller.sort(columIndex, "charge"),
          ),
          const DataColumn2(label: Text("")),
        ],
      ),
    );
  }
}

class ControllerDataSource extends DataTableSource {
  ControllerDataSource(
    this._data,
    this.deleteCallback,
  );

  final List<Map<String, dynamic>> _data;
  final Function(int controllerId) deleteCallback;

  @override
  DataRow? getRow(int index) {
    return DataRow2(
      onTap: () => Get.toNamed(RoutesClass.controllerView, arguments: {
        'id': _data[index]['id'],
        'controller_address': _data[index]['controller_address']
      }),
      cells: [
        DataCell(Text(_data[index]['№'].toString())),
        DataCell(Text(_data[index]['local_address'] ?? '')),
        DataCell(Text(_data[index]['controller_address'].toString())),
        DataCell(
          _GetStatusChip(status: _data[index]['status']),
        ),
        DataCell(Text("${_data[index]['charge'] ?? '0'}")),
        DataCell(
          Row(
            children: <Widget>[
              _DeleteButton(controllerId: _data[index]['id']),
              _EditButton(controllerId: _data[index]['id']),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

class _GetStatusChip extends StatelessWidget {
  const _GetStatusChip({Key? key, required this.status}) : super(key: key);

  final bool? status;

  @override
  Widget build(BuildContext context) {
    if (status == true) {
      return Chip(
        backgroundColor: Colors.green[400],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(UiConstants.defaultPadding * 0.3))),
        label: Text(
          "success_controller_connection".tr,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      );
    } else if (status == false) {
      return Chip(
        backgroundColor: Colors.red[300],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(UiConstants.defaultPadding * 0.3))),
        label: Text(
          "error_controller_connection".tr,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      );
    } else {
      return Chip(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(UiConstants.defaultPadding * 0.3))),
        label: Text(
          "no_data".tr,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      );
    }
  }
}

class _DeleteButton extends GetView<IndexPageController> {
  const _DeleteButton({Key? key, required this.controllerId}) : super(key: key);

  final int controllerId;

  @override
  Widget build(BuildContext context) {
    if (controller.loginPageController.user.value.isSuperUser == true) {
      return IconButtonHoverWithEffect(
        onTap: () {
          Get.closeAllSnackbars();
          Get.defaultDialog(
            title: "delete_question".tr,
            middleText: "",
            buttonColor: Colors.green[400],
            radius: 5,
            content: _DeleteAlert(controllerId: controllerId),
          ).then((result) {
            if (result == true) {
              controller.asyncInit();
            }
          });
        },
        icon: Icons.delete,
        iconColor: Colors.red[300]!,
        hoverColor: Colors.red[100]!,
        backgroundColor: Colors.transparent,
        size: 24,
      );
    } else {
      return Container();
    }
  }
}

class _EditButton extends GetView<IndexPageController> {
  const _EditButton({Key? key, required this.controllerId}) : super(key: key);

  final int controllerId;

  @override
  Widget build(BuildContext context) {
    if (controller.loginPageController.user.value.isSuperUser == true) {
      return IconButtonHoverWithEffect(
        onTap: () {
          controller.controllerEdit(controllerId);
          Get.dialog(EditContainerDialog(),
              arguments: {"controllerID": controllerId}).then((value) {
            controller.clearTextEditingControllers();
          });
        },
        icon: Icons.edit,
        iconColor: Colors.blue,
        hoverColor: Colors.blue[100]!,
        backgroundColor: Colors.transparent,
        size: 24,
      );
    } else {
      return Container();
    }
  }
}

class _DeleteAlert extends GetView<IndexPageController> {
  const _DeleteAlert({Key? key, required this.controllerId}) : super(key: key);

  final int controllerId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: UiConstants.defaultPadding),
      constraints: const BoxConstraints(
        maxWidth: 150,
      ),
      child: Obx(() {
        if (controller.controllerDeleting.isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => Get.back(result: "noo"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[400])),
                  child: Text("cancel".tr)),
              ElevatedButton(
                  onPressed: () async {
                    bool result =
                        await controller.deleteController(controllerId);
                    Get.back(result: result);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[300])),
                  child: Text("confirm".tr)),
            ],
          );
        }
      }),
    );
  }
}
