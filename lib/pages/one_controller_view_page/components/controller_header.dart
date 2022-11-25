import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/controllers/one_controller_view_page_controller.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/one_controller_view_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../shared_components/icon_button_with_effect.dart';
import '../../../utils/constants.dart';
import '../../../utils/date_time_select.dart';

class ControllerHeader extends GetView<OneControllerViewPage> {
  const ControllerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: UiConstants.defaultPadding,
          vertical: UiConstants.defaultPadding * 0.5),
      child: ListTile(
        leading: IconButtonHoverWithEffect(
          onTap: () => Get.back(),
          icon: Icons.arrow_back,
          size: 34,
          backgroundColor: Colors.transparent,
          iconColor: Get.isDarkMode ? Colors.white : Colors.blue,
          hoverColor: Get.isDarkMode
              ? Theme.of(context).appBarTheme.backgroundColor!
              : Colors.blue[200]!,
        ),
        title: Text(
          Get.arguments['controller_address'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: GetBuilder<OneControllerViewPageController>(
          builder: (controller) => Wrap(
            spacing: UiConstants.defaultPadding,
            children: [
              OutlinedButton(
                onPressed: () => controller.getChartData(
                    startDatetime:
                        DateTime.now().subtract(const Duration(days: 7)),
                    endDatetime: DateTime.now()),
                child: const Text("данные за неделю"),
              ),
              OutlinedButton(
                onPressed: () => controller.getChartData(),
                child: Text("data_for_today".tr),
              ),
              OutlinedButton(
                onPressed: () async {
                  final date = await selectDate(context);
                  if (date == null) return;

                  DateTime dateTime = DateTime(
                    date.year,
                    date.month,
                    date.day,
                  );
                  controller.setStartTime(dateTime);

                  if (controller.endDate != null) {
                    if (controller.startDate!.isBefore(controller.endDate!) ||
                        controller.startDate == controller.endDate) {
                      controller.getChartData(
                          startDatetime: controller.startDate,
                          endDatetime: controller.endDate);
                    }
                  }
                },
                child: Text(
                  controller.startDate != null
                      ? DateFormat('d MMM yyyy').format(controller.startDate!)
                      : "start_date".tr,
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  final date = await selectDate(context);
                  if (date == null) return;

                  DateTime dateTime = DateTime(
                    date.year,
                    date.month,
                    date.day,
                  );
                  controller.setEndTime(dateTime);

                  if (controller.startDate != null) {
                    if (controller.startDate!.isBefore(controller.endDate!) ||
                        controller.startDate == controller.endDate) {
                      controller.getChartData(
                          startDatetime: controller.startDate,
                          endDatetime: controller.endDate);
                    }
                  }
                },
                child: Text(
                  controller.endDate != null
                      ? DateFormat('d MMM yyyy').format(controller.endDate!)
                      : "end_date".tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
