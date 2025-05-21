import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/utils/headers.dart';
import '../../data/models/description_model.dart';
import 'description_states.dart';

class DescriptionCubit extends Cubit<DescriptionStates> {
  DescriptionCubit() : super(EmptyState());

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

  Future<void> fetchDescription(int id) async {
    emit(LoadingState());
    try {
      final response = await dio.get('$baseUrl/api/patient/$id/diagnoses');
      if (response.statusCode == 200) {
        final diagnosisData = response.data;
        DescriptionModel model = DescriptionModel.fromJson(diagnosisData);

        emit(DataFounded(model: model));
      } else {
        emit(EmptyState());
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> postDescription(String description, int id) async {
    emit(LoadingState());
    try {
      // ignore: unused_local_variable
      final response = await dio.post(
        '$baseUrl/api/patient/$id/diagnoses',
        data: {'diagnosis': description},
      );
      fetchDescription(id);
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
