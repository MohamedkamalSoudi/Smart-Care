import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/features/doctor/Radiology/data/radiology_model.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/manager/radiology_states.dart';

import '../../../../../core/utils/headers.dart';

class RadiologyCubit extends Cubit<RadiologyStates> {
  RadiologyCubit() : super(RadiologyInitial());

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

  Future<void> fetchRadiologes(int patientId) async {
    emit(RadiologyLoading());
    try {
      final response = await dio.get('$baseUrl/api/tasks/patient/$patientId');
      final data = response.data;

      if (data['patient'] != null &&
          data['patient']['tasks'] != null &&
          (data['patient']['tasks'] as List).isNotEmpty) {
        final List<dynamic> radiologesJson = data['patient']['tasks'];
        final radiologes = radiologesJson
            .map((e) => RadiologyModel.fromJson(e as Map<String, dynamic>))
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
      await dio.get('$baseUrl/api/tasks/$radiologyId');
      await fetchRadiologes(patientId);
    } catch (e) {
      emit(RadiologyError(e.toString()));
    }
  }

 Future<void> toggleRadiologyStatus(int id, bool currentStatus, int patientId) async {
  emit(RadiologyLoading());

  try {
    final newIsDone = !currentStatus;
    final newStatus = newIsDone ? 'completed' : 'pending';

    await dio.post(
      '$baseUrl/api/tasks/$id',
      data: {
        'status': newStatus,
      },
    );

    await fetchRadiologes(patientId);

  } catch (e) {
    emit(RadiologyError(e.toString()));
  }
}


}
