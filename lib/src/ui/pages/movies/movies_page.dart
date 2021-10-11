import 'package:flutter/material.dart';
import 'package:practica2/src/data/services/movie_service.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/ui/pages/movies/widgets/card_movie.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas más populares'),
      ),
      body: FutureBuilder(
        future: _movieService.getAllMovies(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasError) return Center(child: Text('Ha habido un error en la petición'));
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _moviesList(snapshot.data!),
          );
        },
      ),
    );
  }

  Widget _moviesList(List<Movie> movies) {
    return ListView.separated(
      itemCount: movies.length,
      separatorBuilder: (context, index) {
        return Divider(height: 10);
      },
      itemBuilder: (context, index) {
        return CardWidget(movie: movies[index]);
      },
    );
  }
}
