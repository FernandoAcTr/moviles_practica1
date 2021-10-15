import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica2/src/controllers/notas_controller.dart';
import 'package:practica2/src/data/models/nota.dart';

class AddNotePage extends GetView<NotasController> {
  final _controllerTitutlo = TextEditingController();
  final _controllerDetalle = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    bool editing = false;
    Nota? oldNote;

    if (arguments != null) {
      oldNote = arguments as Nota;
      _controllerDetalle.text = oldNote.detalle!;
      _controllerTitutlo.text = oldNote.titulo!;
      editing = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? 'Editar Nota' : 'Agregar Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Nota',
                  labelText: 'Título de la Nota',
                ),
                controller: _controllerTitutlo,
                validator: (value) {
                  if (value?.isEmpty == true) return 'El campo es obligatorio';
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Nota',
                  labelText: 'Detalle de la Nota',
                ),
                controller: _controllerDetalle,
                validator: (value) {
                  if (value?.isEmpty == true) return 'El campo es obligatorio';
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final titulo = _controllerTitutlo.text;
                  final detalle = _controllerDetalle.text;

                  if (!_formKey.currentState!.validate()) return;

                  if (editing)
                    controller.updateNote(oldNote!.copyWith(titulo: titulo, detalle: detalle));
                  else
                    controller.addNote(Nota(titulo: titulo, detalle: detalle));

                  Get.back();
                },
                child: Text('Guardar Nota'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
