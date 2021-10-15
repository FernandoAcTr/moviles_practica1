import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/user.dart';

class PictureWidget extends StatelessWidget {
  final User? user;

  const PictureWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'avatar',
          child: CircleAvatar(
            radius: 45,
            backgroundImage: _getImage(user),
          ),
        ),
        SizedBox(height: 16),
        Text(
          user != null ? "${user!.nombre} ${user!.aPaterno} ${user!.aMaterno}" : 'Tu Nombre',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            user?.about != null ? "${user!.about!}" : 'Acerca de tí',
            style: TextStyle(color: Colors.white, fontSize: 11.0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  _getImage(User? user) => user?.foto != null ? FileImage(File(user!.foto!)) : AssetImage('assets/no-foto.jpg');
}
