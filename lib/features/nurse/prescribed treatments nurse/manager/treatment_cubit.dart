import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import 'package:smart_care_app/features/nurse/prescribed%20treatments%20nurse/data/treatment_model.dart';
import 'package:smart_care_app/features/nurse/prescribed%20treatments%20nurse/manager/treatment_state.dart';

class TreatmentCubit extends Cubit<TreatmentState> {
  TreatmentCubit() : super(TreatmentInitial());

  final Dio dio = Dio();
  final String baseUrl = "http://smartcare.wuaze.com/public";

  Future<void> fetchTreatments(int patientId) async {
    emit(TreatmentLoading());

    try {
      final response = await dio.get(
        '$baseUrl/api/treatments/patient/$patientId',
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['patient']['treatments'];

        final List<Treatment> original =
            data.map<Treatment>((json) => Treatment.fromJson(json)).toList();

        final List<Treatment> expanded = expandTreatmentsWithTimes(original);

        emit(TreatmentLoaded(
          treatments: expanded,
          isEmpty: expanded.isEmpty,
        ));
      } else {
        emit(TreatmentError(
          'Failed to load treatments: ${response.statusCode}',
        ));
      }
    } catch (e) {
      emit(TreatmentError('Error: $e'));
    }
  }

  Future<void> updateTestStatus(
      int testId, bool currentStatus, int patientId) async {
    // تأكد إن الحالة الحالية من نوع TreatmentLoaded
    if (state is! TreatmentLoaded) return;

    final currentState = state as TreatmentLoaded;
    emit(currentState.copyWith(isLoading: true));

    try {
      final newIsDone = !currentStatus;
      final String newApiStatus = newIsDone ? 'completed' : 'pending';

      await dio.post(
        '$baseUrl/api/treatments/$testId',
        data: {'status': newApiStatus},
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      final updatedTreatments = currentState.treatments.map((treatment) {
        if (treatment.id == testId) {
          return treatment.copyWith(isDone: newIsDone, status: newApiStatus);
        }
        return treatment;
      }).toList();

      emit(currentState.copyWith(
        isLoading: false,
        treatments: updatedTreatments,
      ));
    } catch (e) {
      emit(currentState.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
