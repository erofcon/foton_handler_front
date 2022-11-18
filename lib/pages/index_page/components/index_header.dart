import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../shared_components/icon_button_with_effect.dart';
import '../../../utils/constants.dart';
import '../controllers/index_page_controller.dart';

class IndexHeader extends GetView<IndexPageController> {
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
            Text(
              "controllers".tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.4),
            ),
            const Spacer(),
            IconButtonHoverWithEffect(
              onTap: () {
                controller.asyncInit();
              },
              icon: Icons.sync,
              size: 24,
              iconColor: Colors.white,
              hoverColor: Theme.of(context).appBarTheme.backgroundColor!,
              backgroundColor: Theme.of(context).appBarTheme.shadowColor!,
            ),
            const SizedBox(
              width: UiConstants.defaultPadding * 0.5,
            ),
            GetBuilder<IndexPageController>(builder: (controller) {
              return StreamBuilder(
                stream: Stream.periodic(const Duration(minutes: 1)),
                builder: (context, snapshot) {
                  return Text(
                    (() {
                      return "${"last_refresh".tr}: ${timeago.format(controller.updateTime)}";
                    })(),
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  );
                },
              );
            }),
            const SizedBox(
              width: UiConstants.defaultPadding * 2,
            ),
            Obx(() => Text(
                  "${"count_controllers".tr}: ${controller.controllersCount}",
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
