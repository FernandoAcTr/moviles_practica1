import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
import 'package:practica2/src/pages/add_note_page.dart';
import 'package:practica2/src/pages/edit_profile_page.dart';
import 'package:practica2/src/pages/intenciones_screen.dart';
import 'package:practica2/src/pages/notas_page.dart';
import 'package:practica2/src/pages/profile_page.dart';
import 'package:practica2/src/pages/splash_screen.dart';
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
        Routes.home: (_) => SplashScreen(),
        Routes.login: (_) => LoginPage(),
        Routes.dashboard: (_) => DashboradPage(),
        Routes.propinas: (_) => Propinas(),
        Routes.intenciones: (_) => Intenciones(),
        Routes.notas: (_) => NotasPage(),
        Routes.agregar: (_) => AddNotePage(),
        Routes.profile: (_) => ProfilePage(),
        Routes.editProfile: (_) => EditProfilePage(),
      },
    );
  }
}
