class Treatmentmodel {
  final int? id;
  final String name;
  final String? description;
  final String dueDate;
  final String dueTime;
  final String? dueTime2;
  final String? dueTime3;
  final int? counterTime;
  final String? dosage;
  final String? status;
  final int? patientId;
  final bool isDone;

  Treatmentmodel({
    this.id,
    required this.name,
    this.description,
    required this.dueDate,
    required this.dueTime,
    this.dueTime2,
    this.dueTime3,
    this.counterTime,
    this.dosage,
    this.status,
    this.patientId,
    required this.isDone,
  });

  factory Treatmentmodel.fromJson(Map<String, dynamic> json) {
    return Treatmentmodel(
      id: json['id'] as int?,
      name: json['name'] ?? '',
      description: json['description'],
      dueDate: json['due_date'] ?? '',
      dueTime: json['due_time'] ?? '',
      dueTime2: json['due_time2'],
      dueTime3: json['due_time3'],
      counterTime: json['counterTime'] as int?,
      dosage: json['dosage'],
      status: json['status'],
      patientId: json['patient_id'] as int?,
      isDone: json['status'] == 'completed',
    );
  }

  Treatmentmodel copyWith({
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
    return Treatmentmodel(
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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'patient_id': patientId,
      'name': name,
      'description': description,
      'dosage': dosage,
      'counterTime': counterTime,
      'due_time': dueTime,
    };
    if (dueTime2 != null) data['due_time2'] = dueTime2;
    if (dueTime3 != null) data['due_time3'] = dueTime3;
    return data;
  }
}

List<Treatmentmodel> expandTreatmentsWithTimes(List<Treatmentmodel> treatments) {
  List<Treatmentmodel> expanded = [];

  for (var treatment in treatments) {
    List<String?> times = [];

    final int counter = treatment.counterTime ?? 0;

    if (counter >= 1) {
      times.add(treatment.dueTime);
    }
    if (counter >= 2 && treatment.dueTime2 != null) {
      times.add(treatment.dueTime2);
    }
    if (counter >= 3 && treatment.dueTime3 != null) {
      times.add(treatment.dueTime3);
    }

    for (int i = 0; i < times.length; i++) {
      expanded.add(Treatmentmodel(
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

