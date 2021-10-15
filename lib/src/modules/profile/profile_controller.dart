import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:practica2/src/modules/auth/auth_controller.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/device/ImageSelector.dart';

class ProfileController extends GetxController {
  final AuthRepository authRepository;
  final ImageSelector imageSelector;
  final AuthController authController;

  ProfileController({
    required this.authRepository,
    required this.imageSelector,
    required this.authController,
  });

  //state
  final _pickedImage = Rxn<File>();

  File? get pickedImage => _pickedImage.value;

  void editProfile({
    String? nombre,
    String? aPaterno,
    String? aMaterno,
    String? email,
    String? about,
    String? telefono,
  }) async {
    final newUser = await authRepository.editProfile(
      nombre: nombre,
      aPaterno: aPaterno,
      aMaterno: aMaterno,
      email: email,
      telefono: telefono,
      about: about,
      foto: _pickedImage.value?.path,
    );
    authController.user = newUser;
    _pickedImage.value = null;
  }

  pickImage(BuildContext context) async {
    final picked = await imageSelector.showSelectionDialog(context);
    if (picked != null) {
      _pickedImage.value = picked;
    }
  }
}
