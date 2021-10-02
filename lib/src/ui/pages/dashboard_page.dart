import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/domain/models/user.dart';

class DashboardPage extends StatelessWidget {
  final _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
      ),
      drawer: FutureBuilder(
        future: _authRepository.currentUser,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          final user = snapshot.hasData && snapshot.data != null ? snapshot.data : null;
          return Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(user != null ? "${user.nombre} ${user.aPaterno} ${user.aPaterno}" : 'Tu Nombre'),
                  accountEmail: Text(user != null ? "${user.email}" : 'Tu Email'),
                  currentAccountPicture: GestureDetector(
                    child: Hero(
                      tag: 'avatar',
                      child: CircleAvatar(
                        backgroundImage:
                            user != null ? AssetImage('assets/no-foto.jpg') : AssetImage('assets/no-foto.jpg'),
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
                  leading: Icon(Icons.note),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, Routes.notas);
                  },
                ),
                ListTile(
                  title: Text('Películas'),
                  subtitle: Text('Las películas más populares'),
                  leading: Icon(Icons.movie),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, Routes.movies);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
