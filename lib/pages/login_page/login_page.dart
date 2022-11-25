import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/login_page/controllers/login_page_controller.dart';
import 'package:foton_handler_front/shared_components/customAppBar.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const LoginField(),
                const PasswordField(),
                SubmitButton(formKey: formKey),
                const Padding(
                  padding: EdgeInsets.only(top: UiConstants.defaultPadding),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginField extends GetView<LoginPageController> {
  const LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller.loginEditingController,
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

class PasswordField extends GetView<LoginPageController> {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.name,
      controller: controller.passwordEditingController,
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

class SubmitButton extends GetView<LoginPageController> {
  const SubmitButton({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.checkLogin.isTrue) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ElevatedButton.icon(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }
            if (await controller.login()) {
              Get.toNamed(RoutesClass.home);
            } else {
              Get.snackbar("error".tr, "error_login".tr,
                  margin: EdgeInsets.zero,
                  duration: const Duration(seconds: 4),
                  borderRadius: 0,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red[300]);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).appBarTheme.backgroundColor),
            elevation: MaterialStateProperty.all(10),
          ),
          icon: const Icon(Icons.arrow_forward),
          label: Text("log_in".tr),
        );
      }
    });
  }
}
