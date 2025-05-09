import 'package:flutter/material.dart';

class DosageField extends StatelessWidget {
  const DosageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dosage (Optional)", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            hintText: "e.g. 1 Tablet, 10ml",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}