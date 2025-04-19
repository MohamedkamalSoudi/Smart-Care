// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomNotificationButton extends StatelessWidget {
  const CustomNotificationButton({
    super.key,
    required this.text,
    required this.isColored,
  });
  final String text;
  final bool isColored;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: isColored ? Color(0xff4DADFB) : Colors.transparent,
            side: BorderSide(
                width: 2,
                color: isColored
                    ? Color(0xff4DADFB)
                    : Color(0xffD9D9D9).withOpacity(0.8)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: isColored ? Colors.white : Color(0xff4DADFB),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }
}
