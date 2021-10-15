import 'package:get/get.dart';
import 'package:practica2/src/modules/movies/movies_binding.dart';
import 'package:practica2/src/modules/notas/notas_binding.dart';
import 'package:practica2/src/modules/profile/profile_binding.dart';
import 'package:practica2/src/modules/dashboard/dashboard_page.dart';
import 'package:practica2/src/modules/auth/login_page.dart';
import 'package:practica2/src/modules/intenciones/intenciones_page.dart';
import 'package:practica2/src/modules/movies/detail_movie_page.dart';
import 'package:practica2/src/modules/movies/movies_page.dart';
import 'package:practica2/src/modules/notas/add_note_page.dart';
import 'package:practica2/src/modules/notas/notas_page.dart';
import 'package:practica2/src/modules/profile/edit_profile_page.dart';
import 'package:practica2/src/modules/profile/profile_page.dart';
import 'package:practica2/src/modules/propinas/propinas_page.dart';
import 'package:practica2/src/modules/splash/splash_screen.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.PROPINAS,
      page: () => PropinasPage(),
    ),
    GetPage(
      name: Routes.INTENCIONES,
      page: () => IntencionesPage(),
    ),
    GetPage(
      name: Routes.NOTAS,
      page: () => NotasPage(),
      binding: NotasBinding(),
    ),
    GetPage(
      name: Routes.AGREGAR_NOTA,
      page: () => AddNotePage(),
      binding: NotasBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.EDITPROFILE,
      page: () => EditProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.MOVIES,
      page: () => MoviesPage(),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: Routes.DETAILS_MOVIE,
      page: () => DetailMoviePage(),
    ),
  ];
}
