import 'package:flutter/material.dart';

import '../../features/doctor/login/views/login_view.dart';
import '../../features/doctor/description/presentation/views/description_view.dart';
import '../../features/doctor/required_tests/presentation/views/required_tests_view.dart';
import '../../features/splash/views/splahs_view.dart';
import '../../features/doctor/role_selection/views/role_selection_view.dart';
import '../../features/doctor/home/presentation/views/home_view.dart';
import '../../features/doctor/patient data/presentation/views/patient_data.dart';
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
    DescriptionView.id: (context) => DescriptionView(),
    RequiredTestsView.id: (context) => RequiredTestsView(),
  };
}
