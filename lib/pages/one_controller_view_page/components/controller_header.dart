import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_components/icon_button_with_effect.dart';
import '../../../utils/constants.dart';

class ControllerHeader extends StatelessWidget {
  const ControllerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: UiConstants.defaultPadding),
      child: ListTile(
        leading: IconButtonHoverWithEffect(
          onTap: () => Get.back(),
          icon: Icons.arrow_back,
          size: 34,
          backgroundColor: Colors.transparent,
          iconColor: Colors.blue,
          hoverColor: Colors.blue[100]!,
        ),
        title: const Text(
          "192.168.1.251",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          "last update: 23.10.1996:12-07",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
