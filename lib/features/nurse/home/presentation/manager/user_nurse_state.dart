
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';

abstract class UserNurseState {}

class UserNurseInitial extends UserNurseState {}

class UserNurseLoading extends UserNurseState {}

class UserNurseLoaded extends UserNurseState {
  final List<UserModelNurse> users;
  UserNurseLoaded(this.users);
}

class UserNurseError extends UserNurseState {
  final String message;
  UserNurseError(this.message);
}