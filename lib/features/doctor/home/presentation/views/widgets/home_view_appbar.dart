import 'package:flutter/material.dart';

AppBar homeViewAppbar({bool isNurse = false, void Function()? onPressed}) {
  return AppBar(
    centerTitle: true,
    title: Text('Patients List', style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: isNurse
        ? [IconButton(onPressed: onPressed, icon: Icon(Icons.notifications))]
        : [],
    automaticallyImplyLeading: false,
  );
}
