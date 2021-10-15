import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica2/src/controllers/auth_controller.dart';
import 'package:practica2/src/data/models/user.dart';
import 'package:practica2/src/routes/pages.dart';

class DashboardPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DASHBOARD'),
          backgroundColor: Theme.of(context).primaryColor,
          brightness: Brightness.dark,
        ),
        drawer: Obx(() {
          final user = authController.user;
          return Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(user != null ? "${user.nombre} ${user.aPaterno} ${user.aMaterno}" : 'Tu Nombre'),
                  accountEmail: Text(user != null ? "${user.email}" : 'Tu Email'),
                  currentAccountPicture: GestureDetector(
                    child: Hero(
                      tag: 'avatar',
                      child: CircleAvatar(
                        backgroundImage: _getImage(user),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, Routes.PROFILE),
                  ),
                ),
                ListTile(
                  title: Text('Propinas'),
                  subtitle: Text('Calculadora de propinas'),
                  leading: Icon(Icons.monetization_on_outlined),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, Routes.PROPINAS);
                  },
                ),
                ListTile(
                  title: Text('Intenciones'),
                  subtitle: Text('Manejo de intenciones'),
                  leading: Icon(Icons.phone_android),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, Routes.INTENCIONES);
                  },
                ),
                ListTile(
                  title: Text('Notas'),
                  subtitle: Text('CRUD de Notas'),
                  leading: Icon(Icons.note),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, Routes.NOTAS);
                  },
                ),
                ListTile(
                  title: Text('Películas'),
                  subtitle: Text('Las películas más populares'),
                  leading: Icon(Icons.movie),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, Routes.MOVIES);
                  },
                ),
              ],
            ),
          );
        }));
  }

  _getImage(User? user) => user?.foto != null ? FileImage(File(user!.foto!)) : AssetImage('assets/no-foto.jpg');
}
