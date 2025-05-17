import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';

class CustomListTileNurse extends StatelessWidget {
  final IconData icon;
  final String text;
  final double horizontalGap;
  final VoidCallback? onTap; 

  const CustomListTileNurse({
    super.key,
    required this.icon,
    required this.text,
    this.horizontalGap = 40,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.iconhome),
      title: Text(
        text,
        style: TextStyle(color: AppColors.black, fontSize: 18),
      ),
      horizontalTitleGap: horizontalGap,
      minLeadingWidth: 30,
      onTap: onTap, 
    );
  }
}