import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/utils/headers.dart';
import '../../data/treatment_model.dart';
import 'tests_states.dart';

class TestCubit extends Cubit<TestStates> {
  TestCubit() : super(TestInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Accept': HeadersApi.accept,
        'cookie': HeadersApi.cookie,
        'user-agent': HeadersApi.userAgent,
        'Authorization':
            'Bearer 396|sYWeNqsJg9U2sEa1bYWABKgCXxCMclYz1B53IxZrdc8ed65c',
      },
    ),
  );

  Future<void> fetchTests(int patientId) async {
    emit(TestLoading());
    try {
      final response = await dio.get('$baseUrl/api/lab-tests/patient/$patientId');
      final data = response.data;

      if (data['patient'] != null &&
          data['patient']['lab_tests'] != null &&
          (data['patient']['lab_tests'] as List).isNotEmpty) {
        final List<dynamic> testsJson = data['patient']['lab_tests'];
        final tests = testsJson
            .map((e) => TreatmentModel.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(TestSuccess(tests));
      } else {
        emit(TestEmpty());
      }
    } catch (e) {
      emit(TestError(e.toString()));
    }
  }

  Future<void> dTreaadtment(CreateTreatmentRequest request, int patientId) async {
    emit(TestLoading());

    try {
      final response = await dio.post(
        '$baseUrl/api/lab-tests',
        data: request.toJson(),
      );

      await fetchTests(patientId);

      print('Test added successfully: ${response.data}');
    } catch (e) {
      emit(TestError(e.toString()));
      print('Failed to add test: $e');
    }
  }

  Future<void> deleteTest(int testId, int patientId) async {
  emit(TestLoading());
  try {
    await dio.get('$baseUrl/api/lab-tests/$testId');
    await fetchTests(patientId);
  } catch (e) {
    emit(TestError(e.toString()));
  }
}

  // Future<void> toggleTestStatus(int testId, bool currentStatus, int patientId) async {
  //   emit(TestLoading());
  //   try {
  //     final newStatus = !currentStatus;
  //     await dio.put(
  //       '$baseUrl/api/lab-tests/$testId',
  //       data: {
  //         'is_done': newStatus ? 1 : 0,
  //       },
  //     );
  //     await fetchTests(patientId);
  //   } catch (e) {
  //     emit(TestError(e.toString()));
  //   }
  // }
}