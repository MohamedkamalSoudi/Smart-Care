import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import '../../data/patient_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";

  final Dio dio = Dio();

  Future<void> fetchUsers() async {
    emit(UserLoading());

    try {
      final response = await dio.get(
        '$baseUrl/api/doctor/patients',
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      if (response.statusCode == 200) {
        if (response.data is Map && response.data.containsKey('patients')) {
          var data = response.data;
          int range = data['patients'].length;
          List<UserModel> models = [];
          for (int i = 0; i < range; i++) {
            UserModel model = UserModel.fromJson(data['patients'][i]);
            models.add(model);
          }
          emit(UserLoaded(models));
        } else {
          emit(UserError('Data is not available or not a list', type: 'empty_data'));
        }
      } else {
        emit(UserError(
          'Failed to load users: ${response.statusMessage}',
          type: 'server_error',
        ));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        emit(UserError(
          'Server Error (${e.response?.statusCode}): ${e.message}',
          type: 'server_error',
        ));
      } else {
        emit(UserError('Internet connection problem: ${e.message}', type: 'no_internet'));
      }
    } catch (e) {
      emit(UserError('An unexpected error occurred: $e', type: 'unexpected'));
    }
  }
}