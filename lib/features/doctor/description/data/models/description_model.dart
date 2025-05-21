class DescriptionModel {
  final String desc;
  final int patientId;
  final int doctorId;

  DescriptionModel({
    required this.desc,
    required this.patientId,
    required this.doctorId,
  });

  factory DescriptionModel.fromJson(json) {
    return DescriptionModel(
      desc: json['diagnoses']['diagnosis'],
      patientId: json['diagnoses']['patient_id'],
      doctorId: json['diagnoses']['doctor_id'],
    );
  }
}
