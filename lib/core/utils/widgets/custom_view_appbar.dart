import 'package:flutter/material.dart';

AppBar customViewAppbar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 16),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xFF1385E2),
      ),
    ),
  );
}
