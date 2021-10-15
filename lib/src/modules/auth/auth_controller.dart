import 'package:get/get.dart';
import 'package:practica2/src/data/models/user.dart';
import 'package:practica2/src/data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  //state
  final _user = Rxn<User>();

  User? get user => _user.value;
  set user(User? value) => _user.value = value;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    _user.value = await authRepository.currentUser;
  }
}
