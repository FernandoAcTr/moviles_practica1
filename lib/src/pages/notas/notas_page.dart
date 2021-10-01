import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
import 'package:practica2/src/database/db_helper.dart';
import 'package:practica2/src/models/nota_model.dart';
import 'package:practica2/src/pages/notas/widget/no_data_widget.dart';
import 'package:practica2/src/pages/notas/widgets/nota_widget.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  _NotasPageState createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  late DatabaseHelper _dbHelper;
  Future<List<Nota>>? _listNotas;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
    _listNotas = _dbHelper.getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de notas'),
        brightness: Brightness.dark,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, Routes.agregar), icon: Icon(Icons.note_add)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _listNotas = _dbHelper.getAllNotes();
          });
        },
        child: FutureBuilder(
          future: _listNotas,
          builder: (context, AsyncSnapshot<List<Nota>> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Ha ocurrido un error'));
            }

            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data!.isEmpty) return NoDataWidget();

            return _notasList(snapshot.data!);
          },
        ),
      ),
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
            _dbHelper.delete(nota.id!);
            setState(() {
              _listNotas = _dbHelper.getAllNotes();
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Nota eliminada")),
            );
          },
        );
      },
    );
  }
}
