import 'package:flutter/material.dart';

class Intenciones extends StatefulWidget {
  const Intenciones({Key? key}) : super(key: key);

  @override
  _IntencionesState createState() => _IntencionesState();
}

class _IntencionesState extends State<Intenciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intenciones'),
      ),
      body: ListView(
        children: [
          Text('Intenciones'),
        ],
      ),
    );
  }
}
