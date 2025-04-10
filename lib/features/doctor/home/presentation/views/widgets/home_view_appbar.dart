import 'package:flutter/material.dart';

AppBar homeViewAppbar() {
  return AppBar(
    centerTitle: true,
    title: Text('Patients List', style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
  );
}
