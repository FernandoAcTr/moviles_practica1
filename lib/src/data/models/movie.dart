import 'dart:convert';

class Movie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"]?.cast<int>(),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] != null ? DateTime.parse(json["release_date"]) : null,
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"] != null ? double.parse(json["vote_average"].toString()) : null,
        voteCount: json["vote_count"],
      );

  String get fullPosterPath => posterPath == null
      ? 'https://www.bridgiot.co.za/wp-content/uploads/2018/12/1024x1024-no-image-available.png'
      : 'https://image.tmdb.org/t/p/w500/$posterPath';

  String get getBackgroundImage => backdropPath == null
      ? 'https://www.bridgiot.co.za/wp-content/uploads/2018/12/1024x1024-no-image-available.png'
      : 'https://image.tmdb.org/t/p/w500/$backdropPath';
}
