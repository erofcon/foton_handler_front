import 'package:flutter/material.dart';
import 'package:foton_handler_front/utils/constants.dart';
import 'package:get/get.dart';

import '../../shared_components/customAppBar.dart';
import '../../utils/responsive.dart';
import 'components/controller_search.dart';
import 'components/controllers_data_table.dart';
import 'components/controllers_status_bar.dart';
import 'components/legend.dart';
import 'components/side_bar.dart';

class ControllersView extends StatelessWidget {
  const ControllersView({Key? key}) : super(key: key);

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
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Flexible(flex: 2, child: BuildSidebar()),
                Flexible(flex: 10, child: BuildPage()),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BuildSidebar extends StatelessWidget {
  const BuildSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(UiConstants.defaultPadding),
      child: SideBar(),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ControllersStatusBar(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: UiConstants.defaultPadding * 2,
            horizontal: UiConstants.defaultPadding * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              LegendWidget(
                  name: "подключение установлено", color: Colors.green),
              SizedBox(
                height: UiConstants.defaultPadding * 0.2,
              ),
              LegendWidget(name: "ошибка подключения", color: Colors.red),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UiConstants.defaultPadding * 2,
          ),
          child: ControllerSearch(),
        ),
        Container(
          padding: const EdgeInsets.all(UiConstants.defaultPadding * 1.8),
          height: context.height - 300,
          child: const ControllersDataTable(),
        ),
      ],
    );
  }
}
