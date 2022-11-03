import 'package:flutter/material.dart';
import 'package:foton_handler_front/utils/constants.dart';
import 'package:get/get.dart';

class ControllersList extends StatelessWidget {
  const ControllersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height - 350,
      child: Material(
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          addSemanticIndexes: false,
          itemCount: 50,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: UiConstants.defaultPadding,
              ),
              child: Controller(
                leading: index.toString(),
                title: "192.168.1.251",
                trailing: "${"charge_level".tr}: 12",
                color: Colors.green[300]!,
                hoverColor: Colors.green[200]!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class Controller extends StatelessWidget {
  const Controller({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    required this.color,
    required this.hoverColor,
  }) : super(key: key);

  final String leading;
  final String title;
  final String trailing;
  final Color color;
  final Color hoverColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(UiConstants.defaultPadding * 0.3)),
      onTap: () {},
      leading: Text(
        leading,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      trailing: Text(
        trailing,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      tileColor: color,
      hoverColor: hoverColor,
    );
  }
}
