import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica2/src/controllers/auth_controller.dart';
import 'package:practica2/src/controllers/profile_controller.dart';
import 'package:practica2/src/data/models/user.dart';

class EditPictureWidget extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProfilePicture(),
        _buildEditPictureIcon(context),
      ],
    );
  }

  Widget _buildEditPictureIcon(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 4,
      child: _buildCircle(
        child: _buildCircle(
          child: InkWell(
            onTap: () => controller.pickImage(context),
            child: Icon(
              Icons.photo_camera_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
          padding: 8,
          color: Colors.blue,
        ),
        padding: 3,
        color: Colors.white,
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Obx(() => Hero(
          tag: 'avatar',
          child: ClipOval(
            child: Material(
              child: Ink.image(
                image: getImage(authController.user),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: () {}),
              ),
            ),
          ),
        ));
  }

  Widget _buildCircle({
    required Widget child,
    required double padding,
    required Color color,
  }) {
    return ClipOval(
      child: Container(
        color: color,
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }

  getImage(User? user) {
    if (controller.pickedImage != null) return FileImage(controller.pickedImage!);
    if (user?.foto != null) return FileImage(File(user!.foto!));
    return AssetImage('assets/no-foto.jpg');
  }
}
