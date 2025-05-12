import 'package:flutter/material.dart';

class DrugNameField extends StatelessWidget {
  const DrugNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Drug Name", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            hintText: "e.g. Amoxicillin 250mg",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
