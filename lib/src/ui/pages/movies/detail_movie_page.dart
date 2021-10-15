import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/movie.dart';

class DetailMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
