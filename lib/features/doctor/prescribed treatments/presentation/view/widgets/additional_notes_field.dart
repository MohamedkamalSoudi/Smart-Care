import 'package:flutter/material.dart';

class AdditionalNotesField extends StatelessWidget {
  const AdditionalNotesField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Notes (Optional)", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),
        TextFormField(
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
