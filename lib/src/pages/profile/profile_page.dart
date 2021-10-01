import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
import 'package:practica2/src/pages/profile/widgets/picture_widget.dart';
import 'package:practica2/src/pages/profile/widgets/user_info_widget.dart';

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
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: PictureWidget(),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          padding: EdgeInsets.all(16),
          child: UserInfoWidget(),
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
