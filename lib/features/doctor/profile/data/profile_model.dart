class UserModel {
  final String userName;
  final String? image;
  final String? email;
  final String? specialty;

  UserModel(
      {required this.image,
      required this.email,
      required this.userName,
      required this.specialty});

  factory UserModel.fromJson(json) {
    return UserModel(
      userName: json['doctor']['user']['name'],
      email: json['doctor']['user']['email'],
      image: json['doctor']['user']['image'],
      specialty: json['doctor']['specialty'],
    );
  }
}
