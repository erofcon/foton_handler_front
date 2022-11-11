import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ControllerIndicators extends StatelessWidget {
  const ControllerIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(
          horizontal: UiConstants.defaultPadding * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: const <Widget>[
              Text("Напряжение 123"),
              Text("Реле 1"),
            ],
          ),
          Column(
            children: const <Widget>[
              Text("Power 123"),
              Text("Light mode 1"),
            ],
          ),
          const Text("Temperature 123"),
        ],
      ),
    );
  }
}
