import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;

  const TextFieldWidget({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
