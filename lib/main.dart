import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
import 'package:practica2/src/ui/pages/movies/detail_movie_page.dart';
import 'package:practica2/src/ui/pages/notas/add_note_page.dart';
import 'package:practica2/src/ui/pages/profile/edit_profile_page.dart';
import 'package:practica2/src/ui/pages/intenciones/intenciones_page.dart';
import 'package:practica2/src/ui/pages/movies/movies_page.dart';
import 'package:practica2/src/ui/pages/notas/notas_page.dart';
import 'package:practica2/src/ui/pages/profile/profile_page.dart';
import 'package:practica2/src/ui/pages/splash_screen.dart';
import 'package:practica2/src/ui/pages/dashboard_page.dart';
import 'package:practica2/src/ui/pages/login_page.dart';
import 'package:practica2/src/ui/pages/propinas/propinas_page.dart';
import 'package:practica2/src/ui/theme.dart';

void main() async {
  // final dbHelper = DBHelper();
  // await dbHelper.initDatabase();

  runApp(MyApp());
}

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
        Routes.dashboard: (_) => DashboardPage(),
        Routes.propinas: (_) => Propinas(),
        Routes.intenciones: (_) => Intenciones(),
        Routes.notas: (_) => NotasPage(),
        Routes.agregar: (_) => AddNotePage(),
        Routes.profile: (_) => ProfilePage(),
        Routes.editProfile: (_) => EditProfilePage(),
        Routes.movies: (_) => MoviesPage(),
        Routes.detailsMovie: (_) => DetailMoviePage(),
      },
    );
  }
}
