import 'package:flutter/material.dart';

import '../../../../../../core/app_colors.dart';

AppBar homeViewAppbar({bool isNurse = false, void Function()? onPressed}) {
  return AppBar(
    scrolledUnderElevation: 0,
    centerTitle: true,
    title: Text('Patients List', style: TextStyle(color: AppColors.black)),
    backgroundColor: AppColors.whitebody,
    elevation: 0,
    actions: isNurse
        ? [IconButton(onPressed: onPressed, icon: Icon(Icons.notifications , color: AppColors.black))]
        : [],
    automaticallyImplyLeading: false,
  );
}
