import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
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
    return Hero(
      tag: 'avatar',
      child: ClipOval(
        child: Material(
          child: Ink.image(
            image:
                NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/70/Ben_Affleck_by_Gage_Skidmore_3.jpg'),
            fit: BoxFit.cover,
            width: 128,
            height: 128,
            child: InkWell(onTap: () {}),
          ),
        ),
      ),
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
