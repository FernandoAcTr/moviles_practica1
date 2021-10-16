import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/movie.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;

  const CardMovie({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 220,
              height: double.infinity,
              child: FadeInImage(
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                height: 55.0,
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        "${movie.title}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
