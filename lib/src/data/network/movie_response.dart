import 'dart:convert';

import 'package:practica2/src/domain/models/movie.dart';
export 'package:practica2/src/domain/models/movie.dart';

class MovieResponse {
  int? page;
  List<Movie> results;
  int? totalPages;
  int? totalResults;

  MovieResponse({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponse.fromJson(String str) => MovieResponse.fromMap(json.decode(str));

  factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
        page: json["page"] == null ? null : json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
      );
}
