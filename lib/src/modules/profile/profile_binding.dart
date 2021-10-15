import 'package:get/get.dart';
import 'package:practica2/src/modules/auth/auth_controller.dart';
import 'package:practica2/src/modules/profile/profile_controller.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';
import 'package:practica2/src/device/ImageSelector.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(
          authRepository: AuthRepository(),
          imageSelector: ImageSelector(),
          authController: Get.find<AuthController>(),
        ));
  }
}
