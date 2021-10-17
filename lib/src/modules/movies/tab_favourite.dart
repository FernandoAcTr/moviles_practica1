import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:practica2/src/modules/movies/movies_controller.dart';
import 'package:practica2/src/modules/movies/widgets/card_movie.dart';
import 'package:practica2/src/routes/pages.dart';

class TabFavourite extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: controller.favouriteMovies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = controller.favouriteMovies[index];
                movie.uniqueid = '${movie.id}-favourite';
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(Routes.DETAILS_MOVIE, arguments: movie),
                  child: Hero(tag: movie.uniqueid!, child: CardMovie(movie: movie)),
                );
              },
            )),
      ),
    );
  }
}
