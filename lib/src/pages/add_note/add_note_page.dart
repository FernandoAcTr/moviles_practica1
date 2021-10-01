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
  final _formKey = GlobalKey<FormState>();

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
                  print(value?.isEmpty);
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
      ),
    );
  }
}
