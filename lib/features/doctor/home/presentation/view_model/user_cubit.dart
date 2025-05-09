import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import '../../data/patient_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";

  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': HeadersApi.contentType,
        'Accept': HeadersApi.accept,
        'cookie': HeadersApi.cookie,
        'user-agent': HeadersApi.userAgent,
        'Authorization': HeadersApi.authorization,
      },
    ),
  );

  Future<void> fetchUsers() async {
    emit(UserLoading());

    try {
      final response = await dio.get('$baseUrl/api/doctor/patients');

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
          emit(UserError('البيانات غير متوفرة أو ليست قائمة'));
        }
      } else {
        emit(UserError('فشل في تحميل المستخدمين: ${response.statusMessage}'));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        emit(UserError(
            'خطأ من الخادم (${e.response?.statusCode}): ${e.message}'));
      } else {
        emit(UserError('مشكلة في الاتصال: ${e.message}'));
      }
    } catch (e) {
      emit(UserError('حدث خطأ غير متوقع: $e'));
    }
  }
}
