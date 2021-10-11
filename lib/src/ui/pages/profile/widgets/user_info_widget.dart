import 'package:flutter/material.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/data/models/user.dart';

class UserInfoWidget extends StatelessWidget {
  final _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authRepository.currentUser,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        final user = snapshot.hasData && snapshot.data != null ? snapshot.data : null;

        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 4,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Teléfono"),
                subtitle: Text(user != null ? "${user.telefono}" : 'Tu teléfono'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text(user != null ? "${user.email}" : 'Tu email'),
              ),
            ],
          ),
        );
      },
    );
  }
}
