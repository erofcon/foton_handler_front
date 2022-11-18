import 'package:flutter/material.dart';
import 'package:foton_handler_front/shared_components/customAppBar.dart';
import 'package:foton_handler_front/utils/constants.dart';
import 'package:get/get.dart';

import 'components/data_table_controllers.dart';
import 'components/data_table_header.dart';
import 'components/index_header.dart';
import 'controllers/index_page_controller.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            IndexHeader(),
            BuildControllersTab(),
          ],
        ),
      ),
    );
  }
}

class BuildControllersTab extends GetView<IndexPageController> {
  const BuildControllersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.dataLoading.isTrue) {
        return const Padding(
          padding: EdgeInsets.only(top: UiConstants.defaultPadding * 2),
          child: CircularProgressIndicator(),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: UiConstants.defaultPadding,
              horizontal: UiConstants.defaultPadding * 2),
          child: Column(
            children: <Widget>[
              const DataTableHeader(),
              SizedBox(
                height: context.height - 200,
                child: const ControllersDataTable(),
              )
            ],
          ),
        );
      }
    });
  }
}
