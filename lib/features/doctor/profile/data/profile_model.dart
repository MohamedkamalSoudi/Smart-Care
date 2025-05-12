class ProfileDoctorModel {
  final String userName;
  final String? image;
  final String email;
  final String specialty;

  ProfileDoctorModel(
      {required this.image,
      required this.email,
      required this.userName,
      required this.specialty});

  factory ProfileDoctorModel.fromJson(json) {
    return ProfileDoctorModel(
      userName: json['doctor']['user']['name'],
      email: json['doctor']['user']['email'],
      image: json['doctor']['user']['image'],
      specialty: json['doctor']['specialty'],
    );
  }
}
