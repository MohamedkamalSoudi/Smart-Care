import 'package:flutter/material.dart';

class CustomTapBarButton extends StatelessWidget {
  const CustomTapBarButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onPressed,
  });
  final String text;
  final bool isSelected;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: isSelected ? null : 0,
      color: isSelected ? Color(0xff4DADFB) : Color(0xff9ADCF6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
