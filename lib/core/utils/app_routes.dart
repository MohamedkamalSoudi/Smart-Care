import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/prescribed_treatments/presentation/add_new_prescription.dart';
import 'package:smart_care_app/features/nurse/Rediology/rediology_view.dart';

import '../../features/doctor/login/presentation/views/login_view.dart';
import '../../features/doctor/description/presentation/views/description_view.dart';
import '../../features/doctor/prescribed_treatments/presentation/view/widgets/medication_card.dart';
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
    HomeViewDoctor.id: (context) => HomeViewDoctor(),
    ProfileView.id: (context) => ProfileView(),
    PatientData.id: (context) => PatientData(),
    DescriptionView.id: (context) => DescriptionView(),
    RequiredTestsView.id: (context) => RequiredTestsView(),
    RediologyView.id: (context) => RediologyView(),
    AddNewPrescription.id: (context) => AddNewPrescription(),
    MedicationCard.id: (context) => MedicationCard(),

  };
}
