import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/controllers_view/components/legend.dart';
import 'package:foton_handler_front/utils/constants.dart';

import 'components/controller_panel_app_bar.dart';
import 'controllers_list.dart';

class ControllerPanel extends StatelessWidget {
  const ControllerPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ControllerPanelAppBar(),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: UiConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: UiConstants.defaultPadding * 2,
              ),
              LegendWidget(
                  name: "подключение установлено", color: Colors.green),
              SizedBox(
                height: UiConstants.defaultPadding * 0.2,
              ),
              LegendWidget(name: "ошибка подключения", color: Colors.red),
              SizedBox(
                height: UiConstants.defaultPadding * 2,
              ),
              ControllerSearch(),
              SizedBox(
                height: UiConstants.defaultPadding * 2,
              ),
              // ControllersList()
            ],
          ),
        ),
      ],
    );
  }
}

class ControllerSearch extends StatelessWidget {
  const ControllerSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 40,
          maxWidth: 300
        ),
        border: OutlineInputBorder(),
        label: Text("Поиск"),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
