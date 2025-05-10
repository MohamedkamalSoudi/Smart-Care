class ProfileModel {
  final String userName;
  final String? image;
  final String email;
  final String specialty;

  ProfileModel(
      {required this.image,
      required this.email,
      required this.userName,
      required this.specialty});

  factory ProfileModel.fromJson(json) {
    return ProfileModel(
      userName: json['doctor']['user']['name'],
      email: json['doctor']['user']['email'],
      image: json['doctor']['user']['image'],
      specialty: json['doctor']['specialty'],
    );
  }
}
