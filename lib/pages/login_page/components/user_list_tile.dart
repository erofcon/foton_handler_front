import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/login_page/controllers/login_page_controller.dart';
import 'package:get/get.dart';

import '../../../shared_components/icon_button_with_effect.dart';
import '../models/get_all_users_response.dart';

class UserListTile extends GetView<LoginPageController> {
  const UserListTile({Key? key, required this.user}) : super(key: key);

  final GetAllUserResponse user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      constraints: const BoxConstraints(maxWidth: 100, maxHeight: 300),
      child: ListTile(
        leading: _buildAvatar(),
        title: Text(user.username!),
        subtitle: Text(user.isSuperUser! ? 'super_user'.tr : 'user'.tr),
        trailing: IconButtonHoverWithEffect(
          onTap: () => controller.deleteUser(user.id!),
          icon: Icons.delete,
          iconColor: Colors.red[300]!,
          hoverColor: Colors.red[100]!,
          backgroundColor: Colors.transparent,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.orange[400],
      child: Text(
        (() {
          if (user.username != '') {
            return user.username![0].toUpperCase();
          }
          return '';
        })(),
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
