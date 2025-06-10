import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/headers.dart';
import '../../../data/rediology.dart';

part 'rediology_details_state.dart';

class RediologyDetailsCubit extends Cubit<RediologyDetailsState> {
  RediologyDetailsCubit({required this.rediologyId, required this.patientId})
      : super(RediologyDetailsInitial());
  final int rediologyId;
  final int patientId;
  final String baseUrl = "http://smartcare.wuaze.com/public";
  final Dio dio = Dio();
  Future<void> getRediologyData() async {
    emit(RediologyDetailsLoading());
    try {
      final response = await dio.get(
        '$baseUrl/api/tasks/patient/$patientId',
        options: Options(headers: await HeadersApi.getHeaders()),
      );
      var rediologyData = response.data['patient']['tasks']
          .firstWhere((element) => element['id'] == rediologyId);
      emit(RediologyDetailsSuccess(
          rediology: Rediology.fromJson(rediologyData)));
    } catch (e) {
      emit(RediologyDetailsError(error: e.toString()));
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
