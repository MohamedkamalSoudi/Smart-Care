import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import 'package:smart_care_app/features/doctor/profile/data/profile_model.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<DoctorProfileStates> {
  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();

  ProfileCubit() : super(DoctorProfileLoading());

  Future<void> getProfileData() async {
    emit(DoctorProfileLoading());

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(DoctorProfileNoInternet());
      return;
    }

    try {
      final response = await dio.get(
        '$baseUrl/api/doctor/profile',
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      if (response.statusCode == 200) {
        final doctorProfileModel = ProfileDoctorModel.fromJson(response.data);
        emit(DoctorProfileSuccess(doctorProfileModel: doctorProfileModel));
      } else {
        emit(DoctorProfileError("Failed to load profile data"));
      }
    } catch (e) {
      emit(DoctorProfileError("Please check your internet connection."));
    }
  }
}