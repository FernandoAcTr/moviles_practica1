import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/data/services/movie_service.dart';
import 'package:practica2/src/routes/pages.dart';

class SearchMovie extends SearchDelegate {
  final movies = [
    'Spiderman',
    'Capitan America',
    'Los vengadores',
    'Ghost Rider',
    'Iron Man',
    'Iron Man 2',
    'Iron Man 3',
    'Iron Man 4',
  ];

  final recents = [
    'Spiderman',
    'Los Vengadores',
  ];

  final movieService = MovieService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty || query.length < 4) return Container();

    return FutureBuilder(
      future: movieService.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        var movies = snapshot.data;

        if (movies!.length == 0) return Center(child: Text('Sin resultados'));

        return _getListView(movies, context);
      },
    );
  }

  Widget _getListView(List<Movie> movies, BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = movies[index];
        movie.uniqueid = '${movie.id}-search';

        return ListTile(
          leading: Hero(
            tag: movie.uniqueid!,
            child: FadeInImage(
              image: NetworkImage(movie.fullPosterPath),
              placeholder: AssetImage('assets/loading.gif'),
              height: 50.0,
              fadeInDuration: Duration(milliseconds: 50),
              fit: BoxFit.contain,
            ),
          ),
          title: Text(movie.title!),
          subtitle: Text(movie.originalTitle!),
          onTap: () => Navigator.pushNamed(context, Routes.DETAILS_MOVIE, arguments: movie),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        child: Text(query),
        color: Colors.amberAccent,
      ),
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   final subgestList =
  //       (query.isEmpty) ? recents : movies.where((item) => item.toLowerCase().startsWith(query.toLowerCase())).toList();

  //   return ListView.builder(
  //     itemCount: subgestList.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(subgestList[index]),
  //         onTap: () {
  //           query = subgestList[index];
  //           showResults(context);
  //         },
  //       );
  //     },
  //   );
  // }
}
