import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.CustomRowElevatedButton});

  final Function(BuildContext) onPressed;
  final Widget CustomRowElevatedButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        onPressed: () {
          onPressed(context);
        },
        child: CustomRowElevatedButton);
  }
}
