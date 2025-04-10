import 'package:flutter/material.dart';

import '../../features/doctor/login/views/login_view.dart';
import '../../features/splash/views/splahs_view.dart';
import '../../features/doctor/role_selection/views/role_selection_view.dart';
import '../../features/doctor/home/presentation/views/home_view.dart';
import '../../features/doctor/patient data/description of the condition/widgets/patient_data_page_1.dart';
import '../../features/doctor/patient data/description of the condition/widgets/patient_data_page_2.dart';
import '../../features/doctor/patient data/patient_data.dart';
import '../../features/doctor/profile/profile_view.dart';
import '../../features/doctor/onboarding/presentation/views/onboarding_view.dart';

Map<String, WidgetBuilder> get appRoutes {
  return {
    OnboardingView.id: (context) => OnboardingView(),
    SplashView.id: (context) => SplashView(),
    RoleSelectionView.id: (context) => RoleSelectionView(),
    LoginView.id: (context) => LoginView(),
    HomeView.id: (context) => HomeView(),
    ProfileView.id: (context) => ProfileView(),
    PatientData.id: (context) => PatientData(),
    PatientDataPage1.id: (context) => PatientDataPage1(),
    PatientDataPage2.id: (context) => PatientDataPage2(),
  };
}
