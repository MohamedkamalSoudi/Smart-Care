import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/doctor/profile/presentation/managers/profile_cubit.dart';
import 'package:smart_care_app/features/doctor/profile/presentation/views/widgets/profile_page.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const id = 'ProfileView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: Scaffold(
        body: ProfilePage(),
      ),
    );
  }
}
