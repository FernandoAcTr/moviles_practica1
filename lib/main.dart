import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:practica2/src/bindings/auth_binding.dart';
import 'package:practica2/src/routes/pages.dart';
import 'package:practica2/src/ui/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pracica 2',
      initialRoute: Routes.INITIAL,
      initialBinding: AuthBinding(),
      theme: myTheme,
      getPages: AppPages.pages,
    );
  }
}
