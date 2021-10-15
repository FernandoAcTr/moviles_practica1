import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/routes/pages.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;

  const CardMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 8),
            blurRadius: 10,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
              ),
            ),
            Container(
              color: Colors.black54,
              height: 55.0,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${movie.title}", style: TextStyle(color: Colors.white, fontSize: 14)),
                  IconButton(
                    onPressed: () => Navigator.of(context).pushNamed(Routes.DETAILS_MOVIE, arguments: movie),
                    icon: Icon(Icons.chevron_right, color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
