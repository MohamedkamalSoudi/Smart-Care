// ==============================
// Existing Model
// ==============================
class CreateTreatmentRequest {
  final int id;
  final String name;
  final String dueDate;
  final String dueTime;

  CreateTreatmentRequest({
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

// ==============================
// New Model to Add
// ==============================
class TreatmentModel {
  final int id;
  final int patientId;
  final String name;
  final String dueDate;
  final String dueTime;
  final bool isDone;
  final String? filePath;

  TreatmentModel({
    required this.id,
    required this.patientId,
    required this.name,
    required this.dueDate,
    required this.dueTime,
    required this.isDone,
    this.filePath,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      id: json['id'],
      patientId: json['patient_id'],
      name: json['name'],
      dueDate: json['due_date'],
      dueTime: json['due_time'] ?? '00:00',
      isDone: (json['is_done'] ?? 0) == 1,
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
      'file_path': filePath,
    };
  }
}