import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/profile/widgets/profile_page.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const id = 'ProfileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfilePage(),
    );
  }
}
