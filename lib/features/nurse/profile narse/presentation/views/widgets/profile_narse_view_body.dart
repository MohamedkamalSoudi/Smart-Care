import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_care_app/core/shimmer/shimmer_profile_page.dart';
import 'package:smart_care_app/core/utils/assets.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/widgets/custom_bottom_navgbar_nurse.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../common/login/presentation/views/login_view.dart';
import '../../manager/profile_narse_cubit.dart';
import '../../manager/profile_narse_states.dart';
import 'custom_list_tile_nurse.dart';

class ProfileNarseViewBody extends StatelessWidget {
  const ProfileNarseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileNarseCubit, ProfileNarseStates>(
        builder: (context, state) {
          if (state is ProfileNarseLoading) {
            return const ShimmerProfilePage(); 
          }

          if (state is ProfileNarseNoInternet) {
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
          }

          if (state is ProfileNarseSuccess) {
            final profile = state.profileNurseModel;
            final imageUrl = (profile.image != null && profile.image!.isNotEmpty)
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
                    CustomListTileNurse(icon: Icons.person, text: profile.userName, horizontalGap: 30),
                    const SizedBox(height: 10),
                    CustomListTileNurse(icon: Icons.person_outline, text: 'Nurse', horizontalGap: 30),
                    const SizedBox(height: 10),
                    CustomListTileNurse(icon: Icons.email, text: profile.email, horizontalGap: 30),
                    const SizedBox(height: 10),
                    CustomListTileNurse(
                      icon: Icons.logout,
                      text: 'Logout',
                      horizontalGap: 30,
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('token');
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
              bottomNavigationBar: const CustomBottomNavBarNurse(currentIndex: 1),
            );
          }

          if (state is ProfileNarseError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 80, color: Colors.grey),
                  const SizedBox(height: 10),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
