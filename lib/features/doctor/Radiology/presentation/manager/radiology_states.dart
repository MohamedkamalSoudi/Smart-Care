import 'package:smart_care_app/features/doctor/Radiology/data/radiology_model.dart';

abstract class RadiologyStates {}

class RadiologyInitial extends RadiologyStates {}

class RadiologyLoading extends RadiologyStates {}

class RadiologySuccess extends RadiologyStates {
  final List<RadiologyModel> radiologes;

  RadiologySuccess(this.radiologes);
}

class RadiologyEmpty extends RadiologyStates {}

class RadiologyError extends RadiologyStates {
  final String error;

  RadiologyError(this.error);
}
