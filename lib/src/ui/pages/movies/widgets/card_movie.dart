import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/movie.dart';

class CardWidget extends StatelessWidget {
  final Movie movie;

  const CardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 7.0),
            blurRadius: 2.5,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
          ),
        ),
      ),
    );
  }
}
