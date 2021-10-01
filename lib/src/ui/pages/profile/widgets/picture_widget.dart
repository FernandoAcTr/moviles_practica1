import 'package:flutter/material.dart';

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'avatar',
          child: CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/7/70/Ben_Affleck_by_Gage_Skidmore_3.jpg',
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Fernando Acosta Tovar',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        SizedBox(height: 5),
        Text(
          'Ingeniero en sistemas Computacionales del ITC',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ],
    );
  }
}
