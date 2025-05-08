import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';

PreferredSizeWidget homeViewAppbar(
    {bool isNurse = false, VoidCallback? onPressed}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: Column(
      children: [
        AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            'Patients List',
            style: TextStyle(
                color: AppColors.grey60,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.whitebody,
          elevation: 0,
          actions: isNurse
              ? [
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.notifications, color: AppColors.grey60),
                  ),
                ]
              : [],
          automaticallyImplyLeading: false,
        ),
        Divider(
          height: 1.5,
          thickness: 1.5,
          color: AppColors.iconhome,
        ),
      ],
    ),
  );
}
