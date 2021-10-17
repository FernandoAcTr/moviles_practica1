import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/data/models/actor.dart';
import 'package:practica2/src/data/repositories/movie_repository.dart';
import 'package:practica2/src/data/services/movie_service.dart';

class MoviesController extends GetxController {
  final MovieService movieService;
  final MovieRepository movieRepository;

  MoviesController({required this.movieService, required this.movieRepository});

  final pageController = PageController();

  //state
  final List<Movie> popularMovies = <Movie>[].obs;
  final List<Movie> cinemaMovies = <Movie>[].obs;
  final List<Movie> favouriteMovies = <Movie>[].obs;

  final _loading = false.obs;
  final _error = false.obs;
  final _currentPage = 0.obs;

  bool get loading => _loading.value;
  bool get error => _error.value;
  int get currentPage => _currentPage.value;
  set currentPage(int value) {
    pageController.animateToPage(value, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    _currentPage.value = value;
  }

  @override
  void onInit() async {
    _loading.value = true;
    await fetchMovies();
    await fetchFavourites();
    _loading.value = false;
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> fetchMovies() async {
    try {
      final popular = await movieService.getPopularMovies();
      final cinemas = await movieService.getInCinemas();
      popularMovies.assignAll(popular);
      cinemaMovies.assignAll(cinemas);
    } catch (e) {
      print(e);
      _error.value = true;
    }
  }

  Future<void> fetchFavourites() async {
    try {
      final favourite = await movieRepository.findAll();
      favouriteMovies.assignAll(favourite);
    } catch (e) {
      print(e);
      _error.value = true;
    }
  }

  Future<List<Actor>>? getCast(String movieId) {
    try {
      return movieService.getCast(movieId);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isFavouriteMovie(int movieId) async {
    return await movieRepository.isFavourite(movieId);
  }

  void toggleFavourite(Movie movie) {
    movieRepository.toggleFovourite(movie);
    final exists = favouriteMovies.where((element) => movie.id == element.id);
    if (exists.isEmpty)
      favouriteMovies.add(movie);
    else
      favouriteMovies.removeWhere((element) => movie.id == element.id);
  }
}
