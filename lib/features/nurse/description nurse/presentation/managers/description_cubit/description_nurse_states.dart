import '../../../data/models/description_nurse_model.dart';

abstract class DescriptionNurseStates {}

class EmptyNurseState extends DescriptionNurseStates {}

class DataFoundedNurse extends DescriptionNurseStates {
  final DescriptionNurseModel model;
  DataFoundedNurse({required this.model});
}

class LoadingNurseState extends DescriptionNurseStates {}

class ErrorNurseState extends DescriptionNurseStates {
  final String error;
  ErrorNurseState(this.error);
}
