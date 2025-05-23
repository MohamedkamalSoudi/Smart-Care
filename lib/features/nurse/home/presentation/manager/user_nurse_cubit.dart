import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import '../../../../../core/utils/headers.dart';
import 'user_nurse_state.dart';

class UserNurseCubit extends Cubit<UserNurseState> {
  UserNurseCubit() : super(UserNurseInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";

  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': HeadersApi.contentType,
        'Accept': HeadersApi.accept,
        'cookie': HeadersApi.cookie,
        'user-agent': HeadersApi.userAgent,
        'Authorization': 'Bearer 314|9q6Dwp4iSIseGEhEIVsXmZxbTAHIadrNCQx1zn3Me4943b5a',
      },
    ),
  );

  Future<void> fetchUsersNurse() async {
    emit(UserNurseLoading());

    try {
      final response = await dio.get('$baseUrl/api/nurse/patients');

      if (response.statusCode == 200) {
        if (response.data is Map && response.data.containsKey('patients')) {
          var data = response.data;
          int range = data['patients'].length;
          List<UserModelNurse> models = [];
          for (int i = 0; i < range; i++) {
            UserModelNurse model = UserModelNurse.fromJson(data['patients'][i]);
            models.add(model);
          }
          emit(UserNurseLoaded(models));
        } else {
          emit(UserNurseError('Data is not available or not a list'));
        }
      } else {
        emit(UserNurseError('Failed to load users: ${response.statusMessage}'));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        emit(UserNurseError(
            'Server error (${e.response?.statusCode}): ${e.message}'));
      } else {
        emit(UserNurseError('Connection issue: ${e.message}'));
      }
    } catch (e) {
      emit(UserNurseError('An unexpected error occurred: $e'));
    }
  }
}