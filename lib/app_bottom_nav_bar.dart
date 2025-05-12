// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:smart_care_app/features/doctor/home/presentation/views/home_view.dart';
// import 'package:smart_care_app/features/doctor/profile/presentation/views/profile_view.dart';

// PersistentTabController _controller = PersistentTabController();

// class AppBottomNavBar extends StatelessWidget {
//   const AppBottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _buildItems(context),
//       backgroundColor: Colors.white,
//       decoration: navBarDecorationMethod(),
//       navBarStyle: NavBarStyle.style9,
//     );
//   }

//   NavBarDecoration navBarDecorationMethod() {
//     return const NavBarDecoration();
//   }
// }

// List<Widget> _buildScreens() {
//   return const [
//     HomeViewDoctor(),
//     ProfileView(),
//   ];
// }

// List<PersistentBottomNavBarItem> _buildItems(BuildContext context) {
//   return [
//     PersistentBottomNavBarItem(
//       title: 'Home',
//       textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//       icon: Image.asset(
//         'assets/images/homeColored.png',
//       ),
//     ),
//     PersistentBottomNavBarItem(
//       title: 'Profile',
//       textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//       icon: Image.asset(
//         'assets/images/profileColored.png',
//       ),
//     ),
//   ];
// }
