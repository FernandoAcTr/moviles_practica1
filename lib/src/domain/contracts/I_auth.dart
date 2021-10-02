import 'package:practica2/src/domain/models/user.dart';

abstract class AbstractAuthRepository {
  Future<User?> login({required String email, required String password});
  Future<void> logout();
  Future<User?> get currentUser;
  Future<void> editProfile({
    String? nombre,
    String? aPaterno,
    String? aMaterno,
    String? foto,
    String? email,
    String? about,
    String? telefono,
  });
}
