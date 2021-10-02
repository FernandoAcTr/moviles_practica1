import 'package:flutter/material.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/domain/models/user.dart';

class PictureWidget extends StatelessWidget {
  final _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authRepository.currentUser,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        final user = snapshot.hasData && snapshot.data != null ? snapshot.data : null;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'avatar',
              child: CircleAvatar(
                radius: 45,
                backgroundImage: user != null ? AssetImage('assets/no-foto.jpg') : AssetImage('assets/no-foto.jpg'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              user != null ? "${user.nombre} ${user.aPaterno} ${user.aPaterno}" : 'Tu Nombre',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                user != null ? "${user.about}" : 'Acerca de tí',
                style: TextStyle(color: Colors.white, fontSize: 11.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
