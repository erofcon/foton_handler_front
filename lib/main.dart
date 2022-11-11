import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foton_handler_front/localization/localization.dart';
import 'package:foton_handler_front/pages/login_page/controllers/login_page_controller.dart';
import 'package:foton_handler_front/routes/routes.dart';
import 'package:foton_handler_front/services/theme_service.dart';
import 'package:foton_handler_front/theme/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await initialize();
  runApp(const MyApp());
}

Future<void> initialize() async {
  await GetStorage.init();
  Get.lazyPut<LoginPageController>(() => LoginPageController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesClass.home,
      getPages: RoutesClass.routes,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      translations: Localization(),
      locale: const Locale('ru', 'RU'),
      fallbackLocale: const Locale('en', 'US'),
      scrollBehavior: CustomScrollBehaviour(),
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
