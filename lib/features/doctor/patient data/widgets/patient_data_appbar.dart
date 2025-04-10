import 'package:flutter/material.dart';

AppBar patientDataAppbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new,
          color: Color.fromARGB(255, 108, 183, 241)),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text('Patient Data'),
  );
}
