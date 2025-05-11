import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/data/patient_model.dart';
import '../../features/doctor/prescribed_treatments/presentation/add_new_prescription.dart';
import '../../features/nurse/Rediology/rediology_view.dart';

import '../../features/doctor/display prescription/presentation/views/widgets/dispaly_prescription_body.dart';
import '../../features/common/login/presentation/views/login_view.dart';
import '../../features/doctor/description/presentation/views/description_view.dart';
import '../../features/doctor/prescribed_treatments/presentation/view/widgets/medication_card.dart';
import '../../features/doctor/required_tests/presentation/views/required_tests_view.dart';
import '../../features/common/splash/views/splahs_view.dart';
import '../../features/common/role_selection/views/role_selection_view.dart';
import '../../features/doctor/home/presentation/views/home_view.dart';
import '../../features/doctor/patient data/presentation/views/patient_data.dart';
import '../../features/doctor/profile/presentation/views/profile_view.dart';
import '../../features/common/onboarding/presentation/views/onboarding_view.dart';

Map<String, WidgetBuilder> get appRoutes {
  return {
    OnboardingView.id: (context) => OnboardingView(),
    SplashView.id: (context) => SplashView(),
    RoleSelectionView.id: (context) => RoleSelectionView(),
    LoginView.id: (context) => LoginView(),
    HomeViewDoctor.id: (context) => HomeViewDoctor(),
    ProfileView.id: (context) => ProfileView(),
    // PatientData.id: (context) => PatientData(
    //       model: UserModel(id: 1, name: 'name', room: 'room', bed: 1),
    //     ),
    PatientData.id: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as UserModel;
      return PatientData(model: user);
    },
    DescriptionView.id: (context) => DescriptionView(),
    RequiredTestsView.id: (context) => RequiredTestsView(),
    RediologyView.id: (context) => RediologyView(),
    AddNewPrescription.id: (context) => AddNewPrescription(),
    MedicationCard.id: (context) => MedicationCard(),
    DisplayPrescriptionBody.id: (context) => DisplayPrescriptionBody(),
  };
}
