import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_page_controller.dart';

class SettingsDialog extends GetView<LoginPageController> {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(
          maxHeight: 300,
          maxWidth: 300,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  splashRadius: 20,
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const SizedBox(
                  width: 250,
                  child: _HostAddress(),
                ),
                IconButton(
                  splashRadius: 20,
                  onPressed: controller.hostSave,
                  icon: Icon(
                    Icons.save,
                    color: Colors.green[300],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HostAddress extends GetView<LoginPageController> {
  const _HostAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller.hostAddressTextEditingController,
      decoration: InputDecoration(labelText: "host_address".tr),
    );
  }
}
