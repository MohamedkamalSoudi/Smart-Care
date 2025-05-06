import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_care_app/features/doctor/login/presentation/view_model/auth_state.dart';
import 'package:smart_care_app/features/doctor/login/data/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final Dio dio = Dio();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthCubit() : super(AuthInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";

  Future<void> login() async {
    // emit(AuthLoading());
    try {
      final response = await dio.post(
        '$baseUrl/api/auth/access-token',
        data: {
          'email': userNameController.text,
          'password': passwordController.text
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'cookie': '__test=8e5a07a15f3219e5a579854fbe981139',
            'user-agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0',
          },
        ),
      );

      // response تحقق من حالة
      if (response.statusCode == 201) {
        final jsonData = response.data;
        //ف متغير token بخزن قيمة ال
        final token = jsonData['token'];
        //SharedPreferences ف  token بخزن ال
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        final UserModel userModel = UserModel.fromJson(jsonData);
        emit(AuthAuthenticated(userModel: userModel, token: token));
      } else {
        emit(AuthError(message: "Login failed: ${response.statusCode}"));
      }
    } on DioException catch (e) {
      String errorMessage = "Login failed";

      if (e.response != null) {
        errorMessage += ": ${e.response?.statusCode}";
        if (e.response?.data != null && e.response?.data is Map) {
          errorMessage +=
              " - ${e.response?.data['detail'] ?? e.response?.data}";
        }
      } else {
        errorMessage += ": ${e.message ?? 'No internet connection'}";
      }

      emit(AuthError(message: errorMessage));
    } catch (e) {
      emit(AuthError(message: "Unexpected error: $e"));
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    emit(AuthUnauthenticated());
  }
}
