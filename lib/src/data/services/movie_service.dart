import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica2/src/data/models/movie.dart';

class MovieService {
  final apiKey = 'e2dc6a6246da72420a469e4a398c0874';

  Future<List<Movie>> getAllMovies() async {
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=es-MX&page=1';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return List<Movie>.from(json["results"].map((x) => Movie.fromMap(x)));
  }
}
