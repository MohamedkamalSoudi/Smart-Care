import 'package:flutter/material.dart';

class CustomNotificationButton extends StatelessWidget {
  final String text;
  final bool isColored;
  final VoidCallback onTap;

  const CustomNotificationButton({
    super.key,
    required this.text,
    required this.isColored,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor:
            isColored ? const Color(0xff4DADFB) : Colors.transparent,
        side: BorderSide(
          width: 2,
          color: isColored
              ? const Color(0xff4DADFB)
              : const Color(0xffD9D9D9).withOpacity(0.8),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isColored ? Colors.white : const Color(0xff4DADFB),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
