import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import '../../../../profile narse/presentation/views/widgets/profile_narse_view.dart';

class CustomBottomNavBarNurse extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBarNurse({
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
        Navigator.pushNamed(context, ProfileNarseView.id);
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
