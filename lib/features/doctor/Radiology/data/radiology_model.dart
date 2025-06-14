class CreateRadiologyRequest {
  final int id;
  final String name;
  final String dueDate;
  final String dueTime;

  CreateRadiologyRequest({
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

class RadiologyModelAtDoctor {
  final int id;
  final int patientId;
  final String name;
  final String dueDate;
  final String dueTime;
  final bool isDone;
  final String status;
  final String? filePath;

  RadiologyModelAtDoctor({
    required this.id,
    required this.patientId,
    required this.name,
    required this.dueDate,
    required this.dueTime,
    required this.isDone,
    required this.status,
    required this.filePath,
  });

  factory RadiologyModelAtDoctor.fromJson(Map<String, dynamic> json) {
    final status = json['status'] ?? 'pending';
    return RadiologyModelAtDoctor(
      id: json['id'],
      patientId: json['patient_id'],
      name: json['name'],
      dueDate: json['due_date'],
      dueTime: json['due_time'] ?? '00:00',
      isDone: status == 'completed',
      status: status,
      filePath: json['file_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'name': name,
      'due_date': dueDate,
      'due_time': dueTime,
      'is_done': isDone ? 1 : 0,
      'status': status,
      'file_path': filePath,
    };
  }

  RadiologyModelAtDoctor copyWith({
    bool? isDone,
    String? status,
  }) {
    return RadiologyModelAtDoctor(
      id: id,
      patientId: patientId,
      name: name,
      dueDate: dueDate,
      dueTime: dueTime,
      isDone: isDone ?? this.isDone,
      status: status ?? this.status,
      filePath: filePath,
    );
  }
}
