import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/utils/headers.dart';
import '../../data/test_model_at_nurse.dart';
import 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(const TestState());

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
            .map((e) => TestModelAtNurse.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(state.copyWith(tests: tests, isLoading: false));
      } else {
        emit(state.copyWith(isEmpty: true, isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
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

      final tests = state.tests!.map((test) {
        if (test.id == testId) {
          return test.copyWith(isDone: newIsDone, status: newApiStatus);
        }
        return test;
      }).toList();

      emit(state.copyWith(
        isLoading: false,
        tests: tests,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
