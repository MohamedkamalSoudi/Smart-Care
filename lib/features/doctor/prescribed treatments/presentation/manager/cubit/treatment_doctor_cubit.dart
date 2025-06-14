import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import 'package:smart_care_app/features/doctor/prescribed%20treatments/data/treatment_model.dart';
import '../../view/widgets/time_utils.dart';
import 'treatment_doctor_state.dart';

class TreatmentCubitDoctor extends Cubit<TreatmentStateDoctor> {
  TreatmentCubitDoctor() : super(TreatmentInitial());

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

        final List<Treatmentmodel> original =
            data.map<Treatmentmodel>((json) => Treatmentmodel.fromJson(json)).toList();

        final List<Treatmentmodel> expanded = expandTreatmentsWithTimes(original);

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

  Future<void> addTreatment({
  required String patientId,
  required String name,
  String? description,
  required String dosage,
  required List<String> times,
}) async {
  emit(TreatmentLoading());

  try {
    final formData = FormData.fromMap({
      'due_date': DateTime.now().toIso8601String().split('T').first,
      'patient_id': patientId.toString(),
      'name': name,
      'dosage': dosage,
      'counterTime': times.length.toString(),
      'due_time': convertTo24HourFormat(times[0]),
      if (times.length > 1) 'due_time2': convertTo24HourFormat(times[1]),
      if (times.length > 2) 'due_time3': convertTo24HourFormat(times[2]),
      'description': description ?? '',
    });
    final headers = await HeadersApi.getHeaders();

    final response = await dio.post(
      '$baseUrl/api/treatments',
      data: formData,
      options: Options(headers: headers),
    );


    if (response.statusCode == 201 || response.statusCode == 200) {
      await fetchTreatments(int.parse(patientId));
    } else {
      emit(TreatmentError("فشل في إضافة العلاج: ${response.statusCode}"));
    }
  } catch (e) {
    if (e is DioException) {
    }
    emit(TreatmentError("حدث خطأ أثناء الإضافة: $e"));
  }
}


Future<void> deleteTreatment(int treatmentId, int patientId) async {
  emit(TreatmentLoading());
  try {
    final headers = await HeadersApi.getHeaders();

    final response = await dio.get(
      '$baseUrl/api/treatments/$treatmentId',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      await fetchTreatments(patientId);
    } else {
      emit(TreatmentError('فشل في حذف التحليل: ${response.statusCode}'));
    }
  } catch (e) {
    emit(TreatmentError('حدث خطأ أثناء الحذف: $e'));
  }
}
}
