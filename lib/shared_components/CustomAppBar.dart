import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'app_bar_title.dart';
import 'icon_button_with_effect.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).appBarTheme.backgroundColor!,
      child: Row(
        children: <Widget>[
          const AppBarTitle(
            padding: EdgeInsets.only(left: UiConstants.defaultPadding * 2),
          ),
          Expanded(
              child: Column(
                children: [
                  WindowTitleBarBox(
                    child: MoveWindow(),
                  )
                ],
              )),
          const ActionButtons(),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: UiConstants.defaultPadding*2),
          child: Row(children: <Widget>[
            IconButtonHoverWithEffect(
              icon: Icons.settings,
              size: 25,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
              hoverColor: Theme.of(context).appBarTheme.shadowColor!,
            ),
            IconButtonHoverWithEffect(
              icon: Icons.dark_mode_sharp,
              size: 25,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
              hoverColor: Theme.of(context).appBarTheme.shadowColor!,
            ),
          ]),
        ),
        MinimizeWindowButton(
          colors: WindowButtonColors(
              mouseOver: Theme.of(context).appBarTheme.shadowColor),
        ),
        MaximizeWindowButton(
          colors: WindowButtonColors(
              mouseOver: Theme.of(context).appBarTheme.shadowColor),
        ),
        CloseWindowButton()
      ],
    );
  }
}
