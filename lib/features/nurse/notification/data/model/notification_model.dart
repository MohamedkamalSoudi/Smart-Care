import 'package:flutter/material.dart';

class TapBarModel {
  final String text;
  final Widget widget;

  TapBarModel({
    required this.text,
    required this.widget,
  });
}

class NotificationModelAtNurse {
  final String id;
  final String title;
  final String message;
  final String createdAt;
  final PatientDataInNotification patient;

  NotificationModelAtNurse({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.patient,
  });

  factory NotificationModelAtNurse.fromJson(Map<String, dynamic> json) {
    return NotificationModelAtNurse(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      createdAt: json['created_at'],
      patient: PatientDataInNotification.fromJson(json['patient']),
    );
  }
}

class PatientDataInNotification {
  final int id;
  final String roomNumber;
  final String ped;
  final String name;

  PatientDataInNotification({
    required this.id,
    required this.roomNumber,
    required this.ped,
    required this.name,
  });

  factory PatientDataInNotification.fromJson(Map<String, dynamic> json) {
    return PatientDataInNotification(
      id: json['id'],
      roomNumber: json['room_number'],
      ped: json['ped'],
      name: json['user']['name'],
    );
  }
}
