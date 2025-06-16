import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import 'package:smart_care_app/features/nurse/notification/data/model/notification_model.dart';
import 'notification_state.dart';
import 'package:dio/dio.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  List<NotificationModel> notifications = [];

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());

    try {
      final response = await Dio().get(
        'http://smartcare.wuaze.com/api/notifications',
        options: Options(
          headers: await HeadersApi.getHeaders(),
        ),
      );

      final List<dynamic> unreadList = response.data['unread'];

      notifications =
          unreadList.map((item) => NotificationModel.fromJson(item)).toList();

      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
