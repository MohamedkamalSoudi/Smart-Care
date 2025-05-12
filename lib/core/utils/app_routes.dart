import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import '../../features/common/login/presentation/views/login_view.dart';
import '../../features/common/onboarding/presentation/views/onboarding_view.dart';
import '../../features/common/splash/views/splahs_view.dart';
import '../../features/doctor/description/presentation/views/description_view.dart';
import '../../features/doctor/display prescription/presentation/views/widgets/dispaly_prescription_body.dart';
import '../../features/doctor/home/data/patient_model.dart';
import '../../features/doctor/home/presentation/views/home_view_doctor.dart';
import '../../features/doctor/patient data/presentation/views/patient_data.dart';
import '../../features/doctor/prescribed treatments/presentation/add_new_prescription.dart';
import '../../features/doctor/prescribed treatments/presentation/view/widgets/medication_card.dart' show MedicationCard;
import '../../features/doctor/profile/presentation/views/profile_view.dart';
import '../../features/doctor/required_tests/presentation/views/required_tests_view.dart';
import '../../features/nurse/Rediology/rediology_view.dart';
import '../../features/nurse/description nurse/presentation/views/description_nurse_view.dart';
import '../../features/nurse/home/presentation/view/home_view_nurse.dart';
import '../../features/nurse/patient data nurse/presentation/views/patient_data_nurse.dart';
import '../../features/nurse/prescribed treatments nurse/presentation/add_new_prescription_nurse.dart';
import '../../features/nurse/prescribed treatments nurse/presentation/view/widgets/dispaly_prescription_body_nurse.dart';
import '../../features/nurse/profile narse/presentation/views/widgets/profile_narse_view.dart';
import '../../features/nurse/required tests nurse/presentation/views/required_tests_view.dart';

Map<String, WidgetBuilder> get appRoutes {
  return {
    OnboardingView.id: (context) => OnboardingView(),
    SplashView.id: (context) => SplashView(),
    LoginView.id: (context) => LoginView(),
    HomeViewDoctor.id: (context) => HomeViewDoctor(),
    ProfileView.id: (context) => ProfileView(),
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
    ProfileNarseView.id: (context) => ProfileNarseView(),
    PatientDataNurse.id: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as UserModelNurse;
      return PatientDataNurse(model: user);
    },
    HomeViewNurse.id: (context) => HomeViewNurse(),
    DescriptionNurseView.id: (context) => DescriptionNurseView(),
    RequiredTestsViewNurse.id: (context) => RequiredTestsViewNurse(),
    AddNewPrescriptionNurse.id: (context) => AddNewPrescriptionNurse(),
    DisplayPrescriptionBodyNurse.id: (context) => DisplayPrescriptionBodyNurse(),
    
  };
}
