import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_care_app/features/nurse/profile%20narse/data/profile_model_nurse.dart';
import '../../../../../core/utils/headers.dart';
import 'profile_narse_states.dart';



class ProfileNarseCubit extends Cubit<ProfileNarseStates> {
  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();
  ProfileNarseCubit() : super(ProfileNarseLoading());
  Future<void> getProfileData() async {
    try {
      final response = await dio.get(
        '$baseUrl/api/nurse/profile',
        options: Options(
          headers: {
            // 'Content-Type': HeadersApi.contentType,
            // 'Accept': HeadersApi.accept,
            'cookie': HeadersApi.cookie,
            'user-agent': HeadersApi.userAgent,
            'Authorization': 'Bearer 314|9q6Dwp4iSIseGEhEIVsXmZxbTAHIadrNCQx1zn3Me4943b5a',
          },
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;

        final ProfileModelNurse profileModel = ProfileModelNurse.fromJson(jsonData);
        emit(ProfileNarseSuccess(profileNurseModel: profileModel));
      } else {
        emit(ProfileNarseError(response.statusMessage.toString()));
      }
    } catch (e) {
      emit(ProfileNarseError(e.toString()));
    }
  }
}
