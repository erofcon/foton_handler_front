import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/login_page/controllers/login_page_controller.dart';
import 'package:foton_handler_front/shared_components/customAppBar.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 230.0, left: 50.0, right: 50.0),
          height: 550.0,
          constraints: const BoxConstraints(maxWidth: 300),
          child: Form(
            // key: controller.formKey.value,
            child: Column(
              children: const <Widget>[
                LoginField(),
                PasswordField(),
                KeepUser(),
                SubmitButton(),
                Padding(
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
      decoration: const InputDecoration(labelText: "Login"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please send login";
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
      decoration: const InputDecoration(labelText: "Password"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please send password";
        }
        return null;
      },
    );
  }
}

class KeepUser extends GetView<LoginPageController> {
  const KeepUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: UiConstants.defaultPadding),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          const Text('keep me')
        ],
      ),
    );
  }
}

class SubmitButton extends GetView<LoginPageController> {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if(await controller.login()){
          Get.toNamed(RoutesClass.home);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal),
        elevation: MaterialStateProperty.all(10),
      ),
      child: const Icon(Icons.arrow_forward),
    );
  }
}
