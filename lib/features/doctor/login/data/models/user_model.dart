class UserModel {
  final String userName;
  final String userType;
  final String? image;
  final String? email;

  UserModel({
    required this.image,
    required this.email,
    required this.userType,
    required this.userName,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      userName: json['user']['name'],
      userType: json['user']['type'],
      email: json['user']['email'],
      image: json['user']['image'],
    );
  }
}
