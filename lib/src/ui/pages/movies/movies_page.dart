import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:practica2/src/controllers/movies_controller.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/ui/pages/movies/widgets/card_movie.dart';

class MoviesPage extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas más populares'),
      ),
      body: Obx(() {
        if (controller.error) return Center(child: Text('Ha habido un error en la petición'));
        if (controller.loading) return Center(child: CircularProgressIndicator());

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _moviesList(controller.moviesList),
        );
      }),
    );
  }

  Widget _moviesList(List<Movie> movies) {
    return ListView.separated(
      itemCount: movies.length,
      separatorBuilder: (context, index) {
        return Divider(height: 10);
      },
      itemBuilder: (context, index) {
        return CardMovie(movie: movies[index]);
      },
    );
  }
}
