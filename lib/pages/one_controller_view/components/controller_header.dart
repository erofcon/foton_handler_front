import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class ControllerHeader extends StatelessWidget {
  const ControllerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: UiConstants.defaultPadding * 2),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  iconSize: 38,
                  splashRadius: 23,
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.chevron_left)),
              const SizedBox(
                width: UiConstants.defaultPadding,
              ),
              const Icon(Icons.inbox, size: 38, color: Colors.black38),
              const SizedBox(
                width: UiConstants.defaultPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "192.168.1.251",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "23.10.1996:12:48",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
          IconButton(
              iconSize: 30,
              splashRadius: 23,
              onPressed: () {},
              icon: Icon(
                Icons.delete_rounded,
                color: Theme.of(context).appBarTheme.backgroundColor,
              )),
        ],
      ),
    );
  }
}
