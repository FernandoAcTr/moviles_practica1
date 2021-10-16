import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/actor.dart';

class CastList extends StatelessWidget {
  final List<Actor> cast;

  const CastList({required this.cast});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: cast.length,
      itemBuilder: (context, index) {
        final actor = cast[index];
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(actor.fullProfilePath),
              radius: 40,
            ),
            Text(actor.name, style: TextStyle(color: Colors.white)),
            Text('como', style: TextStyle(color: Colors.white, fontSize: 10)),
            SizedBox(
              width: 130,
              child: Text(
                actor.character ?? '',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 10);
      },
    );
  }
}
