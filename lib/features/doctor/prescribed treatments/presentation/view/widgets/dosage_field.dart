import 'package:flutter/material.dart';

class DosageField extends StatelessWidget {
  const DosageField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dosage (Optional)", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "e.g. 1 Tablet, 10ml",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}