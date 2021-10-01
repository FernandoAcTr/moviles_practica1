import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Teléfono'),
            subtitle: Text('4111267600'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('ferando@gmail.com'),
          ),
        ],
      ),
    );
  }
}
