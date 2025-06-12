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
          options: Options(headers: await HeadersApi.getHeaders()));

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['patient']['treatments'];

        final List<Treatment> original =
            data.map<Treatment>((json) => Treatment.fromJson(json)).toList();

        final List<Treatment> expanded = expandTreatmentsWithTimes(original);

        emit(TreatmentLoaded(expanded));
      } else {
        emit(TreatmentError(
            'Failed to load treatments: ${response.statusCode}'));
      }
    } catch (e) {
      emit(TreatmentError('Error: $e'));
    }
  }
}
