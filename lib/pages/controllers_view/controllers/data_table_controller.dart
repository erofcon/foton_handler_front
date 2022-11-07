import 'dart:math';

import 'package:get/get.dart';

class DataTableController extends GetxController {
  final List<Map<String, dynamic>> data = List.generate(
      200,
      (index) => {
            '№': index,
            "IP Address": "192.168.1.251",
            "charge level": Random().nextInt(1000),
          });
}
