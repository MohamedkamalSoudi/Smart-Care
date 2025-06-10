import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/headers.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();

  Future<void> editImage({
    required String results,
    required File image,
    required String status,
    required int rediologyId,
  }) async {
    emit(EditProfileLoading());
    try {
      FormData formData = FormData.fromMap({
        "result": results,
        "file": await MultipartFile.fromFile(
          image.path,
          filename: "${generateRandomString(sizeOfCode: 6)}postImage.jpg",
        ),
        "status": status,
      });

      await dio.post(
        '$baseUrl/api/tasks/$rediologyId',
        data: formData,
        options: Options(headers: await HeadersApi.getHeaders()),
      );
    } catch (e) {
      emit(EditProfileError("فشل رفع الصورة"));
    }
  }

  String generateRandomString({int sizeOfCode = 6}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(sizeOfCode, (index) {
      final now = DateTime.now().millisecondsSinceEpoch + index;
      return chars[now % chars.length];
    }).join();
  }
}
