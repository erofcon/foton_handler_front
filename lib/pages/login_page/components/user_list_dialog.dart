import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/login_page/components/user_list_tile.dart';
import 'package:foton_handler_front/pages/login_page/controllers/login_page_controller.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class UserListDialog extends GetView<LoginPageController> {
  UserListDialog({Key? key}) : super(key: key);

  final GlobalKey<FormState> addContainerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        _SubmitButton(addContainerFormKey: addContainerFormKey),
      ],
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(
          maxHeight: 300,
          maxWidth: 300,
        ),
        child: Column(
          children: <Widget>[
            Obx(() {
              if (controller.loadAllUsers.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.allUsers.length,
                    itemBuilder: (context, index) =>
                        UserListTile(user: controller.allUsers[index]),
                  ),
                );
              }
            }),
            Obx(() {
              if (controller.addUserWidget.isFalse) {
                return Container();
              } else {
                return Form(
                  key: addContainerFormKey,
                  child: Column(
                    children: <Widget>[
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            onPressed: () => controller.addUserWidget(false),
                            icon: const Icon(Icons.close),
                            splashRadius: 15,
                          ),
                        ],
                      ),
                      const _LoginField(),
                      const _PasswordField(),
                      const _IsSuperUser(),
                    ],
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class _LoginField extends GetView<LoginPageController> {
  const _LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller.userLoginTextEditingController,
      decoration: InputDecoration(labelText: "login".tr),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "login_enter".tr;
        }
        return null;
      },
    );
  }
}

class _PasswordField extends GetView<LoginPageController> {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller.userPasswordTextEditingController,
      decoration: InputDecoration(labelText: "password".tr),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "password_enter".tr;
        }
        return null;
      },
    );
  }
}

class _IsSuperUser extends GetView<LoginPageController> {
  const _IsSuperUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: UiConstants.defaultPadding),
      child: Row(
        children: <Widget>[
          Obx(
            () => Checkbox(
              value: controller.isSuperUserStatus.value,
              onChanged: (bool? value) => controller.isSuperUserStatus(value),
            ),
          ),
          Text('is_super_user'.tr),
        ],
      ),
    );
  }
}

class _SubmitButton extends GetView<LoginPageController> {
  const _SubmitButton({Key? key, required this.addContainerFormKey})
      : super(key: key);

  final GlobalKey<FormState> addContainerFormKey;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.userAdding.isTrue) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ElevatedButton.icon(
          onPressed: () async {
            if (controller.addUserWidget.isFalse) {
              controller.addUserWidget(true);
              return;
            }
            if (!addContainerFormKey.currentState!.validate()) {
              return;
            }
            bool result = await controller.createUser();
            Get.back(result: result);
          },
          icon: const Icon(Icons.add),
          label: Text("controller_add".tr),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
        );
      }
    });
  }
}
