import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/index_page/controllers/index_page_controller.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import 'add_container_dialog.dart';
import 'data_table_search.dart';

class DataTableHeader extends GetView<IndexPageController> {
  const DataTableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _DataCollectionsStatus(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            if (controller.loginPageController.user.value.isSuperUser == true)
              ElevatedButton.icon(
                onPressed: () {
                  Get.closeAllSnackbars();
                  Get.dialog(
                    AddContainerDialog(),
                  ).then((result) {
                    if (result == true) {
                      Get.snackbar("success".tr, "success_add_controller".tr,
                          margin: EdgeInsets.zero,
                          duration: const Duration(seconds: 1),
                          borderRadius: 0,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green[300]);
                    } else if (result == false) {
                      Get.snackbar("error".tr, "error_add_controller".tr,
                          margin: EdgeInsets.zero,
                          duration: const Duration(seconds: 1),
                          borderRadius: 0,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red[300]);
                    }
                    controller.clearTextEditingControllers();
                  });
                },
                icon: const Icon(Icons.add),
                label: Text("add".tr),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[400])),
              ),
            const SizedBox(
              width: UiConstants.defaultPadding,
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 300,
                maxHeight: 45,
              ),
              child: const DataTableSearch(),
            ),
          ],
        ),
      ],
    );
  }
}

class _DataCollectionsStatus extends GetView<IndexPageController> {
  const _DataCollectionsStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("${"data_collections_status".tr}: "),
        const _GetStatus(),
        const SizedBox(
          width: UiConstants.defaultPadding,
        ),
        if (controller.loginPageController.user.value.isSuperUser == true)
          ButtonBar(
            buttonPadding:
                const EdgeInsets.all(UiConstants.defaultPadding * 0.3),
            children: <Widget>[
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[400])),
                onPressed: () => controller.setDataCollectionsResume(),
                icon: const Icon(Icons.arrow_right_outlined),
                label: Text("resume_button".tr),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange[400])),
                onPressed: () => controller.setDataCollectionsPause(),
                icon: const Icon(Icons.pause),
                label: Text("pause_button".tr),
              ),
            ],
          ),
      ],
    );
  }
}

class _GetStatus extends GetView<IndexPageController> {
  const _GetStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.checkDataCollectionsStatusResponse.value.taskStatus !=
          null) {
        if (controller.checkDataCollectionsStatusResponse.value.taskStatus ==
            0) {
          return Text(
            "stopped".tr,
            style: TextStyle(
              color: Colors.red[400],
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,
            ),
          );
        } else if (controller
                .checkDataCollectionsStatusResponse.value.taskStatus ==
            1) {
          return Text(
            "works".tr,
            style: TextStyle(
              color: Colors.green[400],
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,
            ),
          );
        } else {
          return Text(
            "pause".tr,
            style: TextStyle(
              color: Colors.orange[400],
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,
            ),
          );
        }
      } else {
        return Text(
          "no_data".tr,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.double,
          ),
        );
      }
    });
  }
}
