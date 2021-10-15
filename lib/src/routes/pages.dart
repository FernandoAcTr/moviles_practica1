import 'package:get/get.dart';
import 'package:practica2/src/bindings/movies_binding.dart';
import 'package:practica2/src/bindings/notas_binding.dart';
import 'package:practica2/src/bindings/profile_binding.dart';
import 'package:practica2/src/ui/pages/dashboard_page.dart';
import 'package:practica2/src/ui/pages/intenciones/intenciones_page.dart';
import 'package:practica2/src/ui/pages/login_page.dart';
import 'package:practica2/src/ui/pages/movies/detail_movie_page.dart';
import 'package:practica2/src/ui/pages/movies/movies_page.dart';
import 'package:practica2/src/ui/pages/notas/add_note_page.dart';
import 'package:practica2/src/ui/pages/notas/notas_page.dart';
import 'package:practica2/src/ui/pages/profile/edit_profile_page.dart';
import 'package:practica2/src/ui/pages/profile/profile_page.dart';
import 'package:practica2/src/ui/pages/propinas/propinas_page.dart';
import 'package:practica2/src/ui/pages/splash_screen.dart';
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
