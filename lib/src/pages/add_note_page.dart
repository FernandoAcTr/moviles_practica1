import 'package:flutter/material.dart';
import 'package:practica2/src/database/db_helper.dart';
import 'package:practica2/src/models/nota_model.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late DatabaseHelper _dbHelper;

  final _controllerTitutlo = TextEditingController();
  final _controllerDetalle = TextEditingController();
  bool editing = false;
  Nota? oldNote;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments != null) {
      oldNote = arguments as Nota;
      _controllerDetalle.text = oldNote!.detalle!;
      _controllerTitutlo.text = oldNote!.titulo!;
      editing = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? 'Editar Nota' : 'Agregar Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Nota',
                labelText: 'Título de la Nota',
                errorText: 'Este campo es obligatorio',
              ),
              controller: _controllerTitutlo,
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Nota',
                labelText: 'Detalle de la Nota',
                errorText: 'Este campo es obligatorio',
              ),
              controller: _controllerDetalle,
            ),
            ElevatedButton(
              onPressed: () async {
                final titulo = _controllerTitutlo.text;
                final detalle = _controllerDetalle.text;

                int result = 0;
                if (!editing) {
                  final newNote = Nota(titulo: titulo, detalle: detalle);
                  result = await _dbHelper.insert(newNote.toMap());
                } else {
                  oldNote!.titulo = titulo;
                  oldNote!.detalle = detalle;
                  result = await _dbHelper.update(oldNote!.toMap());
                }

                if (result > 0) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Ocurrió un error al agregar la nota')));
                }
              },
              child: Text('Guardar Nota'),
            )
          ],
        ),
      ),
    );
  }
}
