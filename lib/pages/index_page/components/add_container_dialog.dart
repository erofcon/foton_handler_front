import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContainerDialog extends StatelessWidget {
  const AddContainerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        constraints: const BoxConstraints(maxHeight: 350, maxWidth: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.close,
                  ),
                  splashRadius: 24,
                )
              ],
            ),
            const SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ip address',
                ),
                maxLength: 15,
              ),
            ),
            const SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'login',
                ),
              ),
            ),
            const SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("add"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
            const Text("assasasa")
          ],
        ),
      ),
    );
  }
}
