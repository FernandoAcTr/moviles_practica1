import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:practica2/src/modules/movies/movies_controller.dart';
import 'package:practica2/src/modules/movies/widgets/card_movie.dart';
import 'package:practica2/src/modules/movies/widgets/card_swiper.dart';
import 'package:practica2/src/routes/pages.dart';
import 'package:practica2/src/widgets/no_data_widget.dart';

class TabMovies extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Obx(() {
      if (controller.loading) return Center(child: CircularProgressIndicator());

      return ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        children: [
          Text('Peliculas en Cines', style: TextStyle(fontSize: 18)),
          Container(
            height: _screenSize.height * 0.5,
            margin: EdgeInsets.only(top: 10),
            child: CardSwiper(
              movies: controller.cinemaMovies,
              onTap: (movie) => Navigator.of(context).pushNamed(Routes.DETAILS_MOVIE, arguments: movie),
            ),
          ),
          SizedBox(height: 10),
          Text('Peliculas mas populares', style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            height: _screenSize.height * 0.25,
            child: _moviesList(),
          )
        ],
      );
    });
  }

  Widget _moviesList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: controller.popularMovies.length,
      itemBuilder: (context, index) {
        final movie = controller.popularMovies[index];
        movie.uniqueid = '${movie.id}-listview';

        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(Routes.DETAILS_MOVIE, arguments: movie),
          child: Hero(
            tag: movie.uniqueid!,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CardMovie(movie: movie),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 10);
      },
    );
  }
}
