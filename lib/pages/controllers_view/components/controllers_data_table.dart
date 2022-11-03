import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../one_controller_view/one_controller_view.dart';

class ControllersDataTable extends StatelessWidget {
  const ControllersDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      source: ControllerDataSource(),
      columnSpacing: 12,
      horizontalMargin: 12,
      rowsPerPage: 20,
      columns: [
        const DataColumn2(label: Text("№")),
        const DataColumn2(label: Text("IP Address")),
        const DataColumn2(label: Text("Status")),
        const DataColumn2(label: Text("")),
        DataColumn2(label: Text("charge_level".tr)),
        const DataColumn2(label: Text("")),
      ],
    );
  }
}

class ControllerDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            '№': index,
            "IP Address": "192.168.1.251",
            "charge level": Random().nextInt(1000),
          });

  @override
  DataRow? getRow(int index) {
    return DataRow2(onTap: () => Get.dialog(const OneControllerView()), cells: [
      DataCell(Text(_data[index]['№'].toString())),
      DataCell(Text(_data[index]['IP Address'].toString())),
      const DataCell(
        Chip(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(UiConstants.defaultPadding * 0.3))),
          label: Text(
            "Connection",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
      const DataCell(Text("")),
      DataCell(Text(_data[index]['charge level'].toString())),
      const DataCell(Text("")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
