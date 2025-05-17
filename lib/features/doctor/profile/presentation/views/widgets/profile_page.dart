import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/custom_bottom_navgbar.dart';
import 'package:smart_care_app/features/doctor/profile/presentation/managers/profile_cubit.dart';
import 'package:smart_care_app/features/doctor/profile/presentation/managers/profile_states.dart';
import 'package:smart_care_app/features/doctor/profile/presentation/views/widgets/custom_list_tile.dart';

import '../../../../../common/login/presentation/views/login_view.dart';

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
                    // 🔴 زر تسجيل الخروج مع الوظيفة الكاملة
                    CustomListTile(
                      icon: Icons.logout,
                      text: 'Logout',
                      horizontalGap: 30,
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('user_token'); // حذف توكن المستخدم

                        // التنقل إلى شاشة تسجيل الدخول وإزالة المحفوظات
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(), // تأكد من وجود هذه الشاشة
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
          child: CircularProgressIndicator(), // عرض مؤشر أثناء جلب البيانات
        );
      },
    );
  }
}