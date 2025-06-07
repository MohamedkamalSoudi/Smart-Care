import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    return BlocConsumer<ProfileNarseCubit, ProfileNarseStates>(
      listener: (context, state) {
        if (state is ProfileNarseError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfileNarseSuccess) {
          final nurseProfile = state.profileNurseModel;
          String baseUrl =
              'http://smartcare.wuaze.com/public/'; // عدّله حسب رابط السيرفر
          String? imagePath = nurseProfile.image;

          String? imageUrl = (imagePath != null && imagePath.isNotEmpty)
              ? '$baseUrl$imagePath'
              : null;
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: AppColors.iconhome),
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
                          backgroundImage: (imageUrl != null)
                              ? NetworkImage(imageUrl)
                              : AssetImage(AssetsData.emptyUser)
                                  as ImageProvider,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomListTileNurse(
                      icon: Icons.person,
                      text: nurseProfile.userName,
                      horizontalGap: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTileNurse(
                      icon: Icons.person_outline,
                      text: 'Nurse',
                      horizontalGap: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTileNurse(
                      icon: Icons.email,
                      text: nurseProfile.email,
                      horizontalGap: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTileNurse(
                      icon: Icons.logout,
                      text: 'Logout',
                      horizontalGap: 30,
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('token');
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBarNurse(
              currentIndex: 1,
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
