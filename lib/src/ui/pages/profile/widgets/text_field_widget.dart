import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? type;
  final int? maxLength;

  const TextFieldWidget({
    required this.label,
    this.controller,
    this.type,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 8),
        TextFormField(
          keyboardType: type,
          maxLength: maxLength,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          controller: controller,
          validator: (value) {
            if (value?.isEmpty == true) return 'El campo es obligatorio';
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
