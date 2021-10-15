import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica2/src/modules/auth/auth_controller.dart';
import 'package:practica2/src/modules/profile/profile_controller.dart';
import 'package:practica2/src/modules/profile/widgets/edit_picture_widget.dart';
import 'package:practica2/src/modules/profile/widgets/text_field_widget.dart';

class EditProfilePage extends GetView<ProfileController> {
  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _aPaternoController = TextEditingController();
  final _aMaternoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _aboutController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        body: Obx(() {
          final user = authController.user;
          _nombreController.text = user?.nombre ?? '';
          _aPaternoController.text = user?.aPaterno ?? '';
          _aMaternoController.text = user?.aMaterno ?? '';
          _emailController.text = user?.email ?? '';
          _telefonoController.text = user?.telefono ?? '';
          _aboutController.text = user?.about ?? '';

          return Form(
            key: _formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 32),
              children: [
                Center(child: EditPictureWidget()),
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
                    controller.editProfile(
                      nombre: _nombreController.text.trim(),
                      aPaterno: _aPaternoController.text.trim(),
                      aMaterno: _aMaternoController.text.trim(),
                      email: _emailController.text.trim(),
                      telefono: _telefonoController.text.trim(),
                      about: _aboutController.text.trim(),
                    );
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          );
        }));
  }
}
