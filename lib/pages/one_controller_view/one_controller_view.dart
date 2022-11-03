import 'package:flutter/material.dart';
import 'package:foton_handler_front/shared_components/CustomAppBar.dart';

import 'components/controller_header.dart';
import 'components/controller_indicators.dart';

class OneControllerView extends StatelessWidget {
  const OneControllerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            ControllerHeader(),
            Divider(),
            ControllerIndicators(),
          ],
        ),
      ),
    );
  }
}
