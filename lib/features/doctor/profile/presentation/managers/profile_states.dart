import 'package:smart_care_app/features/doctor/profile/data/profile_model.dart';

abstract class ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileSuccess extends ProfileStates {
  final ProfileModel profileModel;
  ProfileSuccess({required this.profileModel});
}

class ProfileError extends ProfileStates {
  final String message;
  ProfileError(this.message);
}
