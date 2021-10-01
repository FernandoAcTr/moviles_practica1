import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 32),
        children: [
          Center(child: ProfilePictureWidget()),
          SizedBox(height: 16),
          TextFieldWidget(label: 'Nombre'),
          SizedBox(height: 16),
          TextFieldWidget(label: 'Apellido Materno'),
          SizedBox(height: 16),
          TextFieldWidget(label: 'Apellido Paterno'),
          SizedBox(height: 16),
          TextFieldWidget(label: 'Email'),
          SizedBox(height: 16),
          TextFieldWidget(label: 'Teléfono'),
          SizedBox(height: 16),
          TextFieldWidget(label: 'Acerca de tí'),
          SizedBox(height: 16),
          MaterialButton(
            color: Colors.blue,
            shape: StadiumBorder(),
            textColor: Colors.white,
            child: Text('Guardar'),
            onPressed: () {},
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String label;

  const TextFieldWidget({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        )
      ],
    );
  }
}

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
