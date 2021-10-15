import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
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
                    onPressed: () => Navigator.of(context).pushNamed(Routes.detailsMovie, arguments: movie),
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
