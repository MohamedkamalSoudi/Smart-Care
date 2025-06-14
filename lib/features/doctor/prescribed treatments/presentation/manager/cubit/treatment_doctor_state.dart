import 'package:equatable/equatable.dart';

import '../../../data/treatment_model.dart';

abstract class TreatmentStateDoctor {}

class TreatmentInitial extends TreatmentStateDoctor {}

class TreatmentLoading extends TreatmentStateDoctor {}

class TreatmentLoaded extends TreatmentStateDoctor with EquatableMixin {
  final List<Treatmentmodel> treatments;
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
    List<Treatmentmodel>? treatments,
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

class TreatmentError extends TreatmentStateDoctor {
  final String message;
  TreatmentError(this.message);
}
