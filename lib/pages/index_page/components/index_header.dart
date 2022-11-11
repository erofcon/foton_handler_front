import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_components/icon_button_with_effect.dart';
import '../../../utils/constants.dart';
import '../controllers/controllers_tab_controller.dart';

class IndexHeader extends GetView<ControllersTabController> {
  const IndexHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Theme.of(context).appBarTheme.shadowColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: UiConstants.defaultPadding,
            horizontal: UiConstants.defaultPadding * 2),
        child: Row(
          children: <Widget>[
            const Text(
              "Controllers",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.4),
            ),
            const Spacer(),
            IconButtonHoverWithEffect(
              onTap: () {
                controller.getControllers();
              },
              icon: Icons.sync,
              size: 24,
              iconColor: Colors.white,
              hoverColor: Theme.of(context).appBarTheme.backgroundColor!,
              backgroundColor: Theme.of(context).appBarTheme.shadowColor!,
            ),
            const Text(
              "last refresh: 6  hour ago",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(
              width: UiConstants.defaultPadding * 2,
            ),
            const Text(
              "all controllers: 232",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
