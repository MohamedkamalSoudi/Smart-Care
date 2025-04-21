import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final double horizontalGap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    this.horizontalGap = 40,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.iconhome),
      title: Text(text, style: TextStyle(color: AppColors.black, fontSize: 18)),
      horizontalTitleGap: horizontalGap,
      minLeadingWidth: 30, 
    );
  }
}