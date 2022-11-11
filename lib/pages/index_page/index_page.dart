import 'package:flutter/material.dart';
import 'package:foton_handler_front/shared_components/customAppBar.dart';
import 'package:foton_handler_front/utils/constants.dart';
import 'package:foton_handler_front/utils/responsive.dart';
import 'package:get/get.dart';

import 'components/data_table_controllers.dart';
import 'components/custom_tab_bar.dart';
import 'components/data_table_header.dart';
import 'components/index_header.dart';
import 'components/user_list_tile.dart';
import 'controllers/controllers_tab_controller.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: ResponsiveBuilder(
          mobileBuilder: (context, constraints) {
            return Container();
          },
          tabletBuilder: (context, constraints) {
            return Container();
          },
          desktopBuilder: (context, constraints) {
            return Column(
              children: <Widget>[
                const IndexHeader(),
                SizedBox(
                  height: context.height - 150,
                  child: const CustomTabBar(
                    controllersTab: BuildControllersTab(),
                    createUserTab: BuildCreateUserTab(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BuildControllersTab extends GetView<ControllersTabController> {
  const BuildControllersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return const Center(
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
                height: context.height - 300,
                child: const ControllersDataTable(),
              )
            ],
          ),
        );
      }
    });
  }
}

class BuildCreateUserTab extends StatelessWidget {
  const BuildCreateUserTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: UiConstants.defaultPadding,
          horizontal: UiConstants.defaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("add"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
          ),
          const SizedBox(
            height: UiConstants.defaultPadding * 2,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const UserListTile()),
          ),
        ],
      ),
    );
  }
}
