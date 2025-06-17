import 'package:flutter/material.dart';

class DrugNameField extends StatelessWidget {
  final TextEditingController controller;

  const DrugNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Drug Name", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller, 
          decoration: InputDecoration(
            hintText: " Amoxicillin 250mg",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
