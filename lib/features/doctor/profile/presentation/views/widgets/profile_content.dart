import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_care_app/constant.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/core/utils/assets.dart';
import '../../../../../common/login/presentation/views/login_view.dart';
import '../../../../home/presentation/views/widgets/custom_bottom_navgbar.dart';
import '../../../data/profile_model.dart';
import 'custom_list_tile.dart';

class ProfileContent extends StatelessWidget {
  final ProfileDoctorModel profile;

  const ProfileContent({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = (profile.image != null && profile.image!.isNotEmpty)
        ? 'http://smartcare.wuaze.com/public/${profile.image}'
        : null;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.iconhome),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('My Profile', style: TextStyle(color: AppColors.iconhome)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 60,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl)
                  : const AssetImage(AssetsData.emptyUser) as ImageProvider,
            ),
            const SizedBox(height: 60),
            CustomListTile(icon: Icons.person, text: profile.userName, horizontalGap: 30),
            const SizedBox(height: 10),
            CustomListTile(icon: Icons.person_outline, text: profile.specialty, horizontalGap: 30),
            const SizedBox(height: 10),
            CustomListTile(icon: Icons.email, text: profile.email, horizontalGap: 30),
            const SizedBox(height: 10),
            CustomListTile(
              icon: Icons.logout,
              text: 'Logout',
              horizontalGap: 30,
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('token', '');
                token = '';
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
