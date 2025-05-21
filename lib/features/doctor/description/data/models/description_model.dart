class DescriptionModel {
  final String desc;
 // final DateTime dateTime;
  final int? id;
  final String? patientId;
  final String? doctorId;

  DescriptionModel({
    required this.desc, 
    //required this.dateTime, 
    required this.id,
    this.patientId,
    this.doctorId,
  });

  factory DescriptionModel.fromJson(Map<String, dynamic> json) {
    return DescriptionModel(
      desc: json['diagnoses']['diagnosis'],
      // dateTime: json['created_at'] != null 
      //     ? DateTime.parse(json['created_at']) 
      //     : DateTime.now(),
      id: json['patient']['id'],
      patientId: json['diagnoses']['patient_id']?.toString(),
      doctorId: json['diagnoses']['doctor_id']?.toString(),
    );
  }

//   Map<String, dynamic> toJson() {
//     return {
//       'diagnosis': desc,
//       'patient_id': patientId ?? '3', 
//       'doctor_id': doctorId ?? '2', 
//     };
//   }
}