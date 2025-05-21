import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/utils/headers.dart';
import '../../../data/models/description_nurse_model.dart';
import 'description_nurse_states.dart';

class DescriptionNurseCubit extends Cubit<DescriptionNurseStates> {
  DescriptionNurseCubit() : super(EmptyNurseState());

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

  Future<void> fetchDescriptionNurse(int id) async {
    emit(LoadingNurseState());
    try {
      final response = await dio.get('$baseUrl/api/patient/$id/diagnoses');
      if (response.statusCode == 200 && response.data['diagnoses'] != null) {
        final diagnosisData = response.data;
        DescriptionNurseModel model =
            DescriptionNurseModel.fromJson(diagnosisData);

        emit(DataFoundedNurse(model: model));
      } else {
        emit(EmptyNurseState());
      }
    } catch (e) {
      emit(ErrorNurseState(e.toString()));
    }
  }
}
