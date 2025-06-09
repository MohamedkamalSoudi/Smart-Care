import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/headers.dart';
import '../../../data/lab_test.dart';

part 'test_details_state.dart';

class TestDetailsCubit extends Cubit<TestDetailsState> {
  TestDetailsCubit({required this.testId, required this.patientId})
      : super(TestDetailsInitial());
  final int testId;
  final int patientId;
  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();
  Future<void> getTestData() async {
    emit(TestDetailsLoading());
    try {
      final response = await dio.get(
        '$baseUrl/api/lab-tests/patient/$patientId',
        options: Options(headers: await HeadersApi.getHeaders()),
      );
      var testdata = response.data['patient']['lab_tests']
          .firstWhere((element) => element['id'] == testId);
      emit(TestDetailsSuccess(labTest: LabTest.fromJson(testdata)));
    } catch (e) {
      emit(TestDetailsError(error: e.toString()));
    }
  }

  String generateRandomString({int sizeOfCode = 6}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(sizeOfCode, (index) {
      final now = DateTime.now().millisecondsSinceEpoch + index;
      return chars[now % chars.length];
    }).join();
  }
}
