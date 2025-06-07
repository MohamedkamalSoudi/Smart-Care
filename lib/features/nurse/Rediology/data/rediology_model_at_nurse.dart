class RediologyModelAtNurse {
  final int id;
  final int patientId;
  final String name;
  final String dueDate;
  final String dueTime;
  final bool isDone;
  final String? filePath;
  final String status;

  RediologyModelAtNurse({
    required this.id,
    required this.patientId,
    required this.name,
    required this.dueDate,
    required this.dueTime,
    required this.isDone,
    this.filePath,
    required this.status,
  });

  RediologyModelAtNurse copyWith({
    int? id,
    int? patientId,
    String? name,
    String? dueDate,
    String? dueTime,
    bool? isDone,
    String? filePath,
    String? status,
  }) {
    return RediologyModelAtNurse(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      dueTime: dueTime ?? this.dueTime,
      isDone: isDone ?? this.isDone,
      filePath: filePath ?? this.filePath,
      status: status ?? this.status,
    );
  }

  factory RediologyModelAtNurse.fromJson(Map<String, dynamic> json) {
    final String status = json['status'] ?? 'pending';

    return RediologyModelAtNurse(
      id: json['id'] ?? 0,
      patientId: json['patient_id'] ?? 0,
      name: json['name'] ?? '',
      dueDate: json['due_date'] ?? '',
      dueTime: json['due_time'] ?? '00:00',
      isDone: status == 'completed',
      filePath: json['file_path'],
      status: status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'name': name,
      'due_date': dueDate,
      'due_time': dueTime,
      'file_path': filePath,
      'status': status,
    };
  }
}

class CreateRediologyRequest {
  final int id;
  final String name;
  final String dueDate;
  final String dueTime;

  CreateRediologyRequest({
    required this.id,
    required this.name,
    required this.dueDate,
    required this.dueTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'patient_id': id,
      'name': name,
      'due_date': dueDate,
      'due_time': dueTime,
    };
  }
}
