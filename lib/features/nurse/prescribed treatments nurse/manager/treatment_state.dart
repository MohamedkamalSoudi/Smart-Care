import 'package:equatable/equatable.dart';
import '../data/treatment_model.dart';

abstract class TreatmentState {}

class TreatmentInitial extends TreatmentState {}

class TreatmentLoading extends TreatmentState {}

class TreatmentLoaded extends TreatmentState with EquatableMixin {
  final List<Treatment> treatments;
  final bool isEmpty;
  final bool isLoading;
  final String? error;

  TreatmentLoaded({
    required this.treatments,
    this.isEmpty = false,
    this.isLoading = false,
    this.error,
  });

  TreatmentLoaded copyWith({
    List<Treatment>? treatments,
    bool? isEmpty,
    bool? isLoading,
    String? error,
  }) {
    return TreatmentLoaded(
      treatments: treatments ?? this.treatments,
      isEmpty: isEmpty ?? this.isEmpty,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        treatments.length,
        isEmpty,
        isLoading,
        error,
      ];
}

class TreatmentError extends TreatmentState {
  final String message;
  TreatmentError(this.message);
}
