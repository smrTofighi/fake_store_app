import 'package:device_preview/device_preview.dart';
import 'package:fake_store_app/core/themes/light_theme.dart';
import 'package:fake_store_app/routes/name.dart';
import 'package:fake_store_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      theme: lightTheme(),
      
      initialRoute: NamePages.splashPage,
    );
  }
}
