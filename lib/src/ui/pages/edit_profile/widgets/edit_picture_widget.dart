import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/device/ImageSelector.dart';
import 'package:practica2/src/domain/models/user.dart';

class EditPictureWidget extends StatefulWidget {
  @override
  _EditPictureWidgetState createState() => _EditPictureWidgetState();
}

class _EditPictureWidgetState extends State<EditPictureWidget> {
  final _authRepository = AuthRepository();
  final _imageSelector = ImageSelector();
  File? file;

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
            onTap: () async {
              file = await _imageSelector.showSelectionDialog(context);
              if (file != null) _authRepository.editProfile(foto: file!.path);
              setState(() {});
            },
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
    return FutureBuilder(
      future: _authRepository.currentUser,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        final user = snapshot.hasData && snapshot.data != null ? snapshot.data : null;

        return Hero(
          tag: 'avatar',
          child: ClipOval(
            child: Material(
              child: Ink.image(
                image: getImage(user),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: () {}),
              ),
            ),
          ),
        );
      },
    );
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
    if (file != null) return FileImage(file!);
    if (user?.foto != null) return FileImage(File(user!.foto!));

    return AssetImage('assets/no-foto.jpg');
  }
}
