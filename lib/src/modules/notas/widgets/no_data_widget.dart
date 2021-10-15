import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
