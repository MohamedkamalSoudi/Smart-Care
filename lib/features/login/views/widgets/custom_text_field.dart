import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.prefixIcon, required this.hintText});
  final String hintText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Icon(
            prefixIcon,
            size: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
