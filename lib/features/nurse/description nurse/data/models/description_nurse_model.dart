class DescriptionNurseModel {
  final String desc;
  final int patientId;
  final int doctorId;

  DescriptionNurseModel({
    required this.desc,
    required this.patientId,
    required this.doctorId,
  });

  factory DescriptionNurseModel.fromJson(json) {
    return DescriptionNurseModel(
      desc: json['diagnoses']['diagnosis'],
      patientId: json['diagnoses']['patient_id'],
      doctorId: json['diagnoses']['doctor_id'],
    );
  }
}
