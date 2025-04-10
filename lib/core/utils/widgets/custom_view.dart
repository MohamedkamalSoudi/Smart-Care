import 'package:flutter/material.dart';
import 'custom_view_appbar.dart';

class CustomView extends StatelessWidget {
  final String title;
  final bool isFloatingActive;
  final Function() onPressed;
  final Widget body;

  const CustomView({
    super.key,
    required this.title,
    required this.isFloatingActive,
    required this.body,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBE2FF),
      appBar: customViewAppbar(context, title),
      body: body,
      floatingActionButton: isFloatingActive
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 108, 183, 221),
              onPressed: onPressed,
              child: Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}
