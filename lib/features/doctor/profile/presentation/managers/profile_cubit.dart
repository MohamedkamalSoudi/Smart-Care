
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import 'package:smart_care_app/features/doctor/profile/data/profile_model.dart';

import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();
  ProfileCubit() : super(ProfileLoading());
  Future<void> getProfileData() async {
    try {
      final response = await dio.get(
        '$baseUrl/api/doctor/profile',
        options: Options(
          headers: {
            'Content-Type': HeadersApi.contentType,
            'Accept': HeadersApi.accept,
            'cookie': HeadersApi.cookie,
            'user-agent': HeadersApi.userAgent,
            'Authorization': HeadersApi.authorization,
          },
        ),
      );

      // response تحقق من حالة
      if (response.statusCode == 200) {
        final jsonData = response.data;

        final ProfileModel profileModel = ProfileModel.fromJson(jsonData);
        emit(ProfileSuccess(profileModel: profileModel));
      } else {
        emit(ProfileError(response.statusMessage.toString()));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
