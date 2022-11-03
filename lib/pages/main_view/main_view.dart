// import 'package:flutter/material.dart';
// import 'package:foton_handler_front/shared_components/web_app_bar.dart';
// import 'package:foton_handler_front/utils/constants.dart';
// import 'package:foton_handler_front/utils/responsive.dart';
// import 'package:get/get.dart';
//
// import '../../shared_components/side_bar.dart';
// import '../../shared_components/windows_app_bar.dart';
// import 'controller_panel.dart';
//
// class MainView extends StatelessWidget {
//   const MainView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           // const CustomAppBar(),
//           ResponsiveBuilder(
//             mobileBuilder: (context, constraints) {
//               return Container(
//                 color: Colors.orange,
//                 width: context.width,
//                 height: context.height / 2,
//               );
//             },
//             tabletBuilder: (context, constraints) {
//               return Container(
//                 color: Colors.blueAccent,
//                 width: context.width,
//                 height: context.height / 2,
//               );
//             },
//             desktopBuilder: (context, constraints) {
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const <Widget>[
//                   Flexible(flex: 2, child: BuildSideBar()),
//                   Flexible(flex: 10, child: ControllerPanel()),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
//   const CustomAppBar({Key? key}) : super(key: key);
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     if (GetPlatform.isWindows) {
//       return const WindowsAppBar();
//     } else if (GetPlatform.isWeb) {
//       return const WebAppBar();
//     } else {
//       return Container();
//     }
//   }
// }
//
// class BuildSideBar extends StatelessWidget {
//   const BuildSideBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.only(top: UiConstants.defaultPadding),
//       child: SideBar(),
//     );
//   }
// }
