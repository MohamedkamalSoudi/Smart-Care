import 'package:smart_care_app/features/doctor/profile/data/profile_model.dart';

abstract class DoctorProfileStates {}

class DoctorProfileLoading extends DoctorProfileStates {}

class DoctorProfileSuccess extends DoctorProfileStates {
  final ProfileDoctorModel doctorProfileModel;
  DoctorProfileSuccess({required this.doctorProfileModel});
}

class DoctorProfileError extends DoctorProfileStates {
  final String message;
  DoctorProfileError(this.message);
}
