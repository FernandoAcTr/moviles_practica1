import 'package:get/get.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/data/services/movie_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerController extends GetxController {
  YoutubePlayerController? videoController;
  final MovieService movieService;

  TrailerController({required this.movieService});

  Future<bool> fetchTrailer(Movie movie) async {
    final id = await movieService.getTrailerId(movie.id!);
    if (id == null) return false;

    videoController = YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    return true;
  }

  @override
  void onClose() {
    super.onClose();
    videoController?.dispose();
  }
}
