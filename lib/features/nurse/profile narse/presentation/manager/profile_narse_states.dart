import '../../data/profile_model_nurse.dart';

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

class ProfileNarseNoInternet extends ProfileNarseStates {} 
