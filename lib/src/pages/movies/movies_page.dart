import 'package:flutter/material.dart';
import 'package:practica2/src/services/movie_service.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MovieService _movieService = MovieService();

  @override
  void initState() {
    super.initState();
    final movies = _movieService.getAllMovies();
    print(movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoviesPage'),
      ),
      body: Center(
        child: Text('MoviesPage'),
      ),
    );
  }
}
