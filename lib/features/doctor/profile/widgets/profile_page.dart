import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/core/utils/assets.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/custom_bottom_navgbar.dart';

import 'custom_list_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isPasswordVisible = false;

  // ignore: unused_element
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.iconhome),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(color: AppColors.iconhome),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(AssetsData.bitmap),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.iconhome,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt,
                            color: Colors.white, size: 15),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              CustomListTile(
                icon: Icons.person,
                text: 'Ahmed Mohamed',
                horizontalGap: 30,
              ),
              SizedBox(
                height: 10,
              ),
              CustomListTile(
                icon: Icons.person_outline,
                text: 'Dentistry',
                horizontalGap: 30,
              ),
              SizedBox(
                height: 10,
              ),
              CustomListTile(
                icon: Icons.email,
                text: 'ahmed@gmail.com',
                horizontalGap: 30,
              ),
              SizedBox(
                height: 10,
              ),
              CustomListTile(
                icon: Icons.visibility_off,
                text: '**********',
                horizontalGap: 30,
              ),
              SizedBox(
                height: 10,
              ),
              CustomListTile(
                icon: Icons.logout,
                text: 'Logout',
                horizontalGap: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
