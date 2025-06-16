import 'package:flutter/material.dart';

class TapBarModel {
  final String text;
  final Widget widget;

  TapBarModel({
    required this.text,
    required this.widget,
  });
}

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String createdAt;
  final PatientData patient;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.patient,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      createdAt: json['created_at'],
      patient: PatientData.fromJson(json['patient']),
    );
  }
}

class PatientData {
  final int id;
  final String roomNumber;
  final String ped;
  final String name;

  PatientData({
    required this.id,
    required this.roomNumber,
    required this.ped,
    required this.name,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) {
    return PatientData(
      id: json['id'],
      roomNumber: json['room_number'],
      ped: json['ped'],
      name: json['user']['name'],
    );
  }
}
