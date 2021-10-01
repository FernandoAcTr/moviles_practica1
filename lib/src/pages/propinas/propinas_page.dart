import 'package:flutter/material.dart';

class Propinas extends StatelessWidget {
  final _propinaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Propinas'),
        brightness: Brightness.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tu Consumo (\$)',
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
              keyboardType: TextInputType.number,
              controller: _propinaController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final consumo = double.parse(_propinaController.text);
                final propina = consumo * 1.16;
                showDialog(
                  context: context,
                  builder: (_) => createDialog(propina),
                );
              },
              child: Text('Calcular'),
            )
          ],
        ),
      ),
    );
  }

  Widget createDialog(double propina) {
    return AlertDialog(
      title: Text('Propina'),
      content: Text('El total a pagar es \$${propina.toStringAsFixed(2)}'),
    );
  }
}
