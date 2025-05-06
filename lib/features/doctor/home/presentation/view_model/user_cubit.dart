import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/patient_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";

  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 1|D9uDVgreerqXaeUIlJH7ENvHPAYoX66j3w08qi8jab248552',
        'Accept': 'application/json',
        'cookie': '__test=8e5a07a15f3219e5a579854fbe981139',
        'user-agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0',
      },
    ),
  );

  Future<void> fetchUsers() async {
    emit(UserLoading());

    try {
      final response = await dio.get('$baseUrl/api/doctor/patients');
      log(response.data.toString());


      if (response.statusCode == 200) {
        if (response.data is Map && response.data.containsKey('patients') ) {
          var data = response.data;
          int range = data['patients'].length;
          List<UserModel> models = [];
            for(int i = 0; i < range; i++){
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
        emit(UserError('خطأ من الخادم (${e.response?.statusCode}): ${e.message}'));
      } else {
        emit(UserError('مشكلة في الاتصال: ${e.message}'));
      }
    } catch (e) {
      emit(UserError('حدث خطأ غير متوقع: $e'));
    }
  }
}