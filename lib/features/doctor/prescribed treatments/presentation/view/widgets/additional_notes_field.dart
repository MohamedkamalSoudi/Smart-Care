import 'package:flutter/material.dart';

class AdditionalNotesField extends StatelessWidget {
  const AdditionalNotesField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Notes (Optional)", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: 2,
          decoration: InputDecoration(
            hintText: "e.g. Take with food",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
