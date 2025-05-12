import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/widgets/custom_bottom_navgbar_nurse.dart';
import '../../../../../../core/utils/app_colors.dart';
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
          final profile = state.profileNurseModel;
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
                          backgroundImage: NetworkImage(profile.image ??
                              'https://www.i2clipart.com/cliparts/6/9/2/c/clipart-facebook_no_image-512x512-692c.png'),
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
                    CustomListTileNurse(
                      icon: Icons.person,
                      text: profile.userName,
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
                      text: profile.email,
                      horizontalGap: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTileNurse(
                      icon: Icons.logout,
                      text: 'Logout',
                      horizontalGap: 30,
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
        return Container();
      },
    );
  }
}
