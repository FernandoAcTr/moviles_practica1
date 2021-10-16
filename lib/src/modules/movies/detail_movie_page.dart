import 'dart:ui';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/actor.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/modules/movies/movies_controller.dart';
import 'package:practica2/src/modules/movies/widgets/cast_list.dart';

class DetailMoviePage extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(movie),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildInfoLayer(movie, context),
          )
        ],
      ),
    );
  }

  Widget _buildInfoLayer(Movie movie, BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          height: screen.height * 0.55,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif',
                image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 100),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screen.width * 0.6,
              child: Text(movie.title!,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Icon(Icons.favorite_border, color: Colors.white),
            Text("${movie.voteAverage}/10", style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
        SizedBox(height: 5),
        if (movie.releaseDate != null)
          Text(
            'Lanzamiento: ${DateFormat('y-MM-dd').format(movie.releaseDate!)}',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        SizedBox(height: 10),
        Text(movie.overview ?? 'Sin descripción',
            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text('Reparto', style: TextStyle(fontSize: 18, color: Colors.white)),
        SizedBox(height: 5),
        FutureBuilder(
          future: controller.getCast(movie.id.toString()),
          builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

            return Container(
              height: 170,
              child: CastList(cast: snapshot.data!),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBackground(Movie movie) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(color: Colors.black.withOpacity(0.7)),
      ),
    );
  }
}
