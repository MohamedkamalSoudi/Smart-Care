import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/utils/headers.dart';
import '../../data/treatment_nurse_model.dart';
import 'nurse_test_state.dart';

class NurseTestCubit extends Cubit<NurseTestState> {
  NurseTestCubit() : super(const NurseTestState());

  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Accept': HeadersApi.accept,
        'cookie': HeadersApi.cookie,
        'user-agent': HeadersApi.userAgent,
        'Authorization':
            'Bearer 414|2nWqZ8FJJQda2qviYHWex4WbqIGBJIPRlf8m768R2d85972d',
      },
    ),
  );

  Future<void> fetchTests(int patientId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await dio.get('$baseUrl/api/lab-tests/patient/$patientId');
      final data = response.data;

      if (data['patient'] != null &&
          data['patient']['lab_tests'] != null &&
          (data['patient']['lab_tests'] as List).isNotEmpty) {
        final List<dynamic> testsJson = data['patient']['lab_tests'];
        final tests = testsJson
            .map((e) => NurseTreatmentModel.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(state.copyWith(tests: tests, isLoading: false));
      } else {
        emit(state.copyWith(isEmpty: true, isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> toggleTestStatus(int testId, bool currentStatus, int patientId) async {
  emit(state.copyWith(isLoading: true));

  try {
    final newIsDone = !currentStatus;
    final String newApiStatus = newIsDone ? 'completed' : 'pending';

    await dio.post(
      '$baseUrl/api/lab-tests/$testId',
      data: {
        'status': newApiStatus,
      },
    );

    final updatedTests = state.tests!.map((test) {
      if (test.id == testId) {
        return test.copyWith(isDone: newIsDone, status: newApiStatus);
      }
      return test;
    }).toList();

    emit(state.copyWith(
      isLoading: false,
      tests: updatedTests,
    ));

  } catch (e) {
    emit(state.copyWith(
      isLoading: false,
      error: e.toString(),
    ));
  }
}
}
