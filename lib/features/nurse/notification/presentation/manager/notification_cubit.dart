import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import 'package:smart_care_app/features/nurse/notification/data/model/notification_model.dart';
import 'notification_state.dart';
import 'package:dio/dio.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  List<NotificationModelAtNurse> notificationsAtNurse = [];
  final String baseUrl = "http://smartcare.wuaze.com/public";
  Future<void> fetchNotifications() async {
    emit(NotificationLoading());

    try {
      final response = await Dio().get(
        '$baseUrl/api/notifications',
        options: Options(
          headers: await HeadersApi.getHeaders(),
        ),
      );
      log('Response status: ${response.statusCode}');
      log('Headers: ${response.headers}');
      log('Raw data: ${response.data}');
      if (response.data != null && response.data['unread'] != null) {
        final List<dynamic> unreadList = response.data['unread'];
        log('Unread list: $unreadList');

        if (unreadList.isNotEmpty) {
          notificationsAtNurse = unreadList
              .where((item) =>
                  item is Map<String, dynamic> && item['patient'] != null)
              .map((item) => NotificationModelAtNurse.fromJson(item))
              .toList();
        } else {
          notificationsAtNurse = [];
        }

        emit(NotificationLoaded(notificationsAtNurse));
      } else {
        emit(NotificationError("No unread data in response"));
      }
    } catch (e, stack) {
      log("Error fetching notifications: $e\n$stack");
      emit(NotificationError(e.toString()));
    }
  }
}
