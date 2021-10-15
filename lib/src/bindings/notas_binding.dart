import 'package:get/get.dart';
import 'package:practica2/src/controllers/notas_controller.dart';
import 'package:practica2/src/data/repositories/nota_repository.dart';

class NotasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotasController>(() => NotasController(repository: NotaRepository()));
  }
}
