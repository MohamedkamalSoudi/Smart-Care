import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/features/doctor/profile/presentation/views/profile_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        Navigator.pushNamed(context, ProfileView.id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
            color: currentIndex == 0 ? AppColors.iconhome : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 30,
            color: currentIndex == 1 ? AppColors.iconhome : Colors.grey,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: AppColors.iconhome,
      unselectedItemColor: Colors.grey,
      backgroundColor: AppColors.whitebody,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    );
  }
}
