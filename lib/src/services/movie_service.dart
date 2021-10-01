import 'dart:convert';

import 'package:practica2/src/network/movies.dart';
import 'package:http/http.dart' as http;

class MovieService {
  final apiKey = 'e2dc6a6246da72420a469e4a398c0874';

  Future<List<Movie>> getAllMovies() async {
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=es-MX&page=1';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    final movieResponse = MovieResponse.fromMap(json);
    return movieResponse.results;
  }
}
