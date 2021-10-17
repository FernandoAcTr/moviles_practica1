import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/modules/movies/movies_controller.dart';

class LikeButton extends GetView<MoviesController> {
  final Movie movie;

  LikeButton({required this.movie});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.isFavouriteMovie(movie.id!),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) return Container();
        return FavoriteButton(
          iconSize: 40,
          isFavorite: snapshot.data,
          valueChanged: (_isFavorite) {
            controller.toggleFavourite(movie);
          },
        );
      },
    );
  }
}
