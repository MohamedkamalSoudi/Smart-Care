import '../../data/treatment_model.dart';

abstract class TestStates {}

class TestInitial extends TestStates {}

class TestLoading extends TestStates {}

class TestSuccess extends TestStates {
  final List<TreatmentModel> tests;

  TestSuccess(this.tests);
}

class TestEmpty extends TestStates {}

class TestError extends TestStates {
  final String error;

  TestError(this.error);
}
