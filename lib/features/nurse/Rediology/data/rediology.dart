import 'package:equatable/equatable.dart';

class Rediology extends Equatable {
  final int? id;
  final String? name;
  final dynamic description;
  final String? dueDate;
  final String? dueTime;
  final dynamic result;
  final String? status;
  final dynamic filePath;
  final int? patientId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Rediology({
    this.id,
    this.name,
    this.description,
    this.dueDate,
    this.dueTime,
    this.result,
    this.status,
    this.filePath,
    this.patientId,
    this.createdAt,
    this.updatedAt,
  });

  factory Rediology.fromJson(Map<String, dynamic> json) => Rediology(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as dynamic,
        dueDate: json['due_date'] as String?,
        dueTime: json['due_time'] as String?,
        result: json['result'] as dynamic,
        status: json['status'] as String?,
        filePath: json['file_path'] as dynamic,
        patientId: json['patient_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'due_date': dueDate,
        'due_time': dueTime,
        'result': result,
        'status': status,
        'file_path': filePath,
        'patient_id': patientId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      dueDate,
      dueTime,
      result,
      status,
      filePath,
      patientId,
      createdAt,
      updatedAt,
    ];
  }
}
