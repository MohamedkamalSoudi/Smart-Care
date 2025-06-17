import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/headers.dart';
import 'package:smart_care_app/features/nurse/notification/data/model/notification_model.dart';
import 'notification_state.dart';
import 'package:dio/dio.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  List<NotificationModelAtNurse> schedule = [];
  List<NotificationModelAtNurse> waiting = [];
  List<NotificationModelAtNurse> complete = [];

  final String baseUrl = "http://smartcare.wuaze.com/public";

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());

    try {
      final response = await Dio().get(
        '$baseUrl/api/notifications',
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      if (response.data != null && response.data['unread'] != null) {
        final List<dynamic> unreadList = response.data['unread'];

        if (unreadList.isNotEmpty) {
          schedule = unreadList
              .where((item) =>
                  item is Map<String, dynamic> && item['patient'] != null)
              .map((item) => NotificationModelAtNurse.fromJson(item))
              .toList();
        } else {
          schedule = [];
        }

        emit(NotificationLoaded(
          schedule: schedule,
          waiting: waiting,
          complete: complete,
        ));
      } else {
        emit(NotificationError("No unread data in response"));
      }
    } catch (e, stack) {
      log("Error fetching notifications: $e\n$stack");
      emit(NotificationError(e.toString()));
    }
  }

  void moveToWaiting(NotificationModelAtNurse item) {
    schedule.remove(item);
    waiting.add(item);
    emit(NotificationLoaded(
      schedule: List.from(schedule),
      waiting: List.from(waiting),
      complete: List.from(complete),
    ));
  }

  Future<void> moveToComplete(NotificationModelAtNurse item) async {
    try {
      await markNotificationAsRead(item.id);

      if (schedule.contains(item)) {
        schedule.remove(item);
      } else if (waiting.contains(item)) {
        waiting.remove(item);
      }

      complete.add(item);

      emit(NotificationLoaded(
        schedule: List.from(schedule),
        waiting: List.from(waiting),
        complete: List.from(complete),
      ));
    } catch (e) {
      log('Failed to mark notification as read or move: $e');
    }
  }

  Future<void> markNotificationAsRead(String id) async {
    try {
      final response = await Dio().post(
        '$baseUrl/api/notifications/$id/read',
        options: Options(headers: await HeadersApi.getHeaders()),
      );

      if (response.statusCode == 200) {
        log('Notification $id marked as read');
      } else {
        log('Failed to mark notification $id as read');
      }
    } catch (e) {
      log('Error marking notification $id as read: $e');
      rethrow; // حتى يتم الإمساك بها في moveToComplete
    }
  }
}
