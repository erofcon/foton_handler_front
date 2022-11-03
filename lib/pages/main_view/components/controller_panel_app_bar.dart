import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_components/icon_button_with_effect.dart';
import '../../../utils/constants.dart';

class ControllerPanelAppBar extends StatelessWidget {
  const ControllerPanelAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      color: Theme.of(context).appBarTheme.shadowColor!,
      child: Padding(
        padding: const EdgeInsets.all(UiConstants.defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("controllers".tr.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1)),
            Row(
              children: <Widget>[
                IconButtonHoverWithEffect(
                  icon: Icons.refresh,
                  size: 25,
                  backgroundColor: Theme.of(context).appBarTheme.shadowColor!,
                  hoverColor: Theme.of(context).appBarTheme.backgroundColor!,
                ),
                const SizedBox(width: UiConstants.defaultPadding * 0.5),
                Text(
                  "${"last_refresh".tr}: 23.10.1996",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: UiConstants.defaultPadding,
                ),
                Text(
                  "${"controllers_count".tr}: 123",
                  style: const TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
