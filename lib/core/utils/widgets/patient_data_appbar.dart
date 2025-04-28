import 'package:flutter/material.dart';
import '../../app_colors.dart';

PreferredSizeWidget PatientDataAppbar({
  required BuildContext context,
  required String title,
  bool isNurse = false,
  VoidCallback? onPressed,
  Color iconColor = AppColors.blue,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: Column(
      children: [
        AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: iconColor),
            onPressed: onPressed ?? () => Navigator.pop(context),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.grey60,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.whitebody,
          elevation: 0,
          actions: isNurse ? [] : null,
        ),
        const Divider(
          height: 1.5,
          thickness: 1.5,
          color: AppColors.iconhome,
        ),
      ],
    ),
  );
}
