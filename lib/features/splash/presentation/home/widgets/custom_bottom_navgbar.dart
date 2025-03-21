import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/home/Home_view.dart';
import 'package:smart_care_app/features/splash/presentation/profile/profile_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: const Color(0xFFBBE2FF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context, HomeView.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, ProfileView.id);
            },
          ),
        ],
      ),
    );
  }
}