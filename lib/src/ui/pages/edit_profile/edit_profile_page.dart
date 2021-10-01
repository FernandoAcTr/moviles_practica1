import 'package:flutter/material.dart';
import 'package:practica2/src/ui/pages/edit_profile/widgets/profile_picture_widget.dart';
import 'package:practica2/src/ui/pages/edit_profile/widgets/text_field_widget.dart';

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
          TextFieldWidget(label: 'Apellido Materno'),
          TextFieldWidget(label: 'Apellido Paterno'),
          TextFieldWidget(label: 'Email'),
          TextFieldWidget(label: 'Teléfono'),
          TextFieldWidget(label: 'Acerca de tí'),
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
