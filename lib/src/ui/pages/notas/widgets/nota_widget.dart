import 'package:flutter/material.dart';
import 'package:practica2/src/routes/pages.dart';

typedef void DismissCallback(DismissDirection direction);

class NotaWidget extends StatelessWidget {
  final DismissCallback? onDismissed;
  final int index;
  final nota;

  const NotaWidget({
    this.onDismissed,
    required this.index,
    required this.nota,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecond.toString()),
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
            onPressed: () => Navigator.pushNamed(context, Routes.AGREGAR_NOTA, arguments: nota),
          ),
        ),
      ),
      onDismissed: onDismissed,
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
  }
}
