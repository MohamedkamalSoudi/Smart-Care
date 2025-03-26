import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/home/Home_view.dart';
import 'package:smart_care_app/features/splash/presentation/patient%20data/description%20of%20the%20condition/widgets/patient_data_page_1.dart';
import 'package:smart_care_app/features/splash/presentation/patient%20data/patient_data.dart';
import 'package:smart_care_app/features/splash/presentation/profile/profile_view.dart';

import 'features/login/views/login_view.dart';
import 'features/logo/views/logo_view.dart';
import 'features/role_selection/views/role_selection_view.dart';
import 'features/splash/presentation/patient data/description of the condition/widgets/patient_data_page_2.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const SmartCare());
}

class SmartCare extends StatelessWidget {
  const SmartCare({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashView.id: (context) => SplashView(),
        LogoView.id: (context) => LogoView(),
        RoleSelectionView.id: (context) => RoleSelectionView(),
        LoginView.id: (context) => LoginView(),
        HomeView.id: (context) => HomeView(),
        ProfileView.id: (context) => ProfileView(),
        PatientData.id: (context) => PatientData(),
        PatientDataPage1.id: (context) => PatientDataPage1(),
        PatientDataPage2.id: (context) => PatientDataPage2(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LogoView.id,
    );
  }
}
