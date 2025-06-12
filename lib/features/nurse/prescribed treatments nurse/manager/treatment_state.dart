// الحالة الأساسية
import 'package:smart_care_app/features/nurse/prescribed%20treatments%20nurse/data/treatment_model.dart';

abstract class TreatmentState {}

class TreatmentInitial extends TreatmentState {}

class TreatmentLoading extends TreatmentState {}

class TreatmentLoaded extends TreatmentState {
  final List<Treatment> treatments;
  TreatmentLoaded(this.treatments);
}

class TreatmentError extends TreatmentState {
  final String message;
  TreatmentError(this.message);
}
