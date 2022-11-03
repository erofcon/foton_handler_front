import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerSearch extends StatelessWidget {
  const ControllerSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text("search".tr),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
