import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica2/routes.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        brightness: Brightness.dark,
      ),
      body: Stack(
        children: [
          _buildBackground(context),
          _buildInfoLayer(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.editProfile),
        child: Icon(Icons.edit),
      ),
    );
  }

  Column _buildInfoLayer(BuildContext context) {
    return Column(
      children: [
        //Container superior
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
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
          ),
        ),
        //Container inferior
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          padding: EdgeInsets.all(16),
          child: Card(
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
          ),
        ),
      ],
    );
  }

  Column _buildBackground(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(76, 175, 80, 1),
                Color.fromRGBO(76, 175, 80, 0.6),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.55,
        ),
      ],
    );
  }
}
