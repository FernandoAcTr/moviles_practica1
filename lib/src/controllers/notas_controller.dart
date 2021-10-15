import 'package:get/get.dart';
import 'package:practica2/src/data/models/nota.dart';
import 'package:practica2/src/data/repositories/nota_repository.dart';

class NotasController extends GetxController {
  final NotaRepository repository;

  NotasController({required this.repository});

  //state
  final _loading = false.obs;
  final List<Nota> _notas = <Nota>[].obs;

  bool get loading => _loading.value;
  List<Nota> get notas => _notas;

  @override
  void onInit() {
    fetchNotes();
    super.onInit();
  }

  void fetchNotes() async {
    _loading.value = true;
    final notas = await repository.findAll();
    _notas.assignAll(notas);
    _loading.value = false;
  }

  void deleteNote(Nota nota) {
    repository.delete(nota.id!);
    _notas.removeWhere((element) => element.id == nota.id);
  }

  void addNote(Nota nota) {
    repository.insert(nota.toMap());
    _notas.add(nota);
  }

  void updateNote(Nota nota) {
    repository.update(nota.toMap());
    _notas.removeWhere((element) => element.id == nota.id);
    _notas.add(nota);
  }
}
