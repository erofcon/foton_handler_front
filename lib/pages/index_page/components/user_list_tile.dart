import 'package:flutter/material.dart';

import '../../../shared_components/icon_button_with_effect.dart';


class UserListTile extends StatelessWidget {
  const UserListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      constraints: const BoxConstraints(maxWidth: 100, maxHeight: 300),
      child: ListTile(
        leading: _buildAvatar(),
        title: _buildName(),
        subtitle: const Text("administrator"),
        trailing: IconButtonHoverWithEffect(
          onTap: (){},
          icon: Icons.delete,
          iconColor: Colors.red,
          hoverColor: Colors.red[100]!,
          backgroundColor: Colors.transparent,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.orange[300],
      child: const Text(
        "A",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      "admin".toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
