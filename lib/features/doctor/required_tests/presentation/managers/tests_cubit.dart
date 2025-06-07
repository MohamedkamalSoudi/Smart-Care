import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/headers.dart';
import '../../data/test_model_at_doctor.dart';
import 'tests_states.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestState());

  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();

  Future<void> fetchTests(int patientId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await dio.get(
          '$baseUrl/api/lab-tests/patient/$patientId',
          options: Options(headers: await HeadersApi.getHeaders()));
      final data = response.data;

      if (data['patient'] != null &&
          data['patient']['lab_tests'] != null &&
          (data['patient']['lab_tests'] as List).isNotEmpty) {
        final List<dynamic> testsJson = data['patient']['lab_tests'];
        final tests = testsJson
            .map((e) => TestModelAtDoctor.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(TestState(tests: tests));
      } else {
        emit(TestState(isEmpty: true));
      }
    } catch (e) {
      emit(TestState(error: e.toString()));
    }
  }

  Future<void> addTest(CreateTestRequest request, int patientId) async {
    emit(state.copyWith(isLoading: true));

    try {
      await dio.post(
        '$baseUrl/api/lab-tests',
        data: request.toJson(),
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      await fetchTests(patientId);
    } catch (e) {
      emit(TestState(error: e.toString()));
    }
  }

  Future<void> deleteTest(int testId, int patientId) async {
    emit(state.copyWith(isLoading: true));
    try {
      await dio.get('$baseUrl/api/lab-tests/$testId',
          options: Options(headers: await HeadersApi.getHeaders()));
      await fetchTests(patientId);
    } catch (e) {
      emit(TestState(error: e.toString()));
    }
  }

  Future<void> updateTestStatus(
      int testId, bool currentStatus, int patientId) async {
    emit(state.copyWith(isLoading: true));

    try {
      final newIsDone = !currentStatus;
      final String newApiStatus = newIsDone ? 'completed' : 'pending';

      await dio.post(
        '$baseUrl/api/lab-tests/$testId',
        data: {
          'status': newApiStatus,
        },
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      final updatedTests = state.tests!.map((test) {
        if (test.id == testId) {
          return test.copyWith(isDone: newIsDone, status: newApiStatus);
        }
        return test;
      }).toList();

      emit(TestState(tests: updatedTests));
    } catch (e) {
      emit(TestState(error: e.toString()));
    }
  }
}
