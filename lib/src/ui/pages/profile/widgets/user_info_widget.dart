import 'package:flutter/material.dart';
import 'package:practica2/src/data/models/user.dart';

class UserInfoWidget extends StatelessWidget {
  final User? user;

  const UserInfoWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Teléfono"),
            subtitle: Text(user?.telefono ?? 'Tu teléfono'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text(user?.email ?? 'Tu Email'),
          ),
        ],
      ),
    );
  }
}
