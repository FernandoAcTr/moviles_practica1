import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica2/src/controllers/auth_controller.dart';
import 'package:practica2/src/controllers/profile_controller.dart';
import 'package:practica2/src/routes/pages.dart';
import 'package:practica2/src/ui/pages/profile/widgets/picture_widget.dart';
import 'package:practica2/src/ui/pages/profile/widgets/user_info_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();

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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBackground(context),
            _buildInfoLayer(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.EDITPROFILE),
        child: Icon(Icons.edit),
      ),
    );
  }

  Column _buildInfoLayer(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Obx(() => PictureWidget(user: authController.user)),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          padding: EdgeInsets.all(16),
          child: Obx(() => UserInfoWidget(user: authController.user)),
        ),
      ],
    );
  }

  Widget _buildBackground(BuildContext context) {
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
