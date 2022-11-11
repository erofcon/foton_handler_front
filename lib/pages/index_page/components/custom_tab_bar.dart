import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.controllersTab,
    required this.createUserTab,
  }) : super(key: key);
  final Widget controllersTab;
  final Widget createUserTab;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxWidth: 250),
          padding: const EdgeInsets.symmetric(
              horizontal: UiConstants.defaultPadding),
          child: TabBar(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.focused)
                    ? null
                    : Colors.transparent;
              },
            ),
            controller: _tabController,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: const [
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(top: UiConstants.defaultPadding),
                  child: Text(
                    "controllers",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(top: UiConstants.defaultPadding),
                  child: Text(
                    "users",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              widget.controllersTab,
              widget.createUserTab,
            ],
          ),
        ),
      ],
    );
  }
}
