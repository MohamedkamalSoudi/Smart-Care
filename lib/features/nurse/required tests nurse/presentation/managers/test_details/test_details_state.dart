part of 'test_details_cubit.dart';

sealed class TestDetailsState extends Equatable {
  const TestDetailsState();

  @override
  List<Object> get props => [];
}

final class TestDetailsInitial extends TestDetailsState {}
final class TestDetailsLoading extends TestDetailsState {}
final class TestDetailsSuccess extends TestDetailsState {
  final LabTest labTest;
  const TestDetailsSuccess( {required this.labTest});
}
final class TestDetailsError extends TestDetailsState {
  final String error;
  const TestDetailsError({required this.error});
}

