import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/features/nurse/Rediology/data/rediology_model_at_nurse.dart';
import '../../../../../../core/utils/headers.dart';
import 'rediology_state.dart';

class RediologyCubit extends Cubit<RediologyState> {
  RediologyCubit() : super(const RediologyState());

  final String baseUrl = "http://smartcare.wuaze.com/public";

  final Dio dio = Dio();

  Future<void> fetchTests(int patientId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await dio.get('$baseUrl/api/tasks/patient/$patientId',
          options: Options(headers: await HeadersApi.getHeaders()));
      final data = response.data;

      if (data['patient'] != null &&
          data['patient']['tasks'] != null &&
          (data['patient']['tasks'] as List).isNotEmpty) {
        final List<dynamic> rediologiesJson = data['patient']['tasks'];
        final rediologies = rediologiesJson
            .map((e) =>
                RediologyModelAtNurse.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(state.copyWith(rediologies: rediologies, isLoading: false));
      } else {
        emit(state.copyWith(isEmpty: true, isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> updateRediologyStatus(
      int testId, bool currentStatus, int patientId) async {
    emit(state.copyWith(isLoading: true));

    try {
      final newIsDone = !currentStatus;
      final String newApiStatus = newIsDone ? 'completed' : 'pending';

      await dio.post(
        '$baseUrl/api/tasks/$testId',
        data: {
          'status': newApiStatus,
        },
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      final rediologies = state.rediologies!.map((test) {
        if (test.id == testId) {
          return test.copyWith(isDone: newIsDone, status: newApiStatus);
        }
        return test;
      }).toList();

      emit(state.copyWith(
        isLoading: false,
        rediologies: rediologies,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
