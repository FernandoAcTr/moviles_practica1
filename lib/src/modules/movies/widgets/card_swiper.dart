import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:practica2/src/data/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie movie)? onTap;

  const CardSwiper({required this.movies, this.onTap});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Swiper(
      itemCount: movies.length,
      itemWidth: _screenSize.width * 0.6,
      layout: SwiperLayout.STACK,
      // control: new SwiperControl(),
      // pagination: new SwiperPagination(),
      onTap: (index) => onTap?.call(movies[index]),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            image: NetworkImage(movie.fullPosterPath),
            placeholder: AssetImage('assets/loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
