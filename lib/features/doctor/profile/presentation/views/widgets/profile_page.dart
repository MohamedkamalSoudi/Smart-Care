import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/core/utils/assets.dart';
import '../../../../../common/login/presentation/views/login_view.dart';
import '../../../../home/presentation/views/widgets/custom_bottom_navgbar.dart';
import '../../managers/profile_cubit.dart';
import '../../managers/profile_states.dart';
import 'custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, DoctorProfileStates>(
      listener: (context, state) {
        if (state is DoctorProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DoctorProfileSuccess) {
          final profile = state.doctorProfileModel;
          String baseUrl =
              'http://smartcare.wuaze.com/public/';
          String? imagePath = profile.image;

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
                    CustomListTile(
                      icon: Icons.person,
                      text: profile.userName,
                      horizontalGap: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTile(
                      icon: Icons.person_outline,
                      text: profile.specialty,
                      horizontalGap: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTile(
                      icon: Icons.email,
                      text: profile.email,
                      horizontalGap: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTile(
                      icon: Icons.logout,
                      text: 'Logout',
                      horizontalGap: 30,
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('user_token'); 
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LoginView(), 
                          ),
                          (route) => false,
                        );
                      },
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
        return Center(
          child: CircularProgressIndicator(), 
        );
      },
    );
  }
}
