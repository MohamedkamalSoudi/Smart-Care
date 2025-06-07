import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/features/doctor/Radiology/data/radiology_model.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/manager/radiology_states.dart';

import '../../../../../core/utils/headers.dart';

class RadiologyCubit extends Cubit<RadiologyStates> {
  RadiologyCubit() : super(RadiologyInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();

  Future<void> fetchRadiologes(int patientId) async {
    emit(RadiologyLoading());
    try {
      final response = await dio.get('$baseUrl/api/tasks/patient/$patientId',
          options: Options(headers: await HeadersApi.getHeaders()));
      final data = response.data;

      if (data['patient'] != null &&
          data['patient']['tasks'] != null &&
          (data['patient']['tasks'] as List).isNotEmpty) {
        final List<dynamic> radiologesJson = data['patient']['tasks'];
        final radiologes = radiologesJson
            .map((e) =>
                RadiologyModelAtDoctor.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(RadiologySuccess(radiologes));
      } else {
        emit(RadiologyEmpty());
      }
    } catch (e) {
      emit(RadiologyError(e.toString()));
    }
  }

  Future<void> addRadiology(
      CreateRadiologyRequest request, int patientId) async {
    emit(RadiologyLoading());

    try {
      final response = await dio.post(
        '$baseUrl/api/tasks',
        data: request.toJson(),
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      await fetchRadiologes(patientId);

      print('Radiology added successfully: ${response.data}');
    } catch (e) {
      emit(RadiologyError(e.toString()));
      print('Failed to add Radiology: $e');
    }
  }

  Future<void> deleteRadiology(int radiologyId, int patientId) async {
    emit(RadiologyLoading());
    try {
      await dio.get('$baseUrl/api/tasks/$radiologyId',
          options: Options(headers: await HeadersApi.getHeaders()));
      await fetchRadiologes(patientId);
    } catch (e) {
      emit(RadiologyError(e.toString()));
    }
  }

  Future<void> updateRadiologyStatus(
      int id, bool currentStatus, int patientId) async {
    emit(RadiologyLoading());

    try {
      final newIsDone = !currentStatus;
      final newStatus = newIsDone ? 'completed' : 'pending';

      await dio.post(
        '$baseUrl/api/tasks/$id',
        data: {
          'status': newStatus,
        },
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      await fetchRadiologes(patientId);
    } catch (e) {
      emit(RadiologyError(e.toString()));
    }
  }
}
