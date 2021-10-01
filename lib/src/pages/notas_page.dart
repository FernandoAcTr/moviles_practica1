import 'package:flutter/material.dart';
import 'package:practica2/routes.dart';
import 'package:practica2/src/database/db_helper.dart';
import 'package:practica2/src/models/nota_model.dart';

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

            if (snapshot.data!.isEmpty) return _noData();

            return _notasList(snapshot.data!);
          },
        ),
      ),
    );
  }

  LayoutBuilder _noData() {
    return LayoutBuilder(builder: (context, constraints) {
      return ListView(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: Text('Sin Notas agregadas aún')),
          )
        ],
      );
    });
  }

  Widget _notasList(List<Nota> notas) {
    return ListView.builder(
      itemCount: notas.length,
      itemBuilder: (context, index) {
        final nota = notas[index];

        return Dismissible(
          key: Key(index.toString()),
          background: Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.centerStart,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: Card(
            child: ListTile(
              title: Text(nota.titulo!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(nota.detalle!),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => Navigator.pushNamed(context, Routes.agregar, arguments: nota),
              ),
            ),
          ),
          onDismissed: (direction) {
            _dbHelper.delete(nota.id!);
            setState(() {
              _listNotas = _dbHelper.getAllNotes();
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Nota eliminada")),
            );
          },
          confirmDismiss: (direction) async {
            final result = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text('¿Estas Seguro?'),
                actions: [
                  TextButton(
                    child: Text('Sí, eliminar'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () => Navigator.of(context).pop(false),
                  )
                ],
              ),
            );

            return result;
          },
        );
      },
    );
  }
}
