import 'package:flutter/material.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/domain/models/user.dart';

class ProfilePictureWidget extends StatelessWidget {
  final _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProfilePicture(),
        _buildEditPictureIcon(),
      ],
    );
  }

  Widget _buildEditPictureIcon() {
    return Positioned(
      bottom: 0,
      right: 4,
      child: _buildCircle(
        child: _buildCircle(
          child: InkWell(
            onTap: () {},
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
                image: user != null ? AssetImage('assets/no-foto.jpg') : AssetImage('assets/no-foto.jpg'),
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
}
