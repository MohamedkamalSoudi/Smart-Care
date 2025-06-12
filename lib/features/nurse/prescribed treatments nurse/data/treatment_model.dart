class Treatment {
  final int id;
  final String name;
  final String? description;
  final String dueDate;
  final String dueTime;
  final String? dueTime2;
  final String? dueTime3;
  final int counterTime;
  final String? dosage;
  final String status;
  final int patientId;
  final bool isDone;

  Treatment({
    required this.id,
    required this.name,
    this.description,
    required this.dueDate,
    required this.dueTime,
    this.dueTime2,
    this.dueTime3,
    required this.counterTime,
    this.dosage,
    required this.status,
    required this.patientId,
    required this.isDone,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      dueDate: json['due_date'],
      dueTime: json['due_time'],
      dueTime2: json.containsKey('due_time2') ? json['due_time2'] : null,
      dueTime3: json.containsKey('due_time3') ? json['due_time3'] : null,
      counterTime: json['counterTime'],
      dosage: json['dosage'],
      status: json['status'],
      patientId: json['patient_id'],
      isDone: json['status'] == 'completed',
    );
  }

  Treatment copyWith({
    int? id,
    String? name,
    String? description,
    String? dueDate,
    String? dueTime,
    String? dueTime2,
    String? dueTime3,
    int? counterTime,
    String? dosage,
    String? status,
    int? patientId,
    bool? isDone,
  }) {
    return Treatment(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      dueTime: dueTime ?? this.dueTime,
      dueTime2: dueTime2 ?? this.dueTime2,
      dueTime3: dueTime3 ?? this.dueTime3,
      counterTime: counterTime ?? this.counterTime,
      dosage: dosage ?? this.dosage,
      status: status ?? this.status,
      patientId: patientId ?? this.patientId,
      isDone: isDone ?? this.isDone,
    );
  }
}


List<Treatment> expandTreatmentsWithTimes(List<Treatment> treatments) {
  List<Treatment> expanded = [];

  for (var treatment in treatments) {
    List<String?> times = [];

    if (treatment.counterTime >= 1) {
      times.add(treatment.dueTime);
    }
    if (treatment.counterTime >= 2 && treatment.dueTime2 != null) {
      times.add(treatment.dueTime2);
    }
    if (treatment.counterTime >= 3 && treatment.dueTime3 != null) {
      times.add(treatment.dueTime3);
    }

    for (int i = 0; i < times.length; i++) {
      expanded.add(Treatment(
        id: treatment.id,
        name: treatment.name,
        description: treatment.description,
        dueDate: treatment.dueDate,
        dueTime: times[i]!,
        dueTime2: treatment.dueTime2,
        dueTime3: treatment.dueTime3,
        counterTime: 1,
        dosage: treatment.dosage,
        status: treatment.status,
        patientId: treatment.patientId,
        isDone: treatment.isDone,
      ));
    }
  }

  return expanded;
}
