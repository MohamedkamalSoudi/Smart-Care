import 'package:smart_care_app/features/nurse/profile%20narse/data/profile_model_nurse.dart';

abstract class ProfileNarseStates {}

class ProfileNarseLoading extends ProfileNarseStates {}

class ProfileNarseSuccess extends ProfileNarseStates {
  final ProfileModelNurse profileNurseModel;
  ProfileNarseSuccess({required this.profileNurseModel});
}

class ProfileNarseError extends ProfileNarseStates {
  final String message;
  ProfileNarseError(this.message);
}
