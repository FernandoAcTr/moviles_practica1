import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:practica2/src/modules/movies/movies_controller.dart';
import 'package:practica2/src/modules/movies/tab_favourite.dart';
import 'package:practica2/src/modules/movies/tab_movies.dart';
import 'package:practica2/src/modules/movies/widgets/search_movie.dart';
import 'package:practica2/src/widgets/no_data_widget.dart';

class MoviesPage extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Catálogo de Películas'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(context: context, delegate: SearchMovie()),
            )
          ],
        ),
        body: !controller.error
            ? PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TabMovies(),
                  TabFavourite(),
                ],
              )
            : NoDataWidget(text: 'Sin conexión a internet'),
        bottomNavigationBar: _buildBottomNavbar(),
      ),
    );
  }

  Widget? _buildBottomNavbar() {
    if (controller.error) return null;
    return BottomNavigationBar(
      currentIndex: controller.currentPage,
      onTap: (index) => controller.currentPage = index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Películas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritas',
        )
      ],
    );
  }
}
