import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';

class DashboradPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('ESC Fernando Acosta'),
              accountEmail: Text('fernando@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/7/70/Ben_Affleck_by_Gage_Skidmore_3.jpg',
                ),
              ),
            ),
            ListTile(
              title: Text('Propinas'),
              subtitle: Text('Calculadora de propinas'),
              leading: Icon(Icons.monetization_on_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.practica1);
              },
            ),
            ListTile(
              title: Text('Practica 2'),
              subtitle: Text('Descripcion corta'),
              leading: Icon(Icons.monetization_on_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
