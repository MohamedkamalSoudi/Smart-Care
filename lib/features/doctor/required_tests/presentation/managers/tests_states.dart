import 'package:equatable/equatable.dart';
import '../../data/treatment_model.dart';

class TestState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<TreatmentModel>? tests;
  final bool isEmpty;

  const TestState({
    this.isLoading = false,
    this.error,
    this.tests,
    this.isEmpty = false,
  });

  TestState copyWith({
    bool? isLoading,
    String? error,
    List<TreatmentModel>? tests,
    bool? isEmpty,
  }) {
    return TestState(
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
        tests?.length, // فقط الطول لتجنب مشاكل المقارنة
        isEmpty,
      ];
}