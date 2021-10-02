import 'package:flutter/material.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/domain/models/user.dart';
import 'package:practica2/src/ui/pages/edit_profile/widgets/profile_picture_widget.dart';
import 'package:practica2/src/ui/pages/edit_profile/widgets/text_field_widget.dart';

class EditProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _aPaternoController = TextEditingController();
  final _aMaternoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _aboutController = TextEditingController();

  final _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Form(
        key: _formKey,
        child: FutureBuilder(
          future: _authRepository.currentUser,
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            final user = snapshot.hasData && snapshot.data != null ? snapshot.data : null;
            _nombreController.text = user != null ? user.nombre! : '';
            _aPaternoController.text = user != null ? user.aPaterno! : '';
            _aMaternoController.text = user != null ? user.aMaterno! : '';
            _emailController.text = user != null ? user.email! : '';
            _telefonoController.text = user != null ? user.telefono! : '';
            _aboutController.text = user != null ? user.about! : '';

            return ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 32),
              children: [
                Center(child: ProfilePictureWidget()),
                SizedBox(height: 16),
                TextFieldWidget(label: 'Nombre', controller: _nombreController),
                TextFieldWidget(label: 'Apellido Materno', controller: _aPaternoController),
                TextFieldWidget(label: 'Apellido Paterno', controller: _aMaternoController),
                TextFieldWidget(label: 'Email', controller: _emailController, type: TextInputType.emailAddress),
                TextFieldWidget(
                    label: 'Teléfono', controller: _telefonoController, type: TextInputType.phone, maxLength: 10),
                TextFieldWidget(label: 'Acerca de tí', controller: _aboutController, maxLength: 255),
                MaterialButton(
                  color: Colors.blue,
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  child: Text('Guardar'),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    _authRepository.editProfile(
                      nombre: _nombreController.text,
                      aPaterno: _aPaternoController.text,
                      aMaterno: _aMaternoController.text,
                      email: _emailController.text,
                      telefono: _telefonoController.text,
                      about: _aboutController.text,
                    );
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
