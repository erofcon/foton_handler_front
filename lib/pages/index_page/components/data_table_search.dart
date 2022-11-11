import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers_tab_controller.dart';


class DataTableSearch extends GetView<ControllersTabController> {
  const DataTableSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: controller.onSearch,
      controller: controller.searchTextEditingController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        hintText: 'enter ip address',
        labelText: 'search',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
