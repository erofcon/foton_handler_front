import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import 'add_container_dialog.dart';
import 'data_table_search.dart';

class DataTableHeader extends StatelessWidget {
  const DataTableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () => Get.dialog(
            const AddContainerDialog(),
          ),
          icon: const Icon(Icons.add),
          label: const Text("add"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
        ),
        const SizedBox(
          width: UiConstants.defaultPadding,
        ),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 45,
          ),
          child: const DataTableSearch(),
        ),
      ],
    );
  }
}
