import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import '../../../../../core/utils/headers.dart';
import 'user_nurse_state.dart';

class UserNurseCubit extends Cubit<UserNurseState> {
  UserNurseCubit() : super(UserNurseInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";

  final Dio dio = Dio();

  Future<void> fetchUsersNurse() async {
  emit(UserNurseLoading());

  try {
    final response = await dio.get(
      '$baseUrl/api/nurse/patients',
      options: Options(headers: await HeadersApi.getHeaders()),
    );

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
        emit(UserNurseError('Data is not available or not a list', type: 'empty_data'));
      }
    } else {
      emit(UserNurseError(
        'Failed to load users: ${response.statusMessage}',
        type: 'server_error',
      ));
    }
  } on DioException catch (e) {
    if (e.response != null) {
      emit(UserNurseError(
        'Server Error (${e.response?.statusCode}): ${e.message}',
        type: 'server_error',
      ));
    } else {
      emit(UserNurseError('Internet connection problem: ${e.message}', type: 'no_internet'));
    }
  } catch (e) {
    emit(UserNurseError('An unexpected error occurred: $e', type: 'unexpected'));
  }
}

}
