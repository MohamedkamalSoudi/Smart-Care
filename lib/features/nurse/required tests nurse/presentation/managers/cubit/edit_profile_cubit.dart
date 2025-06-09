import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/headers.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  Future<void> editImage({
  required String results,
  required File image,
  required String status,
  required int testId
}) async {
  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();
    log('soudi_1'); 
  try {
    FormData formData = FormData.fromMap({
      "result": 'results',
        "file": await MultipartFile.fromFile(
          image.path,
          filename: "${generateRandomString(sizeOfCode: 6)}postImage.jpg",
        ),
        "status": status
    });
      log('soudi');
    var response = await dio.post(
      '$baseUrl/api/lab-tests/$testId',
      data: formData,
      options: Options(headers: await HeadersApi.getHeaders()),

    );

    log('Response status: ${response.statusCode}');
    log('Response data: ${response.data}');
  } catch (e) {
    log('Error sending post request: $e');
  }
}

String generateRandomString({int sizeOfCode = 6}) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(sizeOfCode, (index) => chars[(DateTime.now().millisecondsSinceEpoch + index) % chars.length]).join();
}
}
