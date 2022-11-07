import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DrawerList(
            title: "admin_panel".tr,
            icon: Icons.admin_panel_settings,
            press: () => Get.toNamed(RoutesClass.adminPanel))
      ],
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList(
      {Key? key, required this.title, required this.icon, required this.press})
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(UiConstants.defaultPadding * 0.3)),
      style: ListTileStyle.drawer,
      onTap: press,
      horizontalTitleGap: 1.0,
      leading: Icon(icon),
      title: Text(
        title,
      ),
    );
  }
}
