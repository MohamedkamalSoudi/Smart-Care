import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/views/required_radiology_view.dart';
import 'package:smart_care_app/features/doctor/prescribed%20treatments/presentation/manager/cubit/treatment_doctor_cubit.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import '../../features/common/login/presentation/views/login_view.dart';
import '../../features/common/onboarding/presentation/views/onboarding_view.dart';
import '../../features/common/splash/views/splahs_view.dart';
import '../../features/doctor/description/presentation/views/description_view.dart';
import '../../features/doctor/home/data/patient_model.dart';
import '../../features/doctor/home/presentation/views/home_view_doctor.dart';
import '../../features/doctor/patient data/presentation/views/patient_data.dart';
import '../../features/doctor/prescribed treatments/presentation/view/add_new_prescription_viwe_body.dart';
import '../../features/doctor/prescribed treatments/presentation/view/widgets/medication_card.dart';
import '../../features/doctor/profile/presentation/views/profile_view.dart';
import '../../features/doctor/required_tests/presentation/views/required_tests_view.dart';
import '../../features/doctor/required_tests/presentation/views/widgets/test_result.dart';
import '../../features/nurse/description nurse/presentation/views/description_nurse_view.dart';
import '../../features/nurse/home/presentation/view/home_view_nurse.dart';
import '../../features/nurse/patient data nurse/presentation/views/patient_data_nurse.dart';
import '../../features/nurse/prescribed treatments nurse/manager/treatment_cubit.dart';
import '../../features/nurse/prescribed treatments nurse/presentation/view/dispaly_prescription_body_nurse.dart';
import '../../features/nurse/profile narse/presentation/views/widgets/profile_narse_view.dart';
import '../../features/nurse/required tests nurse/presentation/views/required_tests_view.dart';
import '../../features/nurse/Rediology/presentation/views/required_rediology_view.dart';

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
    RequiredTestsViewAtDoctor.id: (context) => RequiredTestsViewAtDoctor(),
    RequiredRadiologyViewAtDoctor.id: (context) =>
        RequiredRadiologyViewAtDoctor(),
    MedicationCard.id: (context) {
  final args = ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
  final cubit = args['cubit'] as TreatmentCubitDoctor;
  final patientId = args['patientId'] as String;

  return MedicationCard(
    cubit: cubit,
    patientId: patientId,
  );
},
    ProfileNarseView.id: (context) => ProfileNarseView(),
    PatientDataNurse.id: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as UserModelNurse;
      return PatientDataNurse(model: user);
    },
    HomeViewNurse.id: (context) => HomeViewNurse(),
    DescriptionNurseView.id: (context) => DescriptionNurseView(),
    RequiredTestsViewAtNurse.id: (context) => RequiredTestsViewAtNurse(),
    RequiredRediologyViewAtNurse.id: (context) =>
        RequiredRediologyViewAtNurse(),
    DisplayPrescriptionBodyNurse.id: (context) {
  final patientId = ModalRoute.of(context)!.settings.arguments as int;
  return BlocProvider(
    create: (context) => TreatmentCubit()..fetchTreatments(patientId),
    child: DisplayPrescriptionBodyNurse(),
  );
},
AddNewPrescriptionViweBody.id: (context) => AddNewPrescriptionViweBody(
),
    TestResult.id: (context) => TestResult(),
  };
}
