import 'package:get/get.dart';
import 'package:practica2/src/controllers/auth_controller.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(authRepository: AuthRepository()));
  }
}
