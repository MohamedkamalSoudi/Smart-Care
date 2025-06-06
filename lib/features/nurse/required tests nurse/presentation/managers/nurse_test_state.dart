import 'package:equatable/equatable.dart';

import '../../data/treatment_nurse_model.dart';

class NurseTestState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<NurseTreatmentModel>? tests;
  final bool isEmpty;

  const NurseTestState({
    this.isLoading = false,
    this.error,
    this.tests,
    this.isEmpty = false,
  });

  NurseTestState copyWith({
    bool? isLoading,
    String? error,
    List<NurseTreatmentModel>? tests,
    bool? isEmpty,
  }) {
    return NurseTestState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      tests: tests ?? this.tests,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        tests?.length,
        isEmpty,
      ];
}
