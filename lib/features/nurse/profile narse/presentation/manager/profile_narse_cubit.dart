import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // ✅
import 'package:dio/dio.dart';
import 'package:smart_care_app/features/nurse/profile%20narse/data/profile_model_nurse.dart';
import '../../../../../core/utils/headers.dart';
import 'profile_narse_states.dart';

class ProfileNarseCubit extends Cubit<ProfileNarseStates> {
  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();

  ProfileNarseCubit() : super(ProfileNarseLoading());

  Future<void> getProfileData() async {
  emit(ProfileNarseLoading());

  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    emit(ProfileNarseNoInternet());
    return;
  }

  try {
    final response = await dio.get(
      '$baseUrl/api/nurse/profile',
      options: Options(headers: await HeadersApi.getHeaders()),
    );

    if (response.statusCode == 200) {
      final profile = ProfileModelNurse.fromJson(response.data);
      emit(ProfileNarseSuccess(profileNurseModel: profile));
    } else {
      emit(ProfileNarseError("Failed to load profile data"));
    }
  } catch (e) {
    emit(ProfileNarseError("Please check your internet connection."));
  }
}

}
