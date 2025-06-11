import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/shimmer/shimmer_profile_page.dart';
import '../../managers/profile_cubit.dart';
import '../../managers/profile_states.dart';
import 'profile_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileCubit, DoctorProfileStates>(
        builder: (context, state) {
          if (state is DoctorProfileLoading) {
            return const ShimmerProfilePage();
          } else if (state is DoctorProfileNoInternet) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "Please check your internet connection.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else if (state is DoctorProfileSuccess) {
            return ProfileContent(profile: state.doctorProfileModel);
          } else if (state is DoctorProfileError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 80, color: Colors.grey),
                  const SizedBox(height: 10),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
