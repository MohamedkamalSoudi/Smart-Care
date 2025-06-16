import 'package:smart_care_app/features/nurse/notification/data/model/notification_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModelAtNurse> schedule;
  final List<NotificationModelAtNurse> waiting;
  final List<NotificationModelAtNurse> complete;

  NotificationLoaded({
    required this.schedule,
    required this.waiting,
    required this.complete,
  });
}

class NotificationError extends NotificationState {
  final String message;
  NotificationError(this.message);
}
