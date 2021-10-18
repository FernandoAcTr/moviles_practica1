import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/data/models/actor.dart';

class MovieService {
  // final apiKey = 'e2dc6a6246da72420a469e4a398c0874';
  final apiKey = '2ea8ea675bd5a34a75e9428ca22adc65';

  Future<List<Movie>> getPopularMovies() async {
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=es-MX&page=1';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return List<Movie>.from(json["results"].map((x) => Movie.fromMap(x)));
  }

  Future<List<Movie>> getInCinemas() async {
    final url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=es-MX&page=1';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return List<Movie>.from(json["results"].map((x) => Movie.fromMap(x)));
  }

  Future<List<Actor>> getCast(int movieId) async {
    final url = 'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=es-MX&page=1';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return List<Actor>.from(json['cast'].map((x) => Actor.fromMap(x)));
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=es-MX&page=1&include_adult=true&query=$query';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return List<Movie>.from(json["results"].map((x) => Movie.fromMap(x)));
  }

  Future<String?> getTrailerId(int movieId) async {
    final url = 'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    List youtube = json['results'].where((video) => video['site'] == 'YouTube').toList();
    return youtube.isEmpty ? null : youtube.first['key'];
  }
}
