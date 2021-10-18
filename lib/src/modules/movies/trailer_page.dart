import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:practica2/src/modules/movies/trailer_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPage extends GetView<TrailerController> {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FutureBuilder(
          future: controller.fetchTrailer(movie),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            if (!snapshot.data!)
              return Center(
                child: Text(
                  'No hay trailer disponible',
                  style: TextStyle(color: Colors.white),
                ),
              );

            return YoutubePlayer(
              controller: controller.videoController!,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
