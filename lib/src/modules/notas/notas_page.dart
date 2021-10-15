import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica2/src/modules/notas/notas_controller.dart';
import 'package:practica2/src/data/models/nota.dart';
import 'package:practica2/src/modules/notas/widgets/no_data_widget.dart';
import 'package:practica2/src/modules/notas/widgets/nota_widget.dart';
import 'package:practica2/src/routes/pages.dart';

class NotasPage extends GetView<NotasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de notas'),
        brightness: Brightness.dark,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.AGREGAR_NOTA),
            icon: Icon(Icons.note_add),
          ),
        ],
      ),
      body: RefreshIndicator(
          onRefresh: () async => controller.fetchNotes(),
          child: Obx(() {
            if (controller.loading) return Center(child: CircularProgressIndicator());

            if (controller.notas.isEmpty) return NoDataWidget();

            return _notasList(controller.notas);
          })),
    );
  }

  Widget _notasList(List<Nota> notas) {
    return ListView.builder(
      itemCount: notas.length,
      itemBuilder: (context, index) {
        final nota = notas[index];

        return NotaWidget(
          index: index,
          nota: nota,
          onDismissed: (direction) {
            controller.deleteNote(nota);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Nota eliminada")),
            );
          },
        );
      },
    );
  }
}
