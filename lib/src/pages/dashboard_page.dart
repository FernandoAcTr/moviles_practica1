import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';

class DashboradPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('ESC Fernando Acosta'),
              accountEmail: Text('fernando@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: Hero(
                  tag: 'avatar',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/7/70/Ben_Affleck_by_Gage_Skidmore_3.jpg',
                    ),
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, Routes.profile),
              ),
            ),
            ListTile(
              title: Text('Propinas'),
              subtitle: Text('Calculadora de propinas'),
              leading: Icon(Icons.monetization_on_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.propinas);
              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Manejo de intenciones'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.intenciones);
              },
            ),
            ListTile(
              title: Text('Notas'),
              subtitle: Text('CRUD de Notas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.notas);
              },
            ),
          ],
        ),
      ),
    );
  }
}
