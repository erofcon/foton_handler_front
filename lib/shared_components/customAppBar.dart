import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/login_page/components/setings_dialog.dart';
import 'package:foton_handler_front/pages/login_page/controllers/login_page_controller.dart';
import 'package:get/get.dart';

import '../pages/login_page/components/user_list_dialog.dart';
import '../services/theme_service.dart';
import '../utils/constants.dart';
import 'icon_button_with_effect.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).appBarTheme.backgroundColor!,
      child: Row(
        children: <Widget>[
          const _AppBarTitle(
            padding: EdgeInsets.only(left: UiConstants.defaultPadding * 2),
          ),
          Expanded(
              child: Column(
            children: [
              WindowTitleBarBox(
                child: MoveWindow(),
              )
            ],
          )),
          const _ActionButtons(),
        ],
      ),
    );
  }
}

class _ActionButtons extends GetView<LoginPageController> {
  const _ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: UiConstants.defaultPadding * 2),
          child: Row(children: <Widget>[
            const _UserActions(),
            if (!GetPlatform.isWeb)
              IconButtonHoverWithEffect(
                onTap: () => Get.dialog(const SettingsDialog()),
                icon: Icons.settings,
                size: 25,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
                hoverColor: Theme.of(context).appBarTheme.shadowColor!,
              ),
            IconButtonHoverWithEffect(
              onTap: () {
                ThemeService().changeThemeMode();
              },
              icon: Icons.emoji_objects,
              size: 25,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
              hoverColor: Theme.of(context).appBarTheme.shadowColor!,
            ),
          ]),
        ),
        MinimizeWindowButton(
          colors: WindowButtonColors(
              mouseOver: Theme.of(context).appBarTheme.shadowColor),
        ),
        MaximizeWindowButton(
          colors: WindowButtonColors(
              mouseOver: Theme.of(context).appBarTheme.shadowColor),
        ),
        CloseWindowButton()
      ],
    );
  }
}

class _UserActions extends GetView<LoginPageController> {
  const _UserActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user.value.username == null) {
        return Container();
      } else {
        return PopupMenuButton(
          child: Container(
            padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(UiConstants.defaultPadding * 0.8),
              ),
              color: Theme.of(context).appBarTheme.shadowColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: UiConstants.defaultPadding * 0.5,
                ),
                Text(
                  controller.user.value.username ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          onSelected: (value) {
            if (value == 'logout') {
              controller.logout();
            }
            if (value == 'user') {
              controller.getAllUsers();
              Get.dialog(UserListDialog()).then((result) {
                controller.closeAddUserDialog();

                if (result == true) {
                  Get.snackbar("success".tr, "add_success".tr,
                      margin: EdgeInsets.zero,
                      duration: const Duration(seconds: 2),
                      borderRadius: 0,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green[300]);
                } else if (result == false) {
                  Get.snackbar("error".tr, "add_error".tr,
                      margin: EdgeInsets.zero,
                      duration: const Duration(seconds: 2),
                      borderRadius: 0,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red[300]);
                }
              });
            }
          },
          itemBuilder: (BuildContext bc) {
            return [
              if (controller.user.value.isSuperUser == true)
                PopupMenuItem(
                  value: 'user',
                  child: Text("users".tr),
                ),
              PopupMenuItem(
                value: 'logout',
                child: Text("logout".tr),
              ),
            ];
          },
        );
      }
    });
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key, required this.padding}) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: const Text(
          "Foton handler v 0.1b",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ));
  }
}
