import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
import 'package:practica2/src/pages/dashboard_page.dart';
import 'package:practica2/src/pages/login_page.dart';
import 'package:practica2/src/pages/propinas_screen.dart';
import 'package:practica2/src/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pracica 2',
      initialRoute: Routes.home,
      theme: myTheme,
      routes: {
        Routes.home: (_) => LoginPage(),
        Routes.dashboard: (_) => DashboradPage(),
        Routes.practica1: (_) => Propinas(),
      },
    );
  }
}
