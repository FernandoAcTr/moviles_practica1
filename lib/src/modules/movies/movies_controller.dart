import 'package:get/get.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/data/services/movie_service.dart';

class MoviesController extends GetxController {
  final MovieService movieService;

  MoviesController({required this.movieService});

  //state
  final List<Movie> moviesList = <Movie>[].obs;
  final _loading = false.obs;
  final _error = false.obs;

  get loading => _loading.value;
  get error => _error.value;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    _loading.value = true;
    try {
      final movies = await movieService.getAllMovies();
      moviesList.assignAll(movies);
    } catch (e) {
      print(e);
      _error.value = true;
    }
    _loading.value = false;
  }
}
