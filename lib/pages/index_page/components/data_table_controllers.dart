import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/one_controller_view_page.dart';
import 'package:get/get.dart';

import '../../../shared_components/icon_button_with_effect.dart';
import '../../../utils/constants.dart';
import '../controllers/controllers_tab_controller.dart';

class ControllersDataTable extends StatelessWidget {
  const ControllersDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllersTabController>(
      init: ControllersTabController(),
      builder: (controller) => PaginatedDataTable2(
        source: ControllerDataSource(
            controller.isSearch ? controller.filterData : controller.data),
        columnSpacing: 12,
        horizontalMargin: 12,
        rowsPerPage: controller.rowPages,
        onRowsPerPageChanged: (r) => controller.changeRowPages(r!),
        wrapInCard: false,
        empty: const Text("No data"),
        columns: const [
          DataColumn2(label: Text("№")),
          DataColumn2(label: Text("controller_address")),
          DataColumn2(label: Text("status")),
          DataColumn2(label: Text("")),
        ],
      ),
    );
  }
}

class ControllerDataSource extends DataTableSource {
  ControllerDataSource(
    this._data,
  );

  final List<Map<String, dynamic>> _data;

  @override
  DataRow? getRow(int index) {
    return DataRow2(
      onTap: () => Get.dialog(const OneControllerViewPage()),
      cells: [
        DataCell(Text(_data[index]['№'].toString())),
        DataCell(Text(_data[index]['controller_address'].toString())),
        // const DataCell(
        //   Chip(
        //     backgroundColor: Colors.green,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(
        //             Radius.circular(UiConstants.defaultPadding * 0.3))),
        //     label: Text(
        //       "Connection",
        //       style: TextStyle(
        //           fontSize: 12,
        //           fontWeight: FontWeight.w600,
        //           color: Colors.white),
        //     ),
        //   ),
        // ),
        DataCell(Text(_data[index]['status'].toString())),
        DataCell(IconButtonHoverWithEffect(
          onTap: (){},
          icon: Icons.delete,
          iconColor: Colors.red,
          hoverColor: Colors.red[100]!,
          backgroundColor: Colors.transparent,
          size: 24,
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
