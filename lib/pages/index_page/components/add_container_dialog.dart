import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/index_page_controller.dart';

class AddContainerDialog extends GetView<IndexPageController> {
  AddContainerDialog({Key? key}) : super(key: key);

  final GlobalKey<FormState> addContainerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      constraints: const BoxConstraints(maxHeight: 280),
      child: Form(
        key: addContainerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _IpField(),
            const _LoginField(),
            const _PasswordField(),
            _SubmitButton(addContainerFormKey: addContainerFormKey),
          ],
        ),
      ),
    ));
  }
}


class _IpField extends GetView<IndexPageController> {
  const _IpField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 15,
      keyboardType: TextInputType.name,
      controller: controller.ipEditingController,
      decoration: InputDecoration(labelText: "enter_ip_address".tr),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "error_enter_ip_address".tr;
        }
        return null;
      },
    );
  }
}

class _LoginField extends GetView<IndexPageController> {
  const _LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller.controllerLoginEditingController,
      decoration: InputDecoration(labelText: "enter_controller_login".tr),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "error_enter_controller_login".tr;
        }
        return null;
      },
    );
  }
}

class _PasswordField extends GetView<IndexPageController> {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller.controllerPasswordEditingController,
      decoration: InputDecoration(labelText: "enter_controller_password".tr),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "error_enter_controller_password".tr;
        }
        return null;
      },
    );
  }
}

class _SubmitButton extends GetView<IndexPageController> {
  const _SubmitButton({Key? key, required this.addContainerFormKey})
      : super(key: key);

  final GlobalKey<FormState> addContainerFormKey;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.controllerAdding.isTrue) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ElevatedButton.icon(
          onPressed: () async {
            if (!addContainerFormKey.currentState!.validate()) {
              return;
            }
            bool result = await controller.addController();
            Get.back(result: result);
          },
          icon: const Icon(Icons.add),
          label: Text("controller_add".tr),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[400])),
        );
      }
    });
  }
}
